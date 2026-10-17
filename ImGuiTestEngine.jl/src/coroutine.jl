#=
A custom implementation of the coroutines interface:
https://github.com/ocornut/imgui_test_engine/wiki/Setting-Up#setting-up-custom-coroutines-interface

Using the default std::thread implementation may cause freezes after task
switching (e.g. through printing), probably something to do with the coroutine
being run on a separate thread.

The code is a fairly straight-forward port of the std::thread implementation:
https://github.com/ocornut/imgui_test_engine/blob/main/imgui_test_engine/imgui_te_coroutine.cpp

The only difference is that we only allow a single coroutine to run at a
time. This is necessary because YieldFunc() is called without a reference to a
coroutine, so it has to be globally accessible. The upstream implementation gets
away with it by using thread-local state instead, but we have no guarantee that
a task will stay on the same thread.
=#
module _Coroutine

import ..ImGuiTestCoroutineInterface


mutable struct CoroutineData
    StateChange::Threads.Condition
    CoroutineRunning::Bool
    CoroutineTerminated::Bool
    task::Task
    name::String

    function CoroutineData(func::Ptr{Cvoid}, name::Cstring, ctx::Ptr{Cvoid})
        self = new(Threads.Condition(), false, false)

        # We sneakily pass a magic variable from the current TLS into the new
        # task. It's used by the Test stdlib to hold a list of the current
        # testsets, so we need it to be able to record the tests from the new
        # task in the original testset that we're currently running under.
        parent_testsets = get(task_local_storage(), :__BASETESTNEXT__, [])
        self.task = errormonitor(Threads.@spawn run_coroutine(self, func, ctx, parent_testsets))
        self.name = unsafe_string(name)

        return self
    end
end

# Global variables
interface::Ref{ImGuiTestCoroutineInterface} = Ref{ImGuiTestCoroutineInterface}()
data::Union{CoroutineData, Nothing} = nothing

function run_coroutine(data::CoroutineData, func::Ptr{Cvoid}, ctx::Ptr{Cvoid}, parent_testsets)
    task_local_storage(:__BASETESTNEXT__, parent_testsets)

    # Wait for the program to request the coroutine to start
    while true
        @lock data.StateChange begin

            if data.CoroutineRunning
                break
            end

            wait(data.StateChange)
        end
    end

    # This may yield internally
    @ccall $func(ctx::Ptr{Cvoid})::Cvoid

    @lock data.StateChange begin
        data.CoroutineTerminated = true
        data.CoroutineRunning = false
        notify(data.StateChange)
    end
end

function CreateFunc(func::Ptr{Cvoid}, name::Cstring, ctx::Ptr{Cvoid})::Ptr{Cvoid}
    if !isnothing(data)
        @error "CreateFunc() was called while another coroutine is still running, this is not supported"
        return C_NULL
    end

    global data = CoroutineData(func, name, ctx)

    return pointer_from_objref(data)
end

# Note that DestroyFunc and RunFunc don't use their `handle` argument because
# it's just a pointer to the global `data` object.
function DestroyFunc(::Ptr{Cvoid})::Cvoid
    if !data.CoroutineTerminated
        @error "Cannot destroy coroutine, it has not terminated"
        return
    end

    if !istaskdone(data.task)
        wait(data.task)
    end

    # This should remove all references to the coroutine data and allow it to be GC'd
    global data = nothing
end

# Return true if it yielded or false if it terminated
function RunFunc(::Ptr{Cvoid})::Bool
    # Request a start
    @lock data.StateChange begin
        if data.CoroutineTerminated
            return false
        end

        data.CoroutineRunning = true
        notify(data.StateChange)
    end

    # Wait for it to terminate or yield
    while true
        @lock data.StateChange begin
            if !data.CoroutineRunning
                return !data.CoroutineTerminated
            end

            wait(data.StateChange)
        end
    end
end

function YieldFunc()::Cvoid
    if isnothing(data)
        @error "YieldFunc() was called but a coroutine has not been set up"
        return
    end

    # Notify that the coroutine isn't running
    @lock data.StateChange begin
        data.CoroutineRunning = false
        notify(data.StateChange)
    end

    # Wait to be started again
    while true
        @lock data.StateChange begin
            if data.CoroutineRunning
                break
            end

            wait(data.StateChange)
        end
    end
end


function __init__()
    global interface[] = ImGuiTestCoroutineInterface(C_NULL, C_NULL, C_NULL, C_NULL)
    interface[].CreateFunc  = @cfunction(CreateFunc, Ptr{Cvoid}, (Ptr{Cvoid}, Cstring, Ptr{Cvoid}))
    interface[].DestroyFunc = @cfunction(DestroyFunc, Cvoid, (Ptr{Cvoid},))
    interface[].RunFunc     = @cfunction(RunFunc, Bool, (Ptr{Cvoid},))
    interface[].YieldFunc   = @cfunction(YieldFunc, Cvoid, ())
end

end

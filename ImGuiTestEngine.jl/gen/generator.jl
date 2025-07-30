import JSON3
import CEnum
import Clang
using Clang.Generators
using Clang.JLLEnvs
import CImGui
using CImGuiPack_jll
import JuliaFormatter: format_file, format_text
import MacroTools: @capture, splitdef, prettify, postwalk


"""
This anonymous module contains the raw bindings from Clang.jl.
"""
bindings_module::Module = Module()

# Special-case: the `flags_value` argument of CheckboxFlags() can
# take in any kind of flag so we leave it untyped.
const args_to_ignore = [(:igCheckboxFlags_IntPtr, :flags_value),
                        (:igCheckboxFlags_UintPtr, :flags_value)]

# ImGui::Begin() would otherwise have an ambiguity with ImGuiListClipper::Begin()
const args_to_annotate = [(:igBegin, :name)]

const function_ignorelist = (
    :cImGuiTestEngine_CreateContext,
    :cImGuiTestEngine_DestroyContext,
    :ImGuiTestEngine_destroy
)
const struct_ignorelist = (
    :ImGuiTestEngine,
    :ImGuiTest
)

const exports = [:SetRef, :GetRef, :GetWindowByRef,
                 :ItemClick, :ItemDoubleClick, :ItemCheck, :ItemOpen, :ItemClose,
                 :MenuClick,
                 :ComboClick, :ComboClickAll,
                 :MouseClick, :MouseMove, :MouseMoveToPos,
                 :Yield,
                 :OpenAndClose]

struct WrapperMethod
    name::Union{Expr, Symbol}
    internal::Bool
    docstring::String
    expr::Expr
    class::String
    line::Int
end

is_internal(metadata) = contains(metadata[:location], "imgui_te_internal") || startswith(metadata[:funcname], "_")

function create_docstring(func_name, overload)
    docstring = "\$(TYPEDSIGNATURES)"

    comment = get(overload, :comment, "")
    if !isempty(comment)
        comment = replace(comment, "\\0" => "\\\\0")
        comment = replace(comment, raw"$" => raw"\$")
        formatted_comment = chopprefix(comment, "//") |> strip |> uppercasefirst
        if !isempty(formatted_comment) && formatted_comment[end] ∉ ('.', '!', '?')
            formatted_comment *= "."
        end

        docstring *= "\n\n$(formatted_comment)"
    end

    header, line = split(overload[:location], ':')
    te_version = "1.92.1"
    link = "https://github.com/ocornut/imgui_test_engine/blob/v$(te_version)/imgui_test_engine/$(header).h#L$(line)"

    if is_internal(overload)
        docstring *= """\n
                     !!! warning
                         This function is internal, it may change in the future."""
    end

    docstring *= "\n\n[Upstream link]($link)."

    return docstring
end

"""
Convert an ImGui argument type to a Julia type annotation.
"""
function imgui_to_jl_type(ig_type)
    parsed_type = Meta.parse(ig_type)
    if !(parsed_type isa Symbol)
        # If it's a whole expression, just return
        return parsed_type
    end

    # Figure out what other types should be allowed as arguments. Otherwise
    # users would have to be careful to only pass in e.g. Int32's for ImGuiID,
    # which is quite annoying.
    unions = if parsed_type === :ImVec2
        # ImVec2 and ImVec4 have special support for NTuple's
        [:(NTuple{2})]
    elseif parsed_type === :ImVec4
        [:(NTuple{4})]
    elseif getproperty(bindings_module, parsed_type) in (Cint, Cuint)
        [:Integer]
    elseif endswith(string(parsed_type), "Callback")
        # Allow passing CFunctions and Ptr{Cvoid}'s to callback arguments
        [:(Base.CFunction), :(Ptr{Cvoid})]
    else
        []
    end

    # ImGui always defines type aliases for enum primitive types, and then a
    # separate enum type with a trailing underscore. Here we check if such an
    # enum type exists and add it to the union if so.
    enum_type = Symbol(parsed_type, :_)
    try
        # Note that we have to use getproperty() and catch an exception because
        # `bindings_module` is an anonymous module, for which propertynames()
        # doesn't work as usual.
        getproperty(bindings_module, enum_type)
        pushfirst!(unions, enum_type)
    catch ex
        if !(ex isa UndefVarError)
            rethrow()
        end
    end

    return if isempty(unions)
        [parsed_type]
    else
        [parsed_type, unions...]
    end
end

"""
For numeric C arguments, widen to the safest possible Julia type so that people
can e.g. pass Int literals to functions that take in a Int32.
"""
function widen_numeric_type(arg_type, overload_arg_types)
    c_numeric_types = Dict("int" => :Int,
                           "unsigned int" => :UInt,
                           "unsigned long" => :UInt,
                           "float" => :Float32,
                           "double" => :Float64)
    if arg_type ∉ keys(c_numeric_types)
        error("Cannot widen a non-numeric type: $(arg_type)")
    end

    check_integral = x -> x in ("int", "unsigned int")
    check_floating = x -> x in ("float", "double")
    is_integral = check_integral(arg_type)
    is_floating = !is_integral
    widest_possible_type = [is_integral ? :Integer : :Real]

    # If the type is the same for all overloads we can widen
    if all(==(arg_type), overload_arg_types)
        return widest_possible_type
    end

    # If this is the only numeric type in all the overloads we can widen
    if !any(x -> x in keys(c_numeric_types), overload_arg_types)
        return widest_possible_type
    end

    # If this is the only integral/floating type in all the overloads we can widen
    if (is_integral && !any(check_integral, overload_arg_types)) || (is_floating && !any(check_floating, overload_arg_types))
        return widest_possible_type
    end

    # Otherwise fall back to the matching C type
    return [c_numeric_types[arg_type]]
end

"""
Convert a C argument type to a Julia type annotation.
"""
function to_jl_type(func_name, func_idx, arg_idx, overloads)
    # Find the type for this argument
    func_args = overloads[func_idx][:argsT]
    arg_info = func_args[arg_idx]
    type_str = arg_info[:type]

    unqualify = x -> replace(x, "const " => "")

    # And the types of the same argument *by name* and *by position* in any other overloads
    arg_name = arg_info[:name]
    overload_arg_types = String[]
    positional_overload_arg_types = String[]
    shares_other_args = false
    for overload_metadata in overloads
        overload_name = Symbol(overload_metadata[:ov_cimguiname])
        if overload_name == func_name || overload_name in function_ignorelist
            continue
        end

        # Get the type of the same argument by name
        overload_args = overload_metadata[:argsT]
        idx = findfirst(x -> x[:name] == arg_name, overload_args)
        if !isnothing(idx)
            push!(overload_arg_types, unqualify(overload_args[idx][:type]))
        end

        # Get the type of the same argument by position
        if arg_idx <= length(overload_args)
            push!(positional_overload_arg_types, unqualify(overload_args[arg_idx][:type]))
        end

        # Check if this overload shares the same types with the other arguments
        if length(overload_args) == length(func_args)
            # Get the types of the other args, except for any arguments that
            # we're explicitly ignoring.
            arg_is_ignored = arg -> (overload_name, Symbol(arg[:name])) in args_to_ignore
            func_args_types = String[arg[:type] for (i, arg) in enumerate(func_args) if i != arg_idx && !arg_is_ignored(arg)]
            overload_args_types = String[arg[:type] for (i, arg) in enumerate(overload_args) if i != arg_idx && !arg_is_ignored(arg)]

            if func_args_types == overload_args_types
                shares_other_args = true
            end
        end
    end

    # Strip const qualifiers and determine if the arg is a pointer type
    unqualified_type = unqualify(type_str)
    is_ptr = unqualified_type != "char*" && unqualified_type[end] == '*'
    if is_ptr
        unqualified_type = unqualified_type[1:end - 1]
    end

    unions = if unqualified_type == "ImGuiWindow *"
        # Special case of a pointer-to-pointer for ImGuiTestContext__ForeignWindowsHideOverPos
        [:(Ptr{Ptr{ImGuiWindow}})]
    elseif startswith(unqualified_type, "Im")
        imgui_to_jl_type(unqualified_type)
    elseif unqualified_type == "bool"
        [:Bool]
    elseif unqualified_type == "int"
        is_ptr ? [:Int32] : widen_numeric_type(unqualified_type, overload_arg_types)
    elseif unqualified_type == "unsigned int"
        is_ptr ? [:UInt32] : widen_numeric_type(unqualified_type, overload_arg_types)
    elseif unqualified_type == "unsigned long"
        is_ptr ? [:UInt64] : widen_numeric_type(unqualified_type, overload_arg_types)
    elseif unqualified_type == "float"
        is_ptr ? [:Float32] : widen_numeric_type(unqualified_type, overload_arg_types)
    elseif unqualified_type == "double"
        is_ptr ? [:Float64] : widen_numeric_type(unqualified_type, overload_arg_types)
    elseif unqualified_type == "char"
        [:Char]
    elseif unqualified_type == "char*"
        # Strings are complicated. Usually we want to pass String objects but
        # sometimes it's also desirable to pass C_NULL. For this reason we try
        # to allow passing a Ptr{Cvoid} to a string argument when possible, but
        # that can cause method ambiguities when one overload takes in a string
        # and the other takes in a pointer. The second will be given a
        # PtrOrRef{T} type which is a type union that includes Ptr{Cvoid}, so if
        # the string overload also allows taking in a Ptr{Cvoid} we might get a
        # method ambiguity.
        #
        # To avoid this we check the types of the arguments in all the overloads
        # with the same name and position. If any of them are non-string
        # pointers we forbid passing a Ptr{Cvoid} to the string overload.
        is_different_ptr = x -> x != unqualified_type && contains(x, "*")
        has_non_string_ptr = (!isnothing(findfirst(is_different_ptr, overload_arg_types))
                              || !isnothing(findfirst(is_different_ptr, positional_overload_arg_types)))

        if has_non_string_ptr
            # Conservative option (only taken if necessary)
            [:String, :(Ptr{Cchar})]
        else
            # Loosest option (preferable)
            [:String, :(Ptr{Cchar}), :(Ptr{Cvoid})]
        end
    elseif unqualified_type == "void"
        [:Cvoid]
    elseif unqualified_type == "size_t"
        [:Int]
    elseif type_str ∈ ("const char* const[]", "const char **")
        [:(Vector{String})]
    else
        error("Unsupported C type: '$(type_str)'")
    end

    if unions isa Expr
        @show unqualified_type is_ptr
    end

    return if is_ptr
        # If this argument is the only one that has a different type from the
        # other arguments across all the overloads, and the other overloads all
        # have pointers for this argument too, then we can't allow Ptr{Cvoid}
        # because of method ambiguity.
        correct_ptr_type = shares_other_args ? :PtrOrRef : :VoidablePtrOrRef

        if length(unions) == 1
            :($correct_ptr_type{$(only(unions))})
        else
            ptr_exprs = [:($correct_ptr_type{$T}) for T in unions]
            :(Union{$(ptr_exprs...)})
        end
    else
        if length(unions) == 1
            only(unions)
        else
            :(Union{$(unions...)})
        end
    end
end

# Stolen from ImPlot.jl
function split_ccall(body)
    local funsymbol, rettype, argtypes, argnames
    for ex in body.args
        @capture(ex, ccall((funsymbol_, libcimgui), rettype_, (argtypes__,), argnames__)) && break
    end
    return (; funsymbol, rettype, argtypes, argnames)
end

function wrap_pOut_body(func_def, body)
    ccall_info = split_ccall(func_def[:body])
    local pOut_type
    if !@capture(ccall_info.argtypes[1], Ptr{pOut_type_})
        @warn "Skipping '$(func_def[:name])', couldn't get type of the `pOut` argument"
        return body
    end

    quote
        pOut = Ref{$pOut_type}()
        $body
        return pOut[]
    end
end

"""
Wrap a single cimgui function.
"""
function wrap_function!(methods, func_name, func_def, overloads; with_arg_types=false)
    func_idx = findfirst(x -> x[:ov_cimguiname] == string(func_name), overloads)
    func_metadata = overloads[func_idx]

    # Filter out variadic arguments. These are always related to string
    # formatting and it's simpler to let that be done in Julia by the users.
    arg_names = filter(!=(:(va_list...)), func_def[:args])
    arg_types_strs = [func_metadata[:argsT][i][:type] for i in eachindex(arg_names)]

    args = copy(arg_names)
    is_pOut = false
    is_context_method = !isempty(arg_names) && :self in arg_names && func_metadata[:stname] == "ImGuiTestContext"
    is_engine_method = (!isempty(arg_names)
                        && :engine in arg_names
                        && startswith(string(func_name), "cImGuiTestEngine_")
                        && func_metadata[:stname] == "")
    struct_name = is_engine_method ? "ImGuiTestEngine" : func_metadata[:stname]
    context_method_ref_args = Symbol[]

    for i in eachindex(args)
        # pOut arguments are part of cimgui and are a pointer to a return value,
        # to be filled in by the cimgui function.
        if arg_names[i] == :pOut
            is_pOut = true
        end

        arg_type_str = arg_types_strs[i]

        # If this is the `self` argument and this function belongs to a struct,
        # then it must be the self object.
        if arg_names[i] == :self && func_metadata[:stname] != ""
            struct_sym = Symbol(struct_name)
            struct_ptr = :(Ptr{$struct_sym})
            arg_type = is_context_method ? :(Union{$struct_ptr, Nothing}) : struct_ptr
            args[i] = :($(args[i])::$arg_type)
        elseif arg_type_str == "ImGuiTest*"
            args[i] = :($(args[i])::ImGuiTest)
            arg_names[i] = :($(arg_names[i]).ptr)
        elseif arg_type_str == "ImGuiTestEngine*"
            args[i] = :($(args[i])::Engine)
            arg_names[i] = :($(arg_names[i]).ptr)
        elseif is_context_method && arg_type_str == "ImGuiTestRef"
            # Replace ImGuiTestRef arguments with our own TestRef
            args[i] = :($(args[i])::TestRef)
            push!(context_method_ref_args, arg_names[i])
            arg_names[i] = :(ImGuiTestRef($(arg_names[i])))
        elseif ((with_arg_types
                 || (func_name, arg_names[i]) in args_to_annotate
                 # We don't support parsing array types yet
                 || (contains(arg_type_str, "Im") && !contains(arg_type_str, '[')))
                && (func_name, arg_names[i]) ∉ args_to_ignore)
            # Always try to parse arg types if `arg_types` is true, or if it's any non-array ImGui type
            type = to_jl_type(func_name, func_idx, i, overloads)
            args[i] = :($(args[i])::$(type))
        end

        if haskey(func_metadata[:defaults], arg_names[i])
            default = func_metadata[:defaults][arg_names[i]]
            if default == "NULL" || default == "nullptr"
                default = "C_NULL"
            end

            # Replace all float literals of the form '1f' or '0.0f' etc with '1f0'/'0.0f0'
            default = replace(default, r"\df" => x -> "$(x[1])f0")

            args[i] = Expr(:kw, args[i], Meta.parse(default))
        end
    end

    # Remove the `self` argument from context methods
    if is_context_method
        popat!(args, findfirst(==(:self), arg_names))
    end

    ig_name = Symbol(func_metadata[:funcname])

    # Create the identifier for the wrapper function. If it's a constructor then
    # we need to add the method to the original type in the `lib` submodule to
    # avoid shadowing the *type* in `lib` with the *function* in `CImGui`. We
    # also capitalize the name for backwards compatibility with the manually
    # created wrappers.
    capitalized_name = uppercasefirst(string(ig_name))
    new_identifier = if startswith(capitalized_name, "ImGuiTestEngine_")
        Symbol(chopprefix(capitalized_name, "ImGuiTestEngine_"))
    else
        Symbol(capitalized_name)
    end

    # String array arguments are always given a Vector{String} type, and are
    # followed by a 'count' argument. Here we delete the 'count' argument in
    # favour of calling `length()` on the vector.
    count_args = [i + 1 for i in eachindex(arg_names) if arg_types_strs[i] == "const char* const[]"]
    deleteat!(args, count_args)
    for i in count_args
        # Take the length of the *previous* argument
        arg_names[i] = :(length($(arg_names[i - 1])))
    end

    # The first argument of pOut functions is always the pOut pointer, so we
    # remove it from the public API.
    if is_pOut
        popfirst!(args)
    end

    inner_call = :(lib.$func_name($(arg_names...)))
    func_expr = if is_context_method
        body = if isempty(context_method_ref_args)
            inner_call
        else
            :(GC.@preserve $(context_method_ref_args...) $inner_call)
        end

        if is_pOut
            body = wrap_pOut_body(func_def, body)
        end

        quote
            function $new_identifier($(args...))
                self = _current_test_context[]

                $body
            end
        end
    else
        if is_pOut
            body = wrap_pOut_body(func_def, inner_call)
            quote
                function $new_identifier($(args...))
                    $body
                end
            end
        else
            :($new_identifier($(args...)) = $inner_call)
        end
    end

    docstring = create_docstring(func_name, func_metadata)

    line = parse(Int, split(func_metadata[:location], ':')[end])

    push!(methods,
          WrapperMethod(new_identifier, is_internal(func_metadata), docstring, prettify(func_expr),
                        struct_name, line))
end

"""
Wrap a destructor. These are pretty simple so we define them separately from
other functions.
"""
function wrap_destructor!(methods, func_name)
    type = Symbol(split(string(func_name), "_")[1])

    func_expr = :(Destroy(self::Ptr{$type}) = $func_name(self))

    push!(methods, WrapperMethod(:Destroy, false, "Destructor for `$type`", prettify(func_expr), "", -1))
end

"""
Iterate over all the functions in the DAG and create wrapper Expr's for them.
"""
function get_wrappers(dag::ExprDAG)
    methods = WrapperMethod[]
    structs = String[]
    enums = Symbol[]
    imgui_defs = JSON3.read(CImGuiPack_jll.cimgui_test_engine_definitions)

    for node in dag.nodes
        for (i, expr) in enumerate(node.exprs)
            # If this is a generated function, extract the :function from it
            if Meta.isexpr(expr, :macrocall) && expr.args[1] == Symbol("@generated")
                expr = expr.args[3]
            end

            if Meta.isexpr(expr, :function)
                # Wrap regular functions

                func_def = splitdef(expr)
                func_name = func_def[:name]

                if func_name in function_ignorelist
                    continue
                end

                if func_name in keys(imgui_defs) && length(imgui_defs[func_name]) == 1
                    all_overloads = imgui_defs[func_name]
                    func_metadata = only(all_overloads)

                    # Handle destructors specially
                    if haskey(func_metadata, :destructor) && func_metadata[:destructor]
                        wrap_destructor!(methods, func_name)
                        continue
                    end

                    wrap_function!(methods, func_name, func_def, all_overloads)
                else
                    # Check if this is an overload, in which case the function
                    # name will something like `name_type()` or
                    # `struct_name_type()`. We need to strip the `type` part off
                    # to index into `imgui_defs`. `X_Str_arr()` is special-cased
                    # because it has two underscores in the name.
                    split_token = endswith(string(func_name), "_Str_arr") ? "_Str_arr" : "_"
                    split_name = rsplit(string(func_name), split_token; limit=2)
                    if length(split_name) == 1
                        continue
                    end

                    abstract_name = split_name[1]
                    if any(startswith(abstract_name, string(x)) for x in function_ignorelist)
                        @info "Skipping '$(func_name)' because it was explicitly ignored"
                        continue
                    elseif !haskey(imgui_defs, abstract_name)
                        # This is very spammy so we don't print a warning by default. It removes symbols from ImPlot and ImNodes.
                        # @warn "Skipping '$(func_name)' because it's not in `imgui_defs`"
                        continue
                    end

                    all_overloads = imgui_defs[abstract_name]
                    for overload_metadata in imgui_defs[abstract_name]
                        if overload_metadata[:ov_cimguiname] == string(func_name)
                            try
                                wrap_function!(methods, func_name, func_def, all_overloads; with_arg_types=true)
                            catch ex
                                @warn "Couldn't wrap '$(func_name)'" exception=ex
                            end
                        end
                    end
                end
            elseif Meta.isexpr(expr, :struct) && node.id ∉ struct_ignorelist
                struct_name = string(node.id)
                push!(structs, struct_name)
            elseif Meta.isexpr(expr, :macrocall) && expr.args[1] == Symbol("@cenum")
                push!(enums, node.id)
            end
        end
    end

    return methods, structs, enums
end

function rewrite!(dag)
    nodes = dag.nodes

    # Strip cimgui symbols
    for i in reverse(eachindex(nodes))
        node = nodes[i]

        filename = Clang.get_filename(node.cursor)
        if !endswith(filename, "cimgui_te.h")
            popat!(nodes, i)
        end
    end

    # Make ImGuiTestCoroutineInterface mutable. Clang.jl doesn't apply
    # mutability for some reason.
    for node in nodes
        if node.id === :ImGuiTestCoroutineInterface && node.type isa Generators.StructDefinition
            node.exprs[1].args[1] = true
        end
    end
end

function generate()
    cd(@__DIR__) do
        include_dir = joinpath(CImGuiPack_jll.artifact_dir, "include")

        cimgui_te_h = joinpath(include_dir, "cimgui_te.h") |> normpath

        local ctx
        options = load_options(joinpath(@__DIR__, "generator.toml"))
        for target in ("x86_64-linux-gnu", "i686-linux-gnu")
            @info "processing $target"

            options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "$target.jl")

            args = get_default_args(target)
            push!(args,
                  "-I$include_dir",
                  "-DCIMGUI_DEFINE_ENUMS_AND_STRUCTS",
                  # cimgui_impl.h uses 'bool', but that requires an extra header
                  "-includestdbool.h")

            ctx = create_context([cimgui_te_h], args, options)
            build!(ctx, BUILDSTAGE_NO_PRINTING)

            rewrite!(ctx.dag)

            build!(ctx, BUILDSTAGE_PRINTING_ONLY)
        end

        println()
        @info "Generating wrapper.jl..."
        println()

        # Load the bindings into a module so we can inspect them when generating
        # the wrappers.
        global bindings_module = Module()
        @eval bindings_module using CImGuiPack_jll
        Base.include(bindings_module, options["general"]["output_file_path"])
        bindings_module = bindings_module.lib

        renamer = expr -> postwalk(expr) do x
            if @capture(x, f_(args__))
                new_args = map(args) do arg
                    postwalk(arg) do y
                        if y isa Symbol && y ∉ (:ImGuiTestEngine, :ImGuiTest)
                            y_str = string(y)
                            if startswith(y_str, "Im") && y in names(CImGui.lib; all=true)
                                :(libig.$y)
                            elseif startswith(y_str, "Im") && y in names(bindings_module; all=true)
                                :(lib.$y)
                            else
                                y
                            end
                        else
                            y
                        end
                    end
                end

                if f === :ImGuiTestEngine
                    f = :TestEngine
                end

                :($f($(new_args...)))
            else
                x
            end
        end

        methods, structs, enums = get_wrappers(ctx.dag)
        output_file = joinpath(@__DIR__, "../src/wrapper.jl")
        open(output_file; write=true) do io
            write(io,
                  """
                  const PtrOrRef{T} = Union{Ptr{T}, Ref{T}} where T
                  const VoidablePtrOrRef{T} = Union{Ptr{T}, Ref{T}, Ptr{Cvoid}} where T

                  const TestRef = Union{String, Int, lib.ImGuiTestRef}

                  """)

            # Write the struct 'typedefs'
            for s in filter(!contains("_"), structs)
                write(io, "const $s = lib.$s\n")
            end
            write(io, "\n")

            # Write enum 'typedefs'. These are likely going to commonly used so
            # we take the opportunity to shorten them a bit.
            enum_renamer = x -> chopprefix(chopprefix(string(x), "ImGui"), "Test")
            for e in enums
                x = getproperty(bindings_module, e)

                write(io, "const $(enum_renamer(e)) = lib.$e\n")
                for inst in @invokelatest instances(x)
                    inst_name = @invokelatest Symbol(inst)
                    write(io, "const $(enum_renamer(inst_name)) = lib.$inst_name\n")
                end
                write(io, "\n")
            end

            # Write the methods
            for w in methods
                write(io,
                      """
                      \"\"\"
                      $(w.docstring)
                      \"\"\"
                      """)
                write(io, string(renamer(w.expr)), "\n\n")
            end

            # Write the `public` and `export` statements
            public_names = unique([string(w.name) for w in methods if !w.internal && w.name ∉ exports])
            # Filter out methods of another module and internal methods
            filter!(x -> !startswith(x, "lib.") && !startswith(x, "_"), public_names)
            public_names = join(public_names, ", ")

            write(io, """
            @static if VERSION >= v"1.11"
                eval(Meta.parse("public $(public_names)"))
            end\n
            """)

            export_names = join(string.(exports), ", ")
            write(io, """
            export $(export_names)
            """)
        end

        format_file(output_file; margin=120)

        # Write the function metadata file for the docs
        wrapper_metadata = Dict()
        for m in methods
            if m.internal
                continue
            end

            name = string(m.name)
            wrapper_metadata[name] = Dict("class" => m.class, "line" => m.line)
        end
        open(joinpath(@__DIR__, "../docs/wrapper_metadata.json"), "w") do f
            JSON3.pretty(f, wrapper_metadata)
        end
    end

    return nothing
end

# Run automatically if the script is launched from the command-line
if !isempty(Base.PROGRAM_FILE)
    generate()
end

const PtrOrRef{T} = Union{Ptr{T},Ref{T}} where {T}
const VoidablePtrOrRef{T} = Union{Ptr{T},Ref{T},Ptr{Cvoid}} where {T}

"""
Destructor for `ImVec2`
"""
Destroy(self::Ptr{ImVec2}) = ImVec2_destroy(self)

"""
Destructor for `ImVec4`
"""
Destroy(self::Ptr{ImVec4}) = ImVec4_destroy(self)

"""
Destructor for `ImTextureRef`
"""
Destroy(self::Ptr{ImTextureRef}) = ImTextureRef_destroy(self)

"""
$(TYPEDSIGNATURES)

== (_TexData ? _TexData->TexID : _TexID) // Implemented below in the file.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L391).
"""
GetTexID(self::Ptr{ImTextureRef}) = ImTextureRef_GetTexID(self)

"""
$(TYPEDSIGNATURES)


Context creation and access
- Each context create its own ImFontAtlas by default. You may instance one yourself and pass it to CreateContext() to share a font atlas between contexts.
- DLL users: heaps and globals are not shared across DLL boundaries! You will need to call SetCurrentContext() + SetAllocatorFunctions()
  for each static/DLL boundary you are calling from. Read "Context and Memory Allocators" section of imgui.cpp for details.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L410).
"""
CreateContext(shared_font_atlas::VoidablePtrOrRef{ImFontAtlas} = C_NULL) = igCreateContext(shared_font_atlas)

"""
$(TYPEDSIGNATURES)

NULL = destroy current context.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L411).
"""
DestroyContext(ctx::VoidablePtrOrRef{ImGuiContext} = C_NULL) = igDestroyContext(ctx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L412).
"""
GetCurrentContext() = igGetCurrentContext()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L413).
"""
SetCurrentContext(ctx::VoidablePtrOrRef{ImGuiContext}) = igSetCurrentContext(ctx)

"""
$(TYPEDSIGNATURES)

Main// access the ImGuiIO structure (mouse/keyboard/gamepad inputs, time, various configuration options/flags).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L416).
"""
GetIO() = igGetIO_Nil()

"""
$(TYPEDSIGNATURES)

Access the ImGuiPlatformIO structure (mostly hooks/functions to connect to platform/renderer and OS Clipboard, IME etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L417).
"""
GetPlatformIO() = igGetPlatformIO_Nil()

"""
$(TYPEDSIGNATURES)

Access the Style structure (colors, sizes). Always use PushStyleColor(), PushStyleVar() to modify style mid-frame!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L418).
"""
GetStyle() = igGetStyle()

"""
$(TYPEDSIGNATURES)

Start a new Dear ImGui frame, you can submit any command from this point until Render()/EndFrame().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L419).
"""
NewFrame() = igNewFrame()

"""
$(TYPEDSIGNATURES)

Ends the Dear ImGui frame. automatically called by Render(). If you don't need to render data (skipping rendering) you may call EndFrame() without Render()... but you'll have wasted CPU already! If you don't need to render, better to not create any windows and not call NewFrame() at all!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L420).
"""
EndFrame() = igEndFrame()

"""
$(TYPEDSIGNATURES)

Ends the Dear ImGui frame, finalize the draw data. You can then get call GetDrawData().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L421).
"""
Render() = igRender()

"""
$(TYPEDSIGNATURES)

Valid after Render() and until the next call to NewFrame(). Call ImGui_ImplXXXX_RenderDrawData() function in your Renderer Backend to render.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L422).
"""
GetDrawData() = igGetDrawData()

"""
$(TYPEDSIGNATURES)

Demo, Debug, Information// create Demo window. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L425).
"""
ShowDemoWindow(p_open = C_NULL) = igShowDemoWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create Metrics/Debugger window. display Dear ImGui internals: windows, draw commands, various internal state, etc.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L426).
"""
ShowMetricsWindow(p_open = C_NULL) = igShowMetricsWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create Debug Log window. display a simplified log of important dear imgui events.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L427).
"""
ShowDebugLogWindow(p_open = C_NULL) = igShowDebugLogWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create Stack Tool window. hover items with mouse to query information about the source of their unique ID.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L428).
"""
ShowIDStackToolWindow(p_open = C_NULL) = igShowIDStackToolWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create About window. display Dear ImGui version, credits and build/system information.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L429).
"""
ShowAboutWindow(p_open = C_NULL) = igShowAboutWindow(p_open)

"""
$(TYPEDSIGNATURES)

Add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L430).
"""
ShowStyleEditor(ref::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igShowStyleEditor(ref)

"""
$(TYPEDSIGNATURES)

Add style selector block (not a window), essentially a combo listing the default styles.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L431).
"""
ShowStyleSelector(label) = igShowStyleSelector(label)

"""
$(TYPEDSIGNATURES)

Add font selector block (not a window), essentially a combo listing the loaded fonts.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L432).
"""
ShowFontSelector(label) = igShowFontSelector(label)

"""
$(TYPEDSIGNATURES)

Add basic help/info block (not a window): how to manipulate ImGui as an end-user (mouse/keyboard controls).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L433).
"""
ShowUserGuide() = igShowUserGuide()

"""
$(TYPEDSIGNATURES)

Get the compiled version string e.g. "1.80 WIP" (essentially the value for IMGUI_VERSION from the compiled version of imgui.cpp).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L434).
"""
GetVersion() = igGetVersion()

"""
$(TYPEDSIGNATURES)

Styles// new, recommended style (default).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L437).
"""
StyleColorsDark(dst::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igStyleColorsDark(dst)

"""
$(TYPEDSIGNATURES)

Best used with borders and a custom, thicker font.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L438).
"""
StyleColorsLight(dst::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igStyleColorsLight(dst)

"""
$(TYPEDSIGNATURES)

Classic imgui style.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L439).
"""
StyleColorsClassic(dst::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igStyleColorsClassic(dst)

"""
$(TYPEDSIGNATURES)

Windows
- Begin() = push window to the stack and start appending to it. End() = pop window from the stack.
- Passing 'bool* p_open != NULL' shows a window-closing widget in the upper-right corner of the window,
  which clicking will set the boolean to false when clicked.
- You may append multiple times to the same window during the same frame by calling Begin()/End() pairs multiple times.
  Some information such as 'flags' or 'p_open' will only be considered by the first call to Begin().
- Begin() return false to indicate the window is collapsed or fully clipped, so you may early out and omit submitting
  anything to the window. Always call a matching End() for each Begin() call, regardless of its return value!
  [Important: due to legacy reason, Begin/End and BeginChild/EndChild are inconsistent with all other functions
   such as BeginMenu/EndMenu, BeginPopup/EndPopup, etc. where the EndXXX call should only be called if the corresponding
   BeginXXX function returned true. Begin and BeginChild are the only odd ones out. Will be fixed in a future update.]
- Note that the bottom of window stack always contains a window called "Debug".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L453).
"""
Begin(
    name::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_open = C_NULL,
    flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0,
) = igBegin(name, p_open, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L454).
"""
End() = igEnd()

"""
$(TYPEDSIGNATURES)

Child Windows
- Use child windows to begin into a self-contained independent scrolling/clipping regions within a host window. Child windows can embed their own child.
- Before 1.90 (November 2023), the "ImGuiChildFlags child_flags = 0" parameter was "bool border = false".
  This API is backward compatible with old code, as we guarantee that ImGuiChildFlags_Borders == true.
  Consider updating your old code:
     BeginChild("Name", size, false)   -> Begin("Name", size, 0); or Begin("Name", size, ImGuiChildFlags_None);
     BeginChild("Name", size, true)    -> Begin("Name", size, ImGuiChildFlags_Borders);
- Manual sizing (each axis can use a different setting e.g. ImVec2(0.0f, 400.0f)):
    == 0.0f: use remaining parent window size for this axis.
     > 0.0f: use specified size for this axis.
     < 0.0f: right/bottom-align to specified distance from available content boundaries.
- Specifying ImGuiChildFlags_AutoResizeX or ImGuiChildFlags_AutoResizeY makes the sizing automatic based on child contents.
  Combining both ImGuiChildFlags_AutoResizeX _and_ ImGuiChildFlags_AutoResizeY defeats purpose of a scrolling region and is NOT recommended.
- BeginChild() returns false to indicate the window is collapsed or fully clipped, so you may early out and omit submitting
  anything to the window. Always call a matching EndChild() for each BeginChild() call, regardless of its return value.
  [Important: due to legacy reason, Begin/End and BeginChild/EndChild are inconsistent with all other functions
   such as BeginMenu/EndMenu, BeginPopup/EndPopup, etc. where the EndXXX call should only be called if the corresponding
   BeginXXX function returned true. Begin and BeginChild are the only odd ones out. Will be fixed in a future update.].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L474).
"""
BeginChild(
    str_id::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    child_flags::Union{ImGuiChildFlags,ImGuiChildFlags_,Integer} = 0,
    window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0,
) = igBeginChild_Str(str_id, size, child_flags, window_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L475).
"""
BeginChild(
    id::Union{ImGuiID,Integer},
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    child_flags::Union{ImGuiChildFlags,ImGuiChildFlags_,Integer} = 0,
    window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0,
) = igBeginChild_ID(id, size, child_flags, window_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L476).
"""
EndChild() = igEndChild()

"""
$(TYPEDSIGNATURES)

Windows Utilities
- 'current window' = the window we are appending into while inside a Begin()/End() block. 'next window' = next window we will Begin() into.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L480).
"""
IsWindowAppearing() = igIsWindowAppearing()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L481).
"""
IsWindowCollapsed() = igIsWindowCollapsed()

"""
$(TYPEDSIGNATURES)

Is current window focused? or its root/child, depending on flags. see flags for options.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L482).
"""
IsWindowFocused(flags::Union{ImGuiFocusedFlags,ImGuiFocusedFlags_,Integer} = 0) = igIsWindowFocused(flags)

"""
$(TYPEDSIGNATURES)

Is current window hovered and hoverable (e.g. not blocked by a popup/modal)? See ImGuiHoveredFlags_ for options. IMPORTANT: If you are trying to check whether your mouse should be dispatched to Dear ImGui or to your underlying app, you should not use this function! Use the 'io.WantCaptureMouse' boolean for that! Refer to FAQ entry "How can I tell whether to dispatch mouse/keyboard to Dear ImGui or my application?" for details.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L483).
"""
IsWindowHovered(flags::Union{ImGuiHoveredFlags,ImGuiHoveredFlags_,Integer} = 0) = igIsWindowHovered(flags)

"""
$(TYPEDSIGNATURES)

Get draw list associated to the current window, to append your own drawing primitives.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L484).
"""
GetWindowDrawList() = igGetWindowDrawList()

"""
$(TYPEDSIGNATURES)

Get DPI scale currently associated to the current window's viewport.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L485).
"""
GetWindowDpiScale() = igGetWindowDpiScale()

"""
$(TYPEDSIGNATURES)

Get current window position in screen space (IT IS UNLIKELY YOU EVER NEED TO USE THIS. Consider always using GetCursorScreenPos() and GetContentRegionAvail() instead).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L486).
"""
GetWindowPos() = igGetWindowPos()

"""
$(TYPEDSIGNATURES)

Get current window size (IT IS UNLIKELY YOU EVER NEED TO USE THIS. Consider always using GetCursorScreenPos() and GetContentRegionAvail() instead).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L487).
"""
GetWindowSize() = igGetWindowSize()

"""
$(TYPEDSIGNATURES)

Get current window width (IT IS UNLIKELY YOU EVER NEED TO USE THIS). Shortcut for GetWindowSize().x.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L488).
"""
GetWindowWidth() = igGetWindowWidth()

"""
$(TYPEDSIGNATURES)

Get current window height (IT IS UNLIKELY YOU EVER NEED TO USE THIS). Shortcut for GetWindowSize().y.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L489).
"""
GetWindowHeight() = igGetWindowHeight()

"""
$(TYPEDSIGNATURES)

Get viewport currently associated to the current window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L490).
"""
GetWindowViewport() = igGetWindowViewport()

"""
$(TYPEDSIGNATURES)

Window manipulation
- Prefer using SetNextXXX functions (before Begin) rather that SetXXX functions (after Begin).// set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L494).
"""
SetNextWindowPos(
    pos::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
    pivot::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igSetNextWindowPos(pos, cond, pivot)

"""
$(TYPEDSIGNATURES)

Set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L495).
"""
SetNextWindowSize(size::Union{ImVec2,NTuple{2}}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetNextWindowSize(size, cond)

"""
$(TYPEDSIGNATURES)

Set next window size limits. use 0.0f or FLT_MAX if you don't want limits. Use -1 for both min and max of same axis to preserve current size (which itself is a constraint). Use callback to apply non-trivial programmatic constraints.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L496).
"""
SetNextWindowSizeConstraints(
    size_min::Union{ImVec2,NTuple{2}},
    size_max::Union{ImVec2,NTuple{2}},
    custom_callback::Union{ImGuiSizeCallback,Base.CFunction,Ptr{Cvoid}} = C_NULL,
    custom_callback_data = C_NULL,
) = igSetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data)

"""
$(TYPEDSIGNATURES)

Set next window content size (~ scrollable client area, which enforce the range of scrollbars). Not including window decorations (title bar, menu bar, etc.) nor WindowPadding. set an axis to 0.0f to leave it automatic. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L497).
"""
SetNextWindowContentSize(size::Union{ImVec2,NTuple{2}}) = igSetNextWindowContentSize(size)

"""
$(TYPEDSIGNATURES)

Set next window collapsed state. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L498).
"""
SetNextWindowCollapsed(collapsed, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetNextWindowCollapsed(collapsed, cond)

"""
$(TYPEDSIGNATURES)

Set next window to be focused / top-most. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L499).
"""
SetNextWindowFocus() = igSetNextWindowFocus()

"""
$(TYPEDSIGNATURES)

Set next window scrolling value (use < 0.0f to not affect a given axis).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L500).
"""
SetNextWindowScroll(scroll::Union{ImVec2,NTuple{2}}) = igSetNextWindowScroll(scroll)

"""
$(TYPEDSIGNATURES)

Set next window background color alpha. helper to easily override the Alpha component of ImGuiCol_WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags_NoBackground.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L501).
"""
SetNextWindowBgAlpha(alpha) = igSetNextWindowBgAlpha(alpha)

"""
$(TYPEDSIGNATURES)

Set next window viewport.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L502).
"""
SetNextWindowViewport(viewport_id::Union{ImGuiID,Integer}) = igSetNextWindowViewport(viewport_id)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window position - call within Begin()/End(). prefer using SetNextWindowPos(), as this may incur tearing and side-effects.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L503).
"""
SetWindowPos(pos::Union{ImVec2,NTuple{2}}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowPos_Vec2(pos, cond)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window size - call within Begin()/End(). set to ImVec2(0, 0) to force an auto-fit. prefer using SetNextWindowSize(), as this may incur tearing and minor side-effects.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L504).
"""
SetWindowSize(size::Union{ImVec2,NTuple{2}}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowSize_Vec2(size, cond)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window collapsed state. prefer using SetNextWindowCollapsed().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L505).
"""
SetWindowCollapsed(collapsed::Bool, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowCollapsed_Bool(collapsed, cond)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window to be focused / top-most. prefer using SetNextWindowFocus().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L506).
"""
SetWindowFocus() = igSetWindowFocus_Nil()

"""
$(TYPEDSIGNATURES)

Set named window position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L507).
"""
SetWindowPos(
    name::Union{String,Ptr{Cchar}},
    pos::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
) = igSetWindowPos_Str(name, pos, cond)

"""
$(TYPEDSIGNATURES)

Set named window size. set axis to 0.0f to force an auto-fit on this axis.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L508).
"""
SetWindowSize(
    name::Union{String,Ptr{Cchar}},
    size::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
) = igSetWindowSize_Str(name, size, cond)

"""
$(TYPEDSIGNATURES)

Set named window collapsed state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L509).
"""
SetWindowCollapsed(name::Union{String,Ptr{Cchar}}, collapsed::Bool, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowCollapsed_Str(name, collapsed, cond)

"""
$(TYPEDSIGNATURES)

Set named window to be focused / top-most. use NULL to remove focus.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L510).
"""
SetWindowFocus(name::Union{String,Ptr{Cchar},Ptr{Cvoid}}) = igSetWindowFocus_Str(name)

"""
$(TYPEDSIGNATURES)

Windows Scrolling
- Any change of Scroll will be applied at the beginning of next frame in the first call to Begin().
- You may instead use SetNextWindowScroll() prior to calling Begin() to avoid this delay, as an alternative to using SetScrollX()/SetScrollY().// get scrolling amount [0 .. GetScrollMaxX()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L515).
"""
GetScrollX() = igGetScrollX()

"""
$(TYPEDSIGNATURES)

Get scrolling amount [0 .. GetScrollMaxY()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L516).
"""
GetScrollY() = igGetScrollY()

"""
$(TYPEDSIGNATURES)

Set scrolling amount [0 .. GetScrollMaxX()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L517).
"""
SetScrollX(scroll_x::Real) = igSetScrollX_Float(scroll_x)

"""
$(TYPEDSIGNATURES)

Set scrolling amount [0 .. GetScrollMaxY()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L518).
"""
SetScrollY(scroll_y::Real) = igSetScrollY_Float(scroll_y)

"""
$(TYPEDSIGNATURES)

Get maximum scrolling amount ~~ ContentSize.x - WindowSize.x - DecorationsSize.x.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L519).
"""
GetScrollMaxX() = igGetScrollMaxX()

"""
$(TYPEDSIGNATURES)

Get maximum scrolling amount ~~ ContentSize.y - WindowSize.y - DecorationsSize.y.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L520).
"""
GetScrollMaxY() = igGetScrollMaxY()

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left, 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L521).
"""
SetScrollHereX(center_x_ratio = 0.5f0) = igSetScrollHereX(center_x_ratio)

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L522).
"""
SetScrollHereY(center_y_ratio = 0.5f0) = igSetScrollHereY(center_y_ratio)

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L523).
"""
SetScrollFromPosX(local_x::Real, center_x_ratio::Real = 0.5f0) = igSetScrollFromPosX_Float(local_x, center_x_ratio)

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L524).
"""
SetScrollFromPosY(local_y::Real, center_y_ratio::Real = 0.5f0) = igSetScrollFromPosY_Float(local_y, center_y_ratio)

"""
$(TYPEDSIGNATURES)

Parameters stacks (font)
 - PushFont(font, 0.0f)                       // Change font and keep current size
 - PushFont(NULL, 20.0f)                      // Keep font and change current size
 - PushFont(font, 20.0f)                      // Change font and set size to 20.0f
 - PushFont(font, style.FontSizeBase * 2.0f)  // Change font and set size to be twice bigger than current size.
 - PushFont(font, font->LegacySize)           // Change font and set size to size passed to AddFontXXX() function. Same as pre-1.92 behavior.
*IMPORTANT* before 1.92, fonts had a single size. They can now be dynamically be adjusted.
 - In 1.92 we have REMOVED the single parameter version of PushFont() because it seems like the easiest way to provide an error-proof transition.
 - PushFont(font) before 1.92 = PushFont(font, font->LegacySize) after 1.92          // Use default font size as passed to AddFontXXX() function.
*IMPORTANT* global scale factors are applied over the provided size.
 - Global scale factors are: 'style.FontScaleMain', 'style.FontScaleDpi' and maybe more.
-  If you want to apply a factor to the _current_ font size:
 - CORRECT:   PushFont(NULL, style.FontSizeBase)         // use current unscaled size    == does nothing
 - CORRECT:   PushFont(NULL, style.FontSizeBase * 2.0f)  // use current unscaled size x2 == make text twice bigger
 - INCORRECT: PushFont(NULL, GetFontSize())              // INCORRECT! using size after global factors already applied == GLOBAL SCALING FACTORS WILL APPLY TWICE!
 - INCORRECT: PushFont(NULL, GetFontSize() * 2.0f)       // INCORRECT! using size after global factors already applied == GLOBAL SCALING FACTORS WILL APPLY TWICE!// Use NULL as a shortcut to keep current font. Use 0.0f to keep current size.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L542).
"""
PushFont(font::VoidablePtrOrRef{ImFont}, font_size_base_unscaled) = igPushFont(font, font_size_base_unscaled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L543).
"""
PopFont() = igPopFont()

"""
$(TYPEDSIGNATURES)

Get current font.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L544).
"""
GetFont() = igGetFont()

"""
$(TYPEDSIGNATURES)

Get current scaled font size (= height in pixels). AFTER global scale factors applied. *IMPORTANT* DO NOT PASS THIS VALUE TO PushFont()! Use ImGui::GetStyle().FontSizeBase to get value before global scale factors.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L545).
"""
GetFontSize() = igGetFontSize()

"""
$(TYPEDSIGNATURES)

Get current font bound at current size // == GetFont()->GetFontBaked(GetFontSize()).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L546).
"""
GetFontBaked() = igGetFontBaked()

"""
$(TYPEDSIGNATURES)

Parameters stacks (shared)// modify a style color. always use this if you modify the style after NewFrame().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L549).
"""
PushStyleColor(idx::Union{ImGuiCol,ImGuiCol_,Integer}, col::Union{ImU32,Integer}) = igPushStyleColor_U32(idx, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L550).
"""
PushStyleColor(idx::Union{ImGuiCol,ImGuiCol_,Integer}, col::Union{ImVec4,NTuple{4}}) = igPushStyleColor_Vec4(idx, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L551).
"""
PopStyleColor(count = 1) = igPopStyleColor(count)

"""
$(TYPEDSIGNATURES)

Modify a style float variable. always use this if you modify the style after NewFrame()!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L552).
"""
PushStyleVar(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val::Real) = igPushStyleVar_Float(idx, val)

"""
$(TYPEDSIGNATURES)

Modify a style ImVec2 variable. ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L553).
"""
PushStyleVar(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val::Union{ImVec2,NTuple{2}}) =
    igPushStyleVar_Vec2(idx, val)

"""
$(TYPEDSIGNATURES)

Modify X component of a style ImVec2 variable. ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L554).
"""
PushStyleVarX(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val_x) = igPushStyleVarX(idx, val_x)

"""
$(TYPEDSIGNATURES)

Modify Y component of a style ImVec2 variable. ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L555).
"""
PushStyleVarY(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val_y) = igPushStyleVarY(idx, val_y)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L556).
"""
PopStyleVar(count = 1) = igPopStyleVar(count)

"""
$(TYPEDSIGNATURES)

Modify specified shared item flag, e.g. PushItemFlag(ImGuiItemFlags_NoTabStop, true).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L557).
"""
PushItemFlag(option::Union{ImGuiItemFlags,ImGuiItemFlags_,Integer}, enabled) = igPushItemFlag(option, enabled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L558).
"""
PopItemFlag() = igPopItemFlag()

"""
$(TYPEDSIGNATURES)

Parameters stacks (current window)// push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L561).
"""
PushItemWidth(item_width) = igPushItemWidth(item_width)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L562).
"""
PopItemWidth() = igPopItemWidth()

"""
$(TYPEDSIGNATURES)

Set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L563).
"""
SetNextItemWidth(item_width) = igSetNextItemWidth(item_width)

"""
$(TYPEDSIGNATURES)

Width of item given pushed settings and current cursor position. NOT necessarily the width of last item unlike most 'Item' functions.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L564).
"""
CalcItemWidth() = igCalcItemWidth()

"""
$(TYPEDSIGNATURES)

Push word-wrapping position for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L565).
"""
PushTextWrapPos(wrap_local_pos_x = 0.0f0) = igPushTextWrapPos(wrap_local_pos_x)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L566).
"""
PopTextWrapPos() = igPopTextWrapPos()

"""
$(TYPEDSIGNATURES)

Style read access
- Use the ShowStyleEditor() function to interactively see/edit the colors.// get UV coordinate for a white pixel, useful to draw custom shapes via the ImDrawList API.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L570).
"""
GetFontTexUvWhitePixel() = igGetFontTexUvWhitePixel()

"""
$(TYPEDSIGNATURES)

Retrieve given style color with style alpha applied and optional extra alpha multiplier, packed as a 32-bit value suitable for ImDrawList.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L571).
"""
GetColorU32(idx::Union{ImGuiCol,ImGuiCol_,Integer}, alpha_mul::Real = 1.0f0) = igGetColorU32_Col(idx, alpha_mul)

"""
$(TYPEDSIGNATURES)

Retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L572).
"""
GetColorU32(col::Union{ImVec4,NTuple{4}}) = igGetColorU32_Vec4(col)

"""
$(TYPEDSIGNATURES)

Retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L573).
"""
GetColorU32(col::Union{ImU32,Integer}, alpha_mul::Real = 1.0f0) = igGetColorU32_U32(col, alpha_mul)

"""
$(TYPEDSIGNATURES)

Retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwise use GetColorU32() to get style color with style alpha baked in.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L574).
"""
GetStyleColorVec4(idx::Union{ImGuiCol,ImGuiCol_,Integer}) = igGetStyleColorVec4(idx)

"""
$(TYPEDSIGNATURES)

Layout cursor positioning
- By "cursor" we mean the current output position.
- The typical widget behavior is to output themselves at the current cursor position, then move the cursor one line down.
- You can call SameLine() between widgets to undo the last carriage return and output at the right of the preceding widget.
- YOU CAN DO 99% OF WHAT YOU NEED WITH ONLY GetCursorScreenPos() and GetContentRegionAvail().
- Attention! We currently have inconsistencies between window-local and absolute positions we will aim to fix with future API:
   - Absolute coordinate:        GetCursorScreenPos(), SetCursorScreenPos(), all ImDrawList:: functions. -> this is the preferred way forward.
   - Window-local coordinates:   SameLine(offset), GetCursorPos(), SetCursorPos(), GetCursorStartPos(), PushTextWrapPos()
   - Window-local coordinates:   GetContentRegionMax(), GetWindowContentRegionMin(), GetWindowContentRegionMax() --> all obsoleted. YOU DON'T NEED THEM.
- GetCursorScreenPos() = GetCursorPos() + GetWindowPos(). GetWindowPos() is almost only ever useful to convert from window-local to absolute coordinates. Try not to use it.// cursor position, absolute coordinates. THIS IS YOUR BEST FRIEND (prefer using this rather than GetCursorPos(), also more useful to work with ImDrawList API).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L586).
"""
GetCursorScreenPos() = igGetCursorScreenPos()

"""
$(TYPEDSIGNATURES)

Cursor position, absolute coordinates. THIS IS YOUR BEST FRIEND.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L587).
"""
SetCursorScreenPos(pos::Union{ImVec2,NTuple{2}}) = igSetCursorScreenPos(pos)

"""
$(TYPEDSIGNATURES)

Available space from current position. THIS IS YOUR BEST FRIEND.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L588).
"""
GetContentRegionAvail() = igGetContentRegionAvail()

"""
$(TYPEDSIGNATURES)

[window-local] cursor position in window-local coordinates. This is not your best friend.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L589).
"""
GetCursorPos() = igGetCursorPos()

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L590).
"""
GetCursorPosX() = igGetCursorPosX()

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L591).
"""
GetCursorPosY() = igGetCursorPosY()

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L592).
"""
SetCursorPos(local_pos::Union{ImVec2,NTuple{2}}) = igSetCursorPos(local_pos)

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L593).
"""
SetCursorPosX(local_x) = igSetCursorPosX(local_x)

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L594).
"""
SetCursorPosY(local_y) = igSetCursorPosY(local_y)

"""
$(TYPEDSIGNATURES)

[window-local] initial cursor position, in window-local coordinates. Call GetCursorScreenPos() after Begin() to get the absolute coordinates version.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L595).
"""
GetCursorStartPos() = igGetCursorStartPos()

"""
$(TYPEDSIGNATURES)

Other layout functions// separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L598).
"""
Separator() = igSeparator()

"""
$(TYPEDSIGNATURES)

Call between widgets or groups to layout them horizontally. X position given in window coordinates.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L599).
"""
SameLine(offset_from_start_x = 0.0f0, spacing = -1.0f0) = igSameLine(offset_from_start_x, spacing)

"""
$(TYPEDSIGNATURES)

Undo a SameLine() or force a new line when in a horizontal-layout context.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L600).
"""
NewLine() = igNewLine()

"""
$(TYPEDSIGNATURES)

Add vertical spacing.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L601).
"""
Spacing() = igSpacing()

"""
$(TYPEDSIGNATURES)

Add a dummy item of given size. unlike InvisibleButton(), Dummy() won't take the mouse click or be navigable into.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L602).
"""
Dummy(size::Union{ImVec2,NTuple{2}}) = igDummy(size)

"""
$(TYPEDSIGNATURES)

Move content position toward the right, by indent_w, or style.IndentSpacing if indent_w <= 0.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L603).
"""
Indent(indent_w = 0.0f0) = igIndent(indent_w)

"""
$(TYPEDSIGNATURES)

Move content position back to the left, by indent_w, or style.IndentSpacing if indent_w <= 0.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L604).
"""
Unindent(indent_w = 0.0f0) = igUnindent(indent_w)

"""
$(TYPEDSIGNATURES)

Lock horizontal starting position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L605).
"""
BeginGroup() = igBeginGroup()

"""
$(TYPEDSIGNATURES)

Unlock horizontal starting position + capture the whole group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L606).
"""
EndGroup() = igEndGroup()

"""
$(TYPEDSIGNATURES)

Vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly framed items (call if you have text on a line before a framed item).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L607).
"""
AlignTextToFramePadding() = igAlignTextToFramePadding()

"""
$(TYPEDSIGNATURES)

~ FontSize.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L608).
"""
GetTextLineHeight() = igGetTextLineHeight()

"""
$(TYPEDSIGNATURES)

~ FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L609).
"""
GetTextLineHeightWithSpacing() = igGetTextLineHeightWithSpacing()

"""
$(TYPEDSIGNATURES)

~ FontSize + style.FramePadding.y * 2.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L610).
"""
GetFrameHeight() = igGetFrameHeight()

"""
$(TYPEDSIGNATURES)

~ FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of framed widgets).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L611).
"""
GetFrameHeightWithSpacing() = igGetFrameHeightWithSpacing()

"""
$(TYPEDSIGNATURES)

ID stack/scopes
Read the FAQ (docs/FAQ.md or http://dearimgui.com/faq) for more details about how ID are handled in dear imgui.
- Those questions are answered and impacted by understanding of the ID stack system:
  - "Q: Why is my widget not reacting when I click on it?"
  - "Q: How can I have widgets with an empty label?"
  - "Q: How can I have multiple widgets with the same label?"
- Short version: ID are hashes of the entire ID stack. If you are creating widgets in a loop you most likely
  want to push a unique identifier (e.g. object pointer, loop index) to uniquely differentiate them.
- You can also use the "Label##foobar" syntax within widget label to distinguish them from each others.
- In this header file we use the "label"/"name" terminology to denote a string that will be displayed + used as an ID,
  whereas "str_id" denote a string that is only used as an ID and not normally displayed.// push string into the ID stack (will hash string).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L624).
"""
PushID(str_id::Union{String,Ptr{Cchar}}) = igPushID_Str(str_id)

"""
$(TYPEDSIGNATURES)

Push string into the ID stack (will hash string).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L625).
"""
PushID(str_id_begin::Union{String,Ptr{Cchar}}, str_id_end::Union{String,Ptr{Cchar},Ptr{Cvoid}}) =
    igPushID_StrStr(str_id_begin, str_id_end)

"""
$(TYPEDSIGNATURES)

Push pointer into the ID stack (will hash pointer).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L626).
"""
PushID(ptr_id::PtrOrRef{Cvoid}) = igPushID_Ptr(ptr_id)

"""
$(TYPEDSIGNATURES)

Push integer into the ID stack (will hash integer).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L627).
"""
PushID(int_id::Integer) = igPushID_Int(int_id)

"""
$(TYPEDSIGNATURES)

Pop from the ID stack.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L628).
"""
PopID() = igPopID()

"""
$(TYPEDSIGNATURES)

Calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into ImGuiStorage yourself.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L629).
"""
GetID(str_id::Union{String,Ptr{Cchar}}) = igGetID_Str(str_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L630).
"""
GetID(str_id_begin::Union{String,Ptr{Cchar}}, str_id_end::Union{String,Ptr{Cchar},Ptr{Cvoid}}) =
    igGetID_StrStr(str_id_begin, str_id_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L631).
"""
GetID(ptr_id::PtrOrRef{Cvoid}) = igGetID_Ptr(ptr_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L632).
"""
GetID(int_id::Integer) = igGetID_Int(int_id)

"""
$(TYPEDSIGNATURES)

Widgets: Text
- Note that all functions taking format strings in the API may be passed ("%s", text) or ("%.*s", text_len, text): which will automatically bypass the formatter.// raw text without formatting. Practically equivalent to 'Text("%s", text)' but doesn't require null terminated string if 'text_end' is specified.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L636).
"""
TextUnformatted(text, text_end = C_NULL) = igTextUnformatted(text, text_end)

"""
$(TYPEDSIGNATURES)

Formatted text.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L637).
"""
function Text end
Text(fmt) = igText(fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L639).
"""
TextColored(col::Union{ImVec4,NTuple{4}}, fmt) = igTextColored(col, fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L641).
"""
TextDisabled(fmt) = igTextDisabled(fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L643).
"""
TextWrapped(fmt) = igTextWrapped(fmt)

"""
$(TYPEDSIGNATURES)

Display text+label aligned the same way as value+label widgets.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L645).
"""
LabelText(label, fmt) = igLabelText(label, fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for Bullet()+Text().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L647).
"""
BulletText(fmt) = igBulletText(fmt)

"""
$(TYPEDSIGNATURES)

Currently: formatted text with a horizontal line.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L649).
"""
SeparatorText(label) = igSeparatorText(label)

"""
$(TYPEDSIGNATURES)

Widgets: Main
- Most widgets return true when the value has been changed or when pressed/selected
- You may also use one of the many IsItemXXX functions (e.g. IsItemActive, IsItemHovered, etc.) to query widget state.// button.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L654).
"""
Button(label, size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0)) = igButton(label, size)

"""
$(TYPEDSIGNATURES)

Button with (FramePadding.y == 0) to easily embed within text.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L655).
"""
SmallButton(label) = igSmallButton(label)

"""
$(TYPEDSIGNATURES)

Flexible button behavior without the visuals, frequently useful to build custom behaviors using the public api (along with IsItemActive, IsItemHovered, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L656).
"""
InvisibleButton(str_id, size::Union{ImVec2,NTuple{2}}, flags::Union{ImGuiButtonFlags,ImGuiButtonFlags_,Integer} = 0) =
    igInvisibleButton(str_id, size, flags)

"""
$(TYPEDSIGNATURES)

Square button with an arrow shape.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L657).
"""
ArrowButton(str_id, dir::ImGuiDir) = igArrowButton(str_id, dir)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L658).
"""
Checkbox(label, v) = igCheckbox(label, v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L659).
"""
CheckboxFlags(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, flags::PtrOrRef{Int32}, flags_value) =
    igCheckboxFlags_IntPtr(label, flags, flags_value)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L660).
"""
CheckboxFlags(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, flags::PtrOrRef{UInt32}, flags_value) =
    igCheckboxFlags_UintPtr(label, flags, flags_value)

"""
$(TYPEDSIGNATURES)

Use with e.g. if (RadioButton("one", my_value==1))  my_value = 1; .

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L661).
"""
RadioButton(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, active::Bool) = igRadioButton_Bool(label, active)

"""
$(TYPEDSIGNATURES)

Shortcut to handle the above pattern when value is an integer.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L662).
"""
RadioButton(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, v::VoidablePtrOrRef{Int32}, v_button::Integer) =
    igRadioButton_IntPtr(label, v, v_button)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L663).
"""
ProgressBar(fraction, size_arg::Union{ImVec2,NTuple{2}} = ImVec2(-FLT_MIN, 0), overlay = C_NULL) =
    igProgressBar(fraction, size_arg, overlay)

"""
$(TYPEDSIGNATURES)

Draw a small circle + keep the cursor on the same line. advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L664).
"""
Bullet() = igBullet()

"""
$(TYPEDSIGNATURES)

Hyperlink text button, return true when clicked.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L665).
"""
TextLink(label) = igTextLink(label)

"""
$(TYPEDSIGNATURES)

Hyperlink text button, automatically open file/url when clicked.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L666).
"""
TextLinkOpenURL(label, url = C_NULL) = igTextLinkOpenURL(label, url)

"""
$(TYPEDSIGNATURES)

Widgets: Images
- Read about ImTextureID/ImTextureRef  here: https://github.com/ocornut/imgui/wiki/Image-Loading-and-Displaying-Examples
- 'uv0' and 'uv1' are texture coordinates. Read about them from the same link above.
- Image() adds style.ImageBorderSize on each side, ImageButton() adds style.FramePadding on each side.
- ImageButton() draws a background based on regular Button() color + optionally an inner background if specified.
- An obsolete version of Image(), before 1.91.9 (March 2025), had a 'tint_col' parameter which is now supported by the ImageWithBg() function.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L674).
"""
Image(
    tex_ref::ImTextureRef,
    image_size::Union{ImVec2,NTuple{2}},
    uv0::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    uv1::Union{ImVec2,NTuple{2}} = ImVec2(1, 1),
) = igImage(tex_ref, image_size, uv0, uv1)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L675).
"""
ImageWithBg(
    tex_ref::ImTextureRef,
    image_size::Union{ImVec2,NTuple{2}},
    uv0::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    uv1::Union{ImVec2,NTuple{2}} = ImVec2(1, 1),
    bg_col::Union{ImVec4,NTuple{4}} = ImVec4(0, 0, 0, 0),
    tint_col::Union{ImVec4,NTuple{4}} = ImVec4(1, 1, 1, 1),
) = igImageWithBg(tex_ref, image_size, uv0, uv1, bg_col, tint_col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L676).
"""
ImageButton(
    str_id,
    tex_ref::ImTextureRef,
    image_size::Union{ImVec2,NTuple{2}},
    uv0::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    uv1::Union{ImVec2,NTuple{2}} = ImVec2(1, 1),
    bg_col::Union{ImVec4,NTuple{4}} = ImVec4(0, 0, 0, 0),
    tint_col::Union{ImVec4,NTuple{4}} = ImVec4(1, 1, 1, 1),
) = igImageButton(str_id, tex_ref, image_size, uv0, uv1, bg_col, tint_col)

"""
$(TYPEDSIGNATURES)

Widgets: Combo Box (Dropdown)
- The BeginCombo()/EndCombo() api allows you to manage your contents and selection state however you want it, by creating e.g. Selectable() items.
- The old Combo() api are helpers over BeginCombo()/EndCombo() which are kept available for convenience purpose. This is analogous to how ListBox are created.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L681).
"""
BeginCombo(label, preview_value, flags::Union{ImGuiComboFlags,ImGuiComboFlags_,Integer} = 0) =
    igBeginCombo(label, preview_value, flags)

"""
$(TYPEDSIGNATURES)

Only call EndCombo() if BeginCombo() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L682).
"""
EndCombo() = igEndCombo()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L683).
"""
Combo(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    current_item::VoidablePtrOrRef{Int32},
    items::Vector{String},
    popup_max_height_in_items::Integer = -1,
) = igCombo_Str_arr(label, current_item, items, length(items), popup_max_height_in_items)

"""
$(TYPEDSIGNATURES)

Separate items with \\0 within a string, end item-list with \\0\\0. e.g. "One\\0Two\\0Three\\0".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L684).
"""
Combo(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    current_item::VoidablePtrOrRef{Int32},
    items_separated_by_zeros::Union{String,Ptr{Cchar}},
    popup_max_height_in_items::Integer = -1,
) = igCombo_Str(label, current_item, items_separated_by_zeros, popup_max_height_in_items)

"""
$(TYPEDSIGNATURES)

Widgets: Drag Sliders
- Ctrl+Click on any drag box to turn them into an input box. Manually input values aren't clamped by default and can go off-bounds. Use ImGuiSliderFlags_AlwaysClamp to always clamp.
- For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every function, note that a 'float v[X]' function argument is the same as 'float* v',
  the array syntax is just a way to document the number of elements that are expected to be accessible. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
- Adjust format string to decorate the value with a prefix, a suffix, or adapt the editing and display precision e.g. "%.3f" -> 1.234; "%5.2f secs" -> 01.23 secs; "Biscuit: %.0f" -> Biscuit: 1; etc.
- Format string may also be set to NULL or use the default format ("%f" or "%d").
- Speed are per-pixel of mouse movement (v_speed=0.2f: mouse needs to move by 5 pixels to increase value by 1). For keyboard/gamepad navigation, minimum speed is Max(v_speed, minimum_step_at_given_precision).
- Use v_min < v_max to clamp edits to given limits. Note that Ctrl+Click manual input can override those limits if ImGuiSliderFlags_AlwaysClamp is not used.
- Use v_max = FLT_MAX / INT_MAX etc to avoid clamping to a maximum, same with v_min = -FLT_MAX / INT_MIN to avoid clamping to a minimum.
- We use the same sets of flags for DragXXX() and SliderXXX() functions as the features are the same and it makes it easier to swap them.
- Legacy: Pre-1.78 there are DragXXX() function signatures that take a final `float power=1.0f' argument instead of the `ImGuiSliderFlags flags=0' argument.
  If you get a warning converting a float to ImGuiSliderFlags, read https://github.com/ocornut/imgui/issues/3361// If v_min >= v_max we have no bound.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L699).
"""
DragFloat(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L700).
"""
DragFloat2(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat2(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L701).
"""
DragFloat3(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat3(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L702).
"""
DragFloat4(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat4(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L703).
"""
DragFloatRange2(
    label,
    v_current_min,
    v_current_max,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f",
    format_max = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)

"""
$(TYPEDSIGNATURES)

If v_min >= v_max we have no bound.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L704).
"""
DragInt(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0,
    v_max = 0,
    format = "%d",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragInt(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L705).
"""
DragInt2(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0,
    v_max = 0,
    format = "%d",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragInt2(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L706).
"""
DragInt3(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0,
    v_max = 0,
    format = "%d",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragInt3(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L707).
"""
DragInt4(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0,
    v_max = 0,
    format = "%d",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragInt4(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L708).
"""
DragIntRange2(
    label,
    v_current_min,
    v_current_max,
    v_speed = 1.0f0,
    v_min = 0,
    v_max = 0,
    format = "%d",
    format_max = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L709).
"""
DragScalar(
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    v_speed = 1.0f0,
    p_min = C_NULL,
    p_max = C_NULL,
    format = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragScalar(label, data_type, p_data, v_speed, p_min, p_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L710).
"""
DragScalarN(
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    components,
    v_speed = 1.0f0,
    p_min = C_NULL,
    p_max = C_NULL,
    format = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragScalarN(label, data_type, p_data, components, v_speed, p_min, p_max, format, flags)

"""
$(TYPEDSIGNATURES)

Widgets: Regular Sliders
- Ctrl+Click on any slider to turn them into an input box. Manually input values aren't clamped by default and can go off-bounds. Use ImGuiSliderFlags_AlwaysClamp to always clamp.
- Adjust format string to decorate the value with a prefix, a suffix, or adapt the editing and display precision e.g. "%.3f" -> 1.234; "%5.2f secs" -> 01.23 secs; "Biscuit: %.0f" -> Biscuit: 1; etc.
- Format string may also be set to NULL or use the default format ("%f" or "%d").
- Legacy: Pre-1.78 there are SliderXXX() function signatures that take a final `float power=1.0f' argument instead of the `ImGuiSliderFlags flags=0' argument.
  If you get a warning converting a float to ImGuiSliderFlags, read https://github.com/ocornut/imgui/issues/3361// adjust format to decorate the value with a prefix or a suffix for in-slider labels or unit display.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L718).
"""
SliderFloat(label, v, v_min, v_max, format = "%.3f", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L719).
"""
SliderFloat2(label, v, v_min, v_max, format = "%.3f", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat2(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L720).
"""
SliderFloat3(label, v, v_min, v_max, format = "%.3f", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat3(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L721).
"""
SliderFloat4(label, v, v_min, v_max, format = "%.3f", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat4(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L722).
"""
SliderAngle(
    label,
    v_rad,
    v_degrees_min = -360.0f0,
    v_degrees_max = 360.0f0,
    format = "%.0f deg",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L723).
"""
SliderInt(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L724).
"""
SliderInt2(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt2(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L725).
"""
SliderInt3(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt3(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L726).
"""
SliderInt4(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt4(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L727).
"""
SliderScalar(
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    p_min,
    p_max,
    format = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igSliderScalar(label, data_type, p_data, p_min, p_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L728).
"""
SliderScalarN(
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    components,
    p_min,
    p_max,
    format = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igSliderScalarN(label, data_type, p_data, components, p_min, p_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L729).
"""
VSliderFloat(
    label,
    size::Union{ImVec2,NTuple{2}},
    v,
    v_min,
    v_max,
    format = "%.3f",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igVSliderFloat(label, size, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L730).
"""
VSliderInt(
    label,
    size::Union{ImVec2,NTuple{2}},
    v,
    v_min,
    v_max,
    format = "%d",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igVSliderInt(label, size, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L731).
"""
VSliderScalar(
    label,
    size::Union{ImVec2,NTuple{2}},
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    p_min,
    p_max,
    format = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igVSliderScalar(label, size, data_type, p_data, p_min, p_max, format, flags)

"""
$(TYPEDSIGNATURES)

Widgets: Input with Keyboard
- If you want to use InputText() with std::string or any custom dynamic string type, use the wrapper in misc/cpp/imgui_stdlib.h/.cpp!
- Most of the ImGuiInputTextFlags flags are only useful for InputText() and not for InputFloatX, InputIntX, InputDouble etc.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L736).
"""
InputText(
    label,
    buf,
    buf_size,
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
    callback::Union{ImGuiInputTextCallback,Base.CFunction,Ptr{Cvoid}} = C_NULL,
    user_data = C_NULL,
) = igInputText(label, buf, buf_size, flags, callback, user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L737).
"""
InputTextMultiline(
    label,
    buf,
    buf_size,
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
    callback::Union{ImGuiInputTextCallback,Base.CFunction,Ptr{Cvoid}} = C_NULL,
    user_data = C_NULL,
) = igInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L738).
"""
InputTextWithHint(
    label,
    hint,
    buf,
    buf_size,
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
    callback::Union{ImGuiInputTextCallback,Base.CFunction,Ptr{Cvoid}} = C_NULL,
    user_data = C_NULL,
) = igInputTextWithHint(label, hint, buf, buf_size, flags, callback, user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L739).
"""
InputFloat(
    label,
    v,
    step = 0.0f0,
    step_fast = 0.0f0,
    format = "%.3f",
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
) = igInputFloat(label, v, step, step_fast, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L740).
"""
InputFloat2(label, v, format = "%.3f", flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputFloat2(label, v, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L741).
"""
InputFloat3(label, v, format = "%.3f", flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputFloat3(label, v, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L742).
"""
InputFloat4(label, v, format = "%.3f", flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputFloat4(label, v, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L743).
"""
InputInt(label, v, step = 1, step_fast = 100, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputInt(label, v, step, step_fast, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L744).
"""
InputInt2(label, v, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) = igInputInt2(label, v, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L745).
"""
InputInt3(label, v, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) = igInputInt3(label, v, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L746).
"""
InputInt4(label, v, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) = igInputInt4(label, v, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L747).
"""
InputDouble(
    label,
    v,
    step = 0.0,
    step_fast = 0.0,
    format = "%.6f",
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
) = igInputDouble(label, v, step, step_fast, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L748).
"""
InputScalar(
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    p_step = C_NULL,
    p_step_fast = C_NULL,
    format = C_NULL,
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
) = igInputScalar(label, data_type, p_data, p_step, p_step_fast, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L749).
"""
InputScalarN(
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    components,
    p_step = C_NULL,
    p_step_fast = C_NULL,
    format = C_NULL,
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
) = igInputScalarN(label, data_type, p_data, components, p_step, p_step_fast, format, flags)

"""
$(TYPEDSIGNATURES)

Widgets: Color Editor/Picker (tip: the ColorEdit* functions have a little color square that can be left-clicked to open a picker, and right-clicked to open an option menu.)
- Note that in C++ a 'float v[X]' function argument is the _same_ as 'float* v', the array syntax is just a way to document the number of elements that are expected to be accessible.
- You can pass the address of a first float element out of a contiguous structure, e.g. &myvector.x.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L754).
"""
ColorEdit3(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0) =
    igColorEdit3(label, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L755).
"""
ColorEdit4(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0) =
    igColorEdit4(label, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L756).
"""
ColorPicker3(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0) =
    igColorPicker3(label, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L757).
"""
ColorPicker4(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0, ref_col = C_NULL) =
    igColorPicker4(label, col, flags, ref_col)

"""
$(TYPEDSIGNATURES)

Display a color square/button, hover for details, return true when pressed.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L758).
"""
ColorButton(
    desc_id,
    col::Union{ImVec4,NTuple{4}},
    flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0,
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igColorButton(desc_id, col, flags, size)

"""
$(TYPEDSIGNATURES)

Widgets: Trees
- TreeNode functions return true when the node is open, in which case you need to also call TreePop() when you are finished displaying the tree node contents.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L762).
"""
TreeNode(label::Union{String,Ptr{Cchar}}) = igTreeNode_Str(label)

"""
$(TYPEDSIGNATURES)

Helper variation to easily decorrelate the id from the displayed string. Read the FAQ about why and how to use ID. to align arbitrary text at the same level as a TreeNode() you can use Bullet().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L763).
"""
TreeNode(str_id::Union{String,Ptr{Cchar}}, fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}}) = igTreeNode_StrStr(str_id, fmt)

"""
$(TYPEDSIGNATURES)

".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L764).
"""
TreeNode(ptr_id::PtrOrRef{Cvoid}, fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}}) = igTreeNode_Ptr(ptr_id, fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L767).
"""
TreeNodeEx(label::Union{String,Ptr{Cchar}}, flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer} = 0) =
    igTreeNodeEx_Str(label, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L768).
"""
TreeNodeEx(
    str_id::Union{String,Ptr{Cchar}},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
    fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}},
) = igTreeNodeEx_StrStr(str_id, flags, fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L769).
"""
TreeNodeEx(
    ptr_id::PtrOrRef{Cvoid},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
    fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}},
) = igTreeNodeEx_Ptr(ptr_id, flags, fmt)

"""
$(TYPEDSIGNATURES)

~ Indent()+PushID(). Already called by TreeNode() when returning true, but you can call TreePush/TreePop yourself if desired.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L772).
"""
TreePush(str_id::Union{String,Ptr{Cchar}}) = igTreePush_Str(str_id)

"""
$(TYPEDSIGNATURES)

".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L773).
"""
TreePush(ptr_id::PtrOrRef{Cvoid}) = igTreePush_Ptr(ptr_id)

"""
$(TYPEDSIGNATURES)

~ Unindent()+PopID().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L774).
"""
TreePop() = igTreePop()

"""
$(TYPEDSIGNATURES)

Horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L775).
"""
GetTreeNodeToLabelSpacing() = igGetTreeNodeToLabelSpacing()

"""
$(TYPEDSIGNATURES)

If returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L776).
"""
CollapsingHeader(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer} = 0,
) = igCollapsingHeader_TreeNodeFlags(label, flags)

"""
$(TYPEDSIGNATURES)

When 'p_visible != NULL': if '*p_visible==true' display an additional small close button on upper right of the header which will set the bool to false when clicked, if '*p_visible==false' don't display the header.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L777).
"""
CollapsingHeader(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_visible::VoidablePtrOrRef{Bool},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer} = 0,
) = igCollapsingHeader_BoolPtr(label, p_visible, flags)

"""
$(TYPEDSIGNATURES)

Set next TreeNode/CollapsingHeader open state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L778).
"""
SetNextItemOpen(is_open, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) = igSetNextItemOpen(is_open, cond)

"""
$(TYPEDSIGNATURES)

Set id to use for open/close storage (default to same as item id).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L779).
"""
SetNextItemStorageID(storage_id::Union{ImGuiID,Integer}) = igSetNextItemStorageID(storage_id)

"""
$(TYPEDSIGNATURES)

Retrieve tree node open/close state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L780).
"""
TreeNodeGetOpen(storage_id::Union{ImGuiID,Integer}) = igTreeNodeGetOpen(storage_id)

"""
$(TYPEDSIGNATURES)

Widgets: Selectables
- A selectable highlights when hovered, and can display another color when selected.
- Neighbors selectable extend their highlight bounds in order to leave no gap between them. This is so a series of selected Selectable appear contiguous.// "bool selected" carry the selection state (read-only). Selectable() is clicked is returns true so you can modify your selection state. size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L785).
"""
Selectable(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    selected::Bool = false,
    flags::Union{ImGuiSelectableFlags,ImGuiSelectableFlags_,Integer} = 0,
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igSelectable_Bool(label, selected, flags, size)

"""
$(TYPEDSIGNATURES)

"bool* p_selected" point to the selection state (read-write), as a convenient helper.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L786).
"""
Selectable(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_selected::PtrOrRef{Bool},
    flags::Union{ImGuiSelectableFlags,ImGuiSelectableFlags_,Integer} = 0,
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igSelectable_BoolPtr(label, p_selected, flags, size)

"""
$(TYPEDSIGNATURES)

Multi-selection system for Selectable(), Checkbox(), TreeNode() functions [BETA]
- This enables standard multi-selection/range-selection idioms (Ctrl+Mouse/Keyboard, Shift+Mouse/Keyboard, etc.) in a way that also allow a clipper to be used.
- ImGuiSelectionUserData is often used to store your item index within the current view (but may store something else).
- Read comments near ImGuiMultiSelectIO for instructions/details and see 'Demo->Widgets->Selection State & Multi-Select' for demo.
- TreeNode() is technically supported but... using this correctly is more complicated. You need some sort of linear/random access to your tree,
  which is suited to advanced trees setups already implementing filters and clipper. We will work simplifying the current demo.
- 'selection_size' and 'items_count' parameters are optional and used by a few features. If they are costly for you to compute, you may avoid them.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L795).
"""
BeginMultiSelect(
    flags::Union{ImGuiMultiSelectFlags,ImGuiMultiSelectFlags_,Integer},
    selection_size = -1,
    items_count = -1,
) = igBeginMultiSelect(flags, selection_size, items_count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L796).
"""
EndMultiSelect() = igEndMultiSelect()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L797).
"""
SetNextItemSelectionUserData(selection_user_data::ImGuiSelectionUserData) =
    igSetNextItemSelectionUserData(selection_user_data)

"""
$(TYPEDSIGNATURES)

Was the last item selection state toggled? Useful if you need the per-item information _before_ reaching EndMultiSelect(). We only returns toggle _event_ in order to handle clipping correctly.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L798).
"""
IsItemToggledSelection() = igIsItemToggledSelection()

"""
$(TYPEDSIGNATURES)

Widgets: List Boxes
- This is essentially a thin wrapper to using BeginChild/EndChild with the ImGuiChildFlags_FrameStyle flag for stylistic changes + displaying a label.
- If you don't need a label you can probably simply use BeginChild() with the ImGuiChildFlags_FrameStyle flag for the same result.
- You can submit contents and manage your selection state however you want it, by creating e.g. Selectable() or any other items.
- The simplified/old ListBox() api are helpers over BeginListBox()/EndListBox() which are kept available for convenience purpose. This is analogous to how Combos are created.
- Choose frame width:   size.x > 0.0f: custom  /  size.x < 0.0f or -FLT_MIN: right-align   /  size.x = 0.0f (default): use current ItemWidth
- Choose frame height:  size.y > 0.0f: custom  /  size.y < 0.0f or -FLT_MIN: bottom-align  /  size.y = 0.0f (default): arbitrary default height which can fit ~7 items// open a framed scrolling region.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L807).
"""
BeginListBox(label, size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0)) = igBeginListBox(label, size)

"""
$(TYPEDSIGNATURES)

Only call EndListBox() if BeginListBox() returned true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L808).
"""
EndListBox() = igEndListBox()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L809).
"""
ListBox(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    current_item::VoidablePtrOrRef{Int32},
    items::Vector{String},
    height_in_items::Integer = -1,
) = igListBox_Str_arr(label, current_item, items, length(items), height_in_items)

"""
$(TYPEDSIGNATURES)

Widgets: Value() Helpers.
- Those are merely shortcut to calling Text() with a format string. Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L821).
"""
Value(prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}}, b::Bool) = igValue_Bool(prefix, b)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L822).
"""
Value(prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}}, v::Int) = igValue_Int(prefix, v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L823).
"""
Value(prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}}, v::UInt) = igValue_Uint(prefix, v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L824).
"""
Value(
    prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    v::Real,
    float_format::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL,
) = igValue_Float(prefix, v, float_format)

"""
$(TYPEDSIGNATURES)

Widgets: Menus
- Use BeginMenuBar() on a window ImGuiWindowFlags_MenuBar to append to its menu bar.
- Use BeginMainMenuBar() to create a menu bar at the top of the screen and append to it.
- Use BeginMenu() to create a menu. You can call BeginMenu() multiple time with the same identifier to append more items to it.
- Note that MenuItem() keyboard shortcuts are displayed as a convenience but _not processed_ by Dear ImGui at the moment.// append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L831).
"""
BeginMenuBar() = igBeginMenuBar()

"""
$(TYPEDSIGNATURES)

Only call EndMenuBar() if BeginMenuBar() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L832).
"""
EndMenuBar() = igEndMenuBar()

"""
$(TYPEDSIGNATURES)

Create and append to a full screen menu-bar.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L833).
"""
BeginMainMenuBar() = igBeginMainMenuBar()

"""
$(TYPEDSIGNATURES)

Only call EndMainMenuBar() if BeginMainMenuBar() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L834).
"""
EndMainMenuBar() = igEndMainMenuBar()

"""
$(TYPEDSIGNATURES)

Create a sub-menu entry. only call EndMenu() if this returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L835).
"""
BeginMenu(label, enabled = true) = igBeginMenu(label, enabled)

"""
$(TYPEDSIGNATURES)

Only call EndMenu() if BeginMenu() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L836).
"""
EndMenu() = igEndMenu()

"""
$(TYPEDSIGNATURES)

Return true when activated.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L837).
"""
MenuItem(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    shortcut::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL,
    selected::Bool = false,
    enabled::Bool = true,
) = igMenuItem_Bool(label, shortcut, selected, enabled)

"""
$(TYPEDSIGNATURES)

Return true when activated + toggle (*p_selected) if p_selected != NULL.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L838).
"""
MenuItem(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    shortcut::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_selected::PtrOrRef{Bool},
    enabled::Bool = true,
) = igMenuItem_BoolPtr(label, shortcut, p_selected, enabled)

"""
$(TYPEDSIGNATURES)

Tooltips
- Tooltips are windows following the mouse. They do not take focus away.
- A tooltip window can contain items of any types.
- SetTooltip() is more or less a shortcut for the 'if (BeginTooltip())  Text(...); EndTooltip(); ' idiom (with a subtlety that it discard any previously submitted tooltip)// begin/append a tooltip window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L844).
"""
BeginTooltip() = igBeginTooltip()

"""
$(TYPEDSIGNATURES)

Only call EndTooltip() if BeginTooltip()/BeginItemTooltip() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L845).
"""
EndTooltip() = igEndTooltip()

"""
$(TYPEDSIGNATURES)

Set a text-only tooltip. Often used after a ImGui::IsItemHovered() check. Override any previous call to SetTooltip().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L846).
"""
SetTooltip(fmt) = igSetTooltip(fmt)

"""
$(TYPEDSIGNATURES)

Tooltips: helpers for showing a tooltip when hovering an item
- BeginItemTooltip() is a shortcut for the 'if (IsItemHovered(ImGuiHoveredFlags_ForTooltip) && BeginTooltip())' idiom.
- SetItemTooltip() is a shortcut for the 'if (IsItemHovered(ImGuiHoveredFlags_ForTooltip))  SetTooltip(...); ' idiom.
- Where 'ImGuiHoveredFlags_ForTooltip' itself is a shortcut to use 'style.HoverFlagsForTooltipMouse' or 'style.HoverFlagsForTooltipNav' depending on active input type. For mouse it defaults to 'ImGuiHoveredFlags_Stationary | ImGuiHoveredFlags_DelayShort'.// begin/append a tooltip window if preceding item was hovered.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L853).
"""
BeginItemTooltip() = igBeginItemTooltip()

"""
$(TYPEDSIGNATURES)

Set a text-only tooltip if preceding item was hovered. override any previous call to SetTooltip().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L854).
"""
SetItemTooltip(fmt) = igSetItemTooltip(fmt)

"""
$(TYPEDSIGNATURES)

Popups, Modals
 - They block normal mouse hovering detection (and therefore most mouse interactions) behind them.
 - If not modal: they can be closed by clicking anywhere outside them, or by pressing Escape (call 'Shortcut(ImGuiKey_Escape)' to claim a higher-priority shortcut).
 - Their visibility state (~bool) is held internally instead of being held by the programmer as we are used to with regular Begin*() calls.
 - The 3 properties above are related: we need to retain popup visibility state in the library because popups may be closed as any time.
 - You can bypass the hovering restriction by using ImGuiHoveredFlags_AllowWhenBlockedByPopup when calling IsItemHovered() or IsWindowHovered().
 - IMPORTANT: Popup identifiers are relative to the current ID stack, so OpenPopup and BeginPopup generally needs to be at the same level of the stack.
   This is sometimes leading to confusing mistakes. May rework this in the future.
 - BeginPopup(): query popup state, if open start appending into the window. Call EndPopup() afterwards if returned true. ImGuiWindowFlags are forwarded to the window.
 - BeginPopupModal(): block every interaction behind the window, cannot be closed by user, add a dimming background, has a title bar.// return true if the popup is open, and you can start outputting to it.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L867).
"""
BeginPopup(str_id, flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0) = igBeginPopup(str_id, flags)

"""
$(TYPEDSIGNATURES)

Return true if the modal is open, and you can start outputting to it.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L868).
"""
BeginPopupModal(name, p_open = C_NULL, flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0) =
    igBeginPopupModal(name, p_open, flags)

"""
$(TYPEDSIGNATURES)

Only call EndPopup() if BeginPopupXXX() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L869).
"""
EndPopup() = igEndPopup()

"""
$(TYPEDSIGNATURES)

Popups: open/close functions
 - OpenPopup(): set popup state to open (unless one of the specified ImGuiPopupFlags prevent opening).
 - OpenPopupXXX() functions return true when the popup is toggled open, which allows you to capture local state if needed.
   You may also call IsWindowAppearing() inside the later BeginPopup() scope if you need to prepare/compute data for the popup.
 - If not modal: they can be closed by clicking anywhere outside them, or by pressing ESCAPE.
 - CloseCurrentPopup(): use inside the BeginPopup()/EndPopup() scope to close manually.
 - CloseCurrentPopup() is called by default by Selectable()/MenuItem() when activated (FIXME: need some options).
 - Use ImGuiPopupFlags_NoOpenOverExistingPopup to avoid opening a popup if there's already one at the same level. This is equivalent to e.g. testing for !IsAnyPopupOpen() prior to OpenPopup().
 - Use IsWindowAppearing() after BeginPopup() to tell if a window just opened.// call to mark popup as open (don't call every frame!).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L880).
"""
OpenPopup(
    str_id::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0,
) = igOpenPopup_Str(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Id overload to facilitate calling from nested stacks.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L881).
"""
OpenPopup(id::Union{ImGuiID,Integer}, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igOpenPopup_ID(id, popup_flags)

"""
$(TYPEDSIGNATURES)

Helper to open popup when clicked on last item. Default to ImGuiPopupFlags_MouseButtonRight == 1. (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L882).
"""
OpenPopupOnItemClick(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igOpenPopupOnItemClick(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Manually close the popup we have begin-ed into.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L883).
"""
CloseCurrentPopup() = igCloseCurrentPopup()

"""
$(TYPEDSIGNATURES)

Popups: Open+Begin popup combined functions helpers to create context menus.
 - Helpers to do OpenPopup+BeginPopup where the Open action is triggered by e.g. hovering an item and right-clicking.
 - IMPORTANT: Notice that BeginPopupContextXXX takes ImGuiPopupFlags just like OpenPopup() and unlike BeginPopup(). For full consistency, we may add ImGuiWindowFlags to the BeginPopupContextXXX functions in the future.
 - IMPORTANT: If you ever used the left mouse button with BeginPopupContextXXX() helpers before 1.92.6:
   - Before this version, OpenPopupOnItemClick(), BeginPopupContextItem(), BeginPopupContextWindow(), BeginPopupContextVoid() had 'a ImGuiPopupFlags popup_flags = 1' default value in their function signature.
   - Before: Explicitly passing a literal 0 meant ImGuiPopupFlags_MouseButtonLeft. The default = 1 meant ImGuiPopupFlags_MouseButtonRight.
   - After: The default = 0 means ImGuiPopupFlags_MouseButtonRight. Explicitly passing a literal 1 also means ImGuiPopupFlags_MouseButtonRight (if legacy behavior are enabled) or will assert (if legacy behavior are disabled).
   - TL;DR: if you don't want to use right mouse button for popups, always specify it explicitly using a named ImGuiPopupFlags_MouseButtonXXXX value.
   - Read "API BREAKING CHANGES" 2026/01/07 (1.92.6) entry in imgui.cpp or GitHub topic #9157 for all details.// open+begin popup when clicked on last item. Use str_id==NULL to associate the popup to previous item. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L894).
"""
BeginPopupContextItem(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igBeginPopupContextItem(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Open+begin popup when clicked on current window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L895).
"""
BeginPopupContextWindow(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igBeginPopupContextWindow(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Open+begin popup when clicked in void (where there are no windows).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L896).
"""
BeginPopupContextVoid(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igBeginPopupContextVoid(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Popups: query functions
 - IsPopupOpen(): return true if the popup is open at the current BeginPopup() level of the popup stack.
 - IsPopupOpen() with ImGuiPopupFlags_AnyPopupId: return true if any popup is open at the current BeginPopup() level of the popup stack.
 - IsPopupOpen() with ImGuiPopupFlags_AnyPopupId + ImGuiPopupFlags_AnyPopupLevel: return true if any popup is open.// return true if the popup is open.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L902).
"""
IsPopupOpen(str_id::Union{String,Ptr{Cchar},Ptr{Cvoid}}, flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igIsPopupOpen_Str(str_id, flags)

"""
$(TYPEDSIGNATURES)

Tables
- Full-featured replacement for old Columns API.
- See Demo->Tables for demo code. See top of imgui_tables.cpp for general commentary.
- See ImGuiTableFlags_ and ImGuiTableColumnFlags_ enums for a description of available flags.
The typical call flow is:
- 1. Call BeginTable(), early out if returning false.
- 2. Optionally call TableSetupColumn() to submit column name/flags/defaults.
- 3. Optionally call TableSetupScrollFreeze() to request scroll freezing of columns/rows.
- 4. Optionally call TableHeadersRow() to submit a header row. Names are pulled from TableSetupColumn() data.
- 5. Populate contents:
   - In most situations you can use TableNextRow() + TableSetColumnIndex(N) to start appending into a column.
   - If you are using tables as a sort of grid, where every column is holding the same type of contents,
     you may prefer using TableNextColumn() instead of TableNextRow() + TableSetColumnIndex().
     TableNextColumn() will automatically wrap-around into the next row if needed.
   - IMPORTANT: Comparatively to the old Columns() API, we need to call TableNextColumn() for the first column!
   - Summary of possible call flow:
       - TableNextRow() -> TableSetColumnIndex(0) -> Text("Hello 0") -> TableSetColumnIndex(1) -> Text("Hello 1")  // OK
       - TableNextRow() -> TableNextColumn()      -> Text("Hello 0") -> TableNextColumn()      -> Text("Hello 1")  // OK
       -                   TableNextColumn()      -> Text("Hello 0") -> TableNextColumn()      -> Text("Hello 1")  // OK: TableNextColumn() automatically gets to next row!
       - TableNextRow()                           -> Text("Hello 0")                                               // Not OK! Missing TableSetColumnIndex() or TableNextColumn()! Text will not appear!
- 5. Call EndTable().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L925).
"""
BeginTable(
    str_id,
    columns,
    flags::Union{ImGuiTableFlags,ImGuiTableFlags_,Integer} = 0,
    outer_size::Union{ImVec2,NTuple{2}} = ImVec2(0.0f0, 0.0f0),
    inner_width = 0.0f0,
) = igBeginTable(str_id, columns, flags, outer_size, inner_width)

"""
$(TYPEDSIGNATURES)

Only call EndTable() if BeginTable() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L926).
"""
EndTable() = igEndTable()

"""
$(TYPEDSIGNATURES)

Append into the first cell of a new row. 'min_row_height' include the minimum top and bottom padding aka CellPadding.y * 2.0f.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L927).
"""
TableNextRow(row_flags::Union{ImGuiTableRowFlags,ImGuiTableRowFlags_,Integer} = 0, min_row_height = 0.0f0) =
    igTableNextRow(row_flags, min_row_height)

"""
$(TYPEDSIGNATURES)

Append into the next column (or first column of next row if currently in last column). Return true when column is visible.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L928).
"""
TableNextColumn() = igTableNextColumn()

"""
$(TYPEDSIGNATURES)

Append into the specified column. Return true when column is visible.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L929).
"""
TableSetColumnIndex(column_n) = igTableSetColumnIndex(column_n)

"""
$(TYPEDSIGNATURES)

Tables: Headers & Columns declaration
- Use TableSetupColumn() to specify label, resizing policy, default width/weight, various other flags etc.
  (the trailing 'ImGuiID user_data', which used to be referred to as 'ImGuiID user_id', is merely user data that is blindly copied in ImGuiTableColumnSortSpecs).
- Use TableHeadersRow() to create a header row and automatically submit a TableHeader() for each column.
  Headers are required to perform: reordering, sorting, and opening the context menu.
  The context menu can also be made available in columns body using ImGuiTableFlags_ContextMenuInBody.
- You may manually submit headers using TableNextRow() + TableHeader() calls, but this is only useful in
  some advanced use cases (e.g. adding custom widgets in header row).
- Use TableSetupScrollFreeze() to lock columns/rows so they stay visible when scrolled. When freezing columns you would usually also use ImGuiTableColumnFlags_NoHide on them.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L940).
"""
TableSetupColumn(
    label,
    flags::Union{ImGuiTableColumnFlags,ImGuiTableColumnFlags_,Integer} = 0,
    init_width_or_weight = 0.0f0,
    user_data::Union{ImGuiID,Integer} = 0,
) = igTableSetupColumn(label, flags, init_width_or_weight, user_data)

"""
$(TYPEDSIGNATURES)

Lock columns/rows so they stay visible when scrolled.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L941).
"""
TableSetupScrollFreeze(cols, rows) = igTableSetupScrollFreeze(cols, rows)

"""
$(TYPEDSIGNATURES)

Submit one header cell manually (rarely used).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L942).
"""
TableHeader(label) = igTableHeader(label)

"""
$(TYPEDSIGNATURES)

Submit a row with headers cells based on data provided to TableSetupColumn() + submit context menu.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L943).
"""
TableHeadersRow() = igTableHeadersRow()

"""
$(TYPEDSIGNATURES)

Submit a row with angled headers for every column with the ImGuiTableColumnFlags_AngledHeader flag. MUST BE FIRST ROW.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L944).
"""
TableAngledHeadersRow() = igTableAngledHeadersRow()

"""
$(TYPEDSIGNATURES)

Tables: Sorting & Miscellaneous functions
- Sorting: call TableGetSortSpecs() to retrieve latest sort specs for the table. NULL when not sorting.
  When 'sort_specs->SpecsDirty == true' you should sort your data. It will be true when sorting specs have
  changed since last call, or the first time. Make sure to set 'SpecsDirty = false' after sorting,
  else you may wastefully sort your data every frame!
- Functions args 'int column_n' treat the default value of -1 as the same as passing the current column index.// get latest sort specs for the table (NULL if not sorting).  Lifetime: don't hold on this pointer over multiple frames or past any subsequent call to BeginTable().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L952).
"""
TableGetSortSpecs() = igTableGetSortSpecs()

"""
$(TYPEDSIGNATURES)

Return number of columns (value passed to BeginTable).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L953).
"""
TableGetColumnCount() = igTableGetColumnCount()

"""
$(TYPEDSIGNATURES)

Return current column index.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L954).
"""
TableGetColumnIndex() = igTableGetColumnIndex()

"""
$(TYPEDSIGNATURES)

Return current row index (header rows are accounted for).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L955).
"""
TableGetRowIndex() = igTableGetRowIndex()

"""
$(TYPEDSIGNATURES)

Return "" if column didn't have a name declared by TableSetupColumn(). Pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L956).
"""
TableGetColumnName(column_n::Integer = -1) = igTableGetColumnName_Int(column_n)

"""
$(TYPEDSIGNATURES)

Return column flags so you can query their Enabled/Visible/Sorted/Hovered status flags. Pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L957).
"""
TableGetColumnFlags(column_n = -1) = igTableGetColumnFlags(column_n)

"""
$(TYPEDSIGNATURES)

Change user accessible enabled/disabled state of a column. Set to false to hide the column. User can use the context menu to change this themselves (right-click in headers, or right-click in columns body with ImGuiTableFlags_ContextMenuInBody).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L958).
"""
TableSetColumnEnabled(column_n, v) = igTableSetColumnEnabled(column_n, v)

"""
$(TYPEDSIGNATURES)

Return hovered column. return -1 when table is not hovered. return columns_count if the unused space at the right of visible columns is hovered. Can also use (TableGetColumnFlags() & ImGuiTableColumnFlags_IsHovered) instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L959).
"""
TableGetHoveredColumn() = igTableGetHoveredColumn()

"""
$(TYPEDSIGNATURES)

Change the color of a cell, row, or column. See ImGuiTableBgTarget_ flags for details.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L960).
"""
TableSetBgColor(
    target::Union{ImGuiTableBgTarget,ImGuiTableBgTarget_,Integer},
    color::Union{ImU32,Integer},
    column_n = -1,
) = igTableSetBgColor(target, color, column_n)

"""
$(TYPEDSIGNATURES)

Legacy Columns API (prefer using Tables!)
- You can also use SameLine(pos_x) to mimic simplified columns.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L964).
"""
Columns(count = 1, id = C_NULL, borders = true) = igColumns(count, id, borders)

"""
$(TYPEDSIGNATURES)

Next column, defaults to current row or next row if the current row is finished.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L965).
"""
NextColumn() = igNextColumn()

"""
$(TYPEDSIGNATURES)

Get current column index.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L966).
"""
GetColumnIndex() = igGetColumnIndex()

"""
$(TYPEDSIGNATURES)

Get column width (in pixels). pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L967).
"""
GetColumnWidth(column_index = -1) = igGetColumnWidth(column_index)

"""
$(TYPEDSIGNATURES)

Set column width (in pixels). pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L968).
"""
SetColumnWidth(column_index, width) = igSetColumnWidth(column_index, width)

"""
$(TYPEDSIGNATURES)

Get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L969).
"""
GetColumnOffset(column_index = -1) = igGetColumnOffset(column_index)

"""
$(TYPEDSIGNATURES)

Set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L970).
"""
SetColumnOffset(column_index, offset_x) = igSetColumnOffset(column_index, offset_x)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L971).
"""
GetColumnsCount() = igGetColumnsCount()

"""
$(TYPEDSIGNATURES)

Tab Bars, Tabs
- Note: Tabs are automatically created by the docking system (when in 'docking' branch). Use this to create tab bars/tabs yourself.// create and append into a TabBar.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L975).
"""
BeginTabBar(str_id, flags::Union{ImGuiTabBarFlags,ImGuiTabBarFlags_,Integer} = 0) = igBeginTabBar(str_id, flags)

"""
$(TYPEDSIGNATURES)

Only call EndTabBar() if BeginTabBar() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L976).
"""
EndTabBar() = igEndTabBar()

"""
$(TYPEDSIGNATURES)

Create a Tab. Returns true if the Tab is selected.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L977).
"""
BeginTabItem(label, p_open = C_NULL, flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer} = 0) =
    igBeginTabItem(label, p_open, flags)

"""
$(TYPEDSIGNATURES)

Only call EndTabItem() if BeginTabItem() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L978).
"""
EndTabItem() = igEndTabItem()

"""
$(TYPEDSIGNATURES)

Create a Tab behaving like a button. return true when clicked. cannot be selected in the tab bar.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L979).
"""
TabItemButton(label, flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer} = 0) = igTabItemButton(label, flags)

"""
$(TYPEDSIGNATURES)

Notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars). For tab-bar: call after BeginTabBar() and before Tab submissions. Otherwise call with a window name.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L980).
"""
SetTabItemClosed(tab_or_docked_window_label) = igSetTabItemClosed(tab_or_docked_window_label)

"""
$(TYPEDSIGNATURES)

Docking
- Read https://github.com/ocornut/imgui/wiki/Docking for details.
- Enable with io.ConfigFlags |= ImGuiConfigFlags_DockingEnable.
- You can use many Docking facilities without calling any API.
  - Drag from window title bar or their tab to dock/undock. Hold SHIFT to disable docking.
  - Drag from window menu button (upper-left button) to undock an entire node (all windows).
  - When io.ConfigDockingWithShift == true, you instead need to hold SHIFT to enable docking.
- DockSpaceOverViewport:
  - This is a helper to create an invisible window covering a viewport, then submit a DockSpace() into it.
  - Most applications can simply call DockSpaceOverViewport() once to allow docking windows into e.g. the edge of your screen.
    e.g. ImGui::NewFrame(); ImGui::DockSpaceOverViewport();                                                   // Create a dockspace in main viewport.
     or: ImGui::NewFrame(); ImGui::DockSpaceOverViewport(0, nullptr, ImGuiDockNodeFlags_PassthruCentralNode); // Create a dockspace in main viewport, central node is transparent.
- Dockspaces:
  - A dockspace is an explicit dock node within an existing window.
  - IMPORTANT: Dockspaces need to be submitted _before_ any window they can host. Submit them early in your frame!
  - IMPORTANT: Dockspaces need to be kept alive if hidden, otherwise windows docked into it will be undocked.
    If you have e.g. multiple tabs with a dockspace inside each tab: submit the non-visible dockspaces with ImGuiDockNodeFlags_KeepAliveOnly.
  - See 'Demo->Examples->Dockspace' or 'Demo->Examples->Documents' for more detailed demos.
- Programmatic docking:
  - There is no public API yet other than the very limited SetNextWindowDockID() function. Sorry for that!
  - Read https://github.com/ocornut/imgui/wiki/Docking for examples of how to use current internal API.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1003).
"""
DockSpace(
    dockspace_id::Union{ImGuiID,Integer},
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    flags::Union{ImGuiDockNodeFlags,ImGuiDockNodeFlags_,Integer} = 0,
    window_class::VoidablePtrOrRef{ImGuiWindowClass} = C_NULL,
) = igDockSpace(dockspace_id, size, flags, window_class)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1004).
"""
DockSpaceOverViewport(
    dockspace_id::Union{ImGuiID,Integer} = 0,
    viewport::VoidablePtrOrRef{ImGuiViewport} = C_NULL,
    flags::Union{ImGuiDockNodeFlags,ImGuiDockNodeFlags_,Integer} = 0,
    window_class::VoidablePtrOrRef{ImGuiWindowClass} = C_NULL,
) = igDockSpaceOverViewport(dockspace_id, viewport, flags, window_class)

"""
$(TYPEDSIGNATURES)

Set next window dock id.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1005).
"""
SetNextWindowDockID(dock_id::Union{ImGuiID,Integer}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetNextWindowDockID(dock_id, cond)

"""
$(TYPEDSIGNATURES)

Set next window class (control docking compatibility + provide hints to platform backend via custom viewport flags and platform parent/child relationship).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1006).
"""
SetNextWindowClass(window_class::VoidablePtrOrRef{ImGuiWindowClass}) = igSetNextWindowClass(window_class)

"""
$(TYPEDSIGNATURES)

Get dock id of current window, or 0 if not associated to any docking node.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1007).
"""
GetWindowDockID() = igGetWindowDockID()

"""
$(TYPEDSIGNATURES)

Is current window docked into another window?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1008).
"""
IsWindowDocked() = igIsWindowDocked()

"""
$(TYPEDSIGNATURES)

Logging/Capture
- All text output from the interface can be captured into tty/file/clipboard. By default, tree nodes are automatically opened during logging.// start logging to tty (stdout).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1012).
"""
LogToTTY(auto_open_depth = -1) = igLogToTTY(auto_open_depth)

"""
$(TYPEDSIGNATURES)

Start logging to file.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1013).
"""
LogToFile(auto_open_depth = -1, filename = C_NULL) = igLogToFile(auto_open_depth, filename)

"""
$(TYPEDSIGNATURES)

Start logging to OS clipboard.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1014).
"""
LogToClipboard(auto_open_depth = -1) = igLogToClipboard(auto_open_depth)

"""
$(TYPEDSIGNATURES)

Stop logging (close file, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1015).
"""
LogFinish() = igLogFinish()

"""
$(TYPEDSIGNATURES)

Helper to display buttons for logging to tty/file/clipboard.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1016).
"""
LogButtons() = igLogButtons()

"""
$(TYPEDSIGNATURES)

Pass text data straight to log (without being displayed).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1017).
"""
LogText(fmt) = igLogText(fmt)

"""
$(TYPEDSIGNATURES)

Drag and Drop
- On source items, call BeginDragDropSource(), if it returns true also call SetDragDropPayload() + EndDragDropSource().
- On target candidates, call BeginDragDropTarget(), if it returns true also call AcceptDragDropPayload() + EndDragDropTarget().
- If you stop calling BeginDragDropSource() the payload is preserved however it won't have a preview tooltip (we currently display a fallback "..." tooltip, see #1725)
- An item can be both drag source and drop target.// call after submitting an item which may be dragged. when this return true, you can call SetDragDropPayload() + EndDragDropSource().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1025).
"""
BeginDragDropSource(flags::Union{ImGuiDragDropFlags,ImGuiDragDropFlags_,Integer} = 0) = igBeginDragDropSource(flags)

"""
$(TYPEDSIGNATURES)

Type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui. Return true when payload has been accepted.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1026).
"""
SetDragDropPayload(type, data, sz, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetDragDropPayload(type, data, sz, cond)

"""
$(TYPEDSIGNATURES)

Only call EndDragDropSource() if BeginDragDropSource() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1027).
"""
EndDragDropSource() = igEndDragDropSource()

"""
$(TYPEDSIGNATURES)

Call after submitting an item that may receive a payload. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1028).
"""
BeginDragDropTarget() = igBeginDragDropTarget()

"""
$(TYPEDSIGNATURES)

Accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1029).
"""
AcceptDragDropPayload(type, flags::Union{ImGuiDragDropFlags,ImGuiDragDropFlags_,Integer} = 0) =
    igAcceptDragDropPayload(type, flags)

"""
$(TYPEDSIGNATURES)

Only call EndDragDropTarget() if BeginDragDropTarget() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1030).
"""
EndDragDropTarget() = igEndDragDropTarget()

"""
$(TYPEDSIGNATURES)

Peek directly into the current payload from anywhere. returns NULL when drag and drop is finished or inactive. use ImGuiPayload::IsDataType() to test for the payload type.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1031).
"""
GetDragDropPayload() = igGetDragDropPayload()

"""
$(TYPEDSIGNATURES)

Disabling
- Disable all user interactions and dim items visuals (applying style.DisabledAlpha over current colors)
- Those can be nested but it cannot be used to enable an already disabled section (a single BeginDisabled(true) in the stack is enough to keep everything disabled)
- Tooltips windows are automatically opted out of disabling. Note that IsItemHovered() by default returns false on disabled items, unless using ImGuiHoveredFlags_AllowWhenDisabled.
- BeginDisabled(false)/EndDisabled() essentially does nothing but is provided to facilitate use of boolean expressions (as a micro-optimization: if you have tens of thousands of BeginDisabled(false)/EndDisabled() pairs, you might want to reformulate your code to avoid making those calls).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1038).
"""
BeginDisabled(disabled = true) = igBeginDisabled(disabled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1039).
"""
EndDisabled() = igEndDisabled()

"""
$(TYPEDSIGNATURES)

Clipping
- Mouse hovering is affected by ImGui::PushClipRect() calls, unlike direct calls to ImDrawList::PushClipRect() which are render only.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1043).
"""
PushClipRect(
    clip_rect_min::Union{ImVec2,NTuple{2}},
    clip_rect_max::Union{ImVec2,NTuple{2}},
    intersect_with_current_clip_rect,
) = igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1044).
"""
PopClipRect() = igPopClipRect()

"""
$(TYPEDSIGNATURES)

Focus, Activation// make last item the default focused item of a newly appearing window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1047).
"""
SetItemDefaultFocus() = igSetItemDefaultFocus()

"""
$(TYPEDSIGNATURES)

Focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1048).
"""
SetKeyboardFocusHere(offset = 0) = igSetKeyboardFocusHere(offset)

"""
$(TYPEDSIGNATURES)

Keyboard/Gamepad Navigation// alter visibility of keyboard/gamepad cursor. by default: show when using an arrow key, hide when clicking with mouse.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1051).
"""
SetNavCursorVisible(visible) = igSetNavCursorVisible(visible)

"""
$(TYPEDSIGNATURES)

Overlapping mode// allow next item to be overlapped by a subsequent item. Typically useful with InvisibleButton(), Selectable(), TreeNode() covering an area where subsequent items may need to be added. Note that both Selectable() and TreeNode() have dedicated flags doing this.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1054).
"""
SetNextItemAllowOverlap() = igSetNextItemAllowOverlap()

"""
$(TYPEDSIGNATURES)

Item/Widgets Utilities and Query Functions
- Most of the functions are referring to the previous Item that has been submitted.
- See Demo Window under "Widgets->Querying Status" for an interactive visualization of most of those functions.// is the last item hovered? (and usable, aka not blocked by a popup, etc.). See ImGuiHoveredFlags for more options.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1059).
"""
IsItemHovered(flags::Union{ImGuiHoveredFlags,ImGuiHoveredFlags_,Integer} = 0) = igIsItemHovered(flags)

"""
$(TYPEDSIGNATURES)

Is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse button on an item. Items that don't interact will always return false).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1060).
"""
IsItemActive() = igIsItemActive()

"""
$(TYPEDSIGNATURES)

Is the last item focused for keyboard/gamepad navigation?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1061).
"""
IsItemFocused() = igIsItemFocused()

"""
$(TYPEDSIGNATURES)

Is the last item hovered and mouse clicked on? (**)  == IsMouseClicked(mouse_button) && IsItemHovered()Important. (**) this is NOT equivalent to the behavior of e.g. Button(). Read comments in function definition.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1062).
"""
IsItemClicked(mouse_button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0) = igIsItemClicked(mouse_button)

"""
$(TYPEDSIGNATURES)

Is the last item visible? (items may be out of sight because of clipping/scrolling).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1063).
"""
IsItemVisible() = igIsItemVisible()

"""
$(TYPEDSIGNATURES)

Did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1064).
"""
IsItemEdited() = igIsItemEdited()

"""
$(TYPEDSIGNATURES)

Was the last item just made active (item was previously inactive).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1065).
"""
IsItemActivated() = igIsItemActivated()

"""
$(TYPEDSIGNATURES)

Was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that require continuous editing.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1066).
"""
IsItemDeactivated() = igIsItemDeactivated()

"""
$(TYPEDSIGNATURES)

Was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns with widgets that require continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable() will return true even when clicking an already selected item).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1067).
"""
IsItemDeactivatedAfterEdit() = igIsItemDeactivatedAfterEdit()

"""
$(TYPEDSIGNATURES)

Was the last item open state toggled? set by TreeNode().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1068).
"""
IsItemToggledOpen() = igIsItemToggledOpen()

"""
$(TYPEDSIGNATURES)

Is any item hovered?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1069).
"""
IsAnyItemHovered() = igIsAnyItemHovered()

"""
$(TYPEDSIGNATURES)

Is any item active?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1070).
"""
IsAnyItemActive() = igIsAnyItemActive()

"""
$(TYPEDSIGNATURES)

Is any item focused?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1071).
"""
IsAnyItemFocused() = igIsAnyItemFocused()

"""
$(TYPEDSIGNATURES)

Get ID of last item (~~ often same ImGui::GetID(label) beforehand).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1072).
"""
GetItemID() = igGetItemID()

"""
$(TYPEDSIGNATURES)

Get upper-left bounding rectangle of the last item (screen space).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1073).
"""
GetItemRectMin() = igGetItemRectMin()

"""
$(TYPEDSIGNATURES)

Get lower-right bounding rectangle of the last item (screen space).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1074).
"""
GetItemRectMax() = igGetItemRectMax()

"""
$(TYPEDSIGNATURES)

Get size of last item.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1075).
"""
GetItemRectSize() = igGetItemRectSize()

"""
$(TYPEDSIGNATURES)

Get generic flags of last item.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1076).
"""
GetItemFlags() = igGetItemFlags()

"""
$(TYPEDSIGNATURES)

[BETA] building block for disambiguation between single-click and double-click. Returns 1 on single-click but delayed by io.MouseSingleClickDelay after mouse release. Returns 2+ on double-click or repeated clicks.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1077).
"""
GetItemClickedCountWithSingleClickDelay(
    mouse_button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0,
    delay = -1.0f0,
) = igGetItemClickedCountWithSingleClickDelay(mouse_button, delay)

"""
$(TYPEDSIGNATURES)

Viewports
- Currently represents the Platform Window created by the application which is hosting our Dear ImGui windows.
- In 'docking' branch with multi-viewport enabled, we extend this concept to have multiple active viewports.
- In the future we will extend this concept further to also represent Platform Monitor and support a "no main platform window" operation mode.// return primary/default viewport. This can never be NULL.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1083).
"""
GetMainViewport() = igGetMainViewport()

"""
$(TYPEDSIGNATURES)

Background/Foreground Draw Lists// get background draw list for the given viewport or viewport associated to the current window. this draw list will be the first rendering one. Useful to quickly draw shapes/text behind dear imgui contents.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1086).
"""
GetBackgroundDrawList(viewport::VoidablePtrOrRef{ImGuiViewport} = C_NULL) = igGetBackgroundDrawList(viewport)

"""
$(TYPEDSIGNATURES)

Get foreground draw list for the given viewport or viewport associated to the current window. this draw list will be the top-most rendered one. Useful to quickly draw shapes/text over dear imgui contents.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1087).
"""
GetForegroundDrawList(viewport::VoidablePtrOrRef{ImGuiViewport} = C_NULL) =
    igGetForegroundDrawList_ViewportPtr(viewport)

"""
$(TYPEDSIGNATURES)

Miscellaneous Utilities// test if rectangle (of given size, starting from cursor position) is visible / not clipped.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1090).
"""
IsRectVisible(size::Union{ImVec2,NTuple{2}}) = igIsRectVisible_Nil(size)

"""
$(TYPEDSIGNATURES)

Test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1091).
"""
IsRectVisible(rect_min::Union{ImVec2,NTuple{2}}, rect_max::Union{ImVec2,NTuple{2}}) =
    igIsRectVisible_Vec2(rect_min, rect_max)

"""
$(TYPEDSIGNATURES)

Get global imgui time. incremented by io.DeltaTime every frame.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1092).
"""
GetTime() = igGetTime()

"""
$(TYPEDSIGNATURES)

Get global imgui frame count. incremented by 1 every frame.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1093).
"""
GetFrameCount() = igGetFrameCount()

"""
$(TYPEDSIGNATURES)

You may use this when creating your own ImDrawList instances.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1094).
"""
GetDrawListSharedData() = igGetDrawListSharedData()

"""
$(TYPEDSIGNATURES)

Get a string corresponding to the enum value (for display, saving, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1095).
"""
GetStyleColorName(idx::Union{ImGuiCol,ImGuiCol_,Integer}) = igGetStyleColorName(idx)

"""
$(TYPEDSIGNATURES)

Replace current window storage with our own (if you want to manipulate it yourself, typically clear subsection of it).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1096).
"""
SetStateStorage(storage::VoidablePtrOrRef{ImGuiStorage}) = igSetStateStorage(storage)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1097).
"""
GetStateStorage() = igGetStateStorage()

"""
$(TYPEDSIGNATURES)

Text Utilities.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1100).
"""
CalcTextSize(text, text_end = C_NULL, hide_text_after_double_hash = false, wrap_width = -1.0f0) =
    igCalcTextSize(text, text_end, hide_text_after_double_hash, wrap_width)

"""
$(TYPEDSIGNATURES)

Color Utilities.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1103).
"""
ColorConvertU32ToFloat4(in::Union{ImU32,Integer}) = igColorConvertU32ToFloat4(in)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1104).
"""
ColorConvertFloat4ToU32(in::Union{ImVec4,NTuple{4}}) = igColorConvertFloat4ToU32(in)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1105).
"""
ColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v) = igColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1106).
"""
ColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b) = igColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b)

"""
$(TYPEDSIGNATURES)

Inputs Utilities: Raw Keyboard/Mouse/Gamepad Access
- Consider using the Shortcut() function instead of IsKeyPressed()/IsKeyChordPressed()! Shortcut() is easier to use and better featured (can do focus routing check).
- the ImGuiKey enum contains all possible keyboard, mouse and gamepad inputs (e.g. ImGuiKey_A, ImGuiKey_MouseLeft, ImGuiKey_GamepadDpadUp...).
- (legacy: before v1.87 (2022-02), we used ImGuiKey < 512 values to carry native/user indices as defined by each backends. This was obsoleted in 1.87 (2022-02) and completely removed in 1.91.5 (2024-11). See https://github.com/ocornut/imgui/issues/4921)// is key being held.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1112).
"""
IsKeyDown(key::ImGuiKey) = igIsKeyDown_Nil(key)

"""
$(TYPEDSIGNATURES)

Was key pressed (went from !Down to Down)? Repeat rate uses io.KeyRepeatDelay / KeyRepeatRate.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1113).
"""
IsKeyPressed(key::ImGuiKey, repeat::Bool = true) = igIsKeyPressed_Bool(key, repeat)

"""
$(TYPEDSIGNATURES)

Was key released (went from Down to !Down)?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1114).
"""
IsKeyReleased(key::ImGuiKey) = igIsKeyReleased_Nil(key)

"""
$(TYPEDSIGNATURES)

Was key chord (mods + key) pressed, e.g. you can pass 'ImGuiMod_Ctrl | ImGuiKey_S' as a key-chord. This doesn't do any routing or focus check, please consider using Shortcut() function instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1115).
"""
IsKeyChordPressed(key_chord::Union{ImGuiKeyChord,Integer}) = igIsKeyChordPressed_Nil(key_chord)

"""
$(TYPEDSIGNATURES)

Uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1116).
"""
GetKeyPressedAmount(key::ImGuiKey, repeat_delay, rate) = igGetKeyPressedAmount(key, repeat_delay, rate)

"""
$(TYPEDSIGNATURES)

[DEBUG] returns English name of the key. Those names are provided for debugging purpose and are not meant to be saved persistently nor compared.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1117).
"""
GetKeyName(key::ImGuiKey) = igGetKeyName(key)

"""
$(TYPEDSIGNATURES)

Override io.WantCaptureKeyboard flag next frame (said flag is left for your application to handle, typically when true it instructs your app to ignore inputs). e.g. force capture keyboard when your widget is being hovered. This is equivalent to setting "io.WantCaptureKeyboard = want_capture_keyboard"; after the next NewFrame() call.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1118).
"""
SetNextFrameWantCaptureKeyboard(want_capture_keyboard) = igSetNextFrameWantCaptureKeyboard(want_capture_keyboard)

"""
$(TYPEDSIGNATURES)

Inputs Utilities: Shortcut Testing & Routing
- Typical use is e.g.: 'if (ImGui::Shortcut(ImGuiMod_Ctrl | ImGuiKey_S))  ... '.
- Flags: Default route use ImGuiInputFlags_RouteFocused, but see ImGuiInputFlags_RouteGlobal and other options in ImGuiInputFlags_!
- Flags: Use ImGuiInputFlags_Repeat to support repeat.
- ImGuiKeyChord = a ImGuiKey + optional ImGuiMod_Alt/ImGuiMod_Ctrl/ImGuiMod_Shift/ImGuiMod_Super.
      ImGuiKey_C                          // Accepted by functions taking ImGuiKey or ImGuiKeyChord arguments
      ImGuiMod_Ctrl | ImGuiKey_C          // Accepted by functions taking ImGuiKeyChord arguments
  only ImGuiMod_XXX values are legal to combine with an ImGuiKey. You CANNOT combine two ImGuiKey values.
- The general idea is that several callers may register interest in a shortcut, and only one owner gets it.
     Parent   -> call Shortcut(Ctrl+S)    // When Parent is focused, Parent gets the shortcut.
       Child1 -> call Shortcut(Ctrl+S)    // When Child1 is focused, Child1 gets the shortcut (Child1 overrides Parent shortcuts)
       Child2 -> no call                  // When Child2 is focused, Parent gets the shortcut.
  The whole system is order independent, so if Child1 makes its calls before Parent, results will be identical.
  This is an important property as it facilitate working with foreign code or larger codebase.
- To understand the difference:
  - IsKeyChordPressed() compares mods and call IsKeyPressed()
    -> the function has no side-effect.
  - Shortcut() submits a route, routes are resolved, if it currently can be routed it calls IsKeyChordPressed()
    -> the function has (desirable) side-effects as it can prevents another call from getting the route.
- Visualize registered routes in 'Metrics/Debugger->Inputs'.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1140).
"""
Shortcut(key_chord::Union{ImGuiKeyChord,Integer}, flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0) =
    igShortcut_Nil(key_chord, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1141).
"""
SetNextItemShortcut(
    key_chord::Union{ImGuiKeyChord,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0,
) = igSetNextItemShortcut(key_chord, flags)

"""
$(TYPEDSIGNATURES)

Inputs Utilities: Key/Input Ownership [BETA]
- One common use case would be to allow your items to disable standard inputs behaviors such
  as Tab or Alt key handling, Mouse Wheel scrolling, etc.
  e.g. `Button(...); if (SetItemKeyOwner(ImGuiKey_MouseWheelY))  ... ` to make hovering/activating a button disable wheel for scrolling.
- Reminder ImGuiKey enum include access to mouse buttons and gamepad, so key ownership can apply to them.
- The return value of SetItemKeyOwner() says if ownership has been requested for the item, which is a shortcut to calling yet non-public TestKeyOwner() function.
- Many related features are still in imgui_internal.h. For instance, most IsKeyXXX()/IsMouseXXX() functions have an owner-id-aware version.// Set key owner to last item ID if it is hovered or active. Return true when ownership has been set. Roughly equivalent to 'if (TestKeyOwner(key, GetItemID()) && (IsItemHovered() || IsItemActive()))  SetKeyOwner(key, GetItemID());'.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1150).
"""
SetItemKeyOwner(key::ImGuiKey) = igSetItemKeyOwner_Nil(key)

"""
$(TYPEDSIGNATURES)

Inputs Utilities: Mouse
- To refer to a mouse button, you may use named enums in your code e.g. ImGuiMouseButton_Left, ImGuiMouseButton_Right.
- You can also use regular integer: it is forever guaranteed that 0=Left, 1=Right, 2=Middle.
- Dragging operations are only reported after mouse has moved a certain distance away from the initial clicking position (see 'lock_threshold' and 'io.MouseDraggingThreshold')// is mouse button held?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1156).
"""
IsMouseDown(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igIsMouseDown_Nil(button)

"""
$(TYPEDSIGNATURES)

Did mouse button clicked? (went from !Down to Down). Same as GetMouseClickedCount() == 1.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1157).
"""
IsMouseClicked(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, repeat::Bool = false) =
    igIsMouseClicked_Bool(button, repeat)

"""
$(TYPEDSIGNATURES)

Did mouse button released? (went from Down to !Down).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1158).
"""
IsMouseReleased(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igIsMouseReleased_Nil(button)

"""
$(TYPEDSIGNATURES)

Did mouse button double-clicked? Same as GetMouseClickedCount() == 2. (note that a double-click will also report IsMouseClicked() == true).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1159).
"""
IsMouseDoubleClicked(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igIsMouseDoubleClicked_Nil(button)

"""
$(TYPEDSIGNATURES)

Delayed mouse release. Use sparingly. Prefer higher-level helper GetItemClickedCountWithSingleClickDelay(). Generally used with 'delay >= io.MouseDoubleClickTime' + combined with a 'io.MouseClickedLastCount==1' test.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1160).
"""
IsMouseReleasedWithDelay(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, delay = -1.0f0) =
    igIsMouseReleasedWithDelay(button, delay)

"""
$(TYPEDSIGNATURES)

Return the number of successive mouse-clicks at the time where a click happen (otherwise 0).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1161).
"""
GetMouseClickedCount(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igGetMouseClickedCount(button)

"""
$(TYPEDSIGNATURES)

Is mouse hovering given bounding rect (in screen space). clipped by current clipping settings, but disregarding of other consideration of focus/window ordering/popup-block.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1162).
"""
IsMouseHoveringRect(r_min::Union{ImVec2,NTuple{2}}, r_max::Union{ImVec2,NTuple{2}}, clip = true) =
    igIsMouseHoveringRect(r_min, r_max, clip)

"""
$(TYPEDSIGNATURES)

By convention we use (-FLT_MAX,-FLT_MAX) to denote that there is no mouse available.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1163).
"""
IsMousePosValid(mouse_pos::VoidablePtrOrRef{ImVec2} = C_NULL) = igIsMousePosValid(mouse_pos)

"""
$(TYPEDSIGNATURES)

[WILL OBSOLETE] is any mouse button held? This was designed for backends, but prefer having backend maintain a mask of held mouse buttons, because upcoming input queue system will make this invalid.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1164).
"""
IsAnyMouseDown() = igIsAnyMouseDown()

"""
$(TYPEDSIGNATURES)

Shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1165).
"""
GetMousePos() = igGetMousePos()

"""
$(TYPEDSIGNATURES)

Retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1166).
"""
GetMousePosOnOpeningCurrentPopup() = igGetMousePosOnOpeningCurrentPopup()

"""
$(TYPEDSIGNATURES)

Is mouse dragging? (uses io.MouseDraggingThreshold if lock_threshold < 0.0f).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1167).
"""
IsMouseDragging(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, lock_threshold = -1.0f0) =
    igIsMouseDragging(button, lock_threshold)

"""
$(TYPEDSIGNATURES)

Return the delta from the initial clicking position while the mouse button is pressed or was just released. This is locked and return 0.0f until the mouse moves past a distance threshold at least once (uses io.MouseDraggingThreshold if lock_threshold < 0.0f).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1168).
"""
GetMouseDragDelta(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0, lock_threshold = -1.0f0) =
    igGetMouseDragDelta(button, lock_threshold)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1169).
"""
ResetMouseDragDelta(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0) = igResetMouseDragDelta(button)

"""
$(TYPEDSIGNATURES)

Get desired mouse cursor shape. Important: reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1170).
"""
GetMouseCursor() = igGetMouseCursor()

"""
$(TYPEDSIGNATURES)

Set desired mouse cursor shape.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1171).
"""
SetMouseCursor(cursor_type::Union{ImGuiMouseCursor,ImGuiMouseCursor_,Integer}) = igSetMouseCursor(cursor_type)

"""
$(TYPEDSIGNATURES)

Override io.WantCaptureMouse flag next frame (said flag is left for your application to handle, typical when true it instructs your app to ignore inputs). This is equivalent to setting "io.WantCaptureMouse = want_capture_mouse;" after the next NewFrame() call.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1172).
"""
SetNextFrameWantCaptureMouse(want_capture_mouse) = igSetNextFrameWantCaptureMouse(want_capture_mouse)

"""
$(TYPEDSIGNATURES)

Clipboard Utilities
- Also see the LogToClipboard() function to capture GUI into clipboard, or easily output text data to the clipboard.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1176).
"""
GetClipboardText() = igGetClipboardText()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1177).
"""
SetClipboardText(text) = igSetClipboardText(text)

"""
$(TYPEDSIGNATURES)

Settings/.Ini Utilities
- The disk functions are automatically called if io.IniFilename != NULL (default is "imgui.ini").
- Set io.IniFilename to NULL to load/save manually. Read io.WantSaveIniSettings description about handling .ini saving manually.
- Important: default value "imgui.ini" is relative to current working dir! Most apps will want to lock this to an absolute path (e.g. same path as executables).// call after CreateContext() and before the first call to NewFrame(). NewFrame() automatically calls LoadIniSettingsFromDisk(io.IniFilename).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1183).
"""
LoadIniSettingsFromDisk(ini_filename) = igLoadIniSettingsFromDisk(ini_filename)

"""
$(TYPEDSIGNATURES)

Call after CreateContext() and before the first call to NewFrame() to provide .ini data from your own data source.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1184).
"""
LoadIniSettingsFromMemory(ini_data, ini_size = 0) = igLoadIniSettingsFromMemory(ini_data, ini_size)

"""
$(TYPEDSIGNATURES)

This is automatically called (if io.IniFilename is not empty) a few seconds after any modification that should be reflected in the .ini file (and also by DestroyContext).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1185).
"""
SaveIniSettingsToDisk(ini_filename) = igSaveIniSettingsToDisk(ini_filename)

"""
$(TYPEDSIGNATURES)

Return a zero-terminated string with the .ini data which you can save by your own mean. call when io.WantSaveIniSettings is set, then save data by your own mean and clear io.WantSaveIniSettings.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1186).
"""
SaveIniSettingsToMemory(out_ini_size = C_NULL) = igSaveIniSettingsToMemory(out_ini_size)

"""
$(TYPEDSIGNATURES)

Debug Utilities
- Your main debugging friend is the ShowMetricsWindow() function.
- Interactive tools are all accessible from the 'Dear ImGui Demo->Tools' menu.
- Read https://github.com/ocornut/imgui/wiki/Debug-Tools for a description of all available debug tools.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1192).
"""
DebugTextEncoding(text) = igDebugTextEncoding(text)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1193).
"""
DebugFlashStyleColor(idx::Union{ImGuiCol,ImGuiCol_,Integer}) = igDebugFlashStyleColor(idx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1194).
"""
DebugStartItemPicker() = igDebugStartItemPicker()

"""
$(TYPEDSIGNATURES)

This is called by IMGUI_CHECKVERSION() macro.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1195).
"""
DebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx) =
    igDebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)

"""
$(TYPEDSIGNATURES)

Call via IMGUI_DEBUG_LOG() for maximum stripping in caller code!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1197).
"""
DebugLog(fmt) = igDebugLog(fmt)

"""
$(TYPEDSIGNATURES)

Memory Allocators
- Those functions are not reliant on the current context.
- DLL users: heaps and globals are not shared across DLL boundaries! You will need to call SetCurrentContext() + SetAllocatorFunctions()
  for each static/DLL boundary you are calling from. Read "Context and Memory Allocators" section of imgui.cpp for more details.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1205).
"""
SetAllocatorFunctions(alloc_func::ImGuiMemAllocFunc, free_func::ImGuiMemFreeFunc, user_data = C_NULL) =
    igSetAllocatorFunctions(alloc_func, free_func, user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1206).
"""
GetAllocatorFunctions(
    p_alloc_func::VoidablePtrOrRef{ImGuiMemAllocFunc},
    p_free_func::VoidablePtrOrRef{ImGuiMemFreeFunc},
    p_user_data,
) = igGetAllocatorFunctions(p_alloc_func, p_free_func, p_user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1207).
"""
MemAlloc(size) = igMemAlloc(size)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1208).
"""
MemFree(ptr) = igMemFree(ptr)

"""
$(TYPEDSIGNATURES)

(Optional) Platform/OS interface for multi-viewport support
Read comments around the ImGuiPlatformIO structure for more details.
Note: You may use GetWindowViewport() to get the current viewport of the current window.// call in main loop. will call CreateWindow/ResizeWindow/etc. platform functions for each secondary viewport, and DestroyWindow for each inactive viewport.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1213).
"""
UpdatePlatformWindows() = igUpdatePlatformWindows()

"""
$(TYPEDSIGNATURES)

Call in main loop. will call RenderWindow/SwapBuffers platform functions for each secondary viewport which doesn't have the ImGuiViewportFlags_Minimized flag set. May be reimplemented by user for custom rendering needs.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1214).
"""
RenderPlatformWindowsDefault(platform_render_arg = C_NULL, renderer_render_arg = C_NULL) =
    igRenderPlatformWindowsDefault(platform_render_arg, renderer_render_arg)

"""
$(TYPEDSIGNATURES)

Call DestroyWindow platform functions for all viewports. call from backend Shutdown() if you need to close platform windows before imgui shutdown. otherwise will be called by DestroyContext().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1215).
"""
DestroyPlatformWindows() = igDestroyPlatformWindows()

"""
$(TYPEDSIGNATURES)

This is a helper for backends.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1216).
"""
FindViewportByID(viewport_id::Union{ImGuiID,Integer}) = igFindViewportByID(viewport_id)

"""
$(TYPEDSIGNATURES)

This is a helper for backends. the type platform_handle is decided by the backend (e.g. HWND, MyWindow*, GLFWwindow* etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L1217).
"""
FindViewportByPlatformHandle(platform_handle) = igFindViewportByPlatformHandle(platform_handle)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2288).
"""
lib.ImGuiTableSortSpecs() = ImGuiTableSortSpecs_ImGuiTableSortSpecs()

"""
Destructor for `ImGuiTableSortSpecs`
"""
Destroy(self::Ptr{ImGuiTableSortSpecs}) = ImGuiTableSortSpecs_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2299).
"""
lib.ImGuiTableColumnSortSpecs() = ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs()

"""
Destructor for `ImGuiTableColumnSortSpecs`
"""
Destroy(self::Ptr{ImGuiTableColumnSortSpecs}) = ImGuiTableColumnSortSpecs_destroy(self)

"""
$(TYPEDSIGNATURES)

Functions.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2510).
"""
lib.ImGuiStyle() = ImGuiStyle_ImGuiStyle()

"""
Destructor for `ImGuiStyle`
"""
Destroy(self::Ptr{ImGuiStyle}) = ImGuiStyle_destroy(self)

"""
$(TYPEDSIGNATURES)

Scale all spacing/padding/thickness values. Do not scale fonts. See comments in definition. Consider not calling this if your initial scale factor if <1.0.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2511).
"""
ScaleAllSizes(self::Ptr{ImGuiStyle}, scale_factor) = ImGuiStyle_ScaleAllSizes(self, scale_factor)

"""
$(TYPEDSIGNATURES)

Input Functions// Queue a new key down/up event. Key should be "translated" (as in, generally ImGuiKey_A matches the key end-user would use to emit an 'A' character).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2696).
"""
AddKeyEvent(self::Ptr{ImGuiIO}, key::ImGuiKey, down) = ImGuiIO_AddKeyEvent(self, key, down)

"""
$(TYPEDSIGNATURES)

Queue a new key down/up event for analog values (e.g. ImGuiKey_Gamepad_ values). Dead-zones should be handled by the backend.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2697).
"""
AddKeyAnalogEvent(self::Ptr{ImGuiIO}, key::ImGuiKey, down, v) = ImGuiIO_AddKeyAnalogEvent(self, key, down, v)

"""
$(TYPEDSIGNATURES)

Queue a mouse position update. Use -FLT_MAX,-FLT_MAX to signify no mouse (e.g. app not focused and not hovered).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2698).
"""
AddMousePosEvent(self::Ptr{ImGuiIO}, x, y) = ImGuiIO_AddMousePosEvent(self, x, y)

"""
$(TYPEDSIGNATURES)

Queue a mouse button change.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2699).
"""
AddMouseButtonEvent(self::Ptr{ImGuiIO}, button, down) = ImGuiIO_AddMouseButtonEvent(self, button, down)

"""
$(TYPEDSIGNATURES)

Queue a mouse wheel update. wheel_y<0: scroll down, wheel_y>0: scroll up, wheel_x<0: scroll right, wheel_x>0: scroll left.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2700).
"""
AddMouseWheelEvent(self::Ptr{ImGuiIO}, wheel_x, wheel_y) = ImGuiIO_AddMouseWheelEvent(self, wheel_x, wheel_y)

"""
$(TYPEDSIGNATURES)

Queue a mouse source change (Mouse/TouchScreen/Pen).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2701).
"""
AddMouseSourceEvent(self::Ptr{ImGuiIO}, source::ImGuiMouseSource) = ImGuiIO_AddMouseSourceEvent(self, source)

"""
$(TYPEDSIGNATURES)

Queue a mouse hovered viewport. Requires backend to set ImGuiBackendFlags_HasMouseHoveredViewport to call this (for multi-viewport support).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2702).
"""
AddMouseViewportEvent(self::Ptr{ImGuiIO}, id::Union{ImGuiID,Integer}) = ImGuiIO_AddMouseViewportEvent(self, id)

"""
$(TYPEDSIGNATURES)

Queue a gain/loss of focus for the application (generally based on OS/platform focus of your window).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2703).
"""
AddFocusEvent(self::Ptr{ImGuiIO}, focused) = ImGuiIO_AddFocusEvent(self, focused)

"""
$(TYPEDSIGNATURES)

Queue a new character input.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2704).
"""
AddInputCharacter(self::Ptr{ImGuiIO}, c) = ImGuiIO_AddInputCharacter(self, c)

"""
$(TYPEDSIGNATURES)

Queue a new character input from a UTF-16 character, it can be a surrogate.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2705).
"""
AddInputCharacterUTF16(self::Ptr{ImGuiIO}, c::ImWchar16) = ImGuiIO_AddInputCharacterUTF16(self, c)

"""
$(TYPEDSIGNATURES)

Queue a new characters input from a UTF-8 string.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2706).
"""
AddInputCharactersUTF8(self::Ptr{ImGuiIO}, str) = ImGuiIO_AddInputCharactersUTF8(self, str)

"""
$(TYPEDSIGNATURES)

[Optional] Specify index for legacy <1.87 IsKeyXXX() functions with native indices + specify native keycode, scancode.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2708).
"""
SetKeyEventNativeData(self::Ptr{ImGuiIO}, key::ImGuiKey, native_keycode, native_scancode, native_legacy_index = -1) =
    ImGuiIO_SetKeyEventNativeData(self, key, native_keycode, native_scancode, native_legacy_index)

"""
$(TYPEDSIGNATURES)

Set master flag for accepting key/mouse/text events (default to true). Useful if you have native dialog boxes that are interrupting your application loop/refresh, and you want to disable events being queued while your app is frozen.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2709).
"""
SetAppAcceptingEvents(self::Ptr{ImGuiIO}, accepting_events) = ImGuiIO_SetAppAcceptingEvents(self, accepting_events)

"""
$(TYPEDSIGNATURES)

Clear all incoming events.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2710).
"""
ClearEventsQueue(self::Ptr{ImGuiIO}) = ImGuiIO_ClearEventsQueue(self)

"""
$(TYPEDSIGNATURES)

Clear current keyboard/gamepad state + current frame text input buffer. Equivalent to releasing all keys/buttons.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2711).
"""
ClearInputKeys(self::Ptr{ImGuiIO}) = ImGuiIO_ClearInputKeys(self)

"""
$(TYPEDSIGNATURES)

Clear current mouse state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2712).
"""
ClearInputMouse(self::Ptr{ImGuiIO}) = ImGuiIO_ClearInputMouse(self)

"""
$(TYPEDSIGNATURES)

Legacy: before 1.87, we required backend to fill io.KeyMap[] (imgui->native map) during initialization and io.KeysDown[] (native indices) every frame.
This is still temporarily supported as a legacy feature. However the new preferred scheme is for backend to call io.AddKeyEvent().
  Old (<1.87):  ImGui::IsKeyPressed(ImGui::GetIO().KeyMap[ImGuiKey_Space]) --> New (1.87+) ImGui::IsKeyPressed(ImGuiKey_Space)
  Old (<1.87):  ImGui::IsKeyPressed(MYPLATFORM_KEY_SPACE)                  --> New (1.87+) ImGui::IsKeyPressed(ImGuiKey_Space)
Read https://github.com/ocornut/imgui/issues/4921 for details.
    //int       KeyMap[ImGuiKey_COUNT];             // [LEGACY] Input: map of indices into the KeysDown[512] entries array which represent your "native" keyboard state. The first 512 are now unused and should be kept zero. Legacy backend will write into KeyMap[] using ImGuiKey_ indices which are always >512.
    //bool      KeysDown[ImGuiKey_COUNT];           // [LEGACY] Input: Keyboard keys that are pressed (ideally left in the "native" order your engine has access to keyboard keys, so you can use your own defines/enums for keys). This used to be [512] sized. It is now ImGuiKey_COUNT to allow legacy io.KeysDown[GetKeyIndex(...)] to work without an overflow.
    //float     NavInputs[ImGuiNavInput_COUNT];     // [LEGACY] Since 1.88, NavInputs[] was removed. Backends from 1.60 to 1.86 won't build. Feed gamepad inputs via io.AddKeyEvent() and ImGuiKey_GamepadXXX enums.
    //void*     ImeWindowHandle;                    // [Obsoleted in 1.87] Set ImGuiViewport::PlatformHandleRaw instead. Set this to your HWND to get automatic IME cursor positioning.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2803).
"""
lib.ImGuiIO() = ImGuiIO_ImGuiIO()

"""
Destructor for `ImGuiIO`
"""
Destroy(self::Ptr{ImGuiIO}) = ImGuiIO_destroy(self)

"""
$(TYPEDSIGNATURES)

Helper functions for text manipulation.
Use those function to benefit from the CallbackResize behaviors. Calling those function reset the selection.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2845).
"""
lib.ImGuiInputTextCallbackData() = ImGuiInputTextCallbackData_ImGuiInputTextCallbackData()

"""
Destructor for `ImGuiInputTextCallbackData`
"""
Destroy(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2846).
"""
DeleteChars(self::Ptr{ImGuiInputTextCallbackData}, pos, bytes_count) =
    ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2847).
"""
InsertChars(self::Ptr{ImGuiInputTextCallbackData}, pos, text, text_end = C_NULL) =
    ImGuiInputTextCallbackData_InsertChars(self, pos, text, text_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2848).
"""
SelectAll(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_SelectAll(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2849).
"""
SetSelection(self::Ptr{ImGuiInputTextCallbackData}, s, e) = ImGuiInputTextCallbackData_SetSelection(self, s, e)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2850).
"""
ClearSelection(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_ClearSelection(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2851).
"""
HasSelection(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_HasSelection(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2884).
"""
lib.ImGuiWindowClass() = ImGuiWindowClass_ImGuiWindowClass()

"""
Destructor for `ImGuiWindowClass`
"""
Destroy(self::Ptr{ImGuiWindowClass}) = ImGuiWindowClass_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2902).
"""
lib.ImGuiPayload() = ImGuiPayload_ImGuiPayload()

"""
Destructor for `ImGuiPayload`
"""
Destroy(self::Ptr{ImGuiPayload}) = ImGuiPayload_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2903).
"""
Clear(self::Ptr{ImGuiPayload}) = ImGuiPayload_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2904).
"""
IsDataType(self::Ptr{ImGuiPayload}, type) = ImGuiPayload_IsDataType(self, type)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2905).
"""
IsPreview(self::Ptr{ImGuiPayload}) = ImGuiPayload_IsPreview(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2906).
"""
IsDelivery(self::Ptr{ImGuiPayload}) = ImGuiPayload_IsDelivery(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2925).
"""
lib.ImGuiOnceUponAFrame() = ImGuiOnceUponAFrame_ImGuiOnceUponAFrame()

"""
Destructor for `ImGuiOnceUponAFrame`
"""
Destroy(self::Ptr{ImGuiOnceUponAFrame}) = ImGuiOnceUponAFrame_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2934).
"""
lib.ImGuiTextFilter(default_filter = "") = ImGuiTextFilter_ImGuiTextFilter(default_filter)

"""
Destructor for `ImGuiTextFilter`
"""
Destroy(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2935).
"""
PassFilter(self::Ptr{ImGuiTextFilter}, text, text_end = C_NULL) = ImGuiTextFilter_PassFilter(self, text, text_end)

"""
$(TYPEDSIGNATURES)

Update internal data when filter changes.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2936).
"""
Build(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_Build(self)

"""
$(TYPEDSIGNATURES)

Clear filter.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2937).
"""
Clear(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_Clear(self)

"""
$(TYPEDSIGNATURES)

Useful if you need e.g. an alternative code-path when there are no filters.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2938).
"""
IsActive(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_IsActive(self)

"""
$(TYPEDSIGNATURES)

Helper to call InputText() + Build() when buffer is changed.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2941).
"""
Draw(self::Ptr{ImGuiTextFilter}, label = "Filter") = ImGuiTextFilter_Draw(self, label)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2942).
"""
DrawWithHint(self::Ptr{ImGuiTextFilter}, label = "Filter", hint = "incl -excl") =
    ImGuiTextFilter_DrawWithHint(self, label, hint)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2960).
"""
lib.ImGuiTextBuffer() = ImGuiTextBuffer_ImGuiTextBuffer()

"""
Destructor for `ImGuiTextBuffer`
"""
Destroy(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2962).
"""
Begin(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_begin(self)

"""
$(TYPEDSIGNATURES)

Buf is zero-terminated, so end() will point on the zero-terminator.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2963).
"""
End(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_end(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2964).
"""
Size(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_size(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2965).
"""
Empty(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_empty(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2966).
"""
Clear(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_clear(self)

"""
$(TYPEDSIGNATURES)

Similar to resize(0) on ImVector: empty string but don't free buffer.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2967).
"""
Resize(self::Ptr{ImGuiTextBuffer}, size) = ImGuiTextBuffer_resize(self, size)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2968).
"""
Reserve(self::Ptr{ImGuiTextBuffer}, capacity) = ImGuiTextBuffer_reserve(self, capacity)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2969).
"""
C_str(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_c_str(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2970).
"""
Append(self::Ptr{ImGuiTextBuffer}, str, str_end = C_NULL) = ImGuiTextBuffer_append(self, str, str_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2980).
"""
lib.ImGuiStoragePair(_key::Union{ImGuiID,Integer}, _val::Integer) = ImGuiStoragePair_ImGuiStoragePair_Int(_key, _val)

"""
Destructor for `ImGuiStoragePair`
"""
Destroy(self::Ptr{ImGuiStoragePair}) = ImGuiStoragePair_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2981).
"""
lib.ImGuiStoragePair(_key::Union{ImGuiID,Integer}, _val::Real) = ImGuiStoragePair_ImGuiStoragePair_Float(_key, _val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2982).
"""
lib.ImGuiStoragePair(_key::Union{ImGuiID,Integer}, _val::PtrOrRef{Cvoid}) =
    ImGuiStoragePair_ImGuiStoragePair_Ptr(_key, _val)

"""
$(TYPEDSIGNATURES)

- Get***() functions find pair, never add/allocate. Pairs are sorted so a query is O(log N)
- Set***() functions find pair, insertion on demand if missing.
- Sorted insertion is costly, paid once. A typical frame shouldn't need to insert any new pair.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3001).
"""
Clear(self::Ptr{ImGuiStorage}) = ImGuiStorage_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3002).
"""
GetInt(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0) =
    ImGuiStorage_GetInt(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3003).
"""
SetInt(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetInt(self, key, val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3004).
"""
GetBool(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = false) =
    ImGuiStorage_GetBool(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3005).
"""
SetBool(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetBool(self, key, val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3006).
"""
GetFloat(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0.0f0) =
    ImGuiStorage_GetFloat(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3007).
"""
SetFloat(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetFloat(self, key, val)

"""
$(TYPEDSIGNATURES)

Default_val is NULL.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3008).
"""
GetVoidPtr(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}) = ImGuiStorage_GetVoidPtr(self, key)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3009).
"""
SetVoidPtr(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetVoidPtr(self, key, val)

"""
$(TYPEDSIGNATURES)

- Get***Ref() functions finds pair, insert on demand if missing, return pointer. Useful if you intend to do Get+Set.
- References are only valid until a new value is added to the storage. Calling a Set***() function or a Get***Ref() function invalidates the pointer.
- A typical use case where this is convenient for quick hacking (e.g. add storage during a live Edit&Continue session if you can't modify existing struct)
     float* pvar = ImGui::GetFloatRef(key); ImGui::SliderFloat("var", pvar, 0, 100.0f); some_var += *pvar;.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3015).
"""
GetIntRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0) =
    ImGuiStorage_GetIntRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3016).
"""
GetBoolRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = false) =
    ImGuiStorage_GetBoolRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3017).
"""
GetFloatRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0.0f0) =
    ImGuiStorage_GetFloatRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3018).
"""
GetVoidPtrRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = C_NULL) =
    ImGuiStorage_GetVoidPtrRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

Advanced: for quicker full rebuild of a storage (instead of an incremental one), you may add all your contents and then sort once.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3021).
"""
BuildSortByKey(self::Ptr{ImGuiStorage}) = ImGuiStorage_BuildSortByKey(self)

"""
$(TYPEDSIGNATURES)


Obsolete: use on your own storage if you know only integer are being stored (open/close all tree nodes).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3023).
"""
SetAllInt(self::Ptr{ImGuiStorage}, val) = ImGuiStorage_SetAllInt(self, val)

"""
$(TYPEDSIGNATURES)

Items_count: Use INT_MAX if you don't know how many items you have (in which case the cursor won't be advanced in the final step, and you can call SeekCursorForItem() manually if you need)
Items_height: Use -1.0f to be calculated automatically on first step. Otherwise pass in the distance between your items, typically GetTextLineHeightWithSpacing() or GetFrameHeightWithSpacing().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3086).
"""
lib.ImGuiListClipper() = ImGuiListClipper_ImGuiListClipper()

"""
Destructor for `ImGuiListClipper`
"""
Destroy(self::Ptr{ImGuiListClipper}) = ImGuiListClipper_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3088).
"""
Begin(self::Ptr{ImGuiListClipper}, items_count, items_height = -1.0f0) =
    ImGuiListClipper_Begin(self, items_count, items_height)

"""
$(TYPEDSIGNATURES)

Automatically called on the last call of Step() that returns false.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3089).
"""
End(self::Ptr{ImGuiListClipper}) = ImGuiListClipper_End(self)

"""
$(TYPEDSIGNATURES)

Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3090).
"""
Step(self::Ptr{ImGuiListClipper}) = ImGuiListClipper_Step(self)

"""
$(TYPEDSIGNATURES)

Call IncludeItemByIndex() or IncludeItemsByIndex() *BEFORE* first call to Step() if you need a range of items to not be clipped, regardless of their visibility.
(Due to alignment / padding of certain items it is possible that an extra item may be included on either end of the display range).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3094).
"""
IncludeItemByIndex(self::Ptr{ImGuiListClipper}, item_index) = ImGuiListClipper_IncludeItemByIndex(self, item_index)

"""
$(TYPEDSIGNATURES)

Item_end is exclusive e.g. use (42, 42+1) to make item 42 never clipped.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3095).
"""
IncludeItemsByIndex(self::Ptr{ImGuiListClipper}, item_begin, item_end) =
    ImGuiListClipper_IncludeItemsByIndex(self, item_begin, item_end)

"""
$(TYPEDSIGNATURES)

Seek cursor toward given item. This is automatically called while stepping.
- The only reason to call this is: you can use ImGuiListClipper::Begin(INT_MAX) if you don't know item count ahead of time.
- In this case, after all steps are done, you'll want to call SeekCursorForItem(item_count).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3100).
"""
SeekCursorForItem(self::Ptr{ImGuiListClipper}, item_index) = ImGuiListClipper_SeekCursorForItem(self, item_index)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3186).
"""
lib.ImColor() = ImColor_ImColor_Nil()

"""
Destructor for `ImColor`
"""
Destroy(self::Ptr{ImColor}) = ImColor_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3187).
"""
lib.ImColor(r::Real, g::Real, b::Real, a::Real = 1.0f0) = ImColor_ImColor_Float(r, g, b, a)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3189).
"""
lib.ImColor(r::Integer, g::Integer, b::Integer, a::Integer = 255) = ImColor_ImColor_Int(r, g, b, a)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3190).
"""
lib.ImColor(rgba::Union{ImU32,Integer}) = ImColor_ImColor_U32(rgba)

"""
$(TYPEDSIGNATURES)

FIXME-OBSOLETE: May need to obsolete/cleanup those helpers.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3195).
"""
SetHSV(self::Ptr{ImColor}, h, s, v, a = 1.0f0) = ImColor_SetHSV(self, h, s, v, a)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3196).
"""
HSV(h, s, v, a = 1.0f0) = (ImColor_HSV(h, s, v, a)).Value

"""
$(TYPEDSIGNATURES)

Methods.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3333).
"""
lib.ImGuiSelectionBasicStorage() = ImGuiSelectionBasicStorage_ImGuiSelectionBasicStorage()

"""
Destructor for `ImGuiSelectionBasicStorage`
"""
Destroy(self::Ptr{ImGuiSelectionBasicStorage}) = ImGuiSelectionBasicStorage_destroy(self)

"""
$(TYPEDSIGNATURES)

Apply selection requests coming from BeginMultiSelect() and EndMultiSelect() functions. It uses 'items_count' passed to BeginMultiSelect().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3334).
"""
ApplyRequests(self::Ptr{ImGuiSelectionBasicStorage}, ms_io::VoidablePtrOrRef{ImGuiMultiSelectIO}) =
    ImGuiSelectionBasicStorage_ApplyRequests(self, ms_io)

"""
$(TYPEDSIGNATURES)

Query if an item id is in selection.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3335).
"""
Contains(self::Ptr{ImGuiSelectionBasicStorage}, id::Union{ImGuiID,Integer}) =
    ImGuiSelectionBasicStorage_Contains(self, id)

"""
$(TYPEDSIGNATURES)

Clear selection.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3336).
"""
Clear(self::Ptr{ImGuiSelectionBasicStorage}) = ImGuiSelectionBasicStorage_Clear(self)

"""
$(TYPEDSIGNATURES)

Swap two selections.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3337).
"""
Swap(self::Ptr{ImGuiSelectionBasicStorage}, r::VoidablePtrOrRef{ImGuiSelectionBasicStorage}) =
    ImGuiSelectionBasicStorage_Swap(self, r)

"""
$(TYPEDSIGNATURES)

Add/remove an item from selection (generally done by ApplyRequests() function).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3338).
"""
SetItemSelected(self::Ptr{ImGuiSelectionBasicStorage}, id::Union{ImGuiID,Integer}, selected) =
    ImGuiSelectionBasicStorage_SetItemSelected(self, id, selected)

"""
$(TYPEDSIGNATURES)

Iterate selection with 'void* it = NULL; ImGuiID id; while (selection.GetNextSelectedItem(&it, &id))  ... '.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3339).
"""
GetNextSelectedItem(self::Ptr{ImGuiSelectionBasicStorage}, opaque_it, out_id::VoidablePtrOrRef{ImGuiID}) =
    ImGuiSelectionBasicStorage_GetNextSelectedItem(self, opaque_it, out_id)

"""
$(TYPEDSIGNATURES)

Convert index to item id based on provided adapter.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3340).
"""
GetStorageIdFromIndex(self::Ptr{ImGuiSelectionBasicStorage}, idx) =
    ImGuiSelectionBasicStorage_GetStorageIdFromIndex(self, idx)

"""
$(TYPEDSIGNATURES)

Methods.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3352).
"""
lib.ImGuiSelectionExternalStorage() = ImGuiSelectionExternalStorage_ImGuiSelectionExternalStorage()

"""
Destructor for `ImGuiSelectionExternalStorage`
"""
Destroy(self::Ptr{ImGuiSelectionExternalStorage}) = ImGuiSelectionExternalStorage_destroy(self)

"""
$(TYPEDSIGNATURES)

Apply selection requests by using AdapterSetItemSelected() calls.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3353).
"""
ApplyRequests(self::Ptr{ImGuiSelectionExternalStorage}, ms_io::VoidablePtrOrRef{ImGuiMultiSelectIO}) =
    ImGuiSelectionExternalStorage_ApplyRequests(self, ms_io)

"""
$(TYPEDSIGNATURES)

Also ensure our padding fields are zeroed.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3396).
"""
lib.ImDrawCmd() = ImDrawCmd_ImDrawCmd()

"""
Destructor for `ImDrawCmd`
"""
Destroy(self::Ptr{ImDrawCmd}) = ImDrawCmd_destroy(self)

"""
$(TYPEDSIGNATURES)

Since 1.83: returns ImTextureID associated with this draw call. Warning: DO NOT assume this is always same as 'TextureId' (we will change this function for an upcoming feature)
Since 1.92: removed ImDrawCmd::TextureId field, the getter function must be used!// == (TexRef._TexData ? TexRef._TexData->TexID : TexRef._TexID).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3400).
"""
GetTexID(self::Ptr{ImDrawCmd}) = ImDrawCmd_GetTexID(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3442).
"""
lib.ImDrawListSplitter() = ImDrawListSplitter_ImDrawListSplitter()

"""
Destructor for `ImDrawListSplitter`
"""
Destroy(self::Ptr{ImDrawListSplitter}) = ImDrawListSplitter_destroy(self)

"""
$(TYPEDSIGNATURES)

Do not clear Channels[] so our allocations are reused next frame.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3444).
"""
Clear(self::Ptr{ImDrawListSplitter}) = ImDrawListSplitter_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3445).
"""
ClearFreeMemory(self::Ptr{ImDrawListSplitter}) = ImDrawListSplitter_ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3446).
"""
Split(self::Ptr{ImDrawListSplitter}, draw_list::VoidablePtrOrRef{ImDrawList}, count) =
    ImDrawListSplitter_Split(self, draw_list, count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3447).
"""
Merge(self::Ptr{ImDrawListSplitter}, draw_list::VoidablePtrOrRef{ImDrawList}) =
    ImDrawListSplitter_Merge(self, draw_list)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3448).
"""
SetCurrentChannel(self::Ptr{ImDrawListSplitter}, draw_list::VoidablePtrOrRef{ImDrawList}, channel_idx) =
    ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx)

"""
$(TYPEDSIGNATURES)

If you want to create ImDrawList instances, pass them ImGui::GetDrawListSharedData().
(advanced: you may create and use your own ImDrawListSharedData so you can use ImDrawList without ImGui, but that's more involved).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3568).
"""
lib.ImDrawList(shared_data::VoidablePtrOrRef{ImDrawListSharedData}) = ImDrawList_ImDrawList(shared_data)

"""
Destructor for `ImDrawList`
"""
Destroy(self::Ptr{ImDrawList}) = ImDrawList_destroy(self)

"""
$(TYPEDSIGNATURES)

Render-level scissoring. This is passed down to your render function but not used for CPU-side coarse clipping. Prefer using higher-level ImGui::PushClipRect() to affect logic (hit-testing and widget culling).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3571).
"""
PushClipRect(
    self::Ptr{ImDrawList},
    clip_rect_min::Union{ImVec2,NTuple{2}},
    clip_rect_max::Union{ImVec2,NTuple{2}},
    intersect_with_current_clip_rect = false,
) = ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3572).
"""
PushClipRectFullScreen(self::Ptr{ImDrawList}) = ImDrawList_PushClipRectFullScreen(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3573).
"""
PopClipRect(self::Ptr{ImDrawList}) = ImDrawList_PopClipRect(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3574).
"""
PushTexture(self::Ptr{ImDrawList}, tex_ref::ImTextureRef) = ImDrawList_PushTexture(self, tex_ref)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3575).
"""
PopTexture(self::Ptr{ImDrawList}) = ImDrawList_PopTexture(self)

"""
$(TYPEDSIGNATURES)

[BETA] Please notify me if you are using this.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3576).
"""
PushDrawFlag(self::Ptr{ImDrawList}, flags::Union{ImDrawFlags,ImDrawFlags_,Integer}, enabled) =
    ImDrawList_PushDrawFlag(self, flags, enabled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3577).
"""
PopDrawFlag(self::Ptr{ImDrawList}) = ImDrawList_PopDrawFlag(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3578).
"""
GetClipRectMin(self::Ptr{ImDrawList}) = ImDrawList_GetClipRectMin(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3579).
"""
GetClipRectMax(self::Ptr{ImDrawList}) = ImDrawList_GetClipRectMax(self)

"""
$(TYPEDSIGNATURES)

Primitives
- Filled shapes must always use clockwise winding order. The anti-aliasing fringe depends on it. Counter-clockwise shapes will have "inward" anti-aliasing.
- For rectangular primitives, "p_min" and "p_max" represent the upper-left and lower-right corners.
- For circle primitives, use "num_segments == 0" to automatically calculate tessellation (preferred).
  In older versions (until Dear ImGui 1.77) the AddCircle functions defaulted to num_segments == 12.
  In future versions we will use textures to provide cheaper and higher-quality circles.
  Use AddNgon() and AddNgonFilled() functions if you need to guarantee a specific number of sides.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3588).
"""
AddLine(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddLine(self, p1, p2, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3589).
"""
AddLineH(
    self::Ptr{ImDrawList},
    min_x,
    max_x,
    y,
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddLineH(self, min_x, max_x, y, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3590).
"""
AddLineV(
    self::Ptr{ImDrawList},
    x,
    min_y,
    max_y,
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddLineV(self, x, min_y, max_y, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

A: upper-left, b: lower-right (== upper-left + size).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3591).
"""
AddRect(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rounding = 0.0f0,
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddRect(self, p_min, p_max, col, rounding, thickness, flags)

"""
$(TYPEDSIGNATURES)

A: upper-left, b: lower-right (== upper-left + size).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3592).
"""
AddRectFilled(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rounding = 0.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3593).
"""
AddRectFilledMultiColor(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col_upr_left::Union{ImU32,Integer},
    col_upr_right::Union{ImU32,Integer},
    col_bot_right::Union{ImU32,Integer},
    col_bot_left::Union{ImU32,Integer},
) = ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3594).
"""
AddQuad(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3595).
"""
AddQuadFilled(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
) = ImDrawList_AddQuadFilled(self, p1, p2, p3, p4, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3596).
"""
AddTriangle(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3597).
"""
AddTriangleFilled(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
) = ImDrawList_AddTriangleFilled(self, p1, p2, p3, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3598).
"""
AddCircle(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius,
    col::Union{ImU32,Integer},
    num_segments = 0,
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3599).
"""
AddCircleFilled(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius,
    col::Union{ImU32,Integer},
    num_segments = 0,
) = ImDrawList_AddCircleFilled(self, center, radius, col, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3600).
"""
AddNgon(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius,
    col::Union{ImU32,Integer},
    num_segments,
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3601).
"""
AddNgonFilled(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, col::Union{ImU32,Integer}, num_segments) =
    ImDrawList_AddNgonFilled(self, center, radius, col, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3602).
"""
AddEllipse(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rot = 0.0f0,
    num_segments = 0,
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddEllipse(self, center, radius, col, rot, num_segments, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3603).
"""
AddEllipseFilled(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rot = 0.0f0,
    num_segments = 0,
) = ImDrawList_AddEllipseFilled(self, center, radius, col, rot, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3604).
"""
AddText(
    self::Ptr{ImDrawList},
    pos::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    text_begin::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    text_end::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL,
) = ImDrawList_AddText_Vec2(self, pos, col, text_begin, text_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3605).
"""
AddText(
    self::Ptr{ImDrawList},
    font::VoidablePtrOrRef{ImFont},
    font_size::Real,
    pos::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    text_begin::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    text_end::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL,
    wrap_width::Real = 0.0f0,
    cpu_fine_clip_rect::VoidablePtrOrRef{ImVec4} = C_NULL,
) = ImDrawList_AddText_FontPtr(self, font, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect)

"""
$(TYPEDSIGNATURES)

Cubic Bezier (4 control points).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3606).
"""
AddBezierCubic(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness,
    num_segments = 0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddBezierCubic(self, p1, p2, p3, p4, col, thickness, num_segments, flags)

"""
$(TYPEDSIGNATURES)

Quadratic Bezier (3 control points).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3607).
"""
AddBezierQuadratic(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness,
    num_segments = 0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddBezierQuadratic(self, p1, p2, p3, col, thickness, num_segments, flags)

"""
$(TYPEDSIGNATURES)

General polygon
- Only simple polygons are supported by filling functions (no self-intersections, no holes).
- Concave polygon fill is more expensive than convex one: it has O(N^2) complexity. Provided as a convenience for the user but not used by the main library.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3612).
"""
AddPolyline(
    self::Ptr{ImDrawList},
    points::VoidablePtrOrRef{ImVec2},
    num_points,
    col::Union{ImU32,Integer},
    thickness,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddPolyline(self, points, num_points, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3613).
"""
AddConvexPolyFilled(
    self::Ptr{ImDrawList},
    points::VoidablePtrOrRef{ImVec2},
    num_points,
    col::Union{ImU32,Integer},
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddConvexPolyFilled(self, points, num_points, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3614).
"""
AddConcavePolyFilled(self::Ptr{ImDrawList}, points::VoidablePtrOrRef{ImVec2}, num_points, col::Union{ImU32,Integer}) =
    ImDrawList_AddConcavePolyFilled(self, points, num_points, col)

"""
$(TYPEDSIGNATURES)

Image primitives
- Read FAQ to understand what ImTextureID/ImTextureRef are.
- "p_min" and "p_max" represent the upper-left and lower-right corners of the rectangle.
- "uv_min" and "uv_max" represent the normalized texture coordinates to use for those corners. Using (0,0)->(1,1) texture coordinates will generally display the entire texture.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3620).
"""
AddImage(
    self::Ptr{ImDrawList},
    tex_ref::ImTextureRef,
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    uv_min::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    uv_max::Union{ImVec2,NTuple{2}} = ImVec2(1, 1),
    col::Union{ImU32,Integer} = 4294967295,
) = ImDrawList_AddImage(self, tex_ref, p_min, p_max, uv_min, uv_max, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3621).
"""
AddImageQuad(
    self::Ptr{ImDrawList},
    tex_ref::ImTextureRef,
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    uv1::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    uv2::Union{ImVec2,NTuple{2}} = ImVec2(1, 0),
    uv3::Union{ImVec2,NTuple{2}} = ImVec2(1, 1),
    uv4::Union{ImVec2,NTuple{2}} = ImVec2(0, 1),
    col::Union{ImU32,Integer} = 4294967295,
) = ImDrawList_AddImageQuad(self, tex_ref, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3622).
"""
AddImageRounded(
    self::Ptr{ImDrawList},
    tex_ref::ImTextureRef,
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    uv_min::Union{ImVec2,NTuple{2}},
    uv_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rounding,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_AddImageRounded(self, tex_ref, p_min, p_max, uv_min, uv_max, col, rounding, flags)

"""
$(TYPEDSIGNATURES)

Stateful path API, add points then finish with PathFillConvex() or PathStroke()
- Important: filled shapes must always use clockwise winding order! The anti-aliasing fringe depends on it. Counter-clockwise shapes will have "inward" anti-aliasing.
  so e.g. 'PathArcTo(center, radius, PI * -0.5f, PI)' is ok, whereas 'PathArcTo(center, radius, PI, PI * -0.5f)' won't have correct anti-aliasing when followed by PathFillConvex().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3627).
"""
PathClear(self::Ptr{ImDrawList}) = ImDrawList_PathClear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3628).
"""
PathLineTo(self::Ptr{ImDrawList}, pos::Union{ImVec2,NTuple{2}}) = ImDrawList_PathLineTo(self, pos)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3629).
"""
PathLineToMergeDuplicate(self::Ptr{ImDrawList}, pos::Union{ImVec2,NTuple{2}}) =
    ImDrawList_PathLineToMergeDuplicate(self, pos)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3630).
"""
PathFillConvex(self::Ptr{ImDrawList}, col::Union{ImU32,Integer}, flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0) =
    ImDrawList_PathFillConvex(self, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3631).
"""
PathFillConcave(self::Ptr{ImDrawList}, col::Union{ImU32,Integer}) = ImDrawList_PathFillConcave(self, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3632).
"""
PathStroke(
    self::Ptr{ImDrawList},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_PathStroke(self, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3633).
"""
PathArcTo(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min, a_max, num_segments = 0) =
    ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments)

"""
$(TYPEDSIGNATURES)

Use precomputed angles for a 12 steps circle.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3634).
"""
PathArcToFast(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min_of_12, a_max_of_12) =
    ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12)

"""
$(TYPEDSIGNATURES)

Ellipse.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3635).
"""
PathEllipticalArcTo(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius::Union{ImVec2,NTuple{2}},
    rot,
    a_min,
    a_max,
    num_segments = 0,
) = ImDrawList_PathEllipticalArcTo(self, center, radius, rot, a_min, a_max, num_segments)

"""
$(TYPEDSIGNATURES)

Cubic Bezier (4 control points).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3636).
"""
PathBezierCubicCurveTo(
    self::Ptr{ImDrawList},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    num_segments = 0,
) = ImDrawList_PathBezierCubicCurveTo(self, p2, p3, p4, num_segments)

"""
$(TYPEDSIGNATURES)

Quadratic Bezier (3 control points).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3637).
"""
PathBezierQuadraticCurveTo(
    self::Ptr{ImDrawList},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    num_segments = 0,
) = ImDrawList_PathBezierQuadraticCurveTo(self, p2, p3, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3638).
"""
PathRect(
    self::Ptr{ImDrawList},
    rect_min::Union{ImVec2,NTuple{2}},
    rect_max::Union{ImVec2,NTuple{2}},
    rounding = 0.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = ImDrawList_PathRect(self, rect_min, rect_max, rounding, flags)

"""
$(TYPEDSIGNATURES)

Advanced: Draw Callbacks
- May be used to alter render state (change sampler, blending, current shader). May be used to emit custom rendering commands (difficult to do correctly, but possible).
- Use special GetPlatformIO().DrawCallback_ResetRenderState callback to instruct backend to reset its render state to the default.
- See other standard callbacks in GetPlatformIO(), which may or not be supported by your backend.
- Your rendering loop must check for 'UserCallback' in ImDrawCmd and call the function instead of rendering triangles. All standard backends are honoring this.
- For some backends, the callback may access selected render-states exposed by the backend in a ImGui_ImplXXXX_RenderState structure pointed to by platform_io.Renderer_RenderState.
- IMPORTANT: please be mindful of the different level of indirection between using size==0 (copying argument) and using size>0 (copying pointed data into a buffer).
  - If userdata_size == 0: we copy/store the 'userdata' argument as-is. It will be available unmodified in ImDrawCmd::UserCallbackData during render.
  - If userdata_size > 0,  we copy/store 'userdata_size' bytes pointed to by 'userdata'. We store them in a buffer stored inside the drawlist. ImDrawCmd::UserCallbackData will point inside that buffer so you have to retrieve data from there. Your callback may need to use ImDrawCmd::UserCallbackDataSize if you expect dynamically-sized data.
  - Support for userdata_size > 0 was added in v1.91.4, October 2024. So earlier code always only allowed to copy/store a simple void*.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3650).
"""
AddCallback(
    self::Ptr{ImDrawList},
    callback::Union{ImDrawCallback,Base.CFunction,Ptr{Cvoid}},
    userdata = C_NULL,
    userdata_size = 0,
) = ImDrawList_AddCallback(self, callback, userdata, userdata_size)

"""
$(TYPEDSIGNATURES)

Advanced: Miscellaneous// This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3653).
"""
AddDrawCmd(self::Ptr{ImDrawList}) = ImDrawList_AddDrawCmd(self)

"""
$(TYPEDSIGNATURES)

Create a clone of the CmdBuffer/IdxBuffer/VtxBuffer. For multi-threaded rendering, consider using `imgui_threaded_rendering` from https://github.com/ocornut/imgui_club instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3654).
"""
CloneOutput(self::Ptr{ImDrawList}) = ImDrawList_CloneOutput(self)

"""
$(TYPEDSIGNATURES)

Advanced: Channels
- Use to split render into layers. By switching channels to can render out-of-order (e.g. submit FG primitives before BG primitives)
- Use to minimize draw calls (e.g. if going back-and-forth between multiple clipping rectangles, prefer to append into separate channels then merge at the end)
- This API shouldn't have been in ImDrawList in the first place!
  Prefer using your own persistent instance of ImDrawListSplitter as you can stack them.
  Using the ImDrawList::ChannelsXXXX you cannot stack a split over another.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3662).
"""
ChannelsSplit(self::Ptr{ImDrawList}, count) = ImDrawList_ChannelsSplit(self, count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3663).
"""
ChannelsMerge(self::Ptr{ImDrawList}) = ImDrawList_ChannelsMerge(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3664).
"""
ChannelsSetCurrent(self::Ptr{ImDrawList}, n) = ImDrawList_ChannelsSetCurrent(self, n)

"""
$(TYPEDSIGNATURES)

Advanced: Primitives allocations
- We render triangles (three vertices)
- All primitives needs to be reserved via PrimReserve() beforehand.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3669).
"""
PrimReserve(self::Ptr{ImDrawList}, idx_count, vtx_count) = ImDrawList_PrimReserve(self, idx_count, vtx_count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3670).
"""
PrimUnreserve(self::Ptr{ImDrawList}, idx_count, vtx_count) = ImDrawList_PrimUnreserve(self, idx_count, vtx_count)

"""
$(TYPEDSIGNATURES)

Axis aligned rectangle (composed of two triangles).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3671).
"""
PrimRect(self::Ptr{ImDrawList}, a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}) =
    ImDrawList_PrimRect(self, a, b, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3672).
"""
PrimRectUV(
    self::Ptr{ImDrawList},
    a::Union{ImVec2,NTuple{2}},
    b::Union{ImVec2,NTuple{2}},
    uv_a::Union{ImVec2,NTuple{2}},
    uv_b::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
) = ImDrawList_PrimRectUV(self, a, b, uv_a, uv_b, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3673).
"""
PrimQuadUV(
    self::Ptr{ImDrawList},
    a::Union{ImVec2,NTuple{2}},
    b::Union{ImVec2,NTuple{2}},
    c::Union{ImVec2,NTuple{2}},
    d::Union{ImVec2,NTuple{2}},
    uv_a::Union{ImVec2,NTuple{2}},
    uv_b::Union{ImVec2,NTuple{2}},
    uv_c::Union{ImVec2,NTuple{2}},
    uv_d::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
) = ImDrawList_PrimQuadUV(self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3674).
"""
PrimWriteVtx(
    self::Ptr{ImDrawList},
    pos::Union{ImVec2,NTuple{2}},
    uv::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
) = ImDrawList_PrimWriteVtx(self, pos, uv, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3675).
"""
PrimWriteIdx(self::Ptr{ImDrawList}, idx::ImDrawIdx) = ImDrawList_PrimWriteIdx(self, idx)

"""
$(TYPEDSIGNATURES)

Write vertex with unique index.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3676).
"""
PrimVtx(self::Ptr{ImDrawList}, pos::Union{ImVec2,NTuple{2}}, uv::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}) =
    ImDrawList_PrimVtx(self, pos, uv, col)

"""
$(TYPEDSIGNATURES)

[Internal helpers].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3697).
"""
_SetDrawListSharedData(self::Ptr{ImDrawList}, data::VoidablePtrOrRef{ImDrawListSharedData}) =
    ImDrawList__SetDrawListSharedData(self, data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3698).
"""
_ResetForNewFrame(self::Ptr{ImDrawList}) = ImDrawList__ResetForNewFrame(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3699).
"""
_SetPixelDensity(self::Ptr{ImDrawList}, pixel_density) = ImDrawList__SetPixelDensity(self, pixel_density)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3700).
"""
_ClearFreeMemory(self::Ptr{ImDrawList}) = ImDrawList__ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3701).
"""
_PopUnusedDrawCmd(self::Ptr{ImDrawList}) = ImDrawList__PopUnusedDrawCmd(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3702).
"""
_TryMergeDrawCmds(self::Ptr{ImDrawList}) = ImDrawList__TryMergeDrawCmds(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3703).
"""
_OnChangedClipRect(self::Ptr{ImDrawList}) = ImDrawList__OnChangedClipRect(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3704).
"""
_OnChangedTexture(self::Ptr{ImDrawList}) = ImDrawList__OnChangedTexture(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3705).
"""
_OnChangedVtxOffset(self::Ptr{ImDrawList}) = ImDrawList__OnChangedVtxOffset(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3706).
"""
_SetTexture(self::Ptr{ImDrawList}, tex_ref::ImTextureRef) = ImDrawList__SetTexture(self, tex_ref)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3707).
"""
_CalcCircleAutoSegmentCount(self::Ptr{ImDrawList}, radius) = ImDrawList__CalcCircleAutoSegmentCount(self, radius)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3708).
"""
_PathArcToFastEx(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min_sample, a_max_sample, a_step) =
    ImDrawList__PathArcToFastEx(self, center, radius, a_min_sample, a_max_sample, a_step)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3709).
"""
_PathArcToN(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min, a_max, num_segments) =
    ImDrawList__PathArcToN(self, center, radius, a_min, a_max, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3710).
"""
_AddRectFilledBaked(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    r,
    tex_uvs::Union{ImVec4,NTuple{4}},
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
) = ImDrawList__AddRectFilledBaked(self, p_min, p_max, col, r, tex_uvs, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3711).
"""
_AddRectBaked(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    r,
    t,
    tex_uvs::Union{ImVec4,NTuple{4}},
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
) = ImDrawList__AddRectBaked(self, p_min, p_max, col, r, t, tex_uvs, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3712).
"""
_AddLine(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
) = ImDrawList__AddLine(self, p1, p2, col, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3713).
"""
_AddRectTinyRounding(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rounding,
    thickness,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
) = ImDrawList__AddRectTinyRounding(self, p_min, p_max, col, rounding, thickness, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3714).
"""
_SelectLineTexture(
    self::Ptr{ImDrawList},
    screen_thickness,
    out_uv0::VoidablePtrOrRef{ImVec2},
    out_uv1::VoidablePtrOrRef{ImVec2},
    out_fringe,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
) = ImDrawList__SelectLineTexture(self, screen_thickness, out_uv0, out_uv1, out_fringe, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3715).
"""
_CalculateCenterBiasedOffset(self::Ptr{ImDrawList}, thickness) =
    ImDrawList__CalculateCenterBiasedOffset(self, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3716).
"""
_AddPolyline(
    self::Ptr{ImDrawList},
    points::VoidablePtrOrRef{ImVec2},
    num_points,
    col::Union{ImU32,Integer},
    thickness,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
    max_inner_offset,
) = ImDrawList__AddPolyline(self, points, num_points, col, thickness, flags, max_inner_offset)

"""
$(TYPEDSIGNATURES)

Functions.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3740).
"""
lib.ImDrawData() = ImDrawData_ImDrawData()

"""
Destructor for `ImDrawData`
"""
Destroy(self::Ptr{ImDrawData}) = ImDrawData_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3741).
"""
Clear(self::Ptr{ImDrawData}) = ImDrawData_Clear(self)

"""
$(TYPEDSIGNATURES)

Helper to add an external draw list into an existing ImDrawData.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3742).
"""
AddDrawList(self::Ptr{ImDrawData}, draw_list::VoidablePtrOrRef{ImDrawList}) = ImDrawData_AddDrawList(self, draw_list)

"""
$(TYPEDSIGNATURES)

Helper to convert all buffers from indexed to non-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3743).
"""
DeIndexAllBuffers(self::Ptr{ImDrawData}) = ImDrawData_DeIndexAllBuffers(self)

"""
$(TYPEDSIGNATURES)

Helper to scale the ClipRect field of each ImDrawCmd. Use if your final output buffer is at a different scale than Dear ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3744).
"""
ScaleClipRects(self::Ptr{ImDrawData}, fb_scale::Union{ImVec2,NTuple{2}}) = ImDrawData_ScaleClipRects(self, fb_scale)

"""
$(TYPEDSIGNATURES)

Functions
- If GetPixels() functions asserts while being called by your render loop, it could be caused by calling ImFontAtlas::Clear()/ClearFonts()?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3814).
"""
lib.ImTextureData() = ImTextureData_ImTextureData()

"""
Destructor for `ImTextureData`
"""
Destroy(self::Ptr{ImTextureData}) = ImTextureData_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3816).
"""
Create(self::Ptr{ImTextureData}, format::ImTextureFormat, w, h) = ImTextureData_Create(self, format, w, h)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3817).
"""
DestroyPixels(self::Ptr{ImTextureData}) = ImTextureData_DestroyPixels(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3818).
"""
GetPixels(self::Ptr{ImTextureData}) = ImTextureData_GetPixels(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3819).
"""
GetPixelsAt(self::Ptr{ImTextureData}, x, y) = ImTextureData_GetPixelsAt(self, x, y)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3820).
"""
GetSizeInBytes(self::Ptr{ImTextureData}) = ImTextureData_GetSizeInBytes(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3821).
"""
GetPitch(self::Ptr{ImTextureData}) = ImTextureData_GetPitch(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3822).
"""
GetTexRef(self::Ptr{ImTextureData}) = ImTextureData_GetTexRef(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3823).
"""
GetTexID(self::Ptr{ImTextureData}) = ImTextureData_GetTexID(self)

"""
$(TYPEDSIGNATURES)

Called by Renderer backend
- Call SetTexID() and SetStatus() after honoring texture requests. Never modify TexID and Status directly!
- A backend may decide to destroy a texture that we did not request to destroy, which is fine (e.g. freeing resources), but we immediately set the texture back in _WantCreate mode.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3828).
"""
SetTexID(self::Ptr{ImTextureData}, tex_id::ImTextureID) = ImTextureData_SetTexID(self, tex_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3829).
"""
SetStatus(self::Ptr{ImTextureData}, status::ImTextureStatus) = ImTextureData_SetStatus(self, status)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3875).
"""
lib.ImFontConfig() = ImFontConfig_ImFontConfig()

"""
Destructor for `ImFontConfig`
"""
Destroy(self::Ptr{ImFontConfig}) = ImFontConfig_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3891).
"""
lib.ImFontGlyph() = ImFontGlyph_ImFontGlyph()

"""
Destructor for `ImFontGlyph`
"""
Destroy(self::Ptr{ImFontGlyph}) = ImFontGlyph_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3900).
"""
lib.ImFontGlyphRangesBuilder() = ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder()

"""
Destructor for `ImFontGlyphRangesBuilder`
"""
Destroy(self::Ptr{ImFontGlyphRangesBuilder}) = ImFontGlyphRangesBuilder_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3901).
"""
Clear(self::Ptr{ImFontGlyphRangesBuilder}) = ImFontGlyphRangesBuilder_Clear(self)

"""
$(TYPEDSIGNATURES)

Get bit n in the array.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3902).
"""
GetBit(self::Ptr{ImFontGlyphRangesBuilder}, n) = ImFontGlyphRangesBuilder_GetBit(self, n)

"""
$(TYPEDSIGNATURES)

Set bit n in the array.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3903).
"""
SetBit(self::Ptr{ImFontGlyphRangesBuilder}, n) = ImFontGlyphRangesBuilder_SetBit(self, n)

"""
$(TYPEDSIGNATURES)

Add character.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3904).
"""
AddChar(self::Ptr{ImFontGlyphRangesBuilder}, c::Union{ImWchar,Integer}) = ImFontGlyphRangesBuilder_AddChar(self, c)

"""
$(TYPEDSIGNATURES)

Add string (each character of the UTF-8 string are added).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3905).
"""
AddText(self::Ptr{ImFontGlyphRangesBuilder}, text, text_end = C_NULL) =
    ImFontGlyphRangesBuilder_AddText(self, text, text_end)

"""
$(TYPEDSIGNATURES)

Add ranges, e.g. builder.AddRanges(ImFontAtlas::GetGlyphRangesDefault()) to force add all of ASCII/Latin+Ext.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3906).
"""
AddRanges(self::Ptr{ImFontGlyphRangesBuilder}, ranges::VoidablePtrOrRef{ImWchar}) =
    ImFontGlyphRangesBuilder_AddRanges(self, ranges)

"""
$(TYPEDSIGNATURES)

Output new ranges.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3907).
"""
BuildRanges(self::Ptr{ImFontGlyphRangesBuilder}, out_ranges::VoidablePtrOrRef{ImVector_ImWchar}) =
    ImFontGlyphRangesBuilder_BuildRanges(self, out_ranges)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3924).
"""
lib.ImFontAtlasRect() = ImFontAtlasRect_ImFontAtlasRect()

"""
Destructor for `ImFontAtlasRect`
"""
Destroy(self::Ptr{ImFontAtlasRect}) = ImFontAtlasRect_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3958).
"""
lib.ImFontAtlas() = ImFontAtlas_ImFontAtlas()

"""
Destructor for `ImFontAtlas`
"""
Destroy(self::Ptr{ImFontAtlas}) = ImFontAtlas_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3960).
"""
AddFont(self::Ptr{ImFontAtlas}, font_cfg::VoidablePtrOrRef{ImFontConfig}) = ImFontAtlas_AddFont(self, font_cfg)

"""
$(TYPEDSIGNATURES)

Selects between AddFontDefaultVector() and AddFontDefaultBitmap().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3961).
"""
AddFontDefault(self::Ptr{ImFontAtlas}, font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL) =
    ImFontAtlas_AddFontDefault(self, font_cfg)

"""
$(TYPEDSIGNATURES)

Embedded scalable font. Recommended at any higher size.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3962).
"""
AddFontDefaultVector(self::Ptr{ImFontAtlas}, font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL) =
    ImFontAtlas_AddFontDefaultVector(self, font_cfg)

"""
$(TYPEDSIGNATURES)

Embedded classic pixel-clean font. Recommended at Size 13px with no scaling.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3963).
"""
AddFontDefaultBitmap(self::Ptr{ImFontAtlas}, font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL) =
    ImFontAtlas_AddFontDefaultBitmap(self, font_cfg)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3964).
"""
AddFontFromFileTTF(
    self::Ptr{ImFontAtlas},
    filename,
    size_pixels = 0.0f0,
    font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL,
    glyph_ranges::VoidablePtrOrRef{ImWchar} = C_NULL,
) = ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges)

"""
$(TYPEDSIGNATURES)

Note: Transfer ownership of 'ttf_data' to ImFontAtlas! Will be deleted after destruction of the atlas. Set font_cfg->FontDataOwnedByAtlas=false to keep ownership of your data and it won't be freed.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3965).
"""
AddFontFromMemoryTTF(
    self::Ptr{ImFontAtlas},
    font_data,
    font_data_size,
    size_pixels = 0.0f0,
    font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL,
    glyph_ranges::VoidablePtrOrRef{ImWchar} = C_NULL,
) = ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_data_size, size_pixels, font_cfg, glyph_ranges)

"""
$(TYPEDSIGNATURES)

'compressed_font_data' still owned by caller. Compress with binary_to_compressed_c.cpp.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3966).
"""
AddFontFromMemoryCompressedTTF(
    self::Ptr{ImFontAtlas},
    compressed_font_data,
    compressed_font_data_size,
    size_pixels = 0.0f0,
    font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL,
    glyph_ranges::VoidablePtrOrRef{ImWchar} = C_NULL,
) = ImFontAtlas_AddFontFromMemoryCompressedTTF(
    self,
    compressed_font_data,
    compressed_font_data_size,
    size_pixels,
    font_cfg,
    glyph_ranges,
)

"""
$(TYPEDSIGNATURES)

'compressed_font_data_base85' still owned by caller. Compress with binary_to_compressed_c.cpp with -base85 parameter.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3967).
"""
AddFontFromMemoryCompressedBase85TTF(
    self::Ptr{ImFontAtlas},
    compressed_font_data_base85,
    size_pixels = 0.0f0,
    font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL,
    glyph_ranges::VoidablePtrOrRef{ImWchar} = C_NULL,
) = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(
    self,
    compressed_font_data_base85,
    size_pixels,
    font_cfg,
    glyph_ranges,
)

"""
$(TYPEDSIGNATURES)

Remove a font.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3968).
"""
RemoveFont(self::Ptr{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) = ImFontAtlas_RemoveFont(self, font)

"""
$(TYPEDSIGNATURES)

Compact cached glyphs and texture.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3969).
"""
CompactCache(self::Ptr{ImFontAtlas}) = ImFontAtlas_CompactCache(self)

"""
$(TYPEDSIGNATURES)

Change font loader at runtime.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3970).
"""
SetFontLoader(self::Ptr{ImFontAtlas}, font_loader::VoidablePtrOrRef{ImFontLoader}) =
    ImFontAtlas_SetFontLoader(self, font_loader)

"""
$(TYPEDSIGNATURES)

Clearing the atlas/fonts has little use nowadays, unless you want to batch remove all fonts.
- Since 1.92, you can call ClearFonts() mid-frame, if you load new fonts afterwards.
- As we are transitioning toward our new font system the semantic for those functions gets increasingly misleading and are often a source of issues.
  TL;DR; most likely, don't use any of those functions. We expect to obsolete/rework them.// Clear everything (fonts + textures). Don't call mid-frame!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3976).
"""
Clear(self::Ptr{ImFontAtlas}) = ImFontAtlas_Clear(self)

"""
$(TYPEDSIGNATURES)

Clear input+output font data/glyphs. New fonts and textures will be recreated afterwards.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3977).
"""
ClearFonts(self::Ptr{ImFontAtlas}) = ImFontAtlas_ClearFonts(self)

"""
$(TYPEDSIGNATURES)

[OBSOLETE] Clear input data (all ImFontConfig structures including sizes, TTF data, glyph ranges, etc.) = all the data used to build the texture and fonts.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3978).
"""
ClearInputData(self::Ptr{ImFontAtlas}) = ImFontAtlas_ClearInputData(self)

"""
$(TYPEDSIGNATURES)

[OBSOLETE] Clear CPU-side copy of the texture data. Saves RAM once the texture has been copied to graphics memory.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L3979).
"""
ClearTexData(self::Ptr{ImFontAtlas}) = ImFontAtlas_ClearTexData(self)

"""
$(TYPEDSIGNATURES)

Since 1.92: specifying glyph ranges is only useful/necessary if your backend doesn't support ImGuiBackendFlags_RendererHasTextures!// Basic Latin, Extended Latin.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4003).
"""
GetGlyphRangesDefault(self::Ptr{ImFontAtlas}) = ImFontAtlas_GetGlyphRangesDefault(self)

"""
$(TYPEDSIGNATURES)

Register and retrieve custom rectangles
- You can request arbitrary rectangles to be packed into the atlas, for your own purpose.
- Since 1.92.0, packing is done immediately in the function call (previously packing was done during the Build call)
- You can render your pixels into the texture right after calling the AddCustomRect() functions.
- VERY IMPORTANT:
  - Texture may be created/resized at any time when calling ImGui or ImFontAtlas functions.
  - IT WILL INVALIDATE RECTANGLE DATA SUCH AS UV COORDINATES. Always use latest values from GetCustomRect().
  - UV coordinates are associated to the current texture identifier aka 'atlas->TexRef'. Both TexRef and UV coordinates are typically changed at the same time.
- If you render colored output into your custom rectangles: set 'atlas->TexPixelsUseColors = true' as this may help some backends decide of preferred texture format.
- Read docs/FONTS.md for more details about using colorful icons.
- Note: this API may be reworked further in order to facilitate supporting e.g. multi-monitor, varying DPI settings.
- (Pre-1.92 names) ------------> (1.92 names)
  - GetCustomRectByIndex()   --> Use GetCustomRect()
  - CalcCustomRectUV()       --> Use GetCustomRect() and read uv0, uv1 fields.
  - AddCustomRectRegular()   --> Renamed to AddCustomRect()
  - AddCustomRectFontGlyph() --> Prefer using custom ImFontLoader inside ImFontConfig
  - ImFontAtlasCustomRect    --> Renamed to ImFontAtlasRect// Register a rectangle. Return -1 (ImFontAtlasRectId_Invalid) on error.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4040).
"""
AddCustomRect(self::Ptr{ImFontAtlas}, width, height, out_r::VoidablePtrOrRef{ImFontAtlasRect} = C_NULL) =
    ImFontAtlas_AddCustomRect(self, width, height, out_r)

"""
$(TYPEDSIGNATURES)

Unregister a rectangle. Existing pixels will stay in texture until resized / garbage collected.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4041).
"""
RemoveCustomRect(self::Ptr{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) = ImFontAtlas_RemoveCustomRect(self, id)

"""
$(TYPEDSIGNATURES)

Get rectangle coordinates for current texture. Valid immediately, never store this (read above)!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4042).
"""
GetCustomRect(self::Ptr{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}, out_r::VoidablePtrOrRef{ImFontAtlasRect}) =
    ImFontAtlas_GetCustomRect(self, id, out_r)

"""
$(TYPEDSIGNATURES)

Functions.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4133).
"""
lib.ImFontBaked() = ImFontBaked_ImFontBaked()

"""
Destructor for `ImFontBaked`
"""
Destroy(self::Ptr{ImFontBaked}) = ImFontBaked_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4134).
"""
ClearOutputData(self::Ptr{ImFontBaked}) = ImFontBaked_ClearOutputData(self)

"""
$(TYPEDSIGNATURES)

Return U+FFFD glyph if requested glyph doesn't exists.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4135).
"""
FindGlyph(self::Ptr{ImFontBaked}, c::Union{ImWchar,Integer}) = ImFontBaked_FindGlyph(self, c)

"""
$(TYPEDSIGNATURES)

Return NULL if glyph doesn't exist.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4136).
"""
FindGlyphNoFallback(self::Ptr{ImFontBaked}, c::Union{ImWchar,Integer}) = ImFontBaked_FindGlyphNoFallback(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4137).
"""
GetCharAdvance(self::Ptr{ImFontBaked}, c::Union{ImWchar,Integer}) = ImFontBaked_GetCharAdvance(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4138).
"""
IsGlyphLoaded(self::Ptr{ImFontBaked}, c::Union{ImWchar,Integer}) = ImFontBaked_IsGlyphLoaded(self, c)

"""
$(TYPEDSIGNATURES)

Methods.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4180).
"""
lib.ImFont() = ImFont_ImFont()

"""
Destructor for `ImFont`
"""
Destroy(self::Ptr{ImFont}) = ImFont_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4182).
"""
IsGlyphInFont(self::Ptr{ImFont}, c::Union{ImWchar,Integer}) = ImFont_IsGlyphInFont(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4183).
"""
IsLoaded(self::Ptr{ImFont}) = ImFont_IsLoaded(self)

"""
$(TYPEDSIGNATURES)

Fill ImFontConfig::Name.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4184).
"""
GetDebugName(self::Ptr{ImFont}) = ImFont_GetDebugName(self)

"""
$(TYPEDSIGNATURES)

[Internal] Don't use!
'max_width' stops rendering after a certain width (could be turned into a 2d size). FLT_MAX to disable.
'wrap_width' enable automatic word-wrapping across multiple lines to fit into given width. 0.0f to disable.// Get or create baked data for given size.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4189).
"""
GetFontBaked(self::Ptr{ImFont}, font_size, density = -1.0f0) = ImFont_GetFontBaked(self, font_size, density)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4190).
"""
CalcTextSizeA(self::Ptr{ImFont}, size, max_width, wrap_width, text_begin, text_end = C_NULL, out_remaining = C_NULL) =
    ImFont_CalcTextSizeA(self, size, max_width, wrap_width, text_begin, text_end, out_remaining)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4191).
"""
CalcWordWrapPosition(self::Ptr{ImFont}, size, text, text_end, wrap_width) =
    ImFont_CalcWordWrapPosition(self, size, text, text_end, wrap_width)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4192).
"""
RenderChar(
    self::Ptr{ImFont},
    draw_list::VoidablePtrOrRef{ImDrawList},
    size,
    pos::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    c::Union{ImWchar,Integer},
    cpu_fine_clip::VoidablePtrOrRef{ImVec4} = C_NULL,
) = ImFont_RenderChar(self, draw_list, size, pos, col, c, cpu_fine_clip)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4193).
"""
RenderText(
    self::Ptr{ImFont},
    draw_list::VoidablePtrOrRef{ImDrawList},
    size,
    pos::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    clip_rect::Union{ImVec4,NTuple{4}},
    text_begin,
    text_end,
    wrap_width = 0.0f0,
    flags::Union{ImDrawTextFlags,ImDrawTextFlags_,Integer} = 0,
) = ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text_begin, text_end, wrap_width, flags)

"""
$(TYPEDSIGNATURES)

[Internal] Don't use!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4199).
"""
ClearOutputData(self::Ptr{ImFont}) = ImFont_ClearOutputData(self)

"""
$(TYPEDSIGNATURES)

Makes 'from_codepoint' character points to 'to_codepoint' glyph.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4200).
"""
AddRemapCodepoint(self::Ptr{ImFont}, from_codepoint::Union{ImWchar,Integer}, to_codepoint::Union{ImWchar,Integer}) =
    ImFont_AddRemapCodepoint(self, from_codepoint, to_codepoint)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4201).
"""
AddRemapCodepointToGlyphIndex(self::Ptr{ImFont}, from_codepoint::Union{ImWchar,Integer}, font_src_idx, glyph_idx) =
    ImFont_AddRemapCodepointToGlyphIndex(self, from_codepoint, font_src_idx, glyph_idx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4202).
"""
IsGlyphRangeUnused(self::Ptr{ImFont}, c_begin, c_last) = ImFont_IsGlyphRangeUnused(self, c_begin, c_last)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4288).
"""
lib.ImGuiViewport() = ImGuiViewport_ImGuiViewport()

"""
Destructor for `ImGuiViewport`
"""
Destroy(self::Ptr{ImGuiViewport}) = ImGuiViewport_destroy(self)

"""
$(TYPEDSIGNATURES)

Helpers.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4292).
"""
GetCenter(self::Ptr{ImGuiViewport}) = ImGuiViewport_GetCenter(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4293).
"""
GetWorkCenter(self::Ptr{ImGuiViewport}) = ImGuiViewport_GetWorkCenter(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4294).
"""
GetDebugName(self::Ptr{ImGuiViewport}) = ImGuiViewport_GetDebugName(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4350).
"""
lib.ImGuiPlatformIO() = ImGuiPlatformIO_ImGuiPlatformIO()

"""
Destructor for `ImGuiPlatformIO`
"""
Destroy(self::Ptr{ImGuiPlatformIO}) = ImGuiPlatformIO_destroy(self)

"""
$(TYPEDSIGNATURES)

Clear all Platform_XXX fields. Typically called on Platform Backend shutdown.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4465).
"""
ClearPlatformHandlers(self::Ptr{ImGuiPlatformIO}) = ImGuiPlatformIO_ClearPlatformHandlers(self)

"""
$(TYPEDSIGNATURES)

Clear all Renderer_XXX fields. Typically called on Renderer Backend shutdown.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4466).
"""
ClearRendererHandlers(self::Ptr{ImGuiPlatformIO}) = ImGuiPlatformIO_ClearRendererHandlers(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4477).
"""
lib.ImGuiPlatformMonitor() = ImGuiPlatformMonitor_ImGuiPlatformMonitor()

"""
Destructor for `ImGuiPlatformMonitor`
"""
Destroy(self::Ptr{ImGuiPlatformMonitor}) = ImGuiPlatformMonitor_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L4489).
"""
lib.ImGuiPlatformImeData() = ImGuiPlatformImeData_ImGuiPlatformImeData()

"""
Destructor for `ImGuiPlatformImeData`
"""
Destroy(self::Ptr{ImGuiPlatformImeData}) = ImGuiPlatformImeData_destroy(self)

"""
$(TYPEDSIGNATURES)

Helpers: Hashing.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L387).
"""
ImHashData(data, data_size, seed::Union{ImGuiID,Integer} = 0) = igImHashData(data, data_size, seed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L388).
"""
ImHashStr(data, data_size = 0, seed::Union{ImGuiID,Integer} = 0) = igImHashStr(data, data_size, seed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L389).
"""
ImHashSkipUncontributingPrefix(label) = igImHashSkipUncontributingPrefix(label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L393).
"""
ImQsort(base, count, size_of_element, compare_func) = igImQsort(base, count, size_of_element, compare_func)

"""
$(TYPEDSIGNATURES)

Helpers: Color Blending.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L397).
"""
ImAlphaBlendColors(col_a::Union{ImU32,Integer}, col_b::Union{ImU32,Integer}) = igImAlphaBlendColors(col_a, col_b)

"""
$(TYPEDSIGNATURES)

Helpers: Bit manipulation.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L400).
"""
ImIsPowerOfTwo(v::Integer) = igImIsPowerOfTwo_Int(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L401).
"""
ImIsPowerOfTwo(v::ImU64) = igImIsPowerOfTwo_U64(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L402).
"""
ImUpperPowerOfTwo(v) = igImUpperPowerOfTwo(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L403).
"""
ImCountSetBits(v) = igImCountSetBits(v)

"""
$(TYPEDSIGNATURES)

Helpers: String// Case insensitive compare.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L408).
"""
ImStricmp(str1, str2) = igImStricmp(str1, str2)

"""
$(TYPEDSIGNATURES)

Case insensitive compare to a certain count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L409).
"""
ImStrnicmp(str1, str2, count) = igImStrnicmp(str1, str2, count)

"""
$(TYPEDSIGNATURES)

Copy to a certain count and always zero terminate (strncpy doesn't).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L410).
"""
ImStrncpy(dst, src, count) = igImStrncpy(dst, src, count)

"""
$(TYPEDSIGNATURES)

Duplicate a string.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L411).
"""
ImStrdup(str) = igImStrdup(str)

"""
$(TYPEDSIGNATURES)

Duplicate a chunk of memory.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L412).
"""
ImMemdup(src, size) = igImMemdup(src, size)

"""
$(TYPEDSIGNATURES)

Copy in provided buffer, recreate buffer if needed.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L413).
"""
ImStrdupcpy(dst, p_dst_size, str) = igImStrdupcpy(dst, p_dst_size, str)

"""
$(TYPEDSIGNATURES)

Find first occurrence of 'c' in string range.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L414).
"""
ImStrchrRange(str_begin, str_end, c) = igImStrchrRange(str_begin, str_end, c)

"""
$(TYPEDSIGNATURES)

End end-of-line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L415).
"""
ImStreolRange(str, str_end) = igImStreolRange(str, str_end)

"""
$(TYPEDSIGNATURES)

Find a substring in a string range.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L416).
"""
ImStristr(haystack, haystack_end, needle, needle_end) = igImStristr(haystack, haystack_end, needle, needle_end)

"""
$(TYPEDSIGNATURES)

Remove leading and trailing blanks from a buffer.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L417).
"""
ImStrTrimBlanks(str) = igImStrTrimBlanks(str)

"""
$(TYPEDSIGNATURES)

Find first non-blank character.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L418).
"""
ImStrSkipBlank(str) = igImStrSkipBlank(str)

"""
$(TYPEDSIGNATURES)

Computer string length (ImWchar string).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L419).
"""
ImStrlenW(str::VoidablePtrOrRef{ImWchar}) = igImStrlenW(str)

"""
$(TYPEDSIGNATURES)

Find beginning-of-line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L420).
"""
ImStrbol(buf_mid_line, buf_begin) = igImStrbol(buf_mid_line, buf_begin)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L422).
"""
ImToUpper(c) = igImToUpper(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L423).
"""
ImCharIsBlankA(c) = igImCharIsBlankA(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L424).
"""
ImCharIsBlankW(c) = igImCharIsBlankW(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L425).
"""
ImCharIsXdigitA(c) = igImCharIsXdigitA(c)

"""
$(TYPEDSIGNATURES)

Helpers: Formatting.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L429).
"""
ImFormatString(buf, buf_size, fmt) = igImFormatString(buf, buf_size, fmt)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L431).
"""
ImFormatStringToTempBuffer(out_buf, out_buf_end, fmt) = igImFormatStringToTempBuffer(out_buf, out_buf_end, fmt)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L433).
"""
ImParseFormatFindStart(format) = igImParseFormatFindStart(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L434).
"""
ImParseFormatFindEnd(format) = igImParseFormatFindEnd(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L435).
"""
ImParseFormatTrimDecorations(format, buf, buf_size) = igImParseFormatTrimDecorations(format, buf, buf_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L436).
"""
ImParseFormatSanitizeForPrinting(fmt_in, fmt_out, fmt_out_size) =
    igImParseFormatSanitizeForPrinting(fmt_in, fmt_out, fmt_out_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L437).
"""
ImParseFormatSanitizeForScanning(fmt_in, fmt_out, fmt_out_size) =
    igImParseFormatSanitizeForScanning(fmt_in, fmt_out, fmt_out_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L438).
"""
ImParseFormatPrecision(format, default_value) = igImParseFormatPrecision(format, default_value)

"""
$(TYPEDSIGNATURES)

Helpers: UTF-8 <> wchar conversions// return output UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L441).
"""
ImTextCharToUtf8(out_buf, c) = igImTextCharToUtf8(out_buf, c)

"""
$(TYPEDSIGNATURES)

Return output UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L442).
"""
ImTextStrToUtf8(out_buf, out_buf_size, in_text::VoidablePtrOrRef{ImWchar}, in_text_end::VoidablePtrOrRef{ImWchar}) =
    igImTextStrToUtf8(out_buf, out_buf_size, in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Read one character. return input UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L443).
"""
ImTextCharFromUtf8(out_char, in_text, in_text_end) = igImTextCharFromUtf8(out_char, in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return input UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L444).
"""
ImTextStrFromUtf8(out_buf::VoidablePtrOrRef{ImWchar}, out_buf_size, in_text, in_text_end, in_remaining = C_NULL) =
    igImTextStrFromUtf8(out_buf, out_buf_size, in_text, in_text_end, in_remaining)

"""
$(TYPEDSIGNATURES)

Return number of UTF-8 code-points (NOT bytes count).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L445).
"""
ImTextCountCharsFromUtf8(in_text, in_text_end) = igImTextCountCharsFromUtf8(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return number of bytes to express one char in UTF-8.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L446).
"""
ImTextCountUtf8BytesFromChar(in_text, in_text_end) = igImTextCountUtf8BytesFromChar(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return number of bytes to express string in UTF-8.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L447).
"""
ImTextCountUtf8BytesFromStr(in_text::VoidablePtrOrRef{ImWchar}, in_text_end::VoidablePtrOrRef{ImWchar}) =
    igImTextCountUtf8BytesFromStr(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return previous UTF-8 code-point.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L448).
"""
ImTextFindPreviousUtf8Codepoint(in_text_start, in_p) = igImTextFindPreviousUtf8Codepoint(in_text_start, in_p)

"""
$(TYPEDSIGNATURES)

Return previous UTF-8 code-point if 'in_p' is not the end of a valid one.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L449).
"""
ImTextFindValidUtf8CodepointEnd(in_text_start, in_text_end, in_p) =
    igImTextFindValidUtf8CodepointEnd(in_text_start, in_text_end, in_p)

"""
$(TYPEDSIGNATURES)

Return number of lines taken by text. trailing carriage return doesn't count as an extra line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L450).
"""
ImTextCountLines(in_text, in_text_end) = igImTextCountLines(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L460).
"""
ImFontCalcTextSizeEx(
    font::VoidablePtrOrRef{ImFont},
    size,
    max_width,
    wrap_width,
    text_begin,
    text_end_display,
    text_end,
    out_remaining,
    out_offset::VoidablePtrOrRef{ImVec2},
    flags::Union{ImDrawTextFlags,ImDrawTextFlags_,Integer},
) = igImFontCalcTextSizeEx(
    font,
    size,
    max_width,
    wrap_width,
    text_begin,
    text_end_display,
    text_end,
    out_remaining,
    out_offset,
    flags,
)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L461).
"""
ImFontCalcWordWrapPositionEx(
    font::VoidablePtrOrRef{ImFont},
    size,
    text,
    text_end,
    wrap_width,
    flags::Union{ImDrawTextFlags,ImDrawTextFlags_,Integer} = 0,
) = igImFontCalcWordWrapPositionEx(font, size, text, text_end, wrap_width, flags)

"""
$(TYPEDSIGNATURES)

Trim trailing space and find beginning of next line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L462).
"""
ImTextCalcWordWrapNextLineStart(text, text_end, flags::Union{ImDrawTextFlags,ImDrawTextFlags_,Integer} = 0) =
    igImTextCalcWordWrapNextLineStart(text, text_end, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L469).
"""
ImTextInitClassifiers() = igImTextInitClassifiers()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L470).
"""
ImTextClassifierClear(bits::VoidablePtrOrRef{ImU32}, codepoint_min, codepoint_end, char_class::ImWcharClass) =
    igImTextClassifierClear(bits, codepoint_min, codepoint_end, char_class)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L471).
"""
ImTextClassifierSetCharClass(bits::VoidablePtrOrRef{ImU32}, codepoint_min, codepoint_end, char_class::ImWcharClass, c) =
    igImTextClassifierSetCharClass(bits, codepoint_min, codepoint_end, char_class, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L472).
"""
ImTextClassifierSetCharClassFromStr(
    bits::VoidablePtrOrRef{ImU32},
    codepoint_min,
    codepoint_end,
    char_class::ImWcharClass,
    s,
) = igImTextClassifierSetCharClassFromStr(bits, codepoint_min, codepoint_end, char_class, s)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L486).
"""
ImFileOpen(filename, mode) = igImFileOpen(filename, mode)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L487).
"""
ImFileClose(file::ImFileHandle) = igImFileClose(file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L488).
"""
ImFileGetSize(file::ImFileHandle) = igImFileGetSize(file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L489).
"""
ImFileRead(data, size::ImU64, count::ImU64, file::ImFileHandle) = igImFileRead(data, size, count, file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L490).
"""
ImFileWrite(data, size::ImU64, count::ImU64, file::ImFileHandle) = igImFileWrite(data, size, count, file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L494).
"""
ImFileLoadToMemory(filename, mode, out_file_size = C_NULL, padding_bytes = 0) =
    igImFileLoadToMemory(filename, mode, out_file_size, padding_bytes)

"""
$(TYPEDSIGNATURES)

DragBehaviorT/SliderBehaviorT uses ImPow with either float/double and need the precision.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L509).
"""
ImPow(x::Float32, y::Float32) = igImPow_Float(x, y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L510).
"""
ImPow(x::Float64, y::Float64) = igImPow_double(x, y)

"""
$(TYPEDSIGNATURES)

DragBehaviorT/SliderBehaviorT uses ImLog with either float/double and need the precision.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L511).
"""
ImLog(x::Float32) = igImLog_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L512).
"""
ImLog(x::Float64) = igImLog_double(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L513).
"""
ImAbs(x::Integer) = igImAbs_Int(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L514).
"""
ImAbs(x::Float32) = igImAbs_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L515).
"""
ImAbs(x::Float64) = igImAbs_double(x)

"""
$(TYPEDSIGNATURES)

Sign operator - returns -1, 0 or 1 based on sign of argument.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L516).
"""
ImSign(x::Float32) = igImSign_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L517).
"""
ImSign(x::Float64) = igImSign_double(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L519).
"""
ImRsqrt(x::Float32) = igImRsqrt_Float(x)

"""
$(TYPEDSIGNATURES)


Converge to more precise solution using single step of Newton-Raphson method, repeating increases precision.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L521).
"""
ImRsqrtPrecise(x) = igImRsqrtPrecise(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L526).
"""
ImRsqrt(x::Float64) = igImRsqrt_double(x)

"""
$(TYPEDSIGNATURES)

- ImMin/ImMax/ImClamp/ImLerp/ImSwap are used by widgets which support variety of types: signed/unsigned int/long long float/double
(Specialized version ensure that runtime-check pragmas/macros are applied with caller settings. Template version are less reliable in this regards).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L531).
"""
ImMin(lhs::Integer, rhs::Integer) = igImMin_Int(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L532).
"""
ImMax(lhs::Integer, rhs::Integer) = igImMax_Int(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L533).
"""
ImClamp(v::Integer, mn::Integer, mx::Integer) = igImClamp_Int(v, mn, mx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L534).
"""
ImMin(lhs::Real, rhs::Real) = igImMin_Float(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L535).
"""
ImMax(lhs::Real, rhs::Real) = igImMax_Float(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L536).
"""
ImClamp(v::Real, mn::Real, mx::Real) = igImClamp_Float(v, mn, mx)

"""
$(TYPEDSIGNATURES)


- Misc maths helpers.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L546).
"""
ImMin(lhs::Union{ImVec2,NTuple{2}}, rhs::Union{ImVec2,NTuple{2}}) = igImMin_Vec2(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L547).
"""
ImMax(lhs::Union{ImVec2,NTuple{2}}, rhs::Union{ImVec2,NTuple{2}}) = igImMax_Vec2(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L548).
"""
ImClamp(v::Union{ImVec2,NTuple{2}}, mn::Union{ImVec2,NTuple{2}}, mx::Union{ImVec2,NTuple{2}}) =
    igImClamp_Vec2(v, mn, mx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L549).
"""
ImLerp(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, t::Float32) = igImLerp_Vec2Float(a, b, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L550).
"""
ImLerp(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, t::Union{ImVec2,NTuple{2}}) = igImLerp_Vec2Vec2(a, b, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L551).
"""
ImLerp(a::Union{ImVec4,NTuple{4}}, b::Union{ImVec4,NTuple{4}}, t::Float32) = igImLerp_Vec4(a, b, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L552).
"""
ImSaturate(f) = igImSaturate(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L553).
"""
ImLengthSqr(lhs::Union{ImVec2,NTuple{2}}) = igImLengthSqr_Vec2(lhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L554).
"""
ImLengthSqr(lhs::Union{ImVec4,NTuple{4}}) = igImLengthSqr_Vec4(lhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L555).
"""
ImInvLength(lhs::Union{ImVec2,NTuple{2}}, fail_value) = igImInvLength(lhs, fail_value)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L556).
"""
ImTrunc(f::Real) = igImTrunc_Float(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L557).
"""
ImTrunc(v::Union{ImVec2,NTuple{2}}) = igImTrunc_Vec2(v)

"""
$(TYPEDSIGNATURES)

Decent replacement for floorf().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L558).
"""
ImFloor(f::Real) = igImFloor_Float(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L559).
"""
ImFloor(v::Union{ImVec2,NTuple{2}}) = igImFloor_Vec2(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L560).
"""
ImTrunc64(f) = igImTrunc64(f)

"""
$(TYPEDSIGNATURES)

Positive values only.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L561).
"""
ImRoundPositive64(f) = igImRoundPositive64(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L562).
"""
ImRoundSigned64(f) = igImRoundSigned64(f)

"""
$(TYPEDSIGNATURES)

Consider using the bit-hack version (search for "0x1p120f").

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L563).
"""
ImCeilFast(f) = igImCeilFast(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L564).
"""
ImModPositive(a, b) = igImModPositive(a, b)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L565).
"""
ImDot(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}) = igImDot(a, b)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L566).
"""
ImRotate(v::Union{ImVec2,NTuple{2}}, cos_a, sin_a) = igImRotate(v, cos_a, sin_a)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L567).
"""
ImLinearSweep(current, target, speed) = igImLinearSweep(current, target, speed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L568).
"""
ImLinearRemapClamp(s0, s1, d0, d1, x) = igImLinearRemapClamp(s0, s1, d0, d1, x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L569).
"""
ImMul(lhs::Union{ImVec2,NTuple{2}}, rhs::Union{ImVec2,NTuple{2}}) = igImMul(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L570).
"""
ImIsFloatAboveGuaranteedIntegerPrecision(f) = igImIsFloatAboveGuaranteedIntegerPrecision(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L571).
"""
ImExponentialMovingAverage(avg, sample, n) = igImExponentialMovingAverage(avg, sample, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L573).
"""
ImIsTruncated(x) = igImIsTruncated(x)

"""
$(TYPEDSIGNATURES)

Returns true if all parameters are whole numbers.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L576).
"""
ImIsTruncated4(x, y, z, w) = igImIsTruncated4(x, y, z, w)

"""
$(TYPEDSIGNATURES)

Helpers: Geometry.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L592).
"""
ImBezierCubicCalc(
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    t,
) = igImBezierCubicCalc(p1, p2, p3, p4, t)

"""
$(TYPEDSIGNATURES)

For curves with explicit number of segments.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L593).
"""
ImBezierCubicClosestPoint(
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    p::Union{ImVec2,NTuple{2}},
    num_segments,
) = igImBezierCubicClosestPoint(p1, p2, p3, p4, p, num_segments)

"""
$(TYPEDSIGNATURES)

For auto-tessellated curves you can use max_error = style.CurveTessellationMaxError.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L594).
"""
ImBezierCubicClosestPointCasteljau(
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    p::Union{ImVec2,NTuple{2}},
    max_error,
) = igImBezierCubicClosestPointCasteljau(p1, p2, p3, p4, p, max_error)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L595).
"""
ImBezierQuadraticCalc(p1::Union{ImVec2,NTuple{2}}, p2::Union{ImVec2,NTuple{2}}, p3::Union{ImVec2,NTuple{2}}, t) =
    igImBezierQuadraticCalc(p1, p2, p3, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L596).
"""
ImLineClosestPoint(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, p::Union{ImVec2,NTuple{2}}) =
    igImLineClosestPoint(a, b, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L597).
"""
ImTriangleContainsPoint(
    a::Union{ImVec2,NTuple{2}},
    b::Union{ImVec2,NTuple{2}},
    c::Union{ImVec2,NTuple{2}},
    p::Union{ImVec2,NTuple{2}},
) = igImTriangleContainsPoint(a, b, c, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L598).
"""
ImTriangleClosestPoint(
    a::Union{ImVec2,NTuple{2}},
    b::Union{ImVec2,NTuple{2}},
    c::Union{ImVec2,NTuple{2}},
    p::Union{ImVec2,NTuple{2}},
) = igImTriangleClosestPoint(a, b, c, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L599).
"""
ImTriangleBarycentricCoords(
    a::Union{ImVec2,NTuple{2}},
    b::Union{ImVec2,NTuple{2}},
    c::Union{ImVec2,NTuple{2}},
    p::Union{ImVec2,NTuple{2}},
    out_u,
    out_v,
    out_w,
) = igImTriangleBarycentricCoords(a, b, c, p, out_u, out_v, out_w)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L600).
"""
ImTriangleArea(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, c::Union{ImVec2,NTuple{2}}) =
    igImTriangleArea(a, b, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L601).
"""
ImTriangleIsClockwise(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, c::Union{ImVec2,NTuple{2}}) =
    igImTriangleIsClockwise(a, b, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L609).
"""
lib.ImVec1() = ImVec1_ImVec1_Nil()

"""
Destructor for `ImVec1`
"""
Destroy(self::Ptr{ImVec1}) = ImVec1_destroy(self)

"""
Destructor for `ImVec2i`
"""
Destroy(self::Ptr{ImVec2i}) = ImVec2i_destroy(self)

"""
Destructor for `ImVec2ih`
"""
Destroy(self::Ptr{ImVec2ih}) = ImVec2ih_destroy(self)

"""
Destructor for `ImRect`
"""
Destroy(self::Ptr{ImRect}) = ImRect_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L642).
"""
GetCenter(self::Ptr{ImRect}) = ImRect_GetCenter(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L643).
"""
GetSize(self::Ptr{ImRect}) = ImRect_GetSize(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L644).
"""
GetWidth(self::Ptr{ImRect}) = ImRect_GetWidth(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L645).
"""
GetHeight(self::Ptr{ImRect}) = ImRect_GetHeight(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L646).
"""
GetArea(self::Ptr{ImRect}) = ImRect_GetArea(self)

"""
$(TYPEDSIGNATURES)

Top-left.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L647).
"""
GetTL(self::Ptr{ImRect}) = ImRect_GetTL(self)

"""
$(TYPEDSIGNATURES)

Top-right.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L648).
"""
GetTR(self::Ptr{ImRect}) = ImRect_GetTR(self)

"""
$(TYPEDSIGNATURES)

Bottom-left.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L649).
"""
GetBL(self::Ptr{ImRect}) = ImRect_GetBL(self)

"""
$(TYPEDSIGNATURES)

Bottom-right.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L650).
"""
GetBR(self::Ptr{ImRect}) = ImRect_GetBR(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L653).
"""
ContainsWithPad(self::Ptr{ImRect}, p::Union{ImVec2,NTuple{2}}, pad::Union{ImVec2,NTuple{2}}) =
    ImRect_ContainsWithPad(self, p, pad)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L654).
"""
Overlaps(self::Ptr{ImRect}, r::ImRect) = ImRect_Overlaps(self, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L657).
"""
AddX(self::Ptr{ImRect}, x) = ImRect_AddX(self, x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L658).
"""
AddY(self::Ptr{ImRect}, y) = ImRect_AddY(self, y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L661).
"""
Translate(self::Ptr{ImRect}, d::Union{ImVec2,NTuple{2}}) = ImRect_Translate(self, d)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L662).
"""
TranslateX(self::Ptr{ImRect}, dx) = ImRect_TranslateX(self, dx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L663).
"""
TranslateY(self::Ptr{ImRect}, dy) = ImRect_TranslateY(self, dy)

"""
$(TYPEDSIGNATURES)

Simple version, may lead to an inverted rectangle, which is fine for Contains/Overlaps test but not for display.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L664).
"""
ClipWith(self::Ptr{ImRect}, r::ImRect) = ImRect_ClipWith(self, r)

"""
$(TYPEDSIGNATURES)

Full version, ensure both points are fully clipped.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L665).
"""
ClipWithFull(self::Ptr{ImRect}, r::ImRect) = ImRect_ClipWithFull(self, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L666).
"""
IsInverted(self::Ptr{ImRect}) = ImRect_IsInverted(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L667).
"""
ToVec4(self::Ptr{ImRect}) = ImRect_ToVec4(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L668).
"""
AsVec4(self::Ptr{ImRect}) = ImRect_AsVec4(self)

"""
$(TYPEDSIGNATURES)

Helper: ImBitArray.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L674).
"""
ImBitArrayGetStorageSizeInBytes(bitcount) = igImBitArrayGetStorageSizeInBytes(bitcount)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L675).
"""
ImBitArrayClearAllBits(arr::VoidablePtrOrRef{ImU32}, bitcount) = igImBitArrayClearAllBits(arr, bitcount)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L676).
"""
ImBitArrayTestBit(arr::VoidablePtrOrRef{ImU32}, n) = igImBitArrayTestBit(arr, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L677).
"""
ImBitArrayClearBit(arr::VoidablePtrOrRef{ImU32}, n) = igImBitArrayClearBit(arr, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L678).
"""
ImBitArraySetBit(arr::VoidablePtrOrRef{ImU32}, n) = igImBitArraySetBit(arr, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L679).
"""
ImBitArraySetBitRange(arr::VoidablePtrOrRef{ImU32}, n, n2) = igImBitArraySetBitRange(arr, n, n2)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L715).
"""
Create(self::Ptr{ImBitVector}, sz) = ImBitVector_Create(self, sz)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L716).
"""
Clear(self::Ptr{ImBitVector}) = ImBitVector_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L717).
"""
TestBit(self::Ptr{ImBitVector}, n) = ImBitVector_TestBit(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L718).
"""
SetBit(self::Ptr{ImBitVector}, n) = ImBitVector_SetBit(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L719).
"""
ClearBit(self::Ptr{ImBitVector}, n) = ImBitVector_ClearBit(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L872).
"""
Clear(self::Ptr{ImGuiTextIndex}) = ImGuiTextIndex_clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L873).
"""
Size(self::Ptr{ImGuiTextIndex}) = ImGuiTextIndex_size(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L874).
"""
Get_line_begin(self::Ptr{ImGuiTextIndex}, base, n) = ImGuiTextIndex_get_line_begin(self, base, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L875).
"""
Get_line_end(self::Ptr{ImGuiTextIndex}, base, n) = ImGuiTextIndex_get_line_end(self, base, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L876).
"""
Append(self::Ptr{ImGuiTextIndex}, base, old_size, new_size) = ImGuiTextIndex_append(self, base, old_size, new_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L886).
"""
lib.ImGuiTextFilterItem(b, e) = ImGuiTextFilterItem_ImGuiTextFilterItem(b, e)

"""
Destructor for `ImGuiTextFilterItem`
"""
Destroy(self::Ptr{ImGuiTextFilterItem}) = ImGuiTextFilterItem_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L898).
"""
lib.ImGuiPackedDate() = ImGuiPackedDate_ImGuiPackedDate_Nil()

"""
Destructor for `ImGuiPackedDate`
"""
Destroy(self::Ptr{ImGuiPackedDate}) = ImGuiPackedDate_destroy(self)

"""
$(TYPEDSIGNATURES)

Pack.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L899).
"""
lib.ImGuiPackedDate(yyyymmdd::Integer) = ImGuiPackedDate_ImGuiPackedDate_Int(yyyymmdd)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L900).
"""
IsValid(self::Ptr{ImGuiPackedDate}) = ImGuiPackedDate_IsValid(self)

"""
$(TYPEDSIGNATURES)

Unpack.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L901).
"""
Unpack(self::Ptr{ImGuiPackedDate}) = ImGuiPackedDate_Unpack(self)

"""
$(TYPEDSIGNATURES)

FIXME-OPT: Stupid but enough for what we do with it.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L902).
"""
SubtractMonths(self::Ptr{ImGuiPackedDate}, m) = ImGuiPackedDate_SubtractMonths(self, m)

"""
$(TYPEDSIGNATURES)

Helper: ImGuiStorage.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L906).
"""
ImLowerBound(
    in_begin::VoidablePtrOrRef{ImGuiStoragePair},
    in_end::VoidablePtrOrRef{ImGuiStoragePair},
    key::Union{ImGuiID,Integer},
) = igImLowerBound(in_begin, in_end, key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L980).
"""
lib.ImDrawListSharedData() = ImDrawListSharedData_ImDrawListSharedData()

"""
Destructor for `ImDrawListSharedData`
"""
Destroy(self::Ptr{ImDrawListSharedData}) = ImDrawListSharedData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L982).
"""
SetCircleTessellationMaxError(self::Ptr{ImDrawListSharedData}, max_error) =
    ImDrawListSharedData_SetCircleTessellationMaxError(self, max_error)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L990).
"""
lib.ImDrawDataBuilder() = ImDrawDataBuilder_ImDrawDataBuilder()

"""
Destructor for `ImDrawDataBuilder`
"""
Destroy(self::Ptr{ImDrawDataBuilder}) = ImDrawDataBuilder_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1011).
"""
GetVarPtr(self::Ptr{ImGuiStyleVarInfo}, parent) = ImGuiStyleVarInfo_GetVarPtr(self, parent)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1026).
"""
lib.ImGuiStyleMod(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, v::Integer) =
    ImGuiStyleMod_ImGuiStyleMod_Int(idx, v)

"""
Destructor for `ImGuiStyleMod`
"""
Destroy(self::Ptr{ImGuiStyleMod}) = ImGuiStyleMod_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1027).
"""
lib.ImGuiStyleMod(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, v::Real) = ImGuiStyleMod_ImGuiStyleMod_Float(idx, v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1028).
"""
lib.ImGuiStyleMod(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, v::Union{ImVec2,NTuple{2}}) =
    ImGuiStyleMod_ImGuiStyleMod_Vec2(idx, v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1267).
"""
lib.ImGuiComboPreviewData() = ImGuiComboPreviewData_ImGuiComboPreviewData()

"""
Destructor for `ImGuiComboPreviewData`
"""
Destroy(self::Ptr{ImGuiComboPreviewData}) = ImGuiComboPreviewData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1301).
"""
lib.ImGuiMenuColumns() = ImGuiMenuColumns_ImGuiMenuColumns()

"""
Destructor for `ImGuiMenuColumns`
"""
Destroy(self::Ptr{ImGuiMenuColumns}) = ImGuiMenuColumns_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1302).
"""
Update(self::Ptr{ImGuiMenuColumns}, spacing, window_reappearing) =
    ImGuiMenuColumns_Update(self, spacing, window_reappearing)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1303).
"""
DeclColumns(self::Ptr{ImGuiMenuColumns}, w_icon, w_label, w_shortcut, w_mark) =
    ImGuiMenuColumns_DeclColumns(self, w_icon, w_label, w_shortcut, w_mark)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1304).
"""
CalcNextTotalWidth(self::Ptr{ImGuiMenuColumns}, update_offsets) =
    ImGuiMenuColumns_CalcNextTotalWidth(self, update_offsets)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1315).
"""
lib.ImGuiInputTextDeactivatedState() = ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState()

"""
Destructor for `ImGuiInputTextDeactivatedState`
"""
Destroy(self::Ptr{ImGuiInputTextDeactivatedState}) = ImGuiInputTextDeactivatedState_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1316).
"""
ClearFreeMemory(self::Ptr{ImGuiInputTextDeactivatedState}) = ImGuiInputTextDeactivatedState_ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1360).
"""
lib.ImGuiInputTextState() = ImGuiInputTextState_ImGuiInputTextState()

"""
Destructor for `ImGuiInputTextState`
"""
Destroy(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1362).
"""
ClearText(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ClearText(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1363).
"""
ClearFreeMemory(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

Cannot be inline because we call in code in stb_textedit.h implementation.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1364).
"""
OnKeyPressed(self::Ptr{ImGuiInputTextState}, key) = ImGuiInputTextState_OnKeyPressed(self, key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1365).
"""
OnCharPressed(self::Ptr{ImGuiInputTextState}, c) = ImGuiInputTextState_OnCharPressed(self, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1366).
"""
GetPreferredOffsetX(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetPreferredOffsetX(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1367).
"""
GetText(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetText(self)

"""
$(TYPEDSIGNATURES)

Cursor & Selection.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1370).
"""
CursorAnimReset(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_CursorAnimReset(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1371).
"""
CursorClamp(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_CursorClamp(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1372).
"""
HasSelection(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_HasSelection(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1373).
"""
ClearSelection(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ClearSelection(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1374).
"""
GetCursorPos(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetCursorPos(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1375).
"""
GetSelectionStart(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetSelectionStart(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1376).
"""
GetSelectionEnd(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetSelectionEnd(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1377).
"""
SetSelection(self::Ptr{ImGuiInputTextState}, start, _end) = ImGuiInputTextState_SetSelection(self, start, _end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1378).
"""
SelectAll(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_SelectAll(self)

"""
$(TYPEDSIGNATURES)

Reload user buf (WIP #2890)
If you modify underlying user-passed const char* while active you need to call this (InputText V2 may lift this)
  strcpy(my_buf, "hello");
  if (ImGuiInputTextState* state = ImGui::GetInputTextState(id)) // id may be ImGui::GetItemID() is last item
      state->ReloadUserBufAndSelectAll();.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1385).
"""
ReloadUserBufAndSelectAll(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ReloadUserBufAndSelectAll(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1386).
"""
ReloadUserBufAndKeepSelection(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ReloadUserBufAndKeepSelection(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1387).
"""
ReloadUserBufAndMoveToEnd(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ReloadUserBufAndMoveToEnd(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1455).
"""
lib.ImGuiNextWindowData() = ImGuiNextWindowData_ImGuiNextWindowData()

"""
Destructor for `ImGuiNextWindowData`
"""
Destroy(self::Ptr{ImGuiNextWindowData}) = ImGuiNextWindowData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1456).
"""
ClearFlags(self::Ptr{ImGuiNextWindowData}) = ImGuiNextWindowData_ClearFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1487).
"""
lib.ImGuiNextItemData() = ImGuiNextItemData_ImGuiNextItemData()

"""
Destructor for `ImGuiNextItemData`
"""
Destroy(self::Ptr{ImGuiNextItemData}) = ImGuiNextItemData_destroy(self)

"""
$(TYPEDSIGNATURES)

Also cleared manually by ItemAdd()!

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1488).
"""
ClearFlags(self::Ptr{ImGuiNextItemData}) = ImGuiNextItemData_ClearFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1504).
"""
lib.ImGuiLastItemData() = ImGuiLastItemData_ImGuiLastItemData()

"""
Destructor for `ImGuiLastItemData`
"""
Destroy(self::Ptr{ImGuiLastItemData}) = ImGuiLastItemData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1537).
"""
lib.ImGuiErrorRecoveryState() = ImGuiErrorRecoveryState_ImGuiErrorRecoveryState()

"""
Destructor for `ImGuiErrorRecoveryState`
"""
Destroy(self::Ptr{ImGuiErrorRecoveryState}) = ImGuiErrorRecoveryState_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1563).
"""
lib.ImGuiPtrOrIndex(ptr::PtrOrRef{Cvoid}) = ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr)

"""
Destructor for `ImGuiPtrOrIndex`
"""
Destroy(self::Ptr{ImGuiPtrOrIndex}) = ImGuiPtrOrIndex_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1564).
"""
lib.ImGuiPtrOrIndex(index::Integer) = ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1600).
"""
lib.ImGuiPopupData() = ImGuiPopupData_ImGuiPopupData()

"""
Destructor for `ImGuiPopupData`
"""
Destroy(self::Ptr{ImGuiPopupData}) = ImGuiPopupData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1681).
"""
lib.ImGuiInputEvent() = ImGuiInputEvent_ImGuiInputEvent()

"""
Destructor for `ImGuiInputEvent`
"""
Destroy(self::Ptr{ImGuiInputEvent}) = ImGuiInputEvent_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1701).
"""
lib.ImGuiKeyRoutingData() = ImGuiKeyRoutingData_ImGuiKeyRoutingData()

"""
Destructor for `ImGuiKeyRoutingData`
"""
Destroy(self::Ptr{ImGuiKeyRoutingData}) = ImGuiKeyRoutingData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1712).
"""
lib.ImGuiKeyRoutingTable() = ImGuiKeyRoutingTable_ImGuiKeyRoutingTable()

"""
Destructor for `ImGuiKeyRoutingTable`
"""
Destroy(self::Ptr{ImGuiKeyRoutingTable}) = ImGuiKeyRoutingTable_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1713).
"""
Clear(self::Ptr{ImGuiKeyRoutingTable}) = ImGuiKeyRoutingTable_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1725).
"""
lib.ImGuiKeyOwnerData() = ImGuiKeyOwnerData_ImGuiKeyOwnerData()

"""
Destructor for `ImGuiKeyOwnerData`
"""
Destroy(self::Ptr{ImGuiKeyOwnerData}) = ImGuiKeyOwnerData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1783).
"""
FromIndices(min, max) = ImGuiListClipperRange_FromIndices(min, max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1784).
"""
FromPositions(y1, y2, off_min, off_max) = ImGuiListClipperRange_FromPositions(y1, y2, off_min, off_max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1796).
"""
lib.ImGuiListClipperData() = ImGuiListClipperData_ImGuiListClipperData()

"""
Destructor for `ImGuiListClipperData`
"""
Destroy(self::Ptr{ImGuiListClipperData}) = ImGuiListClipperData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1797).
"""
Reset(self::Ptr{ImGuiListClipperData}, clipper::VoidablePtrOrRef{ImGuiListClipper}) =
    ImGuiListClipperData_Reset(self, clipper)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1888).
"""
lib.ImGuiNavItemData() = ImGuiNavItemData_ImGuiNavItemData()

"""
Destructor for `ImGuiNavItemData`
"""
Destroy(self::Ptr{ImGuiNavItemData}) = ImGuiNavItemData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1889).
"""
Clear(self::Ptr{ImGuiNavItemData}) = ImGuiNavItemData_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1932).
"""
lib.ImGuiTypingSelectState() = ImGuiTypingSelectState_ImGuiTypingSelectState()

"""
Destructor for `ImGuiTypingSelectState`
"""
Destroy(self::Ptr{ImGuiTypingSelectState}) = ImGuiTypingSelectState_destroy(self)

"""
$(TYPEDSIGNATURES)

We preserve remaining data for easier debugging.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1933).
"""
Clear(self::Ptr{ImGuiTypingSelectState}) = ImGuiTypingSelectState_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1968).
"""
lib.ImGuiOldColumnData() = ImGuiOldColumnData_ImGuiOldColumnData()

"""
Destructor for `ImGuiOldColumnData`
"""
Destroy(self::Ptr{ImGuiOldColumnData}) = ImGuiOldColumnData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L1989).
"""
lib.ImGuiOldColumns() = ImGuiOldColumns_ImGuiOldColumns()

"""
Destructor for `ImGuiOldColumns`
"""
Destroy(self::Ptr{ImGuiOldColumns}) = ImGuiOldColumns_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2018).
"""
lib.ImGuiBoxSelectState() = ImGuiBoxSelectState_ImGuiBoxSelectState()

"""
Destructor for `ImGuiBoxSelectState`
"""
Destroy(self::Ptr{ImGuiBoxSelectState}) = ImGuiBoxSelectState_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2050).
"""
lib.ImGuiMultiSelectTempData() = ImGuiMultiSelectTempData_ImGuiMultiSelectTempData()

"""
Destructor for `ImGuiMultiSelectTempData`
"""
Destroy(self::Ptr{ImGuiMultiSelectTempData}) = ImGuiMultiSelectTempData_destroy(self)

"""
$(TYPEDSIGNATURES)

Zero-clear except IO as we preserve IO.Requests[] buffer allocation.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2051).
"""
Clear(self::Ptr{ImGuiMultiSelectTempData}) = ImGuiMultiSelectTempData_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2052).
"""
ClearIO(self::Ptr{ImGuiMultiSelectTempData}) = ImGuiMultiSelectTempData_ClearIO(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2067).
"""
lib.ImGuiMultiSelectState() = ImGuiMultiSelectState_ImGuiMultiSelectState()

"""
Destructor for `ImGuiMultiSelectState`
"""
Destroy(self::Ptr{ImGuiMultiSelectState}) = ImGuiMultiSelectState_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2174).
"""
lib.ImGuiDockNode(id::Union{ImGuiID,Integer}) = ImGuiDockNode_ImGuiDockNode(id)

"""
Destructor for `ImGuiDockNode`
"""
Destroy(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2176).
"""
IsRootNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsRootNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2177).
"""
IsDockSpace(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsDockSpace(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2178).
"""
IsFloatingNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsFloatingNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2179).
"""
IsCentralNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsCentralNode(self)

"""
$(TYPEDSIGNATURES)

Hidden tab bar can be shown back by clicking the small triangle.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2180).
"""
IsHiddenTabBar(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsHiddenTabBar(self)

"""
$(TYPEDSIGNATURES)

Never show a tab bar.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2181).
"""
IsNoTabBar(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsNoTabBar(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2182).
"""
IsSplitNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsSplitNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2183).
"""
IsLeafNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsLeafNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2184).
"""
IsEmpty(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsEmpty(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2185).
"""
Rect(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_Rect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2187).
"""
SetLocalFlags(self::Ptr{ImGuiDockNode}, flags::Union{ImGuiDockNodeFlags,ImGuiDockNodeFlags_,Integer}) =
    ImGuiDockNode_SetLocalFlags(self, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2188).
"""
UpdateMergedFlags(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_UpdateMergedFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2221).
"""
lib.ImGuiDockContext() = ImGuiDockContext_ImGuiDockContext()

"""
Destructor for `ImGuiDockContext`
"""
Destroy(self::Ptr{ImGuiDockContext}) = ImGuiDockContext_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2263).
"""
lib.ImGuiViewportP() = ImGuiViewportP_ImGuiViewportP()

"""
Destructor for `ImGuiViewportP`
"""
Destroy(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2265).
"""
ClearRequestFlags(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_ClearRequestFlags(self)

"""
$(TYPEDSIGNATURES)

Calculate work rect pos/size given a set of offset (we have 1 pair of offset for rect locked from last frame data, and 1 pair for currently building rect).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2268).
"""
CalcWorkRectPos(self::Ptr{ImGuiViewportP}, inset_min::Union{ImVec2,NTuple{2}}) =
    ImGuiViewportP_CalcWorkRectPos(self, inset_min)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2269).
"""
CalcWorkRectSize(self::Ptr{ImGuiViewportP}, inset_min::Union{ImVec2,NTuple{2}}, inset_max::Union{ImVec2,NTuple{2}}) =
    ImGuiViewportP_CalcWorkRectSize(self, inset_min, inset_max)

"""
$(TYPEDSIGNATURES)

Update public fields.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2270).
"""
UpdateWorkRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_UpdateWorkRect(self)

"""
$(TYPEDSIGNATURES)

Helpers to retrieve ImRect (we don't need to store BuildWorkRect as every access tend to change it, hence the code asymmetry).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2273).
"""
GetMainRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_GetMainRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2274).
"""
GetWorkRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_GetWorkRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2275).
"""
GetBuildWorkRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_GetBuildWorkRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2301).
"""
lib.ImGuiWindowSettings() = ImGuiWindowSettings_ImGuiWindowSettings()

"""
Destructor for `ImGuiWindowSettings`
"""
Destroy(self::Ptr{ImGuiWindowSettings}) = ImGuiWindowSettings_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2302).
"""
GetName(self::Ptr{ImGuiWindowSettings}) = ImGuiWindowSettings_GetName(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2329).
"""
lib.ImGuiSettingsHandler() = ImGuiSettingsHandler_ImGuiSettingsHandler()

"""
Destructor for `ImGuiSettingsHandler`
"""
Destroy(self::Ptr{ImGuiSettingsHandler}) = ImGuiSettingsHandler_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2425).
"""
lib.ImGuiDebugAllocInfo() = ImGuiDebugAllocInfo_ImGuiDebugAllocInfo()

"""
Destructor for `ImGuiDebugAllocInfo`
"""
Destroy(self::Ptr{ImGuiDebugAllocInfo}) = ImGuiDebugAllocInfo_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2457).
"""
lib.ImGuiStackLevelInfo() = ImGuiStackLevelInfo_ImGuiStackLevelInfo()

"""
Destructor for `ImGuiStackLevelInfo`
"""
Destroy(self::Ptr{ImGuiStackLevelInfo}) = ImGuiStackLevelInfo_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2470).
"""
lib.ImGuiDebugItemPathQuery() = ImGuiDebugItemPathQuery_ImGuiDebugItemPathQuery()

"""
Destructor for `ImGuiDebugItemPathQuery`
"""
Destroy(self::Ptr{ImGuiDebugItemPathQuery}) = ImGuiDebugItemPathQuery_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2481).
"""
lib.ImGuiIDStackTool() = ImGuiIDStackTool_ImGuiIDStackTool()

"""
Destructor for `ImGuiIDStackTool`
"""
Destroy(self::Ptr{ImGuiIDStackTool}) = ImGuiIDStackTool_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2499).
"""
lib.ImGuiContextHook() = ImGuiContextHook_ImGuiContextHook()

"""
Destructor for `ImGuiContextHook`
"""
Destroy(self::Ptr{ImGuiContextHook}) = ImGuiContextHook_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L2923).
"""
lib.ImGuiContext(shared_font_atlas::VoidablePtrOrRef{ImFontAtlas}) = ImGuiContext_ImGuiContext(shared_font_atlas)

"""
Destructor for `ImGuiContext`
"""
Destroy(self::Ptr{ImGuiContext}) = ImGuiContext_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3125).
"""
lib.ImGuiWindow(context::VoidablePtrOrRef{ImGuiContext}, name) = ImGuiWindow_ImGuiWindow(context, name)

"""
Destructor for `ImGuiWindow`
"""
Destroy(self::Ptr{ImGuiWindow}) = ImGuiWindow_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3129).
"""
GetID(self::Ptr{ImGuiWindow}, str::Union{String,Ptr{Cchar}}, str_end::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL) =
    ImGuiWindow_GetID_Str(self, str, str_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3130).
"""
GetID(self::Ptr{ImGuiWindow}, ptr::PtrOrRef{Cvoid}) = ImGuiWindow_GetID_Ptr(self, ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3131).
"""
GetID(self::Ptr{ImGuiWindow}, n::Integer) = ImGuiWindow_GetID_Int(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3132).
"""
GetIDFromPos(self::Ptr{ImGuiWindow}, p_abs::Union{ImVec2,NTuple{2}}) = ImGuiWindow_GetIDFromPos(self, p_abs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3133).
"""
GetIDFromRectangle(self::Ptr{ImGuiWindow}, r_abs::ImRect) = ImGuiWindow_GetIDFromRectangle(self, r_abs)

"""
$(TYPEDSIGNATURES)

We don't use g.FontSize because the window may be != g.CurrentWindow.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3136).
"""
Rect(self::Ptr{ImGuiWindow}) = ImGuiWindow_Rect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3137).
"""
TitleBarRect(self::Ptr{ImGuiWindow}) = ImGuiWindow_TitleBarRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3138).
"""
MenuBarRect(self::Ptr{ImGuiWindow}) = ImGuiWindow_MenuBarRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3183).
"""
lib.ImGuiTabItem() = ImGuiTabItem_ImGuiTabItem()

"""
Destructor for `ImGuiTabItem`
"""
Destroy(self::Ptr{ImGuiTabItem}) = ImGuiTabItem_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3227).
"""
lib.ImGuiTabBar() = ImGuiTabBar_ImGuiTabBar()

"""
Destructor for `ImGuiTabBar`
"""
Destroy(self::Ptr{ImGuiTabBar}) = ImGuiTabBar_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3291).
"""
lib.ImGuiTableColumn() = ImGuiTableColumn_ImGuiTableColumn()

"""
Destructor for `ImGuiTableColumn`
"""
Destroy(self::Ptr{ImGuiTableColumn}) = ImGuiTableColumn_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3352).
"""
lib.ImGuiTableInstanceData() = ImGuiTableInstanceData_ImGuiTableInstanceData()

"""
Destructor for `ImGuiTableInstanceData`
"""
Destroy(self::Ptr{ImGuiTableInstanceData}) = ImGuiTableInstanceData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3477).
"""
lib.ImGuiTable() = ImGuiTable_ImGuiTable()

"""
Destructor for `ImGuiTable`
"""
Destroy(self::Ptr{ImGuiTable}) = ImGuiTable_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3511).
"""
lib.ImGuiTableTempData() = ImGuiTableTempData_ImGuiTableTempData()

"""
Destructor for `ImGuiTableTempData`
"""
Destroy(self::Ptr{ImGuiTableTempData}) = ImGuiTableTempData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3527).
"""
lib.ImGuiTableColumnSettings() = ImGuiTableColumnSettings_ImGuiTableColumnSettings()

"""
Destructor for `ImGuiTableColumnSettings`
"""
Destroy(self::Ptr{ImGuiTableColumnSettings}) = ImGuiTableColumnSettings_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3551).
"""
lib.ImGuiTableSettings() = ImGuiTableSettings_ImGuiTableSettings()

"""
Destructor for `ImGuiTableSettings`
"""
Destroy(self::Ptr{ImGuiTableSettings}) = ImGuiTableSettings_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3552).
"""
GetColumnSettings(self::Ptr{ImGuiTableSettings}) = ImGuiTableSettings_GetColumnSettings(self)

"""
$(TYPEDSIGNATURES)


Tables: Candidates for public API.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3558).
"""
TableOpenContextMenu(column_n = -1) = igTableOpenContextMenu(column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3559).
"""
TableSetColumnWidth(column_n, width) = igTableSetColumnWidth(column_n, width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3560).
"""
TableSetColumnSortDirection(column_n, sort_direction::ImGuiSortDirection, append_to_sort_specs) =
    igTableSetColumnSortDirection(column_n, sort_direction, append_to_sort_specs)

"""
$(TYPEDSIGNATURES)

Retrieve *PREVIOUS FRAME* hovered row. This difference with TableGetHoveredColumn() is the reason why this is not public yet.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3561).
"""
TableGetHoveredRow() = igTableGetHoveredRow()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3562).
"""
TableGetHeaderRowHeight() = igTableGetHeaderRowHeight()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3563).
"""
TableGetHeaderAngledMaxLabelWidth() = igTableGetHeaderAngledMaxLabelWidth()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3564).
"""
TablePushBackgroundChannel() = igTablePushBackgroundChannel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3565).
"""
TablePopBackgroundChannel() = igTablePopBackgroundChannel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3566).
"""
TablePushColumnChannel(column_n) = igTablePushColumnChannel(column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3567).
"""
TablePopColumnChannel() = igTablePopColumnChannel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3568).
"""
TableAngledHeadersRowEx(
    row_id::Union{ImGuiID,Integer},
    angle,
    max_label_width,
    data::VoidablePtrOrRef{ImGuiTableHeaderData},
    data_count,
) = igTableAngledHeadersRowEx(row_id, angle, max_label_width, data, data_count)

"""
$(TYPEDSIGNATURES)

Tables: Internals.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3571).
"""
GetCurrentTable() = igGetCurrentTable()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3572).
"""
TableFindByID(id::Union{ImGuiID,Integer}) = igTableFindByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3573).
"""
BeginTableEx(
    name,
    id::Union{ImGuiID,Integer},
    columns_count,
    flags::Union{ImGuiTableFlags,ImGuiTableFlags_,Integer} = 0,
    outer_size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    inner_width = 0.0f0,
) = igBeginTableEx(name, id, columns_count, flags, outer_size, inner_width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3574).
"""
TableBeginInitMemory(table::VoidablePtrOrRef{ImGuiTable}, columns_count) = igTableBeginInitMemory(table, columns_count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3575).
"""
TableApplyQueuedRequests(table::VoidablePtrOrRef{ImGuiTable}) = igTableApplyQueuedRequests(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3576).
"""
TableSetupDrawChannels(table::VoidablePtrOrRef{ImGuiTable}) = igTableSetupDrawChannels(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3577).
"""
TableReconcileColumns(table::VoidablePtrOrRef{ImGuiTable}) = igTableReconcileColumns(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3578).
"""
TableUpdateLayout(table::VoidablePtrOrRef{ImGuiTable}) = igTableUpdateLayout(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3579).
"""
TableUpdateBorders(table::VoidablePtrOrRef{ImGuiTable}) = igTableUpdateBorders(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3580).
"""
TableUpdateColumnsWeightFromWidth(table::VoidablePtrOrRef{ImGuiTable}) = igTableUpdateColumnsWeightFromWidth(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3581).
"""
TableApplyExternalUnclipRect(table::VoidablePtrOrRef{ImGuiTable}, rect::VoidablePtrOrRef{ImRect}) =
    igTableApplyExternalUnclipRect(table, rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3582).
"""
TableDrawBorders(table::VoidablePtrOrRef{ImGuiTable}) = igTableDrawBorders(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3583).
"""
TableDrawDefaultContextMenu(
    table::VoidablePtrOrRef{ImGuiTable},
    flags_for_section_to_display::Union{ImGuiTableFlags,ImGuiTableFlags_,Integer},
) = igTableDrawDefaultContextMenu(table, flags_for_section_to_display)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3584).
"""
TableBeginContextMenuPopup(table::VoidablePtrOrRef{ImGuiTable}) = igTableBeginContextMenuPopup(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3585).
"""
TableMergeDrawChannels(table::VoidablePtrOrRef{ImGuiTable}) = igTableMergeDrawChannels(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3586).
"""
TableGetInstanceData(table::VoidablePtrOrRef{ImGuiTable}, instance_no) = igTableGetInstanceData(table, instance_no)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3587).
"""
TableGetInstanceID(table::VoidablePtrOrRef{ImGuiTable}, instance_no) = igTableGetInstanceID(table, instance_no)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3588).
"""
TableFixDisplayOrder(table::VoidablePtrOrRef{ImGuiTable}) = igTableFixDisplayOrder(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3589).
"""
TableSortSpecsSanitize(table::VoidablePtrOrRef{ImGuiTable}) = igTableSortSpecsSanitize(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3590).
"""
TableSortSpecsBuild(table::VoidablePtrOrRef{ImGuiTable}) = igTableSortSpecsBuild(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3591).
"""
TableInitColumnDefaults(
    table::VoidablePtrOrRef{ImGuiTable},
    column::VoidablePtrOrRef{ImGuiTableColumn},
    init_mask::Union{ImGuiTableColumnFlags,ImGuiTableColumnFlags_,Integer},
) = igTableInitColumnDefaults(table, column, init_mask)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3592).
"""
TableGetColumnNextSortDirection(column::VoidablePtrOrRef{ImGuiTableColumn}) = igTableGetColumnNextSortDirection(column)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3593).
"""
TableFixColumnSortDirection(table::VoidablePtrOrRef{ImGuiTable}, column::VoidablePtrOrRef{ImGuiTableColumn}) =
    igTableFixColumnSortDirection(table, column)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3594).
"""
TableGetColumnWidthAuto(table::VoidablePtrOrRef{ImGuiTable}, column::VoidablePtrOrRef{ImGuiTableColumn}) =
    igTableGetColumnWidthAuto(table, column)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3595).
"""
TableBeginRow(table::VoidablePtrOrRef{ImGuiTable}) = igTableBeginRow(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3596).
"""
TableEndRow(table::VoidablePtrOrRef{ImGuiTable}) = igTableEndRow(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3597).
"""
TableBeginCell(table::VoidablePtrOrRef{ImGuiTable}, column_n) = igTableBeginCell(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3598).
"""
TableEndCell(table::VoidablePtrOrRef{ImGuiTable}) = igTableEndCell(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3599).
"""
TableGetCellBgRect(table::VoidablePtrOrRef{ImGuiTable}, column_n) = igTableGetCellBgRect(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3600).
"""
TableGetColumnName(table::VoidablePtrOrRef{ImGuiTable}, column_n::Integer) =
    igTableGetColumnName_TablePtr(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3601).
"""
TableGetColumnResizeID(table::VoidablePtrOrRef{ImGuiTable}, column_n, instance_no = 0) =
    igTableGetColumnResizeID(table, column_n, instance_no)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3602).
"""
TableCalcMaxColumnWidth(table::VoidablePtrOrRef{ImGuiTable}, column_n) = igTableCalcMaxColumnWidth(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3603).
"""
TableSetColumnWidthAutoSingle(table::VoidablePtrOrRef{ImGuiTable}, column_n) =
    igTableSetColumnWidthAutoSingle(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3604).
"""
TableSetColumnWidthAutoAll(table::VoidablePtrOrRef{ImGuiTable}) = igTableSetColumnWidthAutoAll(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3605).
"""
TableSetColumnDisplayOrder(table::VoidablePtrOrRef{ImGuiTable}, column_n, dst_order) =
    igTableSetColumnDisplayOrder(table, column_n, dst_order)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3606).
"""
TableQueueSetColumnDisplayOrder(table::VoidablePtrOrRef{ImGuiTable}, column_n, dst_order) =
    igTableQueueSetColumnDisplayOrder(table, column_n, dst_order)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3607).
"""
TableRemove(table::VoidablePtrOrRef{ImGuiTable}) = igTableRemove(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3608).
"""
TableGcCompactTransientBuffers(table::PtrOrRef{ImGuiTable}) = igTableGcCompactTransientBuffers_TablePtr(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3609).
"""
TableGcCompactTransientBuffers(table::PtrOrRef{ImGuiTableTempData}) =
    igTableGcCompactTransientBuffers_TableTempDataPtr(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3610).
"""
TableGcCompactSettings() = igTableGcCompactSettings()

"""
$(TYPEDSIGNATURES)

Tables: Settings.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3613).
"""
TableLoadSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableLoadSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3614).
"""
TableLoadSettingsForColumns(table::VoidablePtrOrRef{ImGuiTable}) = igTableLoadSettingsForColumns(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3615).
"""
TableLoadSettingsForColumn(
    column::VoidablePtrOrRef{ImGuiTableColumn},
    column_settings::VoidablePtrOrRef{ImGuiTableColumnSettings},
    load_flags::Union{ImGuiTableFlags,ImGuiTableFlags_,Integer},
) = igTableLoadSettingsForColumn(column, column_settings, load_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3616).
"""
TableSaveSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableSaveSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3617).
"""
TableResetSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableResetSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3618).
"""
TableGetBoundSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableGetBoundSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3619).
"""
TableSettingsAddSettingsHandler() = igTableSettingsAddSettingsHandler()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3620).
"""
TableSettingsCreate(id::Union{ImGuiID,Integer}, columns_count) = igTableSettingsCreate(id, columns_count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3621).
"""
TableSettingsFindByID(id::Union{ImGuiID,Integer}) = igTableSettingsFindByID(id)

"""
$(TYPEDSIGNATURES)

Legacy Columns API (this is not exposed because we will encourage transitioning to the Tables API).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3624).
"""
SetWindowClipRectBeforeSetChannel(window::VoidablePtrOrRef{ImGuiWindow}, clip_rect::ImRect) =
    igSetWindowClipRectBeforeSetChannel(window, clip_rect)

"""
$(TYPEDSIGNATURES)

Setup number of columns. use an identifier to distinguish multiple column sets. close with EndColumns().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3625).
"""
BeginColumns(str_id, count, flags::Union{ImGuiOldColumnFlags,ImGuiOldColumnFlags_,Integer} = 0) =
    igBeginColumns(str_id, count, flags)

"""
$(TYPEDSIGNATURES)

Close columns.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3626).
"""
EndColumns() = igEndColumns()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3627).
"""
PushColumnClipRect(column_index) = igPushColumnClipRect(column_index)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3628).
"""
PushColumnsBackground() = igPushColumnsBackground()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3629).
"""
PopColumnsBackground() = igPopColumnsBackground()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3630).
"""
GetColumnsID(str_id, count) = igGetColumnsID(str_id, count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3631).
"""
FindOrCreateColumns(window::VoidablePtrOrRef{ImGuiWindow}, id::Union{ImGuiID,Integer}) =
    igFindOrCreateColumns(window, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3632).
"""
GetColumnOffsetFromNorm(columns::VoidablePtrOrRef{ImGuiOldColumns}, offset_norm) =
    igGetColumnOffsetFromNorm(columns, offset_norm)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3633).
"""
GetColumnNormFromOffset(columns::VoidablePtrOrRef{ImGuiOldColumns}, offset) = igGetColumnNormFromOffset(columns, offset)

"""
$(TYPEDSIGNATURES)


Windows
We should always have a CurrentWindow in the stack (there is an implicit "Debug" window)
If this ever crashes because g.CurrentWindow is NULL, it means that either:
- ImGui::NewFrame() has never been called, which is illegal.
- You are calling ImGui functions after ImGui::EndFrame()/ImGui::Render() and before the next ImGui::NewFrame(), which is also illegal.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3648).
"""
GetIO(ctx::VoidablePtrOrRef{ImGuiContext}) = igGetIO_ContextPtr(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3649).
"""
GetPlatformIO(ctx::VoidablePtrOrRef{ImGuiContext}) = igGetPlatformIO_ContextPtr(ctx)

"""
$(TYPEDSIGNATURES)

FIXME-DPI: PLEASE DO NOT USE. I don't want to formalize this just yet. Because reasons.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3650).
"""
GetScale() = igGetScale()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3651).
"""
GetCurrentWindowRead() = igGetCurrentWindowRead()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3652).
"""
GetCurrentWindow() = igGetCurrentWindow()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3653).
"""
FindWindowByID(id::Union{ImGuiID,Integer}) = igFindWindowByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3654).
"""
FindWindowByName(name) = igFindWindowByName(name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3655).
"""
UpdateWindowParentAndRootLinks(
    window::VoidablePtrOrRef{ImGuiWindow},
    flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer},
    parent_window::VoidablePtrOrRef{ImGuiWindow},
) = igUpdateWindowParentAndRootLinks(window, flags, parent_window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3656).
"""
UpdateWindowSkipRefresh(window::VoidablePtrOrRef{ImGuiWindow}) = igUpdateWindowSkipRefresh(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3657).
"""
CalcWindowNextAutoFitSize(window::VoidablePtrOrRef{ImGuiWindow}) = igCalcWindowNextAutoFitSize(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3658).
"""
IsWindowChildOf(
    window::VoidablePtrOrRef{ImGuiWindow},
    potential_parent::VoidablePtrOrRef{ImGuiWindow},
    popup_hierarchy,
    dock_hierarchy,
) = igIsWindowChildOf(window, potential_parent, popup_hierarchy, dock_hierarchy)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3659).
"""
IsWindowInBeginStack(window::VoidablePtrOrRef{ImGuiWindow}) = igIsWindowInBeginStack(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3660).
"""
IsWindowWithinBeginStackOf(window::VoidablePtrOrRef{ImGuiWindow}, potential_parent::VoidablePtrOrRef{ImGuiWindow}) =
    igIsWindowWithinBeginStackOf(window, potential_parent)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3661).
"""
IsWindowAbove(potential_above::VoidablePtrOrRef{ImGuiWindow}, potential_below::VoidablePtrOrRef{ImGuiWindow}) =
    igIsWindowAbove(potential_above, potential_below)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3662).
"""
IsWindowNavFocusable(window::VoidablePtrOrRef{ImGuiWindow}) = igIsWindowNavFocusable(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3663).
"""
SetWindowPos(
    window::PtrOrRef{ImGuiWindow},
    pos::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
) = igSetWindowPos_WindowPtr(window, pos, cond)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3664).
"""
SetWindowSize(
    window::PtrOrRef{ImGuiWindow},
    size::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
) = igSetWindowSize_WindowPtr(window, size, cond)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3665).
"""
SetWindowCollapsed(window::PtrOrRef{ImGuiWindow}, collapsed::Bool, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowCollapsed_WindowPtr(window, collapsed, cond)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3666).
"""
SetWindowHitTestHole(
    window::VoidablePtrOrRef{ImGuiWindow},
    pos::Union{ImVec2,NTuple{2}},
    size::Union{ImVec2,NTuple{2}},
) = igSetWindowHitTestHole(window, pos, size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3667).
"""
SetWindowHiddenAndSkipItemsForCurrentFrame(window::VoidablePtrOrRef{ImGuiWindow}) =
    igSetWindowHiddenAndSkipItemsForCurrentFrame(window)

"""
$(TYPEDSIGNATURES)

You may also use SetNextWindowClass()'s FocusRouteParentWindowId field.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3668).
"""
SetWindowParentWindowForFocusRoute(
    window::VoidablePtrOrRef{ImGuiWindow},
    parent_window::VoidablePtrOrRef{ImGuiWindow},
) = igSetWindowParentWindowForFocusRoute(window, parent_window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3669).
"""
WindowRectAbsToRel(window::VoidablePtrOrRef{ImGuiWindow}, r::ImRect) = igWindowRectAbsToRel(window, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3670).
"""
WindowRectRelToAbs(window::VoidablePtrOrRef{ImGuiWindow}, r::ImRect) = igWindowRectRelToAbs(window, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3671).
"""
WindowPosAbsToRel(window::VoidablePtrOrRef{ImGuiWindow}, p::Union{ImVec2,NTuple{2}}) = igWindowPosAbsToRel(window, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3672).
"""
WindowPosRelToAbs(window::VoidablePtrOrRef{ImGuiWindow}, p::Union{ImVec2,NTuple{2}}) = igWindowPosRelToAbs(window, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3673).
"""
SetNextWindowFlags(flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer}, enabled) =
    igSetNextWindowFlags(flags, enabled)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3674).
"""
SetNextWindowChildFlags(flags::Union{ImGuiChildFlags,ImGuiChildFlags_,Integer}, enabled) =
    igSetNextWindowChildFlags(flags, enabled)

"""
$(TYPEDSIGNATURES)

Windows: Display Order and Focus Order.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3677).
"""
FocusWindow(
    window::VoidablePtrOrRef{ImGuiWindow},
    flags::Union{ImGuiFocusRequestFlags,ImGuiFocusRequestFlags_,Integer} = 0,
) = igFocusWindow(window, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3678).
"""
FocusTopMostWindowUnderOne(
    under_this_window::VoidablePtrOrRef{ImGuiWindow},
    ignore_window::VoidablePtrOrRef{ImGuiWindow},
    filter_viewport::VoidablePtrOrRef{ImGuiViewport},
    flags::Union{ImGuiFocusRequestFlags,ImGuiFocusRequestFlags_,Integer},
) = igFocusTopMostWindowUnderOne(under_this_window, ignore_window, filter_viewport, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3679).
"""
BringWindowToFocusFront(window::VoidablePtrOrRef{ImGuiWindow}) = igBringWindowToFocusFront(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3680).
"""
BringWindowToDisplayFront(window::VoidablePtrOrRef{ImGuiWindow}) = igBringWindowToDisplayFront(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3681).
"""
BringWindowToDisplayBack(window::VoidablePtrOrRef{ImGuiWindow}) = igBringWindowToDisplayBack(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3682).
"""
BringWindowToDisplayBehind(window::VoidablePtrOrRef{ImGuiWindow}, above_window::VoidablePtrOrRef{ImGuiWindow}) =
    igBringWindowToDisplayBehind(window, above_window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3683).
"""
FindWindowDisplayIndex(window::VoidablePtrOrRef{ImGuiWindow}) = igFindWindowDisplayIndex(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3684).
"""
FindBottomMostVisibleWindowWithinBeginStack(window::VoidablePtrOrRef{ImGuiWindow}) =
    igFindBottomMostVisibleWindowWithinBeginStack(window)

"""
$(TYPEDSIGNATURES)

Windows: Idle, Refresh Policies [EXPERIMENTAL].

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3687).
"""
SetNextWindowRefreshPolicy(flags::Union{ImGuiWindowRefreshFlags,ImGuiWindowRefreshFlags_,Integer}) =
    igSetNextWindowRefreshPolicy(flags)

"""
$(TYPEDSIGNATURES)

Fonts, drawing// Register external texture. EXPERIMENTAL.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3690).
"""
RegisterUserTexture(tex::VoidablePtrOrRef{ImTextureData}) = igRegisterUserTexture(tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3691).
"""
UnregisterUserTexture(tex::VoidablePtrOrRef{ImTextureData}) = igUnregisterUserTexture(tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3692).
"""
RegisterFontAtlas(atlas::VoidablePtrOrRef{ImFontAtlas}) = igRegisterFontAtlas(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3693).
"""
UnregisterFontAtlas(atlas::VoidablePtrOrRef{ImFontAtlas}) = igUnregisterFontAtlas(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3694).
"""
SetCurrentFont(font::VoidablePtrOrRef{ImFont}, font_size_before_scaling, font_size_after_scaling) =
    igSetCurrentFont(font, font_size_before_scaling, font_size_after_scaling)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3695).
"""
UpdateCurrentFontSize(restore_font_size_after_scaling) = igUpdateCurrentFontSize(restore_font_size_after_scaling)

"""
$(TYPEDSIGNATURES)

Was SetFontRasterizerDensity().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3696).
"""
SetPixelDensity(pixel_density) = igSetPixelDensity(pixel_density)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3697).
"""
GetPixelDensity() = igGetPixelDensity()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3698).
"""
GetRoundedFontSize(size) = igGetRoundedFontSize(size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3699).
"""
GetDefaultFont() = igGetDefaultFont()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3700).
"""
PushPasswordFont() = igPushPasswordFont()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3701).
"""
PopPasswordFont() = igPopPasswordFont()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3703).
"""
AddDrawListToDrawDataEx(
    draw_data::VoidablePtrOrRef{ImDrawData},
    out_list::VoidablePtrOrRef{ImVector_ImDrawListPtr},
    draw_list::VoidablePtrOrRef{ImDrawList},
) = igAddDrawListToDrawDataEx(draw_data, out_list, draw_list)

"""
$(TYPEDSIGNATURES)

Init.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3706).
"""
Initialize() = igInitialize()

"""
$(TYPEDSIGNATURES)

Since 1.60 this is a _private_ function. You can call DestroyContext() to destroy the context created by CreateContext().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3707).
"""
Shutdown() = igShutdown()

"""
$(TYPEDSIGNATURES)

Context name & generic context hooks.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3710).
"""
SetContextName(ctx::VoidablePtrOrRef{ImGuiContext}, name) = igSetContextName(ctx, name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3711).
"""
AddContextHook(ctx::VoidablePtrOrRef{ImGuiContext}, hook::VoidablePtrOrRef{ImGuiContextHook}) =
    igAddContextHook(ctx, hook)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3712).
"""
RemoveContextHook(ctx::VoidablePtrOrRef{ImGuiContext}, hook_to_remove::Union{ImGuiID,Integer}) =
    igRemoveContextHook(ctx, hook_to_remove)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3713).
"""
CallContextHooks(ctx::VoidablePtrOrRef{ImGuiContext}, type::ImGuiContextHookType) = igCallContextHooks(ctx, type)

"""
$(TYPEDSIGNATURES)

NewFrame.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3716).
"""
UpdateInputEvents(trickle_fast_inputs) = igUpdateInputEvents(trickle_fast_inputs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3717).
"""
UpdateHoveredWindowAndCaptureFlags(mouse_pos::Union{ImVec2,NTuple{2}}) = igUpdateHoveredWindowAndCaptureFlags(mouse_pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3719).
"""
StartMouseMovingWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igStartMouseMovingWindow(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3720).
"""
StartMouseMovingWindowOrNode(window::VoidablePtrOrRef{ImGuiWindow}, node::VoidablePtrOrRef{ImGuiDockNode}, undock) =
    igStartMouseMovingWindowOrNode(window, node, undock)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3721).
"""
StopMouseMovingWindow() = igStopMouseMovingWindow()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3722).
"""
UpdateMouseMovingWindowNewFrame() = igUpdateMouseMovingWindowNewFrame()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3723).
"""
UpdateMouseMovingWindowEndFrame() = igUpdateMouseMovingWindowEndFrame()

"""
$(TYPEDSIGNATURES)

Viewports.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3726).
"""
TranslateWindowsInViewport(
    viewport::VoidablePtrOrRef{ImGuiViewportP},
    old_pos::Union{ImVec2,NTuple{2}},
    new_pos::Union{ImVec2,NTuple{2}},
    old_size::Union{ImVec2,NTuple{2}},
    new_size::Union{ImVec2,NTuple{2}},
) = igTranslateWindowsInViewport(viewport, old_pos, new_pos, old_size, new_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3727).
"""
ScaleWindowsInViewport(viewport::VoidablePtrOrRef{ImGuiViewportP}, scale) = igScaleWindowsInViewport(viewport, scale)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3728).
"""
DestroyPlatformWindow(viewport::VoidablePtrOrRef{ImGuiViewportP}) = igDestroyPlatformWindow(viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3729).
"""
SetWindowViewport(window::VoidablePtrOrRef{ImGuiWindow}, viewport::VoidablePtrOrRef{ImGuiViewportP}) =
    igSetWindowViewport(window, viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3730).
"""
SetCurrentViewport(window::VoidablePtrOrRef{ImGuiWindow}, viewport::VoidablePtrOrRef{ImGuiViewportP}) =
    igSetCurrentViewport(window, viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3731).
"""
GetViewportPlatformMonitor(viewport::VoidablePtrOrRef{ImGuiViewport}) = igGetViewportPlatformMonitor(viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3732).
"""
FindHoveredViewportFromPlatformWindowStack(mouse_platform_pos::Union{ImVec2,NTuple{2}}) =
    igFindHoveredViewportFromPlatformWindowStack(mouse_platform_pos)

"""
$(TYPEDSIGNATURES)

Settings.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3735).
"""
MarkIniSettingsDirty() = igMarkIniSettingsDirty_Nil()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3736).
"""
MarkIniSettingsDirty(window::VoidablePtrOrRef{ImGuiWindow}) = igMarkIniSettingsDirty_WindowPtr(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3737).
"""
ClearIniSettings() = igClearIniSettings()

"""
$(TYPEDSIGNATURES)

[BETA] Expected to turn into a public API. Please report if you are using this!

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3738).
"""
CleanupIniSettings(args::VoidablePtrOrRef{ImGuiSettingsCleanupArgs}) = igCleanupIniSettings(args)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3739).
"""
AddSettingsHandler(handler::VoidablePtrOrRef{ImGuiSettingsHandler}) = igAddSettingsHandler(handler)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3740).
"""
RemoveSettingsHandler(type_name) = igRemoveSettingsHandler(type_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3741).
"""
FindSettingsHandler(type_name) = igFindSettingsHandler(type_name)

"""
$(TYPEDSIGNATURES)

Settings - Windows.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3744).
"""
CreateNewWindowSettings(name) = igCreateNewWindowSettings(name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3745).
"""
FindWindowSettingsByID(id::Union{ImGuiID,Integer}) = igFindWindowSettingsByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3746).
"""
FindWindowSettingsByWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igFindWindowSettingsByWindow(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3747).
"""
ClearWindowSettings(name) = igClearWindowSettings(name)

"""
$(TYPEDSIGNATURES)

Localization.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3750).
"""
LocalizeRegisterEntries(entries::VoidablePtrOrRef{ImGuiLocEntry}, count) = igLocalizeRegisterEntries(entries, count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3751).
"""
LocalizeGetMsg(key::ImGuiLocKey) = igLocalizeGetMsg(key)

"""
$(TYPEDSIGNATURES)

Scrolling.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3754).
"""
SetScrollX(window::VoidablePtrOrRef{ImGuiWindow}, scroll_x::Real) = igSetScrollX_WindowPtr(window, scroll_x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3755).
"""
SetScrollY(window::VoidablePtrOrRef{ImGuiWindow}, scroll_y::Real) = igSetScrollY_WindowPtr(window, scroll_y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3756).
"""
SetScrollFromPosX(window::VoidablePtrOrRef{ImGuiWindow}, local_x::Real, center_x_ratio::Real) =
    igSetScrollFromPosX_WindowPtr(window, local_x, center_x_ratio)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3757).
"""
SetScrollFromPosY(window::VoidablePtrOrRef{ImGuiWindow}, local_y::Real, center_y_ratio::Real) =
    igSetScrollFromPosY_WindowPtr(window, local_y, center_y_ratio)

"""
$(TYPEDSIGNATURES)

Early work-in-progress API (ScrollToItem() will become public).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3760).
"""
ScrollToItem(flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer} = 0) = igScrollToItem(flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3761).
"""
ScrollToRect(
    window::VoidablePtrOrRef{ImGuiWindow},
    rect::ImRect,
    flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer} = 0,
) = igScrollToRect(window, rect, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3762).
"""
ScrollToRectEx(
    window::VoidablePtrOrRef{ImGuiWindow},
    rect::ImRect,
    flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer} = 0,
) = igScrollToRectEx(window, rect, flags)

"""
$(TYPEDSIGNATURES)


//#ifndef IMGUI_DISABLE_OBSOLETE_FUNCTIONS.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3764).
"""
ScrollToBringRectIntoView(window::VoidablePtrOrRef{ImGuiWindow}, rect::ImRect) =
    igScrollToBringRectIntoView(window, rect)

"""
$(TYPEDSIGNATURES)

Basic Accessors.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3768).
"""
GetItemStatusFlags() = igGetItemStatusFlags()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3769).
"""
GetActiveID() = igGetActiveID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3770).
"""
GetFocusID() = igGetFocusID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3771).
"""
SetActiveID(id::Union{ImGuiID,Integer}, window::VoidablePtrOrRef{ImGuiWindow}) = igSetActiveID(id, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3772).
"""
SetFocusID(id::Union{ImGuiID,Integer}, window::VoidablePtrOrRef{ImGuiWindow}) = igSetFocusID(id, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3773).
"""
ClearActiveID() = igClearActiveID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3774).
"""
GetHoveredID() = igGetHoveredID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3775).
"""
SetHoveredID(id::Union{ImGuiID,Integer}) = igSetHoveredID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3776).
"""
KeepAliveID(id::Union{ImGuiID,Integer}) = igKeepAliveID(id)

"""
$(TYPEDSIGNATURES)

Mark data associated to given item as "edited", used by IsItemDeactivatedAfterEdit() function.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3777).
"""
MarkItemEdited(id::Union{ImGuiID,Integer}) = igMarkItemEdited(id)

"""
$(TYPEDSIGNATURES)

Push given value as-is at the top of the ID stack (whereas PushID combines old and new hashes).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3778).
"""
PushOverrideID(id::Union{ImGuiID,Integer}) = igPushOverrideID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3779).
"""
GetIDWithSeed(
    str_id_begin::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    str_id_end::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    seed::Union{ImGuiID,Integer},
) = igGetIDWithSeed_Str(str_id_begin, str_id_end, seed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3780).
"""
GetIDWithSeed(n::Integer, seed::Union{ImGuiID,Integer}) = igGetIDWithSeed_Int(n, seed)

"""
$(TYPEDSIGNATURES)

Basic Helpers for widget code.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3783).
"""
ItemSize(size::Union{ImVec2,NTuple{2}}, text_baseline_y::Real = -1.0f0) = igItemSize_Vec2(size, text_baseline_y)

"""
$(TYPEDSIGNATURES)

FIXME: This is a misleading API since we expect CursorPos to be bb.Min.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3784).
"""
ItemSize(bb::ImRect, text_baseline_y::Real = -1.0f0) = igItemSize_Rect(bb, text_baseline_y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3785).
"""
ItemAdd(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    nav_bb::VoidablePtrOrRef{ImRect} = C_NULL,
    extra_flags::Union{ImGuiItemFlags,ImGuiItemFlags_,Integer} = 0,
) = igItemAdd(bb, id, nav_bb, extra_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3786).
"""
ItemHoverable(bb::ImRect, id::Union{ImGuiID,Integer}, item_flags::Union{ImGuiItemFlags,ImGuiItemFlags_,Integer}) =
    igItemHoverable(bb, id, item_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3787).
"""
IsWindowContentHoverable(
    window::VoidablePtrOrRef{ImGuiWindow},
    flags::Union{ImGuiHoveredFlags,ImGuiHoveredFlags_,Integer} = 0,
) = igIsWindowContentHoverable(window, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3788).
"""
IsClippedEx(bb::ImRect, id::Union{ImGuiID,Integer}) = igIsClippedEx(bb, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3789).
"""
SetLastItemData(
    item_id::Union{ImGuiID,Integer},
    item_flags::Union{ImGuiItemFlags,ImGuiItemFlags_,Integer},
    status_flags::Union{ImGuiItemStatusFlags,ImGuiItemStatusFlags_,Integer},
    item_rect::ImRect,
) = igSetLastItemData(item_id, item_flags, status_flags, item_rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3790).
"""
CalcItemSize(size::Union{ImVec2,NTuple{2}}, default_w, default_h) = igCalcItemSize(size, default_w, default_h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3791).
"""
CalcWrapWidthForPos(pos::Union{ImVec2,NTuple{2}}, wrap_pos_x) = igCalcWrapWidthForPos(pos, wrap_pos_x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3792).
"""
PushMultiItemsWidths(components, width_full) = igPushMultiItemsWidths(components, width_full)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3793).
"""
ShrinkWidths(items::VoidablePtrOrRef{ImGuiShrinkWidthItem}, count, width_excess, width_min) =
    igShrinkWidths(items, count, width_excess, width_min)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3794).
"""
CalcClipRectVisibleItemsY(
    clip_rect::ImRect,
    pos::Union{ImVec2,NTuple{2}},
    items_height,
    out_visible_start,
    out_visible_end,
) = igCalcClipRectVisibleItemsY(clip_rect, pos, items_height, out_visible_start, out_visible_end)

"""
$(TYPEDSIGNATURES)

Parameter stacks (shared).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3797).
"""
GetStyleVarInfo(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}) = igGetStyleVarInfo(idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3798).
"""
BeginDisabledOverrideReenable() = igBeginDisabledOverrideReenable()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3799).
"""
EndDisabledOverrideReenable() = igEndDisabledOverrideReenable()

"""
$(TYPEDSIGNATURES)

Logging/Capture// -> BeginCapture() when we design v2 api, for now stay under the radar by using the old name.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3802).
"""
LogBegin(flags::Union{ImGuiLogFlags,ImGuiLogFlags_,Integer}, auto_open_depth) = igLogBegin(flags, auto_open_depth)

"""
$(TYPEDSIGNATURES)

Start logging/capturing to internal buffer.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3803).
"""
LogToBuffer(auto_open_depth = -1) = igLogToBuffer(auto_open_depth)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3804).
"""
LogRenderedText(ref_pos::VoidablePtrOrRef{ImVec2}, text, text_end = C_NULL) = igLogRenderedText(ref_pos, text, text_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3805).
"""
LogSetNextTextDecoration(prefix, suffix) = igLogSetNextTextDecoration(prefix, suffix)

"""
$(TYPEDSIGNATURES)

Childs.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3808).
"""
BeginChildEx(
    name,
    id::Union{ImGuiID,Integer},
    size_arg::Union{ImVec2,NTuple{2}},
    child_flags::Union{ImGuiChildFlags,ImGuiChildFlags_,Integer},
    window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer},
) = igBeginChildEx(name, id, size_arg, child_flags, window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3809).
"""
FindFrontMostVisibleChildWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igFindFrontMostVisibleChildWindow(window)

"""
$(TYPEDSIGNATURES)

Popups, Modals.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3812).
"""
BeginPopupEx(id::Union{ImGuiID,Integer}, extra_window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer}) =
    igBeginPopupEx(id, extra_window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3813).
"""
BeginPopupMenuEx(
    id::Union{ImGuiID,Integer},
    label,
    extra_window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer},
) = igBeginPopupMenuEx(id, label, extra_window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3814).
"""
OpenPopupEx(
    id::Union{ImGuiID,Integer},
    popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = ImGuiPopupFlags_None,
) = igOpenPopupEx(id, popup_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3815).
"""
ClosePopupToLevel(remaining, restore_focus_to_window_under_popup) =
    igClosePopupToLevel(remaining, restore_focus_to_window_under_popup)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3816).
"""
ClosePopupsOverWindow(ref_window::VoidablePtrOrRef{ImGuiWindow}, restore_focus_to_window_under_popup) =
    igClosePopupsOverWindow(ref_window, restore_focus_to_window_under_popup)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3817).
"""
ClosePopupsExceptModals() = igClosePopupsExceptModals()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3818).
"""
IsPopupOpen(id::Union{ImGuiID,Integer}, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer}) =
    igIsPopupOpen_ID(id, popup_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3819).
"""
GetPopupAllowedExtentRect(window::VoidablePtrOrRef{ImGuiWindow}) = igGetPopupAllowedExtentRect(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3820).
"""
GetTopMostPopupModal() = igGetTopMostPopupModal()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3821).
"""
GetTopMostAndVisiblePopupModal() = igGetTopMostAndVisiblePopupModal()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3822).
"""
FindBlockingModal(window::VoidablePtrOrRef{ImGuiWindow}) = igFindBlockingModal(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3823).
"""
FindBestWindowPosForPopup(window::VoidablePtrOrRef{ImGuiWindow}) = igFindBestWindowPosForPopup(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3824).
"""
FindBestWindowPosForPopupEx(
    ref_pos::Union{ImVec2,NTuple{2}},
    size::Union{ImVec2,NTuple{2}},
    last_dir::VoidablePtrOrRef{ImGuiDir},
    r_outer::ImRect,
    r_avoid::ImRect,
    policy::ImGuiPopupPositionPolicy,
) = igFindBestWindowPosForPopupEx(ref_pos, size, last_dir, r_outer, r_avoid, policy)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3825).
"""
GetMouseButtonFromPopupFlags(flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer}) =
    igGetMouseButtonFromPopupFlags(flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3826).
"""
IsPopupOpenRequestForItem(flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer}, id::Union{ImGuiID,Integer}) =
    igIsPopupOpenRequestForItem(flags, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3827).
"""
IsPopupOpenRequestForWindow(flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer}) =
    igIsPopupOpenRequestForWindow(flags)

"""
$(TYPEDSIGNATURES)

Tooltips.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3830).
"""
BeginTooltipEx(
    tooltip_flags::Union{ImGuiTooltipFlags,ImGuiTooltipFlags_,Integer},
    extra_window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer},
) = igBeginTooltipEx(tooltip_flags, extra_window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3831).
"""
BeginTooltipHidden() = igBeginTooltipHidden()

"""
$(TYPEDSIGNATURES)

Menus.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3834).
"""
BeginViewportSideBar(
    name,
    viewport::VoidablePtrOrRef{ImGuiViewport},
    dir::ImGuiDir,
    size,
    window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer},
) = igBeginViewportSideBar(name, viewport, dir, size, window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3835).
"""
BeginMenuEx(label, icon, enabled = true) = igBeginMenuEx(label, icon, enabled)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3836).
"""
MenuItemEx(label, icon, shortcut = C_NULL, selected = false, enabled = true) =
    igMenuItemEx(label, icon, shortcut, selected, enabled)

"""
$(TYPEDSIGNATURES)

Combos.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3839).
"""
BeginComboPopup(popup_id::Union{ImGuiID,Integer}, bb::ImRect, flags::Union{ImGuiComboFlags,ImGuiComboFlags_,Integer}) =
    igBeginComboPopup(popup_id, bb, flags)

"""
$(TYPEDSIGNATURES)

Submit preview contents a combo. Call this after EndCombo() to display contents that's more than just a text label.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3840).
"""
BeginComboPreview() = igBeginComboPreview()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3841).
"""
EndComboPreview() = igEndComboPreview()

"""
$(TYPEDSIGNATURES)

Keyboard/Gamepad Navigation.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3844).
"""
NavInitWindow(window::VoidablePtrOrRef{ImGuiWindow}, force_reinit) = igNavInitWindow(window, force_reinit)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3845).
"""
NavInitRequestApplyResult() = igNavInitRequestApplyResult()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3846).
"""
NavMoveRequestButNoResultYet() = igNavMoveRequestButNoResultYet()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3847).
"""
NavMoveRequestSubmit(
    move_dir::ImGuiDir,
    clip_dir::ImGuiDir,
    move_flags::Union{ImGuiNavMoveFlags,ImGuiNavMoveFlags_,Integer},
    scroll_flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer},
) = igNavMoveRequestSubmit(move_dir, clip_dir, move_flags, scroll_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3848).
"""
NavMoveRequestForward(
    move_dir::ImGuiDir,
    clip_dir::ImGuiDir,
    move_flags::Union{ImGuiNavMoveFlags,ImGuiNavMoveFlags_,Integer},
    scroll_flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer},
) = igNavMoveRequestForward(move_dir, clip_dir, move_flags, scroll_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3849).
"""
NavMoveRequestResolveWithLastItem(result::VoidablePtrOrRef{ImGuiNavItemData}) =
    igNavMoveRequestResolveWithLastItem(result)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3850).
"""
NavMoveRequestResolveWithPastTreeNode(
    result::VoidablePtrOrRef{ImGuiNavItemData},
    tree_node_data::VoidablePtrOrRef{ImGuiTreeNodeStackData},
) = igNavMoveRequestResolveWithPastTreeNode(result, tree_node_data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3851).
"""
NavMoveRequestCancel() = igNavMoveRequestCancel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3852).
"""
NavMoveRequestApplyResult() = igNavMoveRequestApplyResult()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3853).
"""
NavMoveRequestTryWrapping(
    window::VoidablePtrOrRef{ImGuiWindow},
    move_flags::Union{ImGuiNavMoveFlags,ImGuiNavMoveFlags_,Integer},
) = igNavMoveRequestTryWrapping(window, move_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3854).
"""
NavHighlightActivated(id::Union{ImGuiID,Integer}) = igNavHighlightActivated(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3855).
"""
NavClearPreferredPosForAxis(axis::ImGuiAxis) = igNavClearPreferredPosForAxis(axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3856).
"""
SetNavCursorVisibleAfterMove() = igSetNavCursorVisibleAfterMove()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3857).
"""
NavUpdateCurrentWindowIsScrollPushableX() = igNavUpdateCurrentWindowIsScrollPushableX()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3858).
"""
SetNavWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igSetNavWindow(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3859).
"""
SetNavID(
    id::Union{ImGuiID,Integer},
    nav_layer::ImGuiNavLayer,
    focus_scope_id::Union{ImGuiID,Integer},
    rect_rel::ImRect,
) = igSetNavID(id, nav_layer, focus_scope_id, rect_rel)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3860).
"""
SetNavFocusScope(focus_scope_id::Union{ImGuiID,Integer}) = igSetNavFocusScope(focus_scope_id)

"""
$(TYPEDSIGNATURES)

Focus/Activation
This should be part of a larger set of API: FocusItem(offset = -1), FocusItemByID(id), ActivateItem(offset = -1), ActivateItemByID(id) etc. which are
Much harder to design and implement than expected. I have a couple of private branches on this matter but it's not simple. For now implementing the easy ones.// Focus last item (no selection/activation).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3865).
"""
FocusItem() = igFocusItem()

"""
$(TYPEDSIGNATURES)

Activate an item by ID (button, checkbox, tree node etc.). Activation is queued and processed on the next frame when the item is encountered again. Was called 'ActivateItem()' before 1.89.7.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3866).
"""
ActivateItemByID(id::Union{ImGuiID,Integer}) = igActivateItemByID(id)

"""
$(TYPEDSIGNATURES)

Inputs
FIXME: Eventually we should aim to move e.g. IsActiveIdUsingKey() into IsKeyXXX functions.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3870).
"""
IsNamedKey(key::ImGuiKey) = igIsNamedKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3871).
"""
IsNamedKeyOrMod(key::ImGuiKey) = igIsNamedKeyOrMod(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3872).
"""
IsLegacyKey(key::ImGuiKey) = igIsLegacyKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3873).
"""
IsKeyboardKey(key::ImGuiKey) = igIsKeyboardKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3874).
"""
IsGamepadKey(key::ImGuiKey) = igIsGamepadKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3875).
"""
IsMouseKey(key::ImGuiKey) = igIsMouseKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3876).
"""
IsAliasKey(key::ImGuiKey) = igIsAliasKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3877).
"""
IsLRModKey(key::ImGuiKey) = igIsLRModKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3878).
"""
FixupKeyChord(key_chord::Union{ImGuiKeyChord,Integer}) = igFixupKeyChord(key_chord)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3879).
"""
ConvertSingleModFlagToKey(key::ImGuiKey) = igConvertSingleModFlagToKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3888).
"""
GetKeyData(ctx::VoidablePtrOrRef{ImGuiContext}, key::ImGuiKey) = igGetKeyData_ContextPtr(ctx, key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3889).
"""
GetKeyData(key::ImGuiKey) = igGetKeyData_Key(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3890).
"""
GetKeyChordName(key_chord::Union{ImGuiKeyChord,Integer}) = igGetKeyChordName(key_chord)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3891).
"""
MouseButtonToKey(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igMouseButtonToKey(button)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3892).
"""
IsMouseDragPastThreshold(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, lock_threshold = -1.0f0) =
    igIsMouseDragPastThreshold(button, lock_threshold)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3893).
"""
GetKeyMagnitude2d(key_left::ImGuiKey, key_right::ImGuiKey, key_up::ImGuiKey, key_down::ImGuiKey) =
    igGetKeyMagnitude2d(key_left, key_right, key_up, key_down)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3894).
"""
GetNavTweakPressedAmount(axis::ImGuiAxis) = igGetNavTweakPressedAmount(axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3895).
"""
CalcTypematicRepeatAmount(t0, t1, repeat_delay, repeat_rate) =
    igCalcTypematicRepeatAmount(t0, t1, repeat_delay, repeat_rate)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3896).
"""
GetTypematicRepeatRate(flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer}, repeat_delay, repeat_rate) =
    igGetTypematicRepeatRate(flags, repeat_delay, repeat_rate)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3897).
"""
TeleportMousePos(pos::Union{ImVec2,NTuple{2}}) = igTeleportMousePos(pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3898).
"""
SetActiveIdUsingAllKeyboardKeys() = igSetActiveIdUsingAllKeyboardKeys()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3899).
"""
IsActiveIdUsingNavDir(dir::ImGuiDir) = igIsActiveIdUsingNavDir(dir)

"""
$(TYPEDSIGNATURES)

[EXPERIMENTAL] Low-Level: Key/Input Ownership
- The idea is that instead of "eating" a given input, we can link to an owner id.
- Ownership is most often claimed as a result of reacting to a press/down event (but occasionally may be claimed ahead).
- Input queries can then read input by specifying ImGuiKeyOwner_Any (== 0), ImGuiKeyOwner_NoOwner (== -1) or a custom ID.
- Legacy input queries (without specifying an owner or _Any or _None) are equivalent to using ImGuiKeyOwner_Any (== 0).
- Input ownership is automatically released on the frame after a key is released. Therefore:
  - for ownership registration happening as a result of a down/press event, the SetKeyOwner() call may be done once (common case).
  - for ownership registration happening ahead of a down/press event, the SetKeyOwner() call needs to be made every frame (happens if e.g. claiming ownership on hover).
- SetItemKeyOwner() is a shortcut for common simple case. A custom widget will probably want to call SetKeyOwner() multiple times directly based on its interaction state.
- This is marked experimental because not all widgets are fully honoring the Set/Test idioms. We will need to move forward step by step.
  Please open a GitHub Issue to submit your usage scenario or if there's a use case you need solved.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3912).
"""
GetKeyOwner(key::ImGuiKey) = igGetKeyOwner(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3913).
"""
SetKeyOwner(
    key::ImGuiKey,
    owner_id::Union{ImGuiID,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0,
) = igSetKeyOwner(key, owner_id, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3914).
"""
SetKeyOwnersForKeyChord(
    key::Union{ImGuiKeyChord,Integer},
    owner_id::Union{ImGuiID,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0,
) = igSetKeyOwnersForKeyChord(key, owner_id, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3915).
"""
SetItemKeyOwner(key::ImGuiKey, flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer}) =
    igSetItemKeyOwner_InputFlags(key, flags)

"""
$(TYPEDSIGNATURES)

Test that key is either not owned, either owned by 'owner_id'.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3916).
"""
TestKeyOwner(key::ImGuiKey, owner_id::Union{ImGuiID,Integer}) = igTestKeyOwner(key, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3917).
"""
GetKeyOwnerData(ctx::VoidablePtrOrRef{ImGuiContext}, key::ImGuiKey) = igGetKeyOwnerData(ctx, key)

"""
$(TYPEDSIGNATURES)

[EXPERIMENTAL] High-Level: Input Access functions w/ support for Key/Input Ownership
- Important: legacy IsKeyPressed(ImGuiKey, bool repeat=true) _DEFAULTS_ to repeat, new IsKeyPressed() requires _EXPLICIT_ ImGuiInputFlags_Repeat flag.
- Expected to be later promoted to public API, the prototypes are designed to replace existing ones (since owner_id can default to Any == 0)
- Specifying a value for 'ImGuiID owner' will test that EITHER the key is NOT owned (UNLESS locked), EITHER the key is owned by 'owner'.
  Legacy functions use ImGuiKeyOwner_Any meaning that they typically ignore ownership, unless a call to SetKeyOwner() explicitly used ImGuiInputFlags_LockThisFrame or ImGuiInputFlags_LockUntilRelease.
- Binding generators may want to ignore those for now, or suffix them with Ex() until we decide if this gets moved into public API.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3925).
"""
IsKeyDown(key::ImGuiKey, owner_id::Union{ImGuiID,Integer}) = igIsKeyDown_ID(key, owner_id)

"""
$(TYPEDSIGNATURES)

Important: when transitioning from old to new IsKeyPressed(): old API has "bool repeat = true", so would default to repeat. New API requires explicit ImGuiInputFlags_Repeat.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3926).
"""
IsKeyPressed(
    key::ImGuiKey,
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer},
    owner_id::Union{ImGuiID,Integer} = 0,
) = igIsKeyPressed_InputFlags(key, flags, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3927).
"""
IsKeyReleased(key::ImGuiKey, owner_id::Union{ImGuiID,Integer}) = igIsKeyReleased_ID(key, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3928).
"""
IsKeyChordPressed(
    key_chord::Union{ImGuiKeyChord,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer},
    owner_id::Union{ImGuiID,Integer} = 0,
) = igIsKeyChordPressed_InputFlags(key_chord, flags, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3929).
"""
IsMouseDown(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igIsMouseDown_ID(button, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3930).
"""
IsMouseClicked(
    button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer},
    owner_id::Union{ImGuiID,Integer} = 0,
) = igIsMouseClicked_InputFlags(button, flags, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3931).
"""
IsMouseReleased(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igIsMouseReleased_ID(button, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3932).
"""
IsMouseDoubleClicked(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igIsMouseDoubleClicked_ID(button, owner_id)

"""
$(TYPEDSIGNATURES)

Shortcut Testing & Routing
- Set Shortcut() and SetNextItemShortcut() in imgui.h
- When a policy (except for ImGuiInputFlags_RouteAlways *) is set, Shortcut() will register itself with SetShortcutRouting(),
  allowing the system to decide where to route the input among other route-aware calls.
  (* using ImGuiInputFlags_RouteAlways is roughly equivalent to calling IsKeyChordPressed(key) and bypassing route registration and check)
- When using one of the routing option:
  - The default route is ImGuiInputFlags_RouteFocused (accept inputs if window is in focus stack. Deep-most focused window takes inputs. ActiveId takes inputs over deep-most focused window.)
  - Routes are requested given a chord (key + modifiers) and a routing policy.
  - Routes are resolved during NewFrame(): if keyboard modifiers are matching current ones: SetKeyOwner() is called + route is granted for the frame.
  - Each route may be granted to a single owner. When multiple requests are made we have policies to select the winning route (e.g. deep most window).
  - Multiple read sites may use the same owner id can all access the granted route.
  - When owner_id is 0 we use the current Focus Scope ID as a owner ID in order to identify our location.
- You can chain two unrelated windows in the focus stack using SetWindowParentWindowForFocusRoute()
  e.g. if you have a tool window associated to a document, and you want document shortcuts to run when the tool is focused.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3948).
"""
Shortcut(
    key_chord::Union{ImGuiKeyChord,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer},
    owner_id::Union{ImGuiID,Integer},
) = igShortcut_ID(key_chord, flags, owner_id)

"""
$(TYPEDSIGNATURES)

Owner_id needs to be explicit and cannot be 0.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3949).
"""
SetShortcutRouting(
    key_chord::Union{ImGuiKeyChord,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer},
    owner_id::Union{ImGuiID,Integer},
) = igSetShortcutRouting(key_chord, flags, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3950).
"""
TestShortcutRouting(key_chord::Union{ImGuiKeyChord,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igTestShortcutRouting(key_chord, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3951).
"""
GetShortcutRoutingData(key_chord::Union{ImGuiKeyChord,Integer}) = igGetShortcutRoutingData(key_chord)

"""
$(TYPEDSIGNATURES)

Docking
(some functions are only declared in imgui.cpp, see Docking section).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3955).
"""
DockContextInitialize(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextInitialize(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3956).
"""
DockContextShutdown(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextShutdown(ctx)

"""
$(TYPEDSIGNATURES)

Use root_id==0 to clear all.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3957).
"""
DockContextClearNodes(ctx::VoidablePtrOrRef{ImGuiContext}, root_id::Union{ImGuiID,Integer}, clear_settings_refs) =
    igDockContextClearNodes(ctx, root_id, clear_settings_refs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3958).
"""
DockContextRebuildNodes(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextRebuildNodes(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3959).
"""
DockContextNewFrameUpdateUndocking(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextNewFrameUpdateUndocking(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3960).
"""
DockContextNewFrameUpdateDocking(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextNewFrameUpdateDocking(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3961).
"""
DockContextEndFrame(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextEndFrame(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3962).
"""
DockContextGenNodeID(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextGenNodeID(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3963).
"""
DockContextQueueDock(
    ctx::VoidablePtrOrRef{ImGuiContext},
    target::VoidablePtrOrRef{ImGuiWindow},
    target_node::VoidablePtrOrRef{ImGuiDockNode},
    payload::VoidablePtrOrRef{ImGuiWindow},
    split_dir::ImGuiDir,
    split_ratio,
    split_outer,
) = igDockContextQueueDock(ctx, target, target_node, payload, split_dir, split_ratio, split_outer)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3964).
"""
DockContextQueueUndockWindow(ctx::VoidablePtrOrRef{ImGuiContext}, window::VoidablePtrOrRef{ImGuiWindow}) =
    igDockContextQueueUndockWindow(ctx, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3965).
"""
DockContextQueueUndockNode(ctx::VoidablePtrOrRef{ImGuiContext}, node::VoidablePtrOrRef{ImGuiDockNode}) =
    igDockContextQueueUndockNode(ctx, node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3966).
"""
DockContextProcessUndockWindow(
    ctx::VoidablePtrOrRef{ImGuiContext},
    window::VoidablePtrOrRef{ImGuiWindow},
    clear_persistent_docking_ref = true,
) = igDockContextProcessUndockWindow(ctx, window, clear_persistent_docking_ref)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3967).
"""
DockContextProcessUndockNode(ctx::VoidablePtrOrRef{ImGuiContext}, node::VoidablePtrOrRef{ImGuiDockNode}) =
    igDockContextProcessUndockNode(ctx, node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3968).
"""
DockContextCalcDropPosForDocking(
    target::VoidablePtrOrRef{ImGuiWindow},
    target_node::VoidablePtrOrRef{ImGuiDockNode},
    payload_window::VoidablePtrOrRef{ImGuiWindow},
    payload_node::VoidablePtrOrRef{ImGuiDockNode},
    split_dir::ImGuiDir,
    split_outer,
    out_pos::VoidablePtrOrRef{ImVec2},
) = igDockContextCalcDropPosForDocking(
    target,
    target_node,
    payload_window,
    payload_node,
    split_dir,
    split_outer,
    out_pos,
)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3969).
"""
DockContextFindNodeByID(ctx::VoidablePtrOrRef{ImGuiContext}, id::Union{ImGuiID,Integer}) =
    igDockContextFindNodeByID(ctx, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3970).
"""
DockNodeWindowMenuHandler_Default(
    ctx::VoidablePtrOrRef{ImGuiContext},
    node::VoidablePtrOrRef{ImGuiDockNode},
    tab_bar::VoidablePtrOrRef{ImGuiTabBar},
) = igDockNodeWindowMenuHandler_Default(ctx, node, tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3971).
"""
DockNodeBeginAmendTabBar(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeBeginAmendTabBar(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3972).
"""
DockNodeEndAmendTabBar() = igDockNodeEndAmendTabBar()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3973).
"""
DockNodeGetRootNode(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeGetRootNode(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3974).
"""
DockNodeIsInHierarchyOf(node::VoidablePtrOrRef{ImGuiDockNode}, parent::VoidablePtrOrRef{ImGuiDockNode}) =
    igDockNodeIsInHierarchyOf(node, parent)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3975).
"""
DockNodeGetDepth(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeGetDepth(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3976).
"""
DockNodeGetWindowMenuButtonId(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeGetWindowMenuButtonId(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3977).
"""
GetWindowDockNode() = igGetWindowDockNode()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3978).
"""
GetWindowAlwaysWantOwnTabBar(window::VoidablePtrOrRef{ImGuiWindow}) = igGetWindowAlwaysWantOwnTabBar(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3979).
"""
BeginDocked(window::VoidablePtrOrRef{ImGuiWindow}, p_open) = igBeginDocked(window, p_open)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3980).
"""
BeginDockableDragDropSource(window::VoidablePtrOrRef{ImGuiWindow}) = igBeginDockableDragDropSource(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3981).
"""
BeginDockableDragDropTarget(window::VoidablePtrOrRef{ImGuiWindow}) = igBeginDockableDragDropTarget(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3982).
"""
SetWindowDock(
    window::VoidablePtrOrRef{ImGuiWindow},
    dock_id::Union{ImGuiID,Integer},
    cond::Union{ImGuiCond,ImGuiCond_,Integer},
) = igSetWindowDock(window, dock_id, cond)

"""
$(TYPEDSIGNATURES)

Docking - Builder function needs to be generally called before the node is used/submitted.
- The DockBuilderXXX functions are designed to _eventually_ become a public API, but it is too early to expose it and guarantee stability.
- Do not hold on ImGuiDockNode* pointers! They may be invalidated by any split/merge/remove operation and every frame.
- To create a DockSpace() node, make sure to set the ImGuiDockNodeFlags_DockSpace flag when calling DockBuilderAddNode().
  You can create dockspace nodes (attached to a window) _or_ floating nodes (carry its own window) with this API.
- DockBuilderSplitNode() create 2 child nodes within 1 node. The initial node becomes a parent node.
- If you intend to split the node immediately after creation using DockBuilderSplitNode(), make sure
  to call DockBuilderSetNodeSize() beforehand. If you don't, the resulting split sizes may not be reliable.
- Call DockBuilderFinish() after you are done.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3993).
"""
DockBuilderDockWindow(window_name, node_id::Union{ImGuiID,Integer}) = igDockBuilderDockWindow(window_name, node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3994).
"""
DockBuilderGetNode(node_id::Union{ImGuiID,Integer}) = igDockBuilderGetNode(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3995).
"""
DockBuilderGetCentralNode(node_id::Union{ImGuiID,Integer}) = igDockBuilderGetCentralNode(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3996).
"""
DockBuilderAddNode(
    node_id::Union{ImGuiID,Integer} = 0,
    flags::Union{ImGuiDockNodeFlags,ImGuiDockNodeFlags_,Integer} = 0,
) = igDockBuilderAddNode(node_id, flags)

"""
$(TYPEDSIGNATURES)

Remove node and all its child, undock all windows.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3997).
"""
DockBuilderRemoveNode(node_id::Union{ImGuiID,Integer}) = igDockBuilderRemoveNode(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3998).
"""
DockBuilderRemoveNodeDockedWindows(node_id::Union{ImGuiID,Integer}, clear_settings_refs = true) =
    igDockBuilderRemoveNodeDockedWindows(node_id, clear_settings_refs)

"""
$(TYPEDSIGNATURES)

Remove all split/hierarchy. All remaining docked windows will be re-docked to the remaining root node (node_id).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L3999).
"""
DockBuilderRemoveNodeChildNodes(node_id::Union{ImGuiID,Integer}) = igDockBuilderRemoveNodeChildNodes(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4000).
"""
DockBuilderSetNodePos(node_id::Union{ImGuiID,Integer}, pos::Union{ImVec2,NTuple{2}}) =
    igDockBuilderSetNodePos(node_id, pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4001).
"""
DockBuilderSetNodeSize(node_id::Union{ImGuiID,Integer}, size::Union{ImVec2,NTuple{2}}) =
    igDockBuilderSetNodeSize(node_id, size)

"""
$(TYPEDSIGNATURES)

Create 2 child nodes in this parent node.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4002).
"""
DockBuilderSplitNode(
    node_id::Union{ImGuiID,Integer},
    split_dir::ImGuiDir,
    size_ratio_for_node_at_dir,
    out_id_at_dir::VoidablePtrOrRef{ImGuiID},
    out_id_at_opposite_dir::VoidablePtrOrRef{ImGuiID},
) = igDockBuilderSplitNode(node_id, split_dir, size_ratio_for_node_at_dir, out_id_at_dir, out_id_at_opposite_dir)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4003).
"""
DockBuilderCopyDockSpace(
    src_dockspace_id::Union{ImGuiID,Integer},
    dst_dockspace_id::Union{ImGuiID,Integer},
    in_window_remap_pairs::VoidablePtrOrRef{ImVector_const_charPtr},
) = igDockBuilderCopyDockSpace(src_dockspace_id, dst_dockspace_id, in_window_remap_pairs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4004).
"""
DockBuilderCopyNode(
    src_node_id::Union{ImGuiID,Integer},
    dst_node_id::Union{ImGuiID,Integer},
    out_node_remap_pairs::VoidablePtrOrRef{ImVector_ImGuiID},
) = igDockBuilderCopyNode(src_node_id, dst_node_id, out_node_remap_pairs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4005).
"""
DockBuilderCopyWindowSettings(src_name, dst_name) = igDockBuilderCopyWindowSettings(src_name, dst_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4006).
"""
DockBuilderFinish(node_id::Union{ImGuiID,Integer}) = igDockBuilderFinish(node_id)

"""
$(TYPEDSIGNATURES)

[EXPERIMENTAL] Focus Scope
This is generally used to identify a unique input location (for e.g. a selection set)
There is one per window (automatically set in Begin), but:
- Selection patterns generally need to react (e.g. clear a selection) when landing on one item of the set.
  So in order to identify a set multiple lists in same window may each need a focus scope.
  If you imagine an hypothetical BeginSelectionGroup()/EndSelectionGroup() api, it would likely call PushFocusScope()/EndFocusScope()
- Shortcut routing also use focus scope as a default location identifier if an owner is not provided.
We don't use the ID Stack for this as it is common to want them separate.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4016).
"""
PushFocusScope(id::Union{ImGuiID,Integer}) = igPushFocusScope(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4017).
"""
PopFocusScope() = igPopFocusScope()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4018).
"""
IsInNavFocusRoute(focus_scope_id::Union{ImGuiID,Integer}) = igIsInNavFocusRoute(focus_scope_id)

"""
$(TYPEDSIGNATURES)

Focus scope we are outputting into, set by PushFocusScope().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4019).
"""
GetCurrentFocusScope() = igGetCurrentFocusScope()

"""
$(TYPEDSIGNATURES)

Drag and Drop.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4022).
"""
IsDragDropActive() = igIsDragDropActive()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4023).
"""
BeginDragDropTargetCustom(bb::ImRect, id::Union{ImGuiID,Integer}) = igBeginDragDropTargetCustom(bb, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4024).
"""
BeginDragDropTargetViewport(viewport::VoidablePtrOrRef{ImGuiViewport}, p_bb::VoidablePtrOrRef{ImRect} = C_NULL) =
    igBeginDragDropTargetViewport(viewport, p_bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4025).
"""
ClearDragDrop() = igClearDragDrop()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4026).
"""
IsDragDropPayloadBeingAccepted() = igIsDragDropPayloadBeingAccepted()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4027).
"""
RenderDragDropTargetRectForItem(bb::ImRect) = igRenderDragDropTargetRectForItem(bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4028).
"""
RenderDragDropTargetRectForViewport(viewport_id::Union{ImGuiID,Integer}, bb::ImRect) =
    igRenderDragDropTargetRectForViewport(viewport_id, bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4029).
"""
RenderDragDropTargetRectEx(draw_list::VoidablePtrOrRef{ImDrawList}, bb::ImRect, rounding) =
    igRenderDragDropTargetRectEx(draw_list, bb, rounding)

"""
$(TYPEDSIGNATURES)

Typing-Select API
(provide Windows Explorer style "select items by typing partial name" + "cycle through items by typing same letter" feature)
(this is currently not documented nor used by main library, but should work. See "widgets_typingselect" in imgui_test_suite for usage code. Please let us know if you use this!).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4034).
"""
GetTypingSelectRequest(
    flags::Union{ImGuiTypingSelectFlags,ImGuiTypingSelectFlags_,Integer} = ImGuiTypingSelectFlags_None,
) = igGetTypingSelectRequest(flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4035).
"""
TypingSelectFindMatch(
    req::VoidablePtrOrRef{ImGuiTypingSelectRequest},
    items_count,
    get_item_name_func,
    user_data,
    nav_item_idx,
) = igTypingSelectFindMatch(req, items_count, get_item_name_func, user_data, nav_item_idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4036).
"""
TypingSelectFindNextSingleCharMatch(
    req::VoidablePtrOrRef{ImGuiTypingSelectRequest},
    items_count,
    get_item_name_func,
    user_data,
    nav_item_idx,
) = igTypingSelectFindNextSingleCharMatch(req, items_count, get_item_name_func, user_data, nav_item_idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4037).
"""
TypingSelectFindBestLeadingMatch(
    req::VoidablePtrOrRef{ImGuiTypingSelectRequest},
    items_count,
    get_item_name_func,
    user_data,
) = igTypingSelectFindBestLeadingMatch(req, items_count, get_item_name_func, user_data)

"""
$(TYPEDSIGNATURES)

Box-Select API.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4040).
"""
BeginBoxSelect(
    scope_rect::ImRect,
    window::VoidablePtrOrRef{ImGuiWindow},
    box_select_id::Union{ImGuiID,Integer},
    ms_flags::Union{ImGuiMultiSelectFlags,ImGuiMultiSelectFlags_,Integer},
) = igBeginBoxSelect(scope_rect, window, box_select_id, ms_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4041).
"""
EndBoxSelect(scope_rect::ImRect, ms_flags::Union{ImGuiMultiSelectFlags,ImGuiMultiSelectFlags_,Integer}) =
    igEndBoxSelect(scope_rect, ms_flags)

"""
$(TYPEDSIGNATURES)

Multi-Select API.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4044).
"""
MultiSelectItemHeader(
    id::Union{ImGuiID,Integer},
    p_selected,
    p_button_flags::Union{VoidablePtrOrRef{ImGuiButtonFlags},VoidablePtrOrRef{ImGuiButtonFlags_}},
) = igMultiSelectItemHeader(id, p_selected, p_button_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4045).
"""
MultiSelectItemFooter(
    id::Union{ImGuiID,Integer},
    p_selected,
    p_pressed,
    extra_flags::Union{ImGuiMultiSelectFlags,ImGuiMultiSelectFlags_,Integer} = 0,
) = igMultiSelectItemFooter(id, p_selected, p_pressed, extra_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4046).
"""
MultiSelectAddSetAll(ms::VoidablePtrOrRef{ImGuiMultiSelectTempData}, selected) = igMultiSelectAddSetAll(ms, selected)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4047).
"""
MultiSelectAddSetRange(
    ms::VoidablePtrOrRef{ImGuiMultiSelectTempData},
    selected,
    range_dir,
    first_item::ImGuiSelectionUserData,
    last_item::ImGuiSelectionUserData,
) = igMultiSelectAddSetRange(ms, selected, range_dir, first_item, last_item)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4048).
"""
GetBoxSelectState(id::Union{ImGuiID,Integer}) = igGetBoxSelectState(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4049).
"""
GetMultiSelectState(id::Union{ImGuiID,Integer}) = igGetMultiSelectState(id)

"""
$(TYPEDSIGNATURES)

Tab Bars.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4052).
"""
GetCurrentTabBar() = igGetCurrentTabBar()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4053).
"""
TabBarFindByID(id::Union{ImGuiID,Integer}) = igTabBarFindByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4054).
"""
TabBarRemove(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) = igTabBarRemove(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4055).
"""
BeginTabBarEx(
    tab_bar::VoidablePtrOrRef{ImGuiTabBar},
    bb::ImRect,
    flags::Union{ImGuiTabBarFlags,ImGuiTabBarFlags_,Integer},
) = igBeginTabBarEx(tab_bar, bb, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4056).
"""
TabBarFindTabByID(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab_id::Union{ImGuiID,Integer}) =
    igTabBarFindTabByID(tab_bar, tab_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4057).
"""
TabBarFindTabByOrder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, order) = igTabBarFindTabByOrder(tab_bar, order)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4058).
"""
TabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) =
    igTabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4059).
"""
TabBarGetCurrentTab(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) = igTabBarGetCurrentTab(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4060).
"""
TabBarGetTabOrder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarGetTabOrder(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4061).
"""
TabBarGetTabName(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarGetTabName(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4062).
"""
TabBarGetTabPos(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarGetTabPos(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4063).
"""
TabBarAddTab(
    tab_bar::VoidablePtrOrRef{ImGuiTabBar},
    tab_flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer},
    window::VoidablePtrOrRef{ImGuiWindow},
) = igTabBarAddTab(tab_bar, tab_flags, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4064).
"""
TabBarRemoveTab(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab_id::Union{ImGuiID,Integer}) =
    igTabBarRemoveTab(tab_bar, tab_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4065).
"""
TabBarCloseTab(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarCloseTab(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4066).
"""
TabBarQueueFocus(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::PtrOrRef{ImGuiTabItem}) =
    igTabBarQueueFocus_TabItemPtr(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4067).
"""
TabBarQueueFocus(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab_name::Union{String,Ptr{Cchar}}) =
    igTabBarQueueFocus_Str(tab_bar, tab_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4068).
"""
TabBarQueueReorder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}, offset) =
    igTabBarQueueReorder(tab_bar, tab, offset)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4069).
"""
TabBarQueueReorderFromMousePos(
    tab_bar::VoidablePtrOrRef{ImGuiTabBar},
    tab::VoidablePtrOrRef{ImGuiTabItem},
    mouse_pos::Union{ImVec2,NTuple{2}},
) = igTabBarQueueReorderFromMousePos(tab_bar, tab, mouse_pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4070).
"""
TabBarProcessReorder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) = igTabBarProcessReorder(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4071).
"""
TabItemEx(
    tab_bar::VoidablePtrOrRef{ImGuiTabBar},
    label,
    p_open,
    flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer},
    docked_window::VoidablePtrOrRef{ImGuiWindow},
) = igTabItemEx(tab_bar, label, p_open, flags, docked_window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4072).
"""
TabItemSpacing(str_id, flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer}, width) =
    igTabItemSpacing(str_id, flags, width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4073).
"""
TabItemCalcSize(label::Union{String,Ptr{Cchar}}, has_close_button_or_unsaved_marker::Bool) =
    igTabItemCalcSize_Str(label, has_close_button_or_unsaved_marker)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4074).
"""
TabItemCalcSize(window::VoidablePtrOrRef{ImGuiWindow}) = igTabItemCalcSize_WindowPtr(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4075).
"""
TabItemBackground(
    draw_list::VoidablePtrOrRef{ImDrawList},
    bb::ImRect,
    flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer},
    col::Union{ImU32,Integer},
) = igTabItemBackground(draw_list, bb, flags, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4076).
"""
TabItemLabelAndCloseButton(
    draw_list::VoidablePtrOrRef{ImDrawList},
    bb::ImRect,
    flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer},
    frame_padding::Union{ImVec2,NTuple{2}},
    label,
    tab_id::Union{ImGuiID,Integer},
    close_button_id::Union{ImGuiID,Integer},
    is_contents_visible,
    out_just_closed,
    out_text_clipped,
) = igTabItemLabelAndCloseButton(
    draw_list,
    bb,
    flags,
    frame_padding,
    label,
    tab_id,
    close_button_id,
    is_contents_visible,
    out_just_closed,
    out_text_clipped,
)

"""
$(TYPEDSIGNATURES)

Render helpers
AVOID USING OUTSIDE OF IMGUI.CPP! NOT FOR PUBLIC CONSUMPTION. THOSE FUNCTIONS ARE A MESS. THEIR SIGNATURE AND BEHAVIOR WILL CHANGE, THEY NEED TO BE REFACTORED INTO SOMETHING DECENT.
NB: All position are in absolute pixels coordinates (we are never using window coordinates internally).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4081).
"""
RenderText(pos::Union{ImVec2,NTuple{2}}, text, text_end = C_NULL, hide_text_after_hash = true) =
    igRenderText(pos, text, text_end, hide_text_after_hash)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4082).
"""
RenderTextWrapped(pos::Union{ImVec2,NTuple{2}}, text, text_end, wrap_width) =
    igRenderTextWrapped(pos, text, text_end, wrap_width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4083).
"""
RenderTextClipped(
    pos_min::Union{ImVec2,NTuple{2}},
    pos_max::Union{ImVec2,NTuple{2}},
    text,
    text_end,
    text_size_if_known::VoidablePtrOrRef{ImVec2},
    align::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    clip_rect::VoidablePtrOrRef{ImRect} = C_NULL,
) = igRenderTextClipped(pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4084).
"""
RenderTextClippedEx(
    draw_list::VoidablePtrOrRef{ImDrawList},
    pos_min::Union{ImVec2,NTuple{2}},
    pos_max::Union{ImVec2,NTuple{2}},
    text,
    text_end,
    text_size_if_known::VoidablePtrOrRef{ImVec2},
    align::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    clip_rect::VoidablePtrOrRef{ImRect} = C_NULL,
) = igRenderTextClippedEx(draw_list, pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4085).
"""
RenderTextEllipsis(
    draw_list::VoidablePtrOrRef{ImDrawList},
    pos_min::Union{ImVec2,NTuple{2}},
    pos_max::Union{ImVec2,NTuple{2}},
    ellipsis_max_x,
    text,
    text_end,
    text_size_if_known::VoidablePtrOrRef{ImVec2},
) = igRenderTextEllipsis(draw_list, pos_min, pos_max, ellipsis_max_x, text, text_end, text_size_if_known)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4086).
"""
RenderFrame(
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    fill_col::Union{ImU32,Integer},
    borders = true,
    rounding = 0.0f0,
) = igRenderFrame(p_min, p_max, fill_col, borders, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4087).
"""
RenderFrameBorder(p_min::Union{ImVec2,NTuple{2}}, p_max::Union{ImVec2,NTuple{2}}, rounding = 0.0f0) =
    igRenderFrameBorder(p_min, p_max, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4088).
"""
RenderColorComponentMarker(bb::ImRect, col::Union{ImU32,Integer}, rounding) =
    igRenderColorComponentMarker(bb, col, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4089).
"""
RenderColorRectWithAlphaCheckerboard(
    draw_list::VoidablePtrOrRef{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    alpha,
    grid_step,
    grid_off::Union{ImVec2,NTuple{2}},
    rounding = 0.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = igRenderColorRectWithAlphaCheckerboard(draw_list, p_min, p_max, col, alpha, grid_step, grid_off, rounding, flags)

"""
$(TYPEDSIGNATURES)

Navigation highlight.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4090).
"""
RenderNavCursor(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    flags::Union{ImGuiNavRenderCursorFlags,ImGuiNavRenderCursorFlags_,Integer} = ImGuiNavRenderCursorFlags_None,
    rounding = -1.0f0,
) = igRenderNavCursor(bb, id, flags, rounding)

"""
$(TYPEDSIGNATURES)

Find the optional ## from which we stop displaying text.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4094).
"""
FindRenderedTextEnd(text, text_end = C_NULL) = igFindRenderedTextEnd(text, text_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4095).
"""
RenderMouseCursor(
    pos::Union{ImVec2,NTuple{2}},
    scale,
    mouse_cursor::Union{ImGuiMouseCursor,ImGuiMouseCursor_,Integer},
    col_fill::Union{ImU32,Integer},
    col_border::Union{ImU32,Integer},
    col_shadow::Union{ImU32,Integer},
) = igRenderMouseCursor(pos, scale, mouse_cursor, col_fill, col_border, col_shadow)

"""
$(TYPEDSIGNATURES)

Render helpers (those functions don't access any ImGui state!).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4098).
"""
RenderArrow(
    draw_list::VoidablePtrOrRef{ImDrawList},
    pos::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    dir::ImGuiDir,
    scale = 1.0f0,
) = igRenderArrow(draw_list, pos, col, dir, scale)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4099).
"""
RenderBullet(draw_list::VoidablePtrOrRef{ImDrawList}, pos::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}) =
    igRenderBullet(draw_list, pos, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4100).
"""
RenderCheckMark(draw_list::VoidablePtrOrRef{ImDrawList}, pos::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}, sz) =
    igRenderCheckMark(draw_list, pos, col, sz)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4101).
"""
RenderArrowPointingAt(
    draw_list::VoidablePtrOrRef{ImDrawList},
    pos::Union{ImVec2,NTuple{2}},
    half_sz::Union{ImVec2,NTuple{2}},
    direction::ImGuiDir,
    col::Union{ImU32,Integer},
) = igRenderArrowPointingAt(draw_list, pos, half_sz, direction, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4102).
"""
RenderArrowDockMenu(
    draw_list::VoidablePtrOrRef{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    sz,
    col::Union{ImU32,Integer},
) = igRenderArrowDockMenu(draw_list, p_min, sz, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4103).
"""
RenderRectFilledInRangeH(
    draw_list::VoidablePtrOrRef{ImDrawList},
    rect::ImRect,
    col::Union{ImU32,Integer},
    fill_x0,
    fill_x1,
    rounding,
) = igRenderRectFilledInRangeH(draw_list, rect, col, fill_x0, fill_x1, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4104).
"""
RenderRectFilledWithHole(
    draw_list::VoidablePtrOrRef{ImDrawList},
    outer::ImRect,
    inner::ImRect,
    col::Union{ImU32,Integer},
    rounding,
) = igRenderRectFilledWithHole(draw_list, outer, inner, col, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4105).
"""
CalcRoundingFlagsForRectInRect(r_in::ImRect, r_outer::ImRect, threshold) =
    igCalcRoundingFlagsForRectInRect(r_in, r_outer, threshold)

"""
$(TYPEDSIGNATURES)

Widgets: Text.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4108).
"""
TextEx(text, text_end = C_NULL, flags::Union{ImGuiTextFlags,ImGuiTextFlags_,Integer} = 0) =
    igTextEx(text, text_end, flags)

"""
$(TYPEDSIGNATURES)

FIXME-WIP: Works but API is likely to be reworked.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4109).
"""
TextAligned(align_x, width, fmt) = igTextAligned(align_x, width, fmt)

"""
$(TYPEDSIGNATURES)

Widgets.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4113).
"""
ButtonEx(
    label,
    size_arg::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    flags::Union{ImGuiButtonFlags,ImGuiButtonFlags_,Integer} = 0,
) = igButtonEx(label, size_arg, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4114).
"""
ArrowButtonEx(
    str_id,
    dir::ImGuiDir,
    size_arg::Union{ImVec2,NTuple{2}},
    flags::Union{ImGuiButtonFlags,ImGuiButtonFlags_,Integer} = 0,
) = igArrowButtonEx(str_id, dir, size_arg, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4115).
"""
ImageButtonEx(
    id::Union{ImGuiID,Integer},
    tex_ref::ImTextureRef,
    image_size::Union{ImVec2,NTuple{2}},
    uv0::Union{ImVec2,NTuple{2}},
    uv1::Union{ImVec2,NTuple{2}},
    bg_col::Union{ImVec4,NTuple{4}},
    tint_col::Union{ImVec4,NTuple{4}},
    flags::Union{ImGuiButtonFlags,ImGuiButtonFlags_,Integer} = 0,
) = igImageButtonEx(id, tex_ref, image_size, uv0, uv1, bg_col, tint_col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4116).
"""
SeparatorEx(flags::Union{ImGuiSeparatorFlags,ImGuiSeparatorFlags_,Integer}, thickness = 1.0f0) =
    igSeparatorEx(flags, thickness)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4117).
"""
SeparatorTextEx(id::Union{ImGuiID,Integer}, label, label_end, extra_width) =
    igSeparatorTextEx(id, label, label_end, extra_width)

"""
$(TYPEDSIGNATURES)

Widgets: Window Decorations.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4122).
"""
CloseButton(id::Union{ImGuiID,Integer}, pos::Union{ImVec2,NTuple{2}}) = igCloseButton(id, pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4123).
"""
CollapseButton(id::Union{ImGuiID,Integer}, pos::Union{ImVec2,NTuple{2}}, dock_node::VoidablePtrOrRef{ImGuiDockNode}) =
    igCollapseButton(id, pos, dock_node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4124).
"""
Scrollbar(axis::ImGuiAxis) = igScrollbar(axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4125).
"""
ScrollbarEx(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    axis::ImGuiAxis,
    p_scroll_v::VoidablePtrOrRef{ImS64},
    avail_v::ImS64,
    contents_v::ImS64,
    draw_rounding_flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = igScrollbarEx(bb, id, axis, p_scroll_v, avail_v, contents_v, draw_rounding_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4126).
"""
GetWindowScrollbarRect(window::VoidablePtrOrRef{ImGuiWindow}, axis::ImGuiAxis) = igGetWindowScrollbarRect(window, axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4127).
"""
GetWindowScrollbarID(window::VoidablePtrOrRef{ImGuiWindow}, axis::ImGuiAxis) = igGetWindowScrollbarID(window, axis)

"""
$(TYPEDSIGNATURES)

0..3: corners.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4128).
"""
GetWindowResizeCornerID(window::VoidablePtrOrRef{ImGuiWindow}, n) = igGetWindowResizeCornerID(window, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4129).
"""
GetWindowResizeBorderID(window::VoidablePtrOrRef{ImGuiWindow}, dir::ImGuiDir) = igGetWindowResizeBorderID(window, dir)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4130).
"""
ExtendHitBoxWhenNearViewportEdge(
    window::VoidablePtrOrRef{ImGuiWindow},
    bb::VoidablePtrOrRef{ImRect},
    threshold,
    axis::ImGuiAxis,
) = igExtendHitBoxWhenNearViewportEdge(window, bb, threshold, axis)

"""
$(TYPEDSIGNATURES)

Widgets low-level behaviors.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4133).
"""
ButtonBehavior(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    out_hovered,
    out_held,
    flags::Union{ImGuiButtonFlags,ImGuiButtonFlags_,Integer} = 0,
) = igButtonBehavior(bb, id, out_hovered, out_held, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4134).
"""
DragBehavior(
    id::Union{ImGuiID,Integer},
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_v,
    v_speed,
    p_min,
    p_max,
    format,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer},
) = igDragBehavior(id, data_type, p_v, v_speed, p_min, p_max, format, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4135).
"""
SliderBehavior(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_v,
    p_min,
    p_max,
    format,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer},
    out_grab_bb::VoidablePtrOrRef{ImRect},
) = igSliderBehavior(bb, id, data_type, p_v, p_min, p_max, format, flags, out_grab_bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4136).
"""
SplitterBehavior(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    axis::ImGuiAxis,
    size1,
    size2,
    min_size1,
    min_size2,
    hover_extend = 0.0f0,
    hover_visibility_delay = 0.0f0,
    bg_col::Union{ImU32,Integer} = 0,
) = igSplitterBehavior(bb, id, axis, size1, size2, min_size1, min_size2, hover_extend, hover_visibility_delay, bg_col)

"""
$(TYPEDSIGNATURES)

Widgets: Tree Nodes.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4139).
"""
TreeNodeBehavior(
    id::Union{ImGuiID,Integer},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
    label,
    label_end = C_NULL,
) = igTreeNodeBehavior(id, flags, label, label_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4140).
"""
TreeNodeDrawLineToChildNode(target_pos::Union{ImVec2,NTuple{2}}) = igTreeNodeDrawLineToChildNode(target_pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4141).
"""
TreeNodeDrawLineToTreePop(data::VoidablePtrOrRef{ImGuiTreeNodeStackData}) = igTreeNodeDrawLineToTreePop(data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4142).
"""
TreePushOverrideID(id::Union{ImGuiID,Integer}) = igTreePushOverrideID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4143).
"""
TreeNodeSetOpen(storage_id::Union{ImGuiID,Integer}, open) = igTreeNodeSetOpen(storage_id, open)

"""
$(TYPEDSIGNATURES)

Return open state. Consume previous SetNextItemOpen() data, if any. May return true when logging.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4144).
"""
TreeNodeUpdateNextOpen(
    storage_id::Union{ImGuiID,Integer},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
) = igTreeNodeUpdateNextOpen(storage_id, flags)

"""
$(TYPEDSIGNATURES)

Data type helpers.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4157).
"""
DataTypeGetInfo(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}) = igDataTypeGetInfo(data_type)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4158).
"""
DataTypeFormatString(buf, buf_size, data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data, format) =
    igDataTypeFormatString(buf, buf_size, data_type, p_data, format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4159).
"""
DataTypeApplyOp(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, op, output, arg_1, arg_2) =
    igDataTypeApplyOp(data_type, op, output, arg_1, arg_2)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4160).
"""
DataTypeApplyFromText(
    buf,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    format,
    p_data_when_empty = C_NULL,
) = igDataTypeApplyFromText(buf, data_type, p_data, format, p_data_when_empty)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4161).
"""
DataTypeCompare(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, arg_1, arg_2) =
    igDataTypeCompare(data_type, arg_1, arg_2)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4162).
"""
DataTypeClamp(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data, p_min, p_max) =
    igDataTypeClamp(data_type, p_data, p_min, p_max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4163).
"""
DataTypeIsZero(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data) = igDataTypeIsZero(data_type, p_data)

"""
$(TYPEDSIGNATURES)

InputText.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4166).
"""
InputTextEx(
    label,
    hint,
    buf,
    buf_size,
    size_arg::Union{ImVec2,NTuple{2}},
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer},
    callback::Union{ImGuiInputTextCallback,Base.CFunction,Ptr{Cvoid}} = C_NULL,
    user_data = C_NULL,
) = igInputTextEx(label, hint, buf, buf_size, size_arg, flags, callback, user_data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4167).
"""
InputTextDeactivateHook(id::Union{ImGuiID,Integer}) = igInputTextDeactivateHook(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4168).
"""
TempInputText(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    label,
    buf,
    buf_size,
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
    callback::Union{ImGuiInputTextCallback,Base.CFunction,Ptr{Cvoid}} = C_NULL,
    user_data = C_NULL,
) = igTempInputText(bb, id, label, buf, buf_size, flags, callback, user_data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4169).
"""
TempInputScalar(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    label,
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    p_data,
    format,
    p_clamp_min = C_NULL,
    p_clamp_max = C_NULL,
) = igTempInputScalar(bb, id, label, data_type, p_data, format, p_clamp_min, p_clamp_max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4170).
"""
TempInputIsActive(id::Union{ImGuiID,Integer}) = igTempInputIsActive(id)

"""
$(TYPEDSIGNATURES)

Get input text state if active.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4171).
"""
GetInputTextState(id::Union{ImGuiID,Integer}) = igGetInputTextState(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4172).
"""
SetNextItemRefVal(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data) =
    igSetNextItemRefVal(data_type, p_data)

"""
$(TYPEDSIGNATURES)

This may be useful to apply workaround that a based on distinguish whenever an item is active as a text input field.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4173).
"""
IsItemActiveAsInputText() = igIsItemActiveAsInputText()

"""
$(TYPEDSIGNATURES)

Color.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4176).
"""
ColorTooltip(text, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) =
    igColorTooltip(text, col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4177).
"""
ColorEditOptionsPopup(col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) =
    igColorEditOptionsPopup(col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4178).
"""
ColorPickerOptionsPopup(ref_col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) =
    igColorPickerOptionsPopup(ref_col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4179).
"""
SetNextItemColorMarker(col::Union{ImU32,Integer}) = igSetNextItemColorMarker(col)

"""
$(TYPEDSIGNATURES)

Plot.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4182).
"""
PlotEx(
    plot_type::ImGuiPlotType,
    label,
    values_getter,
    data,
    values_count,
    values_offset,
    overlay_text,
    scale_min,
    scale_max,
    size_arg::Union{ImVec2,NTuple{2}},
) = igPlotEx(
    plot_type,
    label,
    values_getter,
    data,
    values_count,
    values_offset,
    overlay_text,
    scale_min,
    scale_max,
    size_arg,
)

"""
$(TYPEDSIGNATURES)

Shade functions (write over already created vertices).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4185).
"""
ShadeVertsLinearColorGradientKeepAlpha(
    draw_list::VoidablePtrOrRef{ImDrawList},
    vert_start_idx,
    vert_end_idx,
    gradient_p0::Union{ImVec2,NTuple{2}},
    gradient_p1::Union{ImVec2,NTuple{2}},
    col0::Union{ImU32,Integer},
    col1::Union{ImU32,Integer},
) = igShadeVertsLinearColorGradientKeepAlpha(
    draw_list,
    vert_start_idx,
    vert_end_idx,
    gradient_p0,
    gradient_p1,
    col0,
    col1,
)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4186).
"""
ShadeVertsLinearUV(
    draw_list::VoidablePtrOrRef{ImDrawList},
    vert_start_idx,
    vert_end_idx,
    a::Union{ImVec2,NTuple{2}},
    b::Union{ImVec2,NTuple{2}},
    uv_a::Union{ImVec2,NTuple{2}},
    uv_b::Union{ImVec2,NTuple{2}},
    clamp,
) = igShadeVertsLinearUV(draw_list, vert_start_idx, vert_end_idx, a, b, uv_a, uv_b, clamp)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4187).
"""
ShadeVertsTransformPos(
    draw_list::VoidablePtrOrRef{ImDrawList},
    vert_start_idx,
    vert_end_idx,
    pivot_in::Union{ImVec2,NTuple{2}},
    cos_a,
    sin_a,
    pivot_out::Union{ImVec2,NTuple{2}},
) = igShadeVertsTransformPos(draw_list, vert_start_idx, vert_end_idx, pivot_in, cos_a, sin_a, pivot_out)

"""
$(TYPEDSIGNATURES)

Garbage collection.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4190).
"""
GcCompactTransientMiscBuffers() = igGcCompactTransientMiscBuffers()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4191).
"""
GcCompactTransientWindowBuffers(window::VoidablePtrOrRef{ImGuiWindow}) = igGcCompactTransientWindowBuffers(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4192).
"""
GcAwakeTransientWindowBuffers(window::VoidablePtrOrRef{ImGuiWindow}) = igGcAwakeTransientWindowBuffers(window)

"""
$(TYPEDSIGNATURES)

Error handling, State Recovery.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4195).
"""
ErrorLog(msg) = igErrorLog(msg)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4196).
"""
ErrorRecoveryStoreState(state_out::VoidablePtrOrRef{ImGuiErrorRecoveryState}) = igErrorRecoveryStoreState(state_out)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4197).
"""
ErrorRecoveryTryToRecoverState(state_in::VoidablePtrOrRef{ImGuiErrorRecoveryState}) =
    igErrorRecoveryTryToRecoverState(state_in)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4198).
"""
ErrorRecoveryTryToRecoverWindowState(state_in::VoidablePtrOrRef{ImGuiErrorRecoveryState}) =
    igErrorRecoveryTryToRecoverWindowState(state_in)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4199).
"""
ErrorCheckUsingSetCursorPosToExtendParentBoundaries() = igErrorCheckUsingSetCursorPosToExtendParentBoundaries()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4200).
"""
ErrorCheckEndFrameFinalizeErrorTooltip() = igErrorCheckEndFrameFinalizeErrorTooltip()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4201).
"""
BeginErrorTooltip() = igBeginErrorTooltip()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4202).
"""
EndErrorTooltip() = igEndErrorTooltip()

"""
$(TYPEDSIGNATURES)

Demo Doc Marker for e.g. imgui_explorer.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4205).
"""
DemoMarker(file, line, section) = igDemoMarker(file, line, section)

"""
$(TYPEDSIGNATURES)

Debug Tools// size >= 0 : alloc, size = -1 : free.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4208).
"""
DebugAllocHook(info::VoidablePtrOrRef{ImGuiDebugAllocInfo}, frame_count, ptr, size) =
    igDebugAllocHook(info, frame_count, ptr, size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4209).
"""
DebugDrawCursorPos(col::Union{ImU32,Integer} = 4278190335) = igDebugDrawCursorPos(col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4210).
"""
DebugDrawLineExtents(col::Union{ImU32,Integer} = 4278190335) = igDebugDrawLineExtents(col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4211).
"""
DebugDrawItemRect(col::Union{ImU32,Integer} = 4278190335) = igDebugDrawItemRect(col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4212).
"""
DebugTextUnformattedWithLocateItem(line_begin, line_end) = igDebugTextUnformattedWithLocateItem(line_begin, line_end)

"""
$(TYPEDSIGNATURES)

Call sparingly: only 1 at the same time!

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4213).
"""
DebugLocateItem(target_id::Union{ImGuiID,Integer}) = igDebugLocateItem(target_id)

"""
$(TYPEDSIGNATURES)

Only call on reaction to a mouse Hover: because only 1 at the same time!

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4214).
"""
DebugLocateItemOnHover(target_id::Union{ImGuiID,Integer}) = igDebugLocateItemOnHover(target_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4215).
"""
DebugLocateItemResolveWithLastItem() = igDebugLocateItemResolveWithLastItem()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4216).
"""
DebugBreakClearData() = igDebugBreakClearData()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4217).
"""
DebugBreakButton(label, description_of_location) = igDebugBreakButton(label, description_of_location)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4218).
"""
DebugBreakButtonTooltip(keyboard_only, description_of_location) =
    igDebugBreakButtonTooltip(keyboard_only, description_of_location)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4219).
"""
ShowFontAtlas(atlas::VoidablePtrOrRef{ImFontAtlas}) = igShowFontAtlas(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4220).
"""
DebugTextureIDToU64(tex_id::ImTextureID) = igDebugTextureIDToU64(tex_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4221).
"""
DebugHookIdInfo(
    id::Union{ImGuiID,Integer},
    data_type::Union{ImGuiDataType,ImGuiDataType_,Integer},
    data_id,
    data_id_end,
) = igDebugHookIdInfo(id, data_type, data_id, data_id_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4222).
"""
DebugNodeColumns(columns::VoidablePtrOrRef{ImGuiOldColumns}) = igDebugNodeColumns(columns)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4223).
"""
DebugNodeDockNode(node::VoidablePtrOrRef{ImGuiDockNode}, label) = igDebugNodeDockNode(node, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4224).
"""
DebugNodeDrawList(
    window::VoidablePtrOrRef{ImGuiWindow},
    viewport::VoidablePtrOrRef{ImGuiViewportP},
    draw_list::VoidablePtrOrRef{ImDrawList},
    label,
) = igDebugNodeDrawList(window, viewport, draw_list, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4225).
"""
DebugNodeDrawCmdShowMeshAndBoundingBox(
    out_draw_list::VoidablePtrOrRef{ImDrawList},
    draw_list::VoidablePtrOrRef{ImDrawList},
    draw_cmd::VoidablePtrOrRef{ImDrawCmd},
    show_mesh,
    show_aabb,
) = igDebugNodeDrawCmdShowMeshAndBoundingBox(out_draw_list, draw_list, draw_cmd, show_mesh, show_aabb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4226).
"""
DebugNodeFont(font::VoidablePtrOrRef{ImFont}) = igDebugNodeFont(font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4227).
"""
DebugNodeFontGlyphsForSrcMask(font::VoidablePtrOrRef{ImFont}, baked::VoidablePtrOrRef{ImFontBaked}, src_mask) =
    igDebugNodeFontGlyphsForSrcMask(font, baked, src_mask)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4228).
"""
DebugNodeFontGlyph(font::VoidablePtrOrRef{ImFont}, glyph::VoidablePtrOrRef{ImFontGlyph}) =
    igDebugNodeFontGlyph(font, glyph)

"""
$(TYPEDSIGNATURES)

ID used to facilitate persisting the "current" texture.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4229).
"""
DebugNodeTexture(
    tex::VoidablePtrOrRef{ImTextureData},
    int_id,
    highlight_rect::VoidablePtrOrRef{ImFontAtlasRect} = C_NULL,
) = igDebugNodeTexture(tex, int_id, highlight_rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4230).
"""
DebugNodeStorage(storage::VoidablePtrOrRef{ImGuiStorage}, label) = igDebugNodeStorage(storage, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4231).
"""
DebugNodeTabBar(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, label) = igDebugNodeTabBar(tab_bar, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4232).
"""
DebugNodeTable(table::VoidablePtrOrRef{ImGuiTable}) = igDebugNodeTable(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4233).
"""
DebugNodeTableSettings(settings::VoidablePtrOrRef{ImGuiTableSettings}, table::VoidablePtrOrRef{ImGuiTable}) =
    igDebugNodeTableSettings(settings, table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4234).
"""
DebugNodeInputTextState(state::VoidablePtrOrRef{ImGuiInputTextState}) = igDebugNodeInputTextState(state)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4235).
"""
DebugNodeTypingSelectState(state::VoidablePtrOrRef{ImGuiTypingSelectState}) = igDebugNodeTypingSelectState(state)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4236).
"""
DebugNodeMultiSelectState(state::VoidablePtrOrRef{ImGuiMultiSelectState}) = igDebugNodeMultiSelectState(state)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4237).
"""
DebugNodeWindow(window::VoidablePtrOrRef{ImGuiWindow}, label) = igDebugNodeWindow(window, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4238).
"""
DebugNodeWindowSettings(settings::VoidablePtrOrRef{ImGuiWindowSettings}) = igDebugNodeWindowSettings(settings)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4239).
"""
DebugNodeWindowsList(windows::VoidablePtrOrRef{ImVector_ImGuiWindowPtr}, label) = igDebugNodeWindowsList(windows, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4241).
"""
DebugNodeViewport(viewport::VoidablePtrOrRef{ImGuiViewportP}) = igDebugNodeViewport(viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4242).
"""
DebugNodePlatformMonitor(monitor::VoidablePtrOrRef{ImGuiPlatformMonitor}, label, idx) =
    igDebugNodePlatformMonitor(monitor, label, idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4243).
"""
DebugRenderKeyboardPreview(draw_list::VoidablePtrOrRef{ImDrawList}) = igDebugRenderKeyboardPreview(draw_list)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4244).
"""
DebugRenderViewportThumbnail(
    draw_list::VoidablePtrOrRef{ImDrawList},
    viewport::VoidablePtrOrRef{ImGuiViewportP},
    bb::ImRect,
) = igDebugRenderViewportThumbnail(draw_list, viewport, bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4287).
"""
lib.ImFontLoader() = ImFontLoader_ImFontLoader()

"""
Destructor for `ImFontLoader`
"""
Destroy(self::Ptr{ImFontLoader}) = ImFontLoader_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4291).
"""
ImFontAtlasGetFontLoaderForStbTruetype() = igImFontAtlasGetFontLoaderForStbTruetype()

"""
$(TYPEDSIGNATURES)

Refer to ImFontAtlasPackGetRect() to better understand how this works.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4313).
"""
ImFontAtlasRectId_GetIndex(id::Union{ImFontAtlasRectId,Integer}) = igImFontAtlasRectId_GetIndex(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4314).
"""
ImFontAtlasRectId_GetGeneration(id::Union{ImFontAtlasRectId,Integer}) = igImFontAtlasRectId_GetGeneration(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4315).
"""
ImFontAtlasRectId_Make(index_idx, gen_idx) = igImFontAtlasRectId_Make(index_idx, gen_idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4390).
"""
lib.ImFontAtlasBuilder() = ImFontAtlasBuilder_ImFontAtlasBuilder()

"""
Destructor for `ImFontAtlasBuilder`
"""
Destroy(self::Ptr{ImFontAtlasBuilder}) = ImFontAtlasBuilder_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4393).
"""
ImFontAtlasBuildInit(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildInit(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4394).
"""
ImFontAtlasBuildDestroy(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildDestroy(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4395).
"""
ImFontAtlasBuildMain(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildMain(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4396).
"""
ImFontAtlasBuildSetupFontLoader(atlas::VoidablePtrOrRef{ImFontAtlas}, font_loader::VoidablePtrOrRef{ImFontLoader}) =
    igImFontAtlasBuildSetupFontLoader(atlas, font_loader)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4397).
"""
ImFontAtlasBuildNotifySetFont(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    old_font::VoidablePtrOrRef{ImFont},
    new_font::VoidablePtrOrRef{ImFont},
) = igImFontAtlasBuildNotifySetFont(atlas, old_font, new_font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4398).
"""
ImFontAtlasBuildUpdatePointers(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildUpdatePointers(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4399).
"""
ImFontAtlasBuildRenderBitmapFromString(atlas::VoidablePtrOrRef{ImFontAtlas}, x, y, w, h, in_str, in_marker_char) =
    igImFontAtlasBuildRenderBitmapFromString(atlas, x, y, w, h, in_str, in_marker_char)

"""
$(TYPEDSIGNATURES)

Clear output and custom rects.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4400).
"""
ImFontAtlasBuildClear(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildClear(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4402).
"""
ImFontAtlasTextureAdd(atlas::VoidablePtrOrRef{ImFontAtlas}, w, h) = igImFontAtlasTextureAdd(atlas, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4403).
"""
ImFontAtlasTextureMakeSpace(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasTextureMakeSpace(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4404).
"""
ImFontAtlasTextureRepack(atlas::VoidablePtrOrRef{ImFontAtlas}, w, h) = igImFontAtlasTextureRepack(atlas, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4405).
"""
ImFontAtlasTextureGrow(atlas::VoidablePtrOrRef{ImFontAtlas}, old_w = -1, old_h = -1) =
    igImFontAtlasTextureGrow(atlas, old_w, old_h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4406).
"""
ImFontAtlasTextureCompact(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasTextureCompact(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4407).
"""
ImFontAtlasTextureGetSizeEstimate(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasTextureGetSizeEstimate(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4409).
"""
ImFontAtlasBuildSetupFontSpecialGlyphs(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    src::VoidablePtrOrRef{ImFontConfig},
) = igImFontAtlasBuildSetupFontSpecialGlyphs(atlas, font, src)

"""
$(TYPEDSIGNATURES)

Legacy.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4410).
"""
ImFontAtlasBuildLegacyPreloadAllGlyphRanges(atlas::VoidablePtrOrRef{ImFontAtlas}) =
    igImFontAtlasBuildLegacyPreloadAllGlyphRanges(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4411).
"""
ImFontAtlasBuildGetOversampleFactors(
    src::VoidablePtrOrRef{ImFontConfig},
    baked::VoidablePtrOrRef{ImFontBaked},
    out_oversample_h,
    out_oversample_v,
) = igImFontAtlasBuildGetOversampleFactors(src, baked, out_oversample_h, out_oversample_v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4412).
"""
ImFontAtlasBuildDiscardBakes(atlas::VoidablePtrOrRef{ImFontAtlas}, unused_frames) =
    igImFontAtlasBuildDiscardBakes(atlas, unused_frames)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4414).
"""
ImFontAtlasFontSourceInit(atlas::VoidablePtrOrRef{ImFontAtlas}, src::VoidablePtrOrRef{ImFontConfig}) =
    igImFontAtlasFontSourceInit(atlas, src)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4415).
"""
ImFontAtlasFontSourceAddToFont(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    src::VoidablePtrOrRef{ImFontConfig},
) = igImFontAtlasFontSourceAddToFont(atlas, font, src)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4416).
"""
ImFontAtlasFontDestroySourceData(atlas::VoidablePtrOrRef{ImFontAtlas}, src::VoidablePtrOrRef{ImFontConfig}) =
    igImFontAtlasFontDestroySourceData(atlas, src)

"""
$(TYPEDSIGNATURES)

Using FontDestroyOutput/FontInitOutput sequence useful notably if font loader params have changed.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4417).
"""
ImFontAtlasFontInitOutput(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) =
    igImFontAtlasFontInitOutput(atlas, font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4418).
"""
ImFontAtlasFontDestroyOutput(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) =
    igImFontAtlasFontDestroyOutput(atlas, font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4419).
"""
ImFontAtlasFontRebuildOutput(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) =
    igImFontAtlasFontRebuildOutput(atlas, font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4420).
"""
ImFontAtlasFontDiscardBakes(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}, unused_frames) =
    igImFontAtlasFontDiscardBakes(atlas, font, unused_frames)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4422).
"""
ImFontAtlasBakedGetId(font_id::Union{ImGuiID,Integer}, baked_size, rasterizer_density) =
    igImFontAtlasBakedGetId(font_id, baked_size, rasterizer_density)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4423).
"""
ImFontAtlasBakedGetOrAdd(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    font_size,
    font_rasterizer_density,
) = igImFontAtlasBakedGetOrAdd(atlas, font, font_size, font_rasterizer_density)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4424).
"""
ImFontAtlasBakedGetClosestMatch(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    font_size,
    font_rasterizer_density,
) = igImFontAtlasBakedGetClosestMatch(atlas, font, font_size, font_rasterizer_density)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4425).
"""
ImFontAtlasBakedAdd(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    font_size,
    font_rasterizer_density,
    baked_id::Union{ImGuiID,Integer},
) = igImFontAtlasBakedAdd(atlas, font, font_size, font_rasterizer_density, baked_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4426).
"""
ImFontAtlasBakedDiscard(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    baked::VoidablePtrOrRef{ImFontBaked},
) = igImFontAtlasBakedDiscard(atlas, font, baked)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4427).
"""
ImFontAtlasBakedAddFontGlyph(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    baked::VoidablePtrOrRef{ImFontBaked},
    src::VoidablePtrOrRef{ImFontConfig},
    in_glyph::VoidablePtrOrRef{ImFontGlyph},
) = igImFontAtlasBakedAddFontGlyph(atlas, baked, src, in_glyph)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4428).
"""
ImFontAtlasBakedAddFontGlyphAdvancedX(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    baked::VoidablePtrOrRef{ImFontBaked},
    src::VoidablePtrOrRef{ImFontConfig},
    codepoint::Union{ImWchar,Integer},
    advance_x,
) = igImFontAtlasBakedAddFontGlyphAdvancedX(atlas, baked, src, codepoint, advance_x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4429).
"""
ImFontAtlasBakedDiscardFontGlyph(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    font::VoidablePtrOrRef{ImFont},
    baked::VoidablePtrOrRef{ImFontBaked},
    glyph::VoidablePtrOrRef{ImFontGlyph},
) = igImFontAtlasBakedDiscardFontGlyph(atlas, font, baked, glyph)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4430).
"""
ImFontAtlasBakedSetFontGlyphBitmap(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    baked::VoidablePtrOrRef{ImFontBaked},
    src::VoidablePtrOrRef{ImFontConfig},
    glyph::VoidablePtrOrRef{ImFontGlyph},
    r::VoidablePtrOrRef{ImTextureRect},
    src_pixels,
    src_fmt::ImTextureFormat,
    src_pitch,
) = igImFontAtlasBakedSetFontGlyphBitmap(atlas, baked, src, glyph, r, src_pixels, src_fmt, src_pitch)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4432).
"""
ImFontAtlasPackInit(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasPackInit(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4433).
"""
ImFontAtlasPackAddRect(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    w,
    h,
    overwrite_entry::VoidablePtrOrRef{ImFontAtlasRectEntry} = C_NULL,
) = igImFontAtlasPackAddRect(atlas, w, h, overwrite_entry)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4434).
"""
ImFontAtlasPackGetRect(atlas::VoidablePtrOrRef{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) =
    igImFontAtlasPackGetRect(atlas, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4435).
"""
ImFontAtlasPackGetRectSafe(atlas::VoidablePtrOrRef{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) =
    igImFontAtlasPackGetRectSafe(atlas, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4436).
"""
ImFontAtlasPackDiscardRect(atlas::VoidablePtrOrRef{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) =
    igImFontAtlasPackDiscardRect(atlas, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4438).
"""
ImFontAtlasUpdateNewFrame(atlas::VoidablePtrOrRef{ImFontAtlas}, frame_count, renderer_has_textures) =
    igImFontAtlasUpdateNewFrame(atlas, frame_count, renderer_has_textures)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4439).
"""
ImFontAtlasAddDrawListSharedData(atlas::VoidablePtrOrRef{ImFontAtlas}, data::VoidablePtrOrRef{ImDrawListSharedData}) =
    igImFontAtlasAddDrawListSharedData(atlas, data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4440).
"""
ImFontAtlasRemoveDrawListSharedData(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    data::VoidablePtrOrRef{ImDrawListSharedData},
) = igImFontAtlasRemoveDrawListSharedData(atlas, data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4441).
"""
ImFontAtlasUpdateDrawListsTextures(atlas::VoidablePtrOrRef{ImFontAtlas}, old_tex::ImTextureRef, new_tex::ImTextureRef) =
    igImFontAtlasUpdateDrawListsTextures(atlas, old_tex, new_tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4442).
"""
ImFontAtlasUpdateDrawListsSharedData(atlas::VoidablePtrOrRef{ImFontAtlas}) =
    igImFontAtlasUpdateDrawListsSharedData(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4444).
"""
ImFontAtlasTextureBlockConvert(
    src_pixels,
    src_fmt::ImTextureFormat,
    src_pitch,
    dst_pixels,
    dst_fmt::ImTextureFormat,
    dst_pitch,
    w,
    h,
) = igImFontAtlasTextureBlockConvert(src_pixels, src_fmt, src_pitch, dst_pixels, dst_fmt, dst_pitch, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4445).
"""
ImFontAtlasTextureBlockPostProcess(data::VoidablePtrOrRef{ImFontAtlasPostProcessData}) =
    igImFontAtlasTextureBlockPostProcess(data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4446).
"""
ImFontAtlasTextureBlockPostProcessMultiply(data::VoidablePtrOrRef{ImFontAtlasPostProcessData}, multiply_factor) =
    igImFontAtlasTextureBlockPostProcessMultiply(data, multiply_factor)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4447).
"""
ImFontAtlasTextureBlockFill(dst_tex::VoidablePtrOrRef{ImTextureData}, dst_x, dst_y, w, h, col::Union{ImU32,Integer}) =
    igImFontAtlasTextureBlockFill(dst_tex, dst_x, dst_y, w, h, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4448).
"""
ImFontAtlasTextureBlockCopy(
    src_tex::VoidablePtrOrRef{ImTextureData},
    src_x,
    src_y,
    dst_tex::VoidablePtrOrRef{ImTextureData},
    dst_x,
    dst_y,
    w,
    h,
) = igImFontAtlasTextureBlockCopy(src_tex, src_x, src_y, dst_tex, dst_x, dst_y, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4449).
"""
ImFontAtlasTextureBlockQueueUpload(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    tex::VoidablePtrOrRef{ImTextureData},
    x,
    y,
    w,
    h,
) = igImFontAtlasTextureBlockQueueUpload(atlas, tex, x, y, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4451).
"""
ImTextureDataUpdateNewFrame(tex::VoidablePtrOrRef{ImTextureData}) = igImTextureDataUpdateNewFrame(tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4452).
"""
ImTextureDataQueueUpload(tex::VoidablePtrOrRef{ImTextureData}, x, y, w, h) = igImTextureDataQueueUpload(tex, x, y, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4453).
"""
ImTextureDataGetFormatBytesPerPixel(format::ImTextureFormat) = igImTextureDataGetFormatBytesPerPixel(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4454).
"""
ImTextureDataGetStatusName(status::ImTextureStatus) = igImTextureDataGetStatusName(status)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4455).
"""
ImTextureDataGetFormatName(format::ImTextureFormat) = igImTextureDataGetFormatName(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4458).
"""
ImFontAtlasDebugLogTextureRequests(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasDebugLogTextureRequests(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_internal.h#L4461).
"""
ImFontAtlasGetMouseCursorTexData(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    cursor_type::Union{ImGuiMouseCursor,ImGuiMouseCursor_,Integer},
    out_offset::VoidablePtrOrRef{ImVec2},
    out_size::VoidablePtrOrRef{ImVec2},
    out_uv_border,
    out_uv_fill,
) = igImFontAtlasGetMouseCursorTexData(atlas, cursor_type, out_offset, out_size, out_uv_border, out_uv_fill)

"""
$(TYPEDSIGNATURES)


This is automatically assigned when using '#define IMGUI_ENABLE_FREETYPE'.
If you need to dynamically select between multiple builders:
- you can manually assign this builder with 'atlas->SetFontLoader(ImGuiFreeType::GetFontLoader())'
- prefer deep-copying this into your own ImFontLoader instance if you use hot-reloading that messes up static data.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_freetype.h#L69).
"""
GetFontLoader() = ImGuiFreeType_GetFontLoader()

"""
$(TYPEDSIGNATURES)

Override allocators. By default ImGuiFreeType will use IM_ALLOC()/IM_FREE()
However, as FreeType does lots of allocations we provide a way for the user to redirect it to a separate memory heap if desired.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_freetype.h#L73).
"""
SetAllocatorFunctions(alloc_func, free_func, user_data = nullptr) =
    ImGuiFreeType_SetAllocatorFunctions(alloc_func, free_func, user_data)

"""
$(TYPEDSIGNATURES)

Display UI to edit ImFontAtlas::FontLoaderFlags (shared) or ImFontConfig::FontLoaderFlags (single source).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui_freetype.h#L76).
"""
DebugEditFontLoaderFlags(
    p_font_loader_flags::Union{VoidablePtrOrRef{ImGuiFreeTypeLoaderFlags},VoidablePtrOrRef{ImGuiFreeTypeLoaderFlags_}},
) = ImGuiFreeType_DebugEditFontLoaderFlags(p_font_loader_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.93.1 WIP-docking/imgui.h#L2971).
"""
Appendf(self::Ptr{ImGuiTextBuffer}, fmt) = ImGuiTextBuffer_appendf(self, fmt)

@static if VERSION >= v"1.11"
    eval(
        Meta.parse(
            "public Destroy, GetTexID, CreateContext, DestroyContext, GetCurrentContext, SetCurrentContext, GetIO, GetPlatformIO, GetStyle, NewFrame, EndFrame, Render, GetDrawData, ShowDemoWindow, ShowMetricsWindow, ShowDebugLogWindow, ShowIDStackToolWindow, ShowAboutWindow, ShowStyleEditor, ShowStyleSelector, ShowFontSelector, ShowUserGuide, GetVersion, StyleColorsDark, StyleColorsLight, StyleColorsClassic, Begin, End, BeginChild, EndChild, IsWindowAppearing, IsWindowCollapsed, IsWindowFocused, IsWindowHovered, GetWindowDrawList, GetWindowDpiScale, GetWindowPos, GetWindowSize, GetWindowWidth, GetWindowHeight, GetWindowViewport, SetNextWindowPos, SetNextWindowSize, SetNextWindowSizeConstraints, SetNextWindowContentSize, SetNextWindowCollapsed, SetNextWindowFocus, SetNextWindowScroll, SetNextWindowBgAlpha, SetNextWindowViewport, SetWindowPos, SetWindowSize, SetWindowCollapsed, SetWindowFocus, GetScrollX, GetScrollY, SetScrollX, SetScrollY, GetScrollMaxX, GetScrollMaxY, SetScrollHereX, SetScrollHereY, SetScrollFromPosX, SetScrollFromPosY, PushFont, PopFont, GetFont, GetFontSize, GetFontBaked, PushStyleColor, PopStyleColor, PushStyleVar, PushStyleVarX, PushStyleVarY, PopStyleVar, PushItemFlag, PopItemFlag, PushItemWidth, PopItemWidth, SetNextItemWidth, CalcItemWidth, PushTextWrapPos, PopTextWrapPos, GetFontTexUvWhitePixel, GetColorU32, GetStyleColorVec4, GetCursorScreenPos, SetCursorScreenPos, GetContentRegionAvail, GetCursorPos, GetCursorPosX, GetCursorPosY, SetCursorPos, SetCursorPosX, SetCursorPosY, GetCursorStartPos, Separator, SameLine, NewLine, Spacing, Dummy, Indent, Unindent, BeginGroup, EndGroup, AlignTextToFramePadding, GetTextLineHeight, GetTextLineHeightWithSpacing, GetFrameHeight, GetFrameHeightWithSpacing, PushID, PopID, GetID, TextUnformatted, Text, TextColored, TextDisabled, TextWrapped, LabelText, BulletText, SeparatorText, Button, SmallButton, InvisibleButton, ArrowButton, Checkbox, CheckboxFlags, RadioButton, ProgressBar, Bullet, TextLink, TextLinkOpenURL, Image, ImageWithBg, ImageButton, BeginCombo, EndCombo, Combo, DragFloat, DragFloat2, DragFloat3, DragFloat4, DragFloatRange2, DragInt, DragInt2, DragInt3, DragInt4, DragIntRange2, DragScalar, DragScalarN, SliderFloat, SliderFloat2, SliderFloat3, SliderFloat4, SliderAngle, SliderInt, SliderInt2, SliderInt3, SliderInt4, SliderScalar, SliderScalarN, VSliderFloat, VSliderInt, VSliderScalar, InputText, InputTextMultiline, InputTextWithHint, InputFloat, InputFloat2, InputFloat3, InputFloat4, InputInt, InputInt2, InputInt3, InputInt4, InputDouble, InputScalar, InputScalarN, ColorEdit3, ColorEdit4, ColorPicker3, ColorPicker4, ColorButton, TreeNode, TreeNodeEx, TreePush, TreePop, GetTreeNodeToLabelSpacing, CollapsingHeader, SetNextItemOpen, SetNextItemStorageID, TreeNodeGetOpen, Selectable, BeginMultiSelect, EndMultiSelect, SetNextItemSelectionUserData, IsItemToggledSelection, BeginListBox, EndListBox, ListBox, Value, BeginMenuBar, EndMenuBar, BeginMainMenuBar, EndMainMenuBar, BeginMenu, EndMenu, MenuItem, BeginTooltip, EndTooltip, SetTooltip, BeginItemTooltip, SetItemTooltip, BeginPopup, BeginPopupModal, EndPopup, OpenPopup, OpenPopupOnItemClick, CloseCurrentPopup, BeginPopupContextItem, BeginPopupContextWindow, BeginPopupContextVoid, IsPopupOpen, BeginTable, EndTable, TableNextRow, TableNextColumn, TableSetColumnIndex, TableSetupColumn, TableSetupScrollFreeze, TableHeader, TableHeadersRow, TableAngledHeadersRow, TableGetSortSpecs, TableGetColumnCount, TableGetColumnIndex, TableGetRowIndex, TableGetColumnName, TableGetColumnFlags, TableSetColumnEnabled, TableGetHoveredColumn, TableSetBgColor, Columns, NextColumn, GetColumnIndex, GetColumnWidth, SetColumnWidth, GetColumnOffset, SetColumnOffset, GetColumnsCount, BeginTabBar, EndTabBar, BeginTabItem, EndTabItem, TabItemButton, SetTabItemClosed, DockSpace, DockSpaceOverViewport, SetNextWindowDockID, SetNextWindowClass, GetWindowDockID, IsWindowDocked, LogToTTY, LogToFile, LogToClipboard, LogFinish, LogButtons, LogText, BeginDragDropSource, SetDragDropPayload, EndDragDropSource, BeginDragDropTarget, AcceptDragDropPayload, EndDragDropTarget, GetDragDropPayload, BeginDisabled, EndDisabled, PushClipRect, PopClipRect, SetItemDefaultFocus, SetKeyboardFocusHere, SetNavCursorVisible, SetNextItemAllowOverlap, IsItemHovered, IsItemActive, IsItemFocused, IsItemClicked, IsItemVisible, IsItemEdited, IsItemActivated, IsItemDeactivated, IsItemDeactivatedAfterEdit, IsItemToggledOpen, IsAnyItemHovered, IsAnyItemActive, IsAnyItemFocused, GetItemID, GetItemRectMin, GetItemRectMax, GetItemRectSize, GetItemFlags, GetItemClickedCountWithSingleClickDelay, GetMainViewport, GetBackgroundDrawList, GetForegroundDrawList, IsRectVisible, GetTime, GetFrameCount, GetDrawListSharedData, GetStyleColorName, SetStateStorage, GetStateStorage, CalcTextSize, ColorConvertU32ToFloat4, ColorConvertFloat4ToU32, ColorConvertRGBtoHSV, ColorConvertHSVtoRGB, IsKeyDown, IsKeyPressed, IsKeyReleased, IsKeyChordPressed, GetKeyPressedAmount, GetKeyName, SetNextFrameWantCaptureKeyboard, Shortcut, SetNextItemShortcut, SetItemKeyOwner, IsMouseDown, IsMouseClicked, IsMouseReleased, IsMouseDoubleClicked, IsMouseReleasedWithDelay, GetMouseClickedCount, IsMouseHoveringRect, IsMousePosValid, IsAnyMouseDown, GetMousePos, GetMousePosOnOpeningCurrentPopup, IsMouseDragging, GetMouseDragDelta, ResetMouseDragDelta, GetMouseCursor, SetMouseCursor, SetNextFrameWantCaptureMouse, GetClipboardText, SetClipboardText, LoadIniSettingsFromDisk, LoadIniSettingsFromMemory, SaveIniSettingsToDisk, SaveIniSettingsToMemory, DebugTextEncoding, DebugFlashStyleColor, DebugStartItemPicker, DebugCheckVersionAndDataLayout, DebugLog, SetAllocatorFunctions, GetAllocatorFunctions, MemAlloc, MemFree, UpdatePlatformWindows, RenderPlatformWindowsDefault, DestroyPlatformWindows, FindViewportByID, FindViewportByPlatformHandle, ScaleAllSizes, AddKeyEvent, AddKeyAnalogEvent, AddMousePosEvent, AddMouseButtonEvent, AddMouseWheelEvent, AddMouseSourceEvent, AddMouseViewportEvent, AddFocusEvent, AddInputCharacter, AddInputCharacterUTF16, AddInputCharactersUTF8, SetKeyEventNativeData, SetAppAcceptingEvents, ClearEventsQueue, ClearInputKeys, ClearInputMouse, DeleteChars, InsertChars, SelectAll, SetSelection, ClearSelection, HasSelection, Clear, IsDataType, IsPreview, IsDelivery, PassFilter, Build, IsActive, Draw, DrawWithHint, Size, Empty, Resize, Reserve, C_str, Append, GetInt, SetInt, GetBool, SetBool, GetFloat, SetFloat, GetVoidPtr, SetVoidPtr, GetIntRef, GetBoolRef, GetFloatRef, GetVoidPtrRef, BuildSortByKey, SetAllInt, Step, IncludeItemByIndex, IncludeItemsByIndex, SeekCursorForItem, SetHSV, HSV, ApplyRequests, Contains, Swap, SetItemSelected, GetNextSelectedItem, GetStorageIdFromIndex, ClearFreeMemory, Split, Merge, SetCurrentChannel, PushClipRectFullScreen, PushTexture, PopTexture, PushDrawFlag, PopDrawFlag, GetClipRectMin, GetClipRectMax, AddLine, AddLineH, AddLineV, AddRect, AddRectFilled, AddRectFilledMultiColor, AddQuad, AddQuadFilled, AddTriangle, AddTriangleFilled, AddCircle, AddCircleFilled, AddNgon, AddNgonFilled, AddEllipse, AddEllipseFilled, AddText, AddBezierCubic, AddBezierQuadratic, AddPolyline, AddConvexPolyFilled, AddConcavePolyFilled, AddImage, AddImageQuad, AddImageRounded, PathClear, PathLineTo, PathLineToMergeDuplicate, PathFillConvex, PathFillConcave, PathStroke, PathArcTo, PathArcToFast, PathEllipticalArcTo, PathBezierCubicCurveTo, PathBezierQuadraticCurveTo, PathRect, AddCallback, AddDrawCmd, CloneOutput, ChannelsSplit, ChannelsMerge, ChannelsSetCurrent, PrimReserve, PrimUnreserve, PrimRect, PrimRectUV, PrimQuadUV, PrimWriteVtx, PrimWriteIdx, PrimVtx, AddDrawList, DeIndexAllBuffers, ScaleClipRects, Create, DestroyPixels, GetPixels, GetPixelsAt, GetSizeInBytes, GetPitch, GetTexRef, SetTexID, SetStatus, GetBit, SetBit, AddChar, AddRanges, BuildRanges, AddFont, AddFontDefault, AddFontDefaultVector, AddFontDefaultBitmap, AddFontFromFileTTF, AddFontFromMemoryTTF, AddFontFromMemoryCompressedTTF, AddFontFromMemoryCompressedBase85TTF, RemoveFont, CompactCache, SetFontLoader, ClearFonts, ClearInputData, ClearTexData, GetGlyphRangesDefault, AddCustomRect, RemoveCustomRect, GetCustomRect, ClearOutputData, FindGlyph, FindGlyphNoFallback, GetCharAdvance, IsGlyphLoaded, IsGlyphInFont, IsLoaded, GetDebugName, CalcTextSizeA, CalcWordWrapPosition, RenderChar, RenderText, AddRemapCodepoint, AddRemapCodepointToGlyphIndex, IsGlyphRangeUnused, GetCenter, GetWorkCenter, ClearPlatformHandlers, ClearRendererHandlers, GetFontLoader, DebugEditFontLoaderFlags, Appendf",
        ),
    )
end

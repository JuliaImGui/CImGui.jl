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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L378).
"""
GetTexID(self::Ptr{ImTextureRef}) = ImTextureRef_GetTexID(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L397).
"""
CreateContext(shared_font_atlas::VoidablePtrOrRef{ImFontAtlas} = C_NULL) = igCreateContext(shared_font_atlas)

"""
$(TYPEDSIGNATURES)

NULL = destroy current context.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L398).
"""
DestroyContext(ctx::VoidablePtrOrRef{ImGuiContext} = C_NULL) = igDestroyContext(ctx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L399).
"""
GetCurrentContext() = igGetCurrentContext()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L400).
"""
SetCurrentContext(ctx::VoidablePtrOrRef{ImGuiContext}) = igSetCurrentContext(ctx)

"""
$(TYPEDSIGNATURES)

Access the ImGuiIO structure (mouse/keyboard/gamepad inputs, time, various configuration options/flags).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L403).
"""
GetIO() = igGetIO_Nil()

"""
$(TYPEDSIGNATURES)

Access the ImGuiPlatformIO structure (mostly hooks/functions to connect to platform/renderer and OS Clipboard, IME etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L404).
"""
GetPlatformIO() = igGetPlatformIO_Nil()

"""
$(TYPEDSIGNATURES)

Access the Style structure (colors, sizes). Always use PushStyleColor(), PushStyleVar() to modify style mid-frame!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L405).
"""
GetStyle() = igGetStyle()

"""
$(TYPEDSIGNATURES)

Start a new Dear ImGui frame, you can submit any command from this point until Render()/EndFrame().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L406).
"""
NewFrame() = igNewFrame()

"""
$(TYPEDSIGNATURES)

Ends the Dear ImGui frame. automatically called by Render(). If you don't need to render data (skipping rendering) you may call EndFrame() without Render()... but you'll have wasted CPU already! If you don't need to render, better to not create any windows and not call NewFrame() at all!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L407).
"""
EndFrame() = igEndFrame()

"""
$(TYPEDSIGNATURES)

Ends the Dear ImGui frame, finalize the draw data. You can then get call GetDrawData().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L408).
"""
Render() = igRender()

"""
$(TYPEDSIGNATURES)

Valid after Render() and until the next call to NewFrame(). Call ImGui_ImplXXXX_RenderDrawData() function in your Renderer Backend to render.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L409).
"""
GetDrawData() = igGetDrawData()

"""
$(TYPEDSIGNATURES)

Create Demo window. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L412).
"""
ShowDemoWindow(p_open = C_NULL) = igShowDemoWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create Metrics/Debugger window. display Dear ImGui internals: windows, draw commands, various internal state, etc.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L413).
"""
ShowMetricsWindow(p_open = C_NULL) = igShowMetricsWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create Debug Log window. display a simplified log of important dear imgui events.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L414).
"""
ShowDebugLogWindow(p_open = C_NULL) = igShowDebugLogWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create Stack Tool window. hover items with mouse to query information about the source of their unique ID.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L415).
"""
ShowIDStackToolWindow(p_open = C_NULL) = igShowIDStackToolWindow(p_open)

"""
$(TYPEDSIGNATURES)

Create About window. display Dear ImGui version, credits and build/system information.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L416).
"""
ShowAboutWindow(p_open = C_NULL) = igShowAboutWindow(p_open)

"""
$(TYPEDSIGNATURES)

Add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L417).
"""
ShowStyleEditor(ref::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igShowStyleEditor(ref)

"""
$(TYPEDSIGNATURES)

Add style selector block (not a window), essentially a combo listing the default styles.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L418).
"""
ShowStyleSelector(label) = igShowStyleSelector(label)

"""
$(TYPEDSIGNATURES)

Add font selector block (not a window), essentially a combo listing the loaded fonts.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L419).
"""
ShowFontSelector(label) = igShowFontSelector(label)

"""
$(TYPEDSIGNATURES)

Add basic help/info block (not a window): how to manipulate ImGui as an end-user (mouse/keyboard controls).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L420).
"""
ShowUserGuide() = igShowUserGuide()

"""
$(TYPEDSIGNATURES)

Get the compiled version string e.g. "1.80 WIP" (essentially the value for IMGUI_VERSION from the compiled version of imgui.cpp).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L421).
"""
GetVersion() = igGetVersion()

"""
$(TYPEDSIGNATURES)

New, recommended style (default).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L424).
"""
StyleColorsDark(dst::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igStyleColorsDark(dst)

"""
$(TYPEDSIGNATURES)

Best used with borders and a custom, thicker font.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L425).
"""
StyleColorsLight(dst::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igStyleColorsLight(dst)

"""
$(TYPEDSIGNATURES)

Classic imgui style.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L426).
"""
StyleColorsClassic(dst::VoidablePtrOrRef{ImGuiStyle} = C_NULL) = igStyleColorsClassic(dst)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L440).
"""
Begin(
    name::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_open = C_NULL,
    flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0,
) = igBegin(name, p_open, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L441).
"""
End() = igEnd()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L461).
"""
BeginChild(
    str_id::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    child_flags::Union{ImGuiChildFlags,ImGuiChildFlags_,Integer} = 0,
    window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0,
) = igBeginChild_Str(str_id, size, child_flags, window_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L462).
"""
BeginChild(
    id::Union{ImGuiID,Integer},
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    child_flags::Union{ImGuiChildFlags,ImGuiChildFlags_,Integer} = 0,
    window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0,
) = igBeginChild_ID(id, size, child_flags, window_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L463).
"""
EndChild() = igEndChild()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L467).
"""
IsWindowAppearing() = igIsWindowAppearing()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L468).
"""
IsWindowCollapsed() = igIsWindowCollapsed()

"""
$(TYPEDSIGNATURES)

Is current window focused? or its root/child, depending on flags. see flags for options.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L469).
"""
IsWindowFocused(flags::Union{ImGuiFocusedFlags,ImGuiFocusedFlags_,Integer} = 0) = igIsWindowFocused(flags)

"""
$(TYPEDSIGNATURES)

Is current window hovered and hoverable (e.g. not blocked by a popup/modal)? See ImGuiHoveredFlags_ for options. IMPORTANT: If you are trying to check whether your mouse should be dispatched to Dear ImGui or to your underlying app, you should not use this function! Use the 'io.WantCaptureMouse' boolean for that! Refer to FAQ entry "How can I tell whether to dispatch mouse/keyboard to Dear ImGui or my application?" for details.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L470).
"""
IsWindowHovered(flags::Union{ImGuiHoveredFlags,ImGuiHoveredFlags_,Integer} = 0) = igIsWindowHovered(flags)

"""
$(TYPEDSIGNATURES)

Get draw list associated to the current window, to append your own drawing primitives.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L471).
"""
GetWindowDrawList() = igGetWindowDrawList()

"""
$(TYPEDSIGNATURES)

Get DPI scale currently associated to the current window's viewport.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L472).
"""
GetWindowDpiScale() = igGetWindowDpiScale()

"""
$(TYPEDSIGNATURES)

Get current window position in screen space (IT IS UNLIKELY YOU EVER NEED TO USE THIS. Consider always using GetCursorScreenPos() and GetContentRegionAvail() instead).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L473).
"""
GetWindowPos() = igGetWindowPos()

"""
$(TYPEDSIGNATURES)

Get current window size (IT IS UNLIKELY YOU EVER NEED TO USE THIS. Consider always using GetCursorScreenPos() and GetContentRegionAvail() instead).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L474).
"""
GetWindowSize() = igGetWindowSize()

"""
$(TYPEDSIGNATURES)

Get current window width (IT IS UNLIKELY YOU EVER NEED TO USE THIS). Shortcut for GetWindowSize().x.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L475).
"""
GetWindowWidth() = igGetWindowWidth()

"""
$(TYPEDSIGNATURES)

Get current window height (IT IS UNLIKELY YOU EVER NEED TO USE THIS). Shortcut for GetWindowSize().y.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L476).
"""
GetWindowHeight() = igGetWindowHeight()

"""
$(TYPEDSIGNATURES)

Get viewport currently associated to the current window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L477).
"""
GetWindowViewport() = igGetWindowViewport()

"""
$(TYPEDSIGNATURES)

Set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L481).
"""
SetNextWindowPos(
    pos::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
    pivot::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igSetNextWindowPos(pos, cond, pivot)

"""
$(TYPEDSIGNATURES)

Set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L482).
"""
SetNextWindowSize(size::Union{ImVec2,NTuple{2}}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetNextWindowSize(size, cond)

"""
$(TYPEDSIGNATURES)

Set next window size limits. use 0.0f or FLT_MAX if you don't want limits. Use -1 for both min and max of same axis to preserve current size (which itself is a constraint). Use callback to apply non-trivial programmatic constraints.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L483).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L484).
"""
SetNextWindowContentSize(size::Union{ImVec2,NTuple{2}}) = igSetNextWindowContentSize(size)

"""
$(TYPEDSIGNATURES)

Set next window collapsed state. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L485).
"""
SetNextWindowCollapsed(collapsed, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetNextWindowCollapsed(collapsed, cond)

"""
$(TYPEDSIGNATURES)

Set next window to be focused / top-most. call before Begin().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L486).
"""
SetNextWindowFocus() = igSetNextWindowFocus()

"""
$(TYPEDSIGNATURES)

Set next window scrolling value (use < 0.0f to not affect a given axis).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L487).
"""
SetNextWindowScroll(scroll::Union{ImVec2,NTuple{2}}) = igSetNextWindowScroll(scroll)

"""
$(TYPEDSIGNATURES)

Set next window background color alpha. helper to easily override the Alpha component of ImGuiCol_WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags_NoBackground.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L488).
"""
SetNextWindowBgAlpha(alpha) = igSetNextWindowBgAlpha(alpha)

"""
$(TYPEDSIGNATURES)

Set next window viewport.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L489).
"""
SetNextWindowViewport(viewport_id::Union{ImGuiID,Integer}) = igSetNextWindowViewport(viewport_id)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window position - call within Begin()/End(). prefer using SetNextWindowPos(), as this may incur tearing and side-effects.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L490).
"""
SetWindowPos(pos::Union{ImVec2,NTuple{2}}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowPos_Vec2(pos, cond)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window size - call within Begin()/End(). set to ImVec2(0, 0) to force an auto-fit. prefer using SetNextWindowSize(), as this may incur tearing and minor side-effects.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L491).
"""
SetWindowSize(size::Union{ImVec2,NTuple{2}}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowSize_Vec2(size, cond)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window collapsed state. prefer using SetNextWindowCollapsed().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L492).
"""
SetWindowCollapsed(collapsed::Bool, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowCollapsed_Bool(collapsed, cond)

"""
$(TYPEDSIGNATURES)

(not recommended) set current window to be focused / top-most. prefer using SetNextWindowFocus().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L493).
"""
SetWindowFocus() = igSetWindowFocus_Nil()

"""
$(TYPEDSIGNATURES)

Set named window position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L494).
"""
SetWindowPos(
    name::Union{String,Ptr{Cchar}},
    pos::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
) = igSetWindowPos_Str(name, pos, cond)

"""
$(TYPEDSIGNATURES)

Set named window size. set axis to 0.0f to force an auto-fit on this axis.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L495).
"""
SetWindowSize(
    name::Union{String,Ptr{Cchar}},
    size::Union{ImVec2,NTuple{2}},
    cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0,
) = igSetWindowSize_Str(name, size, cond)

"""
$(TYPEDSIGNATURES)

Set named window collapsed state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L496).
"""
SetWindowCollapsed(name::Union{String,Ptr{Cchar}}, collapsed::Bool, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowCollapsed_Str(name, collapsed, cond)

"""
$(TYPEDSIGNATURES)

Set named window to be focused / top-most. use NULL to remove focus.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L497).
"""
SetWindowFocus(name::Union{String,Ptr{Cchar},Ptr{Cvoid}}) = igSetWindowFocus_Str(name)

"""
$(TYPEDSIGNATURES)

Get scrolling amount [0 .. GetScrollMaxX()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L502).
"""
GetScrollX() = igGetScrollX()

"""
$(TYPEDSIGNATURES)

Get scrolling amount [0 .. GetScrollMaxY()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L503).
"""
GetScrollY() = igGetScrollY()

"""
$(TYPEDSIGNATURES)

Set scrolling amount [0 .. GetScrollMaxX()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L504).
"""
SetScrollX(scroll_x::Real) = igSetScrollX_Float(scroll_x)

"""
$(TYPEDSIGNATURES)

Set scrolling amount [0 .. GetScrollMaxY()].

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L505).
"""
SetScrollY(scroll_y::Real) = igSetScrollY_Float(scroll_y)

"""
$(TYPEDSIGNATURES)

Get maximum scrolling amount ~~ ContentSize.x - WindowSize.x - DecorationsSize.x.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L506).
"""
GetScrollMaxX() = igGetScrollMaxX()

"""
$(TYPEDSIGNATURES)

Get maximum scrolling amount ~~ ContentSize.y - WindowSize.y - DecorationsSize.y.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L507).
"""
GetScrollMaxY() = igGetScrollMaxY()

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left, 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L508).
"""
SetScrollHereX(center_x_ratio = 0.5f0) = igSetScrollHereX(center_x_ratio)

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L509).
"""
SetScrollHereY(center_y_ratio = 0.5f0) = igSetScrollHereY(center_y_ratio)

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L510).
"""
SetScrollFromPosX(local_x::Real, center_x_ratio::Real = 0.5f0) = igSetScrollFromPosX_Float(local_x, center_x_ratio)

"""
$(TYPEDSIGNATURES)

Adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L511).
"""
SetScrollFromPosY(local_y::Real, center_y_ratio::Real = 0.5f0) = igSetScrollFromPosY_Float(local_y, center_y_ratio)

"""
$(TYPEDSIGNATURES)

Use NULL as a shortcut to keep current font. Use 0.0f to keep current size.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L529).
"""
PushFont(font::VoidablePtrOrRef{ImFont}, font_size_base_unscaled) = igPushFont(font, font_size_base_unscaled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L530).
"""
PopFont() = igPopFont()

"""
$(TYPEDSIGNATURES)

Get current font.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L531).
"""
GetFont() = igGetFont()

"""
$(TYPEDSIGNATURES)

Get current scaled font size (= height in pixels). AFTER global scale factors applied. *IMPORTANT* DO NOT PASS THIS VALUE TO PushFont()! Use ImGui::GetStyle().FontSizeBase to get value before global scale factors.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L532).
"""
GetFontSize() = igGetFontSize()

"""
$(TYPEDSIGNATURES)

Get current font bound at current size // == GetFont()->GetFontBaked(GetFontSize()).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L533).
"""
GetFontBaked() = igGetFontBaked()

"""
$(TYPEDSIGNATURES)

Modify a style color. always use this if you modify the style after NewFrame().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L536).
"""
PushStyleColor(idx::Union{ImGuiCol,ImGuiCol_,Integer}, col::Union{ImU32,Integer}) = igPushStyleColor_U32(idx, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L537).
"""
PushStyleColor(idx::Union{ImGuiCol,ImGuiCol_,Integer}, col::Union{ImVec4,NTuple{4}}) = igPushStyleColor_Vec4(idx, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L538).
"""
PopStyleColor(count = 1) = igPopStyleColor(count)

"""
$(TYPEDSIGNATURES)

Modify a style float variable. always use this if you modify the style after NewFrame()!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L539).
"""
PushStyleVar(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val::Real) = igPushStyleVar_Float(idx, val)

"""
$(TYPEDSIGNATURES)

Modify a style ImVec2 variable. ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L540).
"""
PushStyleVar(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val::Union{ImVec2,NTuple{2}}) =
    igPushStyleVar_Vec2(idx, val)

"""
$(TYPEDSIGNATURES)

Modify X component of a style ImVec2 variable. ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L541).
"""
PushStyleVarX(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val_x) = igPushStyleVarX(idx, val_x)

"""
$(TYPEDSIGNATURES)

Modify Y component of a style ImVec2 variable. ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L542).
"""
PushStyleVarY(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, val_y) = igPushStyleVarY(idx, val_y)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L543).
"""
PopStyleVar(count = 1) = igPopStyleVar(count)

"""
$(TYPEDSIGNATURES)

Modify specified shared item flag, e.g. PushItemFlag(ImGuiItemFlags_NoTabStop, true).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L544).
"""
PushItemFlag(option::Union{ImGuiItemFlags,ImGuiItemFlags_,Integer}, enabled) = igPushItemFlag(option, enabled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L545).
"""
PopItemFlag() = igPopItemFlag()

"""
$(TYPEDSIGNATURES)

Push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L548).
"""
PushItemWidth(item_width) = igPushItemWidth(item_width)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L549).
"""
PopItemWidth() = igPopItemWidth()

"""
$(TYPEDSIGNATURES)

Set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L550).
"""
SetNextItemWidth(item_width) = igSetNextItemWidth(item_width)

"""
$(TYPEDSIGNATURES)

Width of item given pushed settings and current cursor position. NOT necessarily the width of last item unlike most 'Item' functions.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L551).
"""
CalcItemWidth() = igCalcItemWidth()

"""
$(TYPEDSIGNATURES)

Push word-wrapping position for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L552).
"""
PushTextWrapPos(wrap_local_pos_x = 0.0f0) = igPushTextWrapPos(wrap_local_pos_x)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L553).
"""
PopTextWrapPos() = igPopTextWrapPos()

"""
$(TYPEDSIGNATURES)

Get UV coordinate for a white pixel, useful to draw custom shapes via the ImDrawList API.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L557).
"""
GetFontTexUvWhitePixel() = igGetFontTexUvWhitePixel()

"""
$(TYPEDSIGNATURES)

Retrieve given style color with style alpha applied and optional extra alpha multiplier, packed as a 32-bit value suitable for ImDrawList.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L558).
"""
GetColorU32(idx::Union{ImGuiCol,ImGuiCol_,Integer}, alpha_mul::Real = 1.0f0) = igGetColorU32_Col(idx, alpha_mul)

"""
$(TYPEDSIGNATURES)

Retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L559).
"""
GetColorU32(col::Union{ImVec4,NTuple{4}}) = igGetColorU32_Vec4(col)

"""
$(TYPEDSIGNATURES)

Retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L560).
"""
GetColorU32(col::Union{ImU32,Integer}, alpha_mul::Real = 1.0f0) = igGetColorU32_U32(col, alpha_mul)

"""
$(TYPEDSIGNATURES)

Retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwise use GetColorU32() to get style color with style alpha baked in.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L561).
"""
GetStyleColorVec4(idx::Union{ImGuiCol,ImGuiCol_,Integer}) = igGetStyleColorVec4(idx)

"""
$(TYPEDSIGNATURES)

Cursor position, absolute coordinates. THIS IS YOUR BEST FRIEND (prefer using this rather than GetCursorPos(), also more useful to work with ImDrawList API).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L573).
"""
GetCursorScreenPos() = igGetCursorScreenPos()

"""
$(TYPEDSIGNATURES)

Cursor position, absolute coordinates. THIS IS YOUR BEST FRIEND.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L574).
"""
SetCursorScreenPos(pos::Union{ImVec2,NTuple{2}}) = igSetCursorScreenPos(pos)

"""
$(TYPEDSIGNATURES)

Available space from current position. THIS IS YOUR BEST FRIEND.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L575).
"""
GetContentRegionAvail() = igGetContentRegionAvail()

"""
$(TYPEDSIGNATURES)

[window-local] cursor position in window-local coordinates. This is not your best friend.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L576).
"""
GetCursorPos() = igGetCursorPos()

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L577).
"""
GetCursorPosX() = igGetCursorPosX()

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L578).
"""
GetCursorPosY() = igGetCursorPosY()

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L579).
"""
SetCursorPos(local_pos::Union{ImVec2,NTuple{2}}) = igSetCursorPos(local_pos)

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L580).
"""
SetCursorPosX(local_x) = igSetCursorPosX(local_x)

"""
$(TYPEDSIGNATURES)

[window-local] ".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L581).
"""
SetCursorPosY(local_y) = igSetCursorPosY(local_y)

"""
$(TYPEDSIGNATURES)

[window-local] initial cursor position, in window-local coordinates. Call GetCursorScreenPos() after Begin() to get the absolute coordinates version.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L582).
"""
GetCursorStartPos() = igGetCursorStartPos()

"""
$(TYPEDSIGNATURES)

Separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L585).
"""
Separator() = igSeparator()

"""
$(TYPEDSIGNATURES)

Call between widgets or groups to layout them horizontally. X position given in window coordinates.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L586).
"""
SameLine(offset_from_start_x = 0.0f0, spacing = -1.0f0) = igSameLine(offset_from_start_x, spacing)

"""
$(TYPEDSIGNATURES)

Undo a SameLine() or force a new line when in a horizontal-layout context.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L587).
"""
NewLine() = igNewLine()

"""
$(TYPEDSIGNATURES)

Add vertical spacing.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L588).
"""
Spacing() = igSpacing()

"""
$(TYPEDSIGNATURES)

Add a dummy item of given size. unlike InvisibleButton(), Dummy() won't take the mouse click or be navigable into.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L589).
"""
Dummy(size::Union{ImVec2,NTuple{2}}) = igDummy(size)

"""
$(TYPEDSIGNATURES)

Move content position toward the right, by indent_w, or style.IndentSpacing if indent_w <= 0.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L590).
"""
Indent(indent_w = 0.0f0) = igIndent(indent_w)

"""
$(TYPEDSIGNATURES)

Move content position back to the left, by indent_w, or style.IndentSpacing if indent_w <= 0.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L591).
"""
Unindent(indent_w = 0.0f0) = igUnindent(indent_w)

"""
$(TYPEDSIGNATURES)

Lock horizontal starting position.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L592).
"""
BeginGroup() = igBeginGroup()

"""
$(TYPEDSIGNATURES)

Unlock horizontal starting position + capture the whole group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L593).
"""
EndGroup() = igEndGroup()

"""
$(TYPEDSIGNATURES)

Vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly framed items (call if you have text on a line before a framed item).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L594).
"""
AlignTextToFramePadding() = igAlignTextToFramePadding()

"""
$(TYPEDSIGNATURES)

~ FontSize.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L595).
"""
GetTextLineHeight() = igGetTextLineHeight()

"""
$(TYPEDSIGNATURES)

~ FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L596).
"""
GetTextLineHeightWithSpacing() = igGetTextLineHeightWithSpacing()

"""
$(TYPEDSIGNATURES)

~ FontSize + style.FramePadding.y * 2.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L597).
"""
GetFrameHeight() = igGetFrameHeight()

"""
$(TYPEDSIGNATURES)

~ FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of framed widgets).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L598).
"""
GetFrameHeightWithSpacing() = igGetFrameHeightWithSpacing()

"""
$(TYPEDSIGNATURES)

Push string into the ID stack (will hash string).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L611).
"""
PushID(str_id::Union{String,Ptr{Cchar}}) = igPushID_Str(str_id)

"""
$(TYPEDSIGNATURES)

Push string into the ID stack (will hash string).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L612).
"""
PushID(str_id_begin::Union{String,Ptr{Cchar}}, str_id_end::Union{String,Ptr{Cchar},Ptr{Cvoid}}) =
    igPushID_StrStr(str_id_begin, str_id_end)

"""
$(TYPEDSIGNATURES)

Push pointer into the ID stack (will hash pointer).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L613).
"""
PushID(ptr_id::PtrOrRef{Cvoid}) = igPushID_Ptr(ptr_id)

"""
$(TYPEDSIGNATURES)

Push integer into the ID stack (will hash integer).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L614).
"""
PushID(int_id::Integer) = igPushID_Int(int_id)

"""
$(TYPEDSIGNATURES)

Pop from the ID stack.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L615).
"""
PopID() = igPopID()

"""
$(TYPEDSIGNATURES)

Calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into ImGuiStorage yourself.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L616).
"""
GetID(str_id::Union{String,Ptr{Cchar}}) = igGetID_Str(str_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L617).
"""
GetID(str_id_begin::Union{String,Ptr{Cchar}}, str_id_end::Union{String,Ptr{Cchar},Ptr{Cvoid}}) =
    igGetID_StrStr(str_id_begin, str_id_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L618).
"""
GetID(ptr_id::PtrOrRef{Cvoid}) = igGetID_Ptr(ptr_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L619).
"""
GetID(int_id::Integer) = igGetID_Int(int_id)

"""
$(TYPEDSIGNATURES)

Raw text without formatting. Roughly equivalent to Text("%s", text) but: A) doesn't require null terminated string if 'text_end' is specified, B) it's faster, no memory copy is done, no buffer size limits, recommended for long chunks of text.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L622).
"""
TextUnformatted(text, text_end = C_NULL) = igTextUnformatted(text, text_end)

"""
$(TYPEDSIGNATURES)

Formatted text.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L623).
"""
function Text end
Text(fmt) = igText(fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L625).
"""
TextColored(col::Union{ImVec4,NTuple{4}}, fmt) = igTextColored(col, fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L627).
"""
TextDisabled(fmt) = igTextDisabled(fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L629).
"""
TextWrapped(fmt) = igTextWrapped(fmt)

"""
$(TYPEDSIGNATURES)

Display text+label aligned the same way as value+label widgets.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L631).
"""
LabelText(label, fmt) = igLabelText(label, fmt)

"""
$(TYPEDSIGNATURES)

Shortcut for Bullet()+Text().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L633).
"""
BulletText(fmt) = igBulletText(fmt)

"""
$(TYPEDSIGNATURES)

Currently: formatted text with a horizontal line.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L635).
"""
SeparatorText(label) = igSeparatorText(label)

"""
$(TYPEDSIGNATURES)

Button.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L640).
"""
Button(label, size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0)) = igButton(label, size)

"""
$(TYPEDSIGNATURES)

Button with (FramePadding.y == 0) to easily embed within text.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L641).
"""
SmallButton(label) = igSmallButton(label)

"""
$(TYPEDSIGNATURES)

Flexible button behavior without the visuals, frequently useful to build custom behaviors using the public api (along with IsItemActive, IsItemHovered, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L642).
"""
InvisibleButton(str_id, size::Union{ImVec2,NTuple{2}}, flags::Union{ImGuiButtonFlags,ImGuiButtonFlags_,Integer} = 0) =
    igInvisibleButton(str_id, size, flags)

"""
$(TYPEDSIGNATURES)

Square button with an arrow shape.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L643).
"""
ArrowButton(str_id, dir::ImGuiDir) = igArrowButton(str_id, dir)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L644).
"""
Checkbox(label, v) = igCheckbox(label, v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L645).
"""
CheckboxFlags(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, flags::PtrOrRef{Int32}, flags_value) =
    igCheckboxFlags_IntPtr(label, flags, flags_value)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L646).
"""
CheckboxFlags(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, flags::PtrOrRef{UInt32}, flags_value) =
    igCheckboxFlags_UintPtr(label, flags, flags_value)

"""
$(TYPEDSIGNATURES)

Use with e.g. if (RadioButton("one", my_value==1))  my_value = 1;.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L647).
"""
RadioButton(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, active::Bool) = igRadioButton_Bool(label, active)

"""
$(TYPEDSIGNATURES)

Shortcut to handle the above pattern when value is an integer.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L648).
"""
RadioButton(label::Union{String,Ptr{Cchar},Ptr{Cvoid}}, v::VoidablePtrOrRef{Int32}, v_button::Integer) =
    igRadioButton_IntPtr(label, v, v_button)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L649).
"""
ProgressBar(fraction, size_arg::Union{ImVec2,NTuple{2}} = ImVec2(-FLT_MIN, 0), overlay = C_NULL) =
    igProgressBar(fraction, size_arg, overlay)

"""
$(TYPEDSIGNATURES)

Draw a small circle + keep the cursor on the same line. advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L650).
"""
Bullet() = igBullet()

"""
$(TYPEDSIGNATURES)

Hyperlink text button, return true when clicked.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L651).
"""
TextLink(label) = igTextLink(label)

"""
$(TYPEDSIGNATURES)

Hyperlink text button, automatically open file/url when clicked.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L652).
"""
TextLinkOpenURL(label, url = C_NULL) = igTextLinkOpenURL(label, url)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L660).
"""
Image(
    tex_ref::ImTextureRef,
    image_size::Union{ImVec2,NTuple{2}},
    uv0::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    uv1::Union{ImVec2,NTuple{2}} = ImVec2(1, 1),
) = igImage(tex_ref, image_size, uv0, uv1)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L661).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L662).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L667).
"""
BeginCombo(label, preview_value, flags::Union{ImGuiComboFlags,ImGuiComboFlags_,Integer} = 0) =
    igBeginCombo(label, preview_value, flags)

"""
$(TYPEDSIGNATURES)

Only call EndCombo() if BeginCombo() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L668).
"""
EndCombo() = igEndCombo()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L669).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L670).
"""
Combo(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    current_item::VoidablePtrOrRef{Int32},
    items_separated_by_zeros::Union{String,Ptr{Cchar}},
    popup_max_height_in_items::Integer = -1,
) = igCombo_Str(label, current_item, items_separated_by_zeros, popup_max_height_in_items)

"""
$(TYPEDSIGNATURES)

If v_min >= v_max we have no bound.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L685).
"""
DragFloat(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f0",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L686).
"""
DragFloat2(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f0",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat2(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L687).
"""
DragFloat3(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f0",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat3(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L688).
"""
DragFloat4(
    label,
    v,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f0",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloat4(label, v, v_speed, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L689).
"""
DragFloatRange2(
    label,
    v_current_min,
    v_current_max,
    v_speed = 1.0f0,
    v_min = 0.0f0,
    v_max = 0.0f0,
    format = "%.3f0",
    format_max = C_NULL,
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)

"""
$(TYPEDSIGNATURES)

If v_min >= v_max we have no bound.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L690).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L691).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L692).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L693).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L694).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L695).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L696).
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

Adjust format to decorate the value with a prefix or a suffix for in-slider labels or unit display.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L704).
"""
SliderFloat(label, v, v_min, v_max, format = "%.3f0", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L705).
"""
SliderFloat2(label, v, v_min, v_max, format = "%.3f0", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat2(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L706).
"""
SliderFloat3(label, v, v_min, v_max, format = "%.3f0", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat3(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L707).
"""
SliderFloat4(label, v, v_min, v_max, format = "%.3f0", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderFloat4(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L708).
"""
SliderAngle(
    label,
    v_rad,
    v_degrees_min = -360.0f0,
    v_degrees_max = 360.0f0,
    format = "%.0f0 deg",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L709).
"""
SliderInt(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L710).
"""
SliderInt2(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt2(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L711).
"""
SliderInt3(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt3(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L712).
"""
SliderInt4(label, v, v_min, v_max, format = "%d", flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0) =
    igSliderInt4(label, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L713).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L714).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L715).
"""
VSliderFloat(
    label,
    size::Union{ImVec2,NTuple{2}},
    v,
    v_min,
    v_max,
    format = "%.3f0",
    flags::Union{ImGuiSliderFlags,ImGuiSliderFlags_,Integer} = 0,
) = igVSliderFloat(label, size, v, v_min, v_max, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L716).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L717).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L722).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L723).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L724).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L725).
"""
InputFloat(
    label,
    v,
    step = 0.0f0,
    step_fast = 0.0f0,
    format = "%.3f0",
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
) = igInputFloat(label, v, step, step_fast, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L726).
"""
InputFloat2(label, v, format = "%.3f0", flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputFloat2(label, v, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L727).
"""
InputFloat3(label, v, format = "%.3f0", flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputFloat3(label, v, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L728).
"""
InputFloat4(label, v, format = "%.3f0", flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputFloat4(label, v, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L729).
"""
InputInt(label, v, step = 1, step_fast = 100, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) =
    igInputInt(label, v, step, step_fast, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L730).
"""
InputInt2(label, v, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) = igInputInt2(label, v, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L731).
"""
InputInt3(label, v, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) = igInputInt3(label, v, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L732).
"""
InputInt4(label, v, flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0) = igInputInt4(label, v, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L733).
"""
InputDouble(
    label,
    v,
    step = 0.0,
    step_fast = 0.0,
    format = "%.6f0",
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer} = 0,
) = igInputDouble(label, v, step, step_fast, format, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L734).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L735).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L740).
"""
ColorEdit3(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0) =
    igColorEdit3(label, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L741).
"""
ColorEdit4(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0) =
    igColorEdit4(label, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L742).
"""
ColorPicker3(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0) =
    igColorPicker3(label, col, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L743).
"""
ColorPicker4(label, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0, ref_col = C_NULL) =
    igColorPicker4(label, col, flags, ref_col)

"""
$(TYPEDSIGNATURES)

Display a color square/button, hover for details, return true when pressed.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L744).
"""
ColorButton(
    desc_id,
    col::Union{ImVec4,NTuple{4}},
    flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer} = 0,
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igColorButton(desc_id, col, flags, size)

"""
$(TYPEDSIGNATURES)

Initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L745).
"""
SetColorEditOptions(flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) = igSetColorEditOptions(flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L749).
"""
TreeNode(label::Union{String,Ptr{Cchar}}) = igTreeNode_Str(label)

"""
$(TYPEDSIGNATURES)

Helper variation to easily decorrelate the id from the displayed string. Read the FAQ about why and how to use ID. to align arbitrary text at the same level as a TreeNode() you can use Bullet().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L750).
"""
TreeNode(str_id::Union{String,Ptr{Cchar}}, fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}}) = igTreeNode_StrStr(str_id, fmt)

"""
$(TYPEDSIGNATURES)

".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L751).
"""
TreeNode(ptr_id::PtrOrRef{Cvoid}, fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}}) = igTreeNode_Ptr(ptr_id, fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L754).
"""
TreeNodeEx(label::Union{String,Ptr{Cchar}}, flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer} = 0) =
    igTreeNodeEx_Str(label, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L755).
"""
TreeNodeEx(
    str_id::Union{String,Ptr{Cchar}},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
    fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}},
) = igTreeNodeEx_StrStr(str_id, flags, fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L756).
"""
TreeNodeEx(
    ptr_id::PtrOrRef{Cvoid},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
    fmt::Union{String,Ptr{Cchar},Ptr{Cvoid}},
) = igTreeNodeEx_Ptr(ptr_id, flags, fmt)

"""
$(TYPEDSIGNATURES)

~ Indent()+PushID(). Already called by TreeNode() when returning true, but you can call TreePush/TreePop yourself if desired.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L759).
"""
TreePush(str_id::Union{String,Ptr{Cchar}}) = igTreePush_Str(str_id)

"""
$(TYPEDSIGNATURES)

".

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L760).
"""
TreePush(ptr_id::PtrOrRef{Cvoid}) = igTreePush_Ptr(ptr_id)

"""
$(TYPEDSIGNATURES)

~ Unindent()+PopID().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L761).
"""
TreePop() = igTreePop()

"""
$(TYPEDSIGNATURES)

Horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L762).
"""
GetTreeNodeToLabelSpacing() = igGetTreeNodeToLabelSpacing()

"""
$(TYPEDSIGNATURES)

If returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L763).
"""
CollapsingHeader(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer} = 0,
) = igCollapsingHeader_TreeNodeFlags(label, flags)

"""
$(TYPEDSIGNATURES)

When 'p_visible != NULL': if '*p_visible==true' display an additional small close button on upper right of the header which will set the bool to false when clicked, if '*p_visible==false' don't display the header.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L764).
"""
CollapsingHeader(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_visible::VoidablePtrOrRef{Bool},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer} = 0,
) = igCollapsingHeader_BoolPtr(label, p_visible, flags)

"""
$(TYPEDSIGNATURES)

Set next TreeNode/CollapsingHeader open state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L765).
"""
SetNextItemOpen(is_open, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) = igSetNextItemOpen(is_open, cond)

"""
$(TYPEDSIGNATURES)

Set id to use for open/close storage (default to same as item id).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L766).
"""
SetNextItemStorageID(storage_id::Union{ImGuiID,Integer}) = igSetNextItemStorageID(storage_id)

"""
$(TYPEDSIGNATURES)

"bool selected" carry the selection state (read-only). Selectable() is clicked is returns true so you can modify your selection state. size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L771).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L772).
"""
Selectable(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_selected::PtrOrRef{Bool},
    flags::Union{ImGuiSelectableFlags,ImGuiSelectableFlags_,Integer} = 0,
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
) = igSelectable_BoolPtr(label, p_selected, flags, size)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L781).
"""
BeginMultiSelect(
    flags::Union{ImGuiMultiSelectFlags,ImGuiMultiSelectFlags_,Integer},
    selection_size = -1,
    items_count = -1,
) = igBeginMultiSelect(flags, selection_size, items_count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L782).
"""
EndMultiSelect() = igEndMultiSelect()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L783).
"""
SetNextItemSelectionUserData(selection_user_data::ImGuiSelectionUserData) =
    igSetNextItemSelectionUserData(selection_user_data)

"""
$(TYPEDSIGNATURES)

Was the last item selection state toggled? Useful if you need the per-item information _before_ reaching EndMultiSelect(). We only returns toggle _event_ in order to handle clipping correctly.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L784).
"""
IsItemToggledSelection() = igIsItemToggledSelection()

"""
$(TYPEDSIGNATURES)

Open a framed scrolling region.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L793).
"""
BeginListBox(label, size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0)) = igBeginListBox(label, size)

"""
$(TYPEDSIGNATURES)

Only call EndListBox() if BeginListBox() returned true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L794).
"""
EndListBox() = igEndListBox()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L795).
"""
ListBox(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    current_item::VoidablePtrOrRef{Int32},
    items::Vector{String},
    height_in_items::Integer = -1,
) = igListBox_Str_arr(label, current_item, items, length(items), height_in_items)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L807).
"""
Value(prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}}, b::Bool) = igValue_Bool(prefix, b)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L808).
"""
Value(prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}}, v::Int) = igValue_Int(prefix, v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L809).
"""
Value(prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}}, v::UInt) = igValue_Uint(prefix, v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L810).
"""
Value(
    prefix::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    v::Real,
    float_format::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL,
) = igValue_Float(prefix, v, float_format)

"""
$(TYPEDSIGNATURES)

Append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L817).
"""
BeginMenuBar() = igBeginMenuBar()

"""
$(TYPEDSIGNATURES)

Only call EndMenuBar() if BeginMenuBar() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L818).
"""
EndMenuBar() = igEndMenuBar()

"""
$(TYPEDSIGNATURES)

Create and append to a full screen menu-bar.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L819).
"""
BeginMainMenuBar() = igBeginMainMenuBar()

"""
$(TYPEDSIGNATURES)

Only call EndMainMenuBar() if BeginMainMenuBar() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L820).
"""
EndMainMenuBar() = igEndMainMenuBar()

"""
$(TYPEDSIGNATURES)

Create a sub-menu entry. only call EndMenu() if this returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L821).
"""
BeginMenu(label, enabled = true) = igBeginMenu(label, enabled)

"""
$(TYPEDSIGNATURES)

Only call EndMenu() if BeginMenu() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L822).
"""
EndMenu() = igEndMenu()

"""
$(TYPEDSIGNATURES)

Return true when activated.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L823).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L824).
"""
MenuItem(
    label::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    shortcut::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    p_selected::PtrOrRef{Bool},
    enabled::Bool = true,
) = igMenuItem_BoolPtr(label, shortcut, p_selected, enabled)

"""
$(TYPEDSIGNATURES)

Begin/append a tooltip window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L830).
"""
BeginTooltip() = igBeginTooltip()

"""
$(TYPEDSIGNATURES)

Only call EndTooltip() if BeginTooltip()/BeginItemTooltip() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L831).
"""
EndTooltip() = igEndTooltip()

"""
$(TYPEDSIGNATURES)

Set a text-only tooltip. Often used after a ImGui::IsItemHovered() check. Override any previous call to SetTooltip().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L832).
"""
SetTooltip(fmt) = igSetTooltip(fmt)

"""
$(TYPEDSIGNATURES)

Begin/append a tooltip window if preceding item was hovered.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L839).
"""
BeginItemTooltip() = igBeginItemTooltip()

"""
$(TYPEDSIGNATURES)

Set a text-only tooltip if preceding item was hovered. override any previous call to SetTooltip().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L840).
"""
SetItemTooltip(fmt) = igSetItemTooltip(fmt)

"""
$(TYPEDSIGNATURES)

Return true if the popup is open, and you can start outputting to it.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L853).
"""
BeginPopup(str_id, flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0) = igBeginPopup(str_id, flags)

"""
$(TYPEDSIGNATURES)

Return true if the modal is open, and you can start outputting to it.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L854).
"""
BeginPopupModal(name, p_open = C_NULL, flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer} = 0) =
    igBeginPopupModal(name, p_open, flags)

"""
$(TYPEDSIGNATURES)

Only call EndPopup() if BeginPopupXXX() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L855).
"""
EndPopup() = igEndPopup()

"""
$(TYPEDSIGNATURES)

Call to mark popup as open (don't call every frame!).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L865).
"""
OpenPopup(
    str_id::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0,
) = igOpenPopup_Str(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Id overload to facilitate calling from nested stacks.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L866).
"""
OpenPopup(id::Union{ImGuiID,Integer}, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igOpenPopup_ID(id, popup_flags)

"""
$(TYPEDSIGNATURES)

Helper to open popup when clicked on last item. Default to ImGuiPopupFlags_MouseButtonRight == 1. (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L867).
"""
OpenPopupOnItemClick(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 1) =
    igOpenPopupOnItemClick(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Manually close the popup we have begin-ed into.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L868).
"""
CloseCurrentPopup() = igCloseCurrentPopup()

"""
$(TYPEDSIGNATURES)

Open+begin popup when clicked on last item. Use str_id==NULL to associate the popup to previous item. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L875).
"""
BeginPopupContextItem(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 1) =
    igBeginPopupContextItem(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Open+begin popup when clicked on current window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L876).
"""
BeginPopupContextWindow(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 1) =
    igBeginPopupContextWindow(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Open+begin popup when clicked in void (where there are no windows).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L877).
"""
BeginPopupContextVoid(str_id = C_NULL, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 1) =
    igBeginPopupContextVoid(str_id, popup_flags)

"""
$(TYPEDSIGNATURES)

Return true if the popup is open.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L883).
"""
IsPopupOpen(str_id::Union{String,Ptr{Cchar},Ptr{Cvoid}}, flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = 0) =
    igIsPopupOpen_Str(str_id, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L906).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L907).
"""
EndTable() = igEndTable()

"""
$(TYPEDSIGNATURES)

Append into the first cell of a new row.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L908).
"""
TableNextRow(row_flags::Union{ImGuiTableRowFlags,ImGuiTableRowFlags_,Integer} = 0, min_row_height = 0.0f0) =
    igTableNextRow(row_flags, min_row_height)

"""
$(TYPEDSIGNATURES)

Append into the next column (or first column of next row if currently in last column). Return true when column is visible.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L909).
"""
TableNextColumn() = igTableNextColumn()

"""
$(TYPEDSIGNATURES)

Append into the specified column. Return true when column is visible.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L910).
"""
TableSetColumnIndex(column_n) = igTableSetColumnIndex(column_n)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L920).
"""
TableSetupColumn(
    label,
    flags::Union{ImGuiTableColumnFlags,ImGuiTableColumnFlags_,Integer} = 0,
    init_width_or_weight = 0.0f0,
    user_id::Union{ImGuiID,Integer} = 0,
) = igTableSetupColumn(label, flags, init_width_or_weight, user_id)

"""
$(TYPEDSIGNATURES)

Lock columns/rows so they stay visible when scrolled.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L921).
"""
TableSetupScrollFreeze(cols, rows) = igTableSetupScrollFreeze(cols, rows)

"""
$(TYPEDSIGNATURES)

Submit one header cell manually (rarely used).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L922).
"""
TableHeader(label) = igTableHeader(label)

"""
$(TYPEDSIGNATURES)

Submit a row with headers cells based on data provided to TableSetupColumn() + submit context menu.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L923).
"""
TableHeadersRow() = igTableHeadersRow()

"""
$(TYPEDSIGNATURES)

Submit a row with angled headers for every column with the ImGuiTableColumnFlags_AngledHeader flag. MUST BE FIRST ROW.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L924).
"""
TableAngledHeadersRow() = igTableAngledHeadersRow()

"""
$(TYPEDSIGNATURES)

Get latest sort specs for the table (NULL if not sorting).  Lifetime: don't hold on this pointer over multiple frames or past any subsequent call to BeginTable().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L932).
"""
TableGetSortSpecs() = igTableGetSortSpecs()

"""
$(TYPEDSIGNATURES)

Return number of columns (value passed to BeginTable).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L933).
"""
TableGetColumnCount() = igTableGetColumnCount()

"""
$(TYPEDSIGNATURES)

Return current column index.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L934).
"""
TableGetColumnIndex() = igTableGetColumnIndex()

"""
$(TYPEDSIGNATURES)

Return current row index (header rows are accounted for).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L935).
"""
TableGetRowIndex() = igTableGetRowIndex()

"""
$(TYPEDSIGNATURES)

Return "" if column didn't have a name declared by TableSetupColumn(). Pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L936).
"""
TableGetColumnName(column_n::Integer = -1) = igTableGetColumnName_Int(column_n)

"""
$(TYPEDSIGNATURES)

Return column flags so you can query their Enabled/Visible/Sorted/Hovered status flags. Pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L937).
"""
TableGetColumnFlags(column_n = -1) = igTableGetColumnFlags(column_n)

"""
$(TYPEDSIGNATURES)

Change user accessible enabled/disabled state of a column. Set to false to hide the column. User can use the context menu to change this themselves (right-click in headers, or right-click in columns body with ImGuiTableFlags_ContextMenuInBody).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L938).
"""
TableSetColumnEnabled(column_n, v) = igTableSetColumnEnabled(column_n, v)

"""
$(TYPEDSIGNATURES)

Return hovered column. return -1 when table is not hovered. return columns_count if the unused space at the right of visible columns is hovered. Can also use (TableGetColumnFlags() & ImGuiTableColumnFlags_IsHovered) instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L939).
"""
TableGetHoveredColumn() = igTableGetHoveredColumn()

"""
$(TYPEDSIGNATURES)

Change the color of a cell, row, or column. See ImGuiTableBgTarget_ flags for details.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L940).
"""
TableSetBgColor(
    target::Union{ImGuiTableBgTarget,ImGuiTableBgTarget_,Integer},
    color::Union{ImU32,Integer},
    column_n = -1,
) = igTableSetBgColor(target, color, column_n)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L944).
"""
Columns(count = 1, id = C_NULL, borders = true) = igColumns(count, id, borders)

"""
$(TYPEDSIGNATURES)

Next column, defaults to current row or next row if the current row is finished.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L945).
"""
NextColumn() = igNextColumn()

"""
$(TYPEDSIGNATURES)

Get current column index.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L946).
"""
GetColumnIndex() = igGetColumnIndex()

"""
$(TYPEDSIGNATURES)

Get column width (in pixels). pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L947).
"""
GetColumnWidth(column_index = -1) = igGetColumnWidth(column_index)

"""
$(TYPEDSIGNATURES)

Set column width (in pixels). pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L948).
"""
SetColumnWidth(column_index, width) = igSetColumnWidth(column_index, width)

"""
$(TYPEDSIGNATURES)

Get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L949).
"""
GetColumnOffset(column_index = -1) = igGetColumnOffset(column_index)

"""
$(TYPEDSIGNATURES)

Set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L950).
"""
SetColumnOffset(column_index, offset_x) = igSetColumnOffset(column_index, offset_x)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L951).
"""
GetColumnsCount() = igGetColumnsCount()

"""
$(TYPEDSIGNATURES)

Create and append into a TabBar.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L955).
"""
BeginTabBar(str_id, flags::Union{ImGuiTabBarFlags,ImGuiTabBarFlags_,Integer} = 0) = igBeginTabBar(str_id, flags)

"""
$(TYPEDSIGNATURES)

Only call EndTabBar() if BeginTabBar() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L956).
"""
EndTabBar() = igEndTabBar()

"""
$(TYPEDSIGNATURES)

Create a Tab. Returns true if the Tab is selected.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L957).
"""
BeginTabItem(label, p_open = C_NULL, flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer} = 0) =
    igBeginTabItem(label, p_open, flags)

"""
$(TYPEDSIGNATURES)

Only call EndTabItem() if BeginTabItem() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L958).
"""
EndTabItem() = igEndTabItem()

"""
$(TYPEDSIGNATURES)

Create a Tab behaving like a button. return true when clicked. cannot be selected in the tab bar.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L959).
"""
TabItemButton(label, flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer} = 0) = igTabItemButton(label, flags)

"""
$(TYPEDSIGNATURES)

Notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars). For tab-bar: call after BeginTabBar() and before Tab submissions. Otherwise call with a window name.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L960).
"""
SetTabItemClosed(tab_or_docked_window_label) = igSetTabItemClosed(tab_or_docked_window_label)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L981).
"""
DockSpace(
    dockspace_id::Union{ImGuiID,Integer},
    size::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    flags::Union{ImGuiDockNodeFlags,ImGuiDockNodeFlags_,Integer} = 0,
    window_class::VoidablePtrOrRef{ImGuiWindowClass} = C_NULL,
) = igDockSpace(dockspace_id, size, flags, window_class)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L982).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L983).
"""
SetNextWindowDockID(dock_id::Union{ImGuiID,Integer}, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetNextWindowDockID(dock_id, cond)

"""
$(TYPEDSIGNATURES)

Set next window class (control docking compatibility + provide hints to platform backend via custom viewport flags and platform parent/child relationship).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L984).
"""
SetNextWindowClass(window_class::VoidablePtrOrRef{ImGuiWindowClass}) = igSetNextWindowClass(window_class)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L985).
"""
GetWindowDockID() = igGetWindowDockID()

"""
$(TYPEDSIGNATURES)

Is current window docked into another window?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L986).
"""
IsWindowDocked() = igIsWindowDocked()

"""
$(TYPEDSIGNATURES)

Start logging to tty (stdout).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L990).
"""
LogToTTY(auto_open_depth = -1) = igLogToTTY(auto_open_depth)

"""
$(TYPEDSIGNATURES)

Start logging to file.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L991).
"""
LogToFile(auto_open_depth = -1, filename = C_NULL) = igLogToFile(auto_open_depth, filename)

"""
$(TYPEDSIGNATURES)

Start logging to OS clipboard.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L992).
"""
LogToClipboard(auto_open_depth = -1) = igLogToClipboard(auto_open_depth)

"""
$(TYPEDSIGNATURES)

Stop logging (close file, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L993).
"""
LogFinish() = igLogFinish()

"""
$(TYPEDSIGNATURES)

Helper to display buttons for logging to tty/file/clipboard.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L994).
"""
LogButtons() = igLogButtons()

"""
$(TYPEDSIGNATURES)

Pass text data straight to log (without being displayed).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L995).
"""
LogText(fmt) = igLogText(fmt)

"""
$(TYPEDSIGNATURES)

Call after submitting an item which may be dragged. when this return true, you can call SetDragDropPayload() + EndDragDropSource().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1003).
"""
BeginDragDropSource(flags::Union{ImGuiDragDropFlags,ImGuiDragDropFlags_,Integer} = 0) = igBeginDragDropSource(flags)

"""
$(TYPEDSIGNATURES)

Type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui. Return true when payload has been accepted.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1004).
"""
SetDragDropPayload(type, data, sz, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetDragDropPayload(type, data, sz, cond)

"""
$(TYPEDSIGNATURES)

Only call EndDragDropSource() if BeginDragDropSource() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1005).
"""
EndDragDropSource() = igEndDragDropSource()

"""
$(TYPEDSIGNATURES)

Call after submitting an item that may receive a payload. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1006).
"""
BeginDragDropTarget() = igBeginDragDropTarget()

"""
$(TYPEDSIGNATURES)

Accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1007).
"""
AcceptDragDropPayload(type, flags::Union{ImGuiDragDropFlags,ImGuiDragDropFlags_,Integer} = 0) =
    igAcceptDragDropPayload(type, flags)

"""
$(TYPEDSIGNATURES)

Only call EndDragDropTarget() if BeginDragDropTarget() returns true!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1008).
"""
EndDragDropTarget() = igEndDragDropTarget()

"""
$(TYPEDSIGNATURES)

Peek directly into the current payload from anywhere. returns NULL when drag and drop is finished or inactive. use ImGuiPayload::IsDataType() to test for the payload type.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1009).
"""
GetDragDropPayload() = igGetDragDropPayload()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1016).
"""
BeginDisabled(disabled = true) = igBeginDisabled(disabled)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1017).
"""
EndDisabled() = igEndDisabled()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1021).
"""
PushClipRect(
    clip_rect_min::Union{ImVec2,NTuple{2}},
    clip_rect_max::Union{ImVec2,NTuple{2}},
    intersect_with_current_clip_rect,
) = igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1022).
"""
PopClipRect() = igPopClipRect()

"""
$(TYPEDSIGNATURES)

Make last item the default focused item of a newly appearing window.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1025).
"""
SetItemDefaultFocus() = igSetItemDefaultFocus()

"""
$(TYPEDSIGNATURES)

Focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1026).
"""
SetKeyboardFocusHere(offset = 0) = igSetKeyboardFocusHere(offset)

"""
$(TYPEDSIGNATURES)

Alter visibility of keyboard/gamepad cursor. by default: show when using an arrow key, hide when clicking with mouse.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1029).
"""
SetNavCursorVisible(visible) = igSetNavCursorVisible(visible)

"""
$(TYPEDSIGNATURES)

Allow next item to be overlapped by a subsequent item. Useful with invisible buttons, selectable, treenode covering an area where subsequent items may need to be added. Note that both Selectable() and TreeNode() have dedicated flags doing this.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1032).
"""
SetNextItemAllowOverlap() = igSetNextItemAllowOverlap()

"""
$(TYPEDSIGNATURES)

Is the last item hovered? (and usable, aka not blocked by a popup, etc.). See ImGuiHoveredFlags for more options.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1037).
"""
IsItemHovered(flags::Union{ImGuiHoveredFlags,ImGuiHoveredFlags_,Integer} = 0) = igIsItemHovered(flags)

"""
$(TYPEDSIGNATURES)

Is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse button on an item. Items that don't interact will always return false).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1038).
"""
IsItemActive() = igIsItemActive()

"""
$(TYPEDSIGNATURES)

Is the last item focused for keyboard/gamepad navigation?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1039).
"""
IsItemFocused() = igIsItemFocused()

"""
$(TYPEDSIGNATURES)

Is the last item hovered and mouse clicked on? (**)  == IsMouseClicked(mouse_button) && IsItemHovered()Important. (**) this is NOT equivalent to the behavior of e.g. Button(). Read comments in function definition.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1040).
"""
IsItemClicked(mouse_button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0) = igIsItemClicked(mouse_button)

"""
$(TYPEDSIGNATURES)

Is the last item visible? (items may be out of sight because of clipping/scrolling).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1041).
"""
IsItemVisible() = igIsItemVisible()

"""
$(TYPEDSIGNATURES)

Did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1042).
"""
IsItemEdited() = igIsItemEdited()

"""
$(TYPEDSIGNATURES)

Was the last item just made active (item was previously inactive).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1043).
"""
IsItemActivated() = igIsItemActivated()

"""
$(TYPEDSIGNATURES)

Was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that require continuous editing.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1044).
"""
IsItemDeactivated() = igIsItemDeactivated()

"""
$(TYPEDSIGNATURES)

Was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns with widgets that require continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable() will return true even when clicking an already selected item).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1045).
"""
IsItemDeactivatedAfterEdit() = igIsItemDeactivatedAfterEdit()

"""
$(TYPEDSIGNATURES)

Was the last item open state toggled? set by TreeNode().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1046).
"""
IsItemToggledOpen() = igIsItemToggledOpen()

"""
$(TYPEDSIGNATURES)

Is any item hovered?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1047).
"""
IsAnyItemHovered() = igIsAnyItemHovered()

"""
$(TYPEDSIGNATURES)

Is any item active?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1048).
"""
IsAnyItemActive() = igIsAnyItemActive()

"""
$(TYPEDSIGNATURES)

Is any item focused?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1049).
"""
IsAnyItemFocused() = igIsAnyItemFocused()

"""
$(TYPEDSIGNATURES)

Get ID of last item (~~ often same ImGui::GetID(label) beforehand).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1050).
"""
GetItemID() = igGetItemID()

"""
$(TYPEDSIGNATURES)

Get upper-left bounding rectangle of the last item (screen space).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1051).
"""
GetItemRectMin() = igGetItemRectMin()

"""
$(TYPEDSIGNATURES)

Get lower-right bounding rectangle of the last item (screen space).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1052).
"""
GetItemRectMax() = igGetItemRectMax()

"""
$(TYPEDSIGNATURES)

Get size of last item.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1053).
"""
GetItemRectSize() = igGetItemRectSize()

"""
$(TYPEDSIGNATURES)

Return primary/default viewport. This can never be NULL.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1059).
"""
GetMainViewport() = igGetMainViewport()

"""
$(TYPEDSIGNATURES)

Get background draw list for the given viewport or viewport associated to the current window. this draw list will be the first rendering one. Useful to quickly draw shapes/text behind dear imgui contents.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1062).
"""
GetBackgroundDrawList(viewport::VoidablePtrOrRef{ImGuiViewport} = C_NULL) = igGetBackgroundDrawList(viewport)

"""
$(TYPEDSIGNATURES)

Get foreground draw list for the given viewport or viewport associated to the current window. this draw list will be the top-most rendered one. Useful to quickly draw shapes/text over dear imgui contents.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1063).
"""
GetForegroundDrawList(viewport::VoidablePtrOrRef{ImGuiViewport} = C_NULL) =
    igGetForegroundDrawList_ViewportPtr(viewport)

"""
$(TYPEDSIGNATURES)

Test if rectangle (of given size, starting from cursor position) is visible / not clipped.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1066).
"""
IsRectVisible(size::Union{ImVec2,NTuple{2}}) = igIsRectVisible_Nil(size)

"""
$(TYPEDSIGNATURES)

Test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1067).
"""
IsRectVisible(rect_min::Union{ImVec2,NTuple{2}}, rect_max::Union{ImVec2,NTuple{2}}) =
    igIsRectVisible_Vec2(rect_min, rect_max)

"""
$(TYPEDSIGNATURES)

Get global imgui time. incremented by io.DeltaTime every frame.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1068).
"""
GetTime() = igGetTime()

"""
$(TYPEDSIGNATURES)

Get global imgui frame count. incremented by 1 every frame.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1069).
"""
GetFrameCount() = igGetFrameCount()

"""
$(TYPEDSIGNATURES)

You may use this when creating your own ImDrawList instances.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1070).
"""
GetDrawListSharedData() = igGetDrawListSharedData()

"""
$(TYPEDSIGNATURES)

Get a string corresponding to the enum value (for display, saving, etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1071).
"""
GetStyleColorName(idx::Union{ImGuiCol,ImGuiCol_,Integer}) = igGetStyleColorName(idx)

"""
$(TYPEDSIGNATURES)

Replace current window storage with our own (if you want to manipulate it yourself, typically clear subsection of it).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1072).
"""
SetStateStorage(storage::VoidablePtrOrRef{ImGuiStorage}) = igSetStateStorage(storage)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1073).
"""
GetStateStorage() = igGetStateStorage()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1076).
"""
CalcTextSize(text, text_end = C_NULL, hide_text_after_double_hash = false, wrap_width = -1.0f0) =
    igCalcTextSize(text, text_end, hide_text_after_double_hash, wrap_width)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1079).
"""
ColorConvertU32ToFloat4(in::Union{ImU32,Integer}) = igColorConvertU32ToFloat4(in)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1080).
"""
ColorConvertFloat4ToU32(in::Union{ImVec4,NTuple{4}}) = igColorConvertFloat4ToU32(in)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1081).
"""
ColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v) = igColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1082).
"""
ColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b) = igColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b)

"""
$(TYPEDSIGNATURES)

Is key being held.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1088).
"""
IsKeyDown(key::ImGuiKey) = igIsKeyDown_Nil(key)

"""
$(TYPEDSIGNATURES)

Was key pressed (went from !Down to Down)? if repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1089).
"""
IsKeyPressed(key::ImGuiKey, repeat::Bool = true) = igIsKeyPressed_Bool(key, repeat)

"""
$(TYPEDSIGNATURES)

Was key released (went from Down to !Down)?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1090).
"""
IsKeyReleased(key::ImGuiKey) = igIsKeyReleased_Nil(key)

"""
$(TYPEDSIGNATURES)

Was key chord (mods + key) pressed, e.g. you can pass 'ImGuiMod_Ctrl | ImGuiKey_S' as a key-chord. This doesn't do any routing or focus check, please consider using Shortcut() function instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1091).
"""
IsKeyChordPressed(key_chord::Union{ImGuiKeyChord,Integer}) = igIsKeyChordPressed_Nil(key_chord)

"""
$(TYPEDSIGNATURES)

Uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1092).
"""
GetKeyPressedAmount(key::ImGuiKey, repeat_delay, rate) = igGetKeyPressedAmount(key, repeat_delay, rate)

"""
$(TYPEDSIGNATURES)

[DEBUG] returns English name of the key. Those names are provided for debugging purpose and are not meant to be saved persistently nor compared.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1093).
"""
GetKeyName(key::ImGuiKey) = igGetKeyName(key)

"""
$(TYPEDSIGNATURES)

Override io.WantCaptureKeyboard flag next frame (said flag is left for your application to handle, typically when true it instructs your app to ignore inputs). e.g. force capture keyboard when your widget is being hovered. This is equivalent to setting "io.WantCaptureKeyboard = want_capture_keyboard"; after the next NewFrame() call.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1094).
"""
SetNextFrameWantCaptureKeyboard(want_capture_keyboard) = igSetNextFrameWantCaptureKeyboard(want_capture_keyboard)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1111).
"""
Shortcut(key_chord::Union{ImGuiKeyChord,Integer}, flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0) =
    igShortcut_Nil(key_chord, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1112).
"""
SetNextItemShortcut(
    key_chord::Union{ImGuiKeyChord,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0,
) = igSetNextItemShortcut(key_chord, flags)

"""
$(TYPEDSIGNATURES)

Set key owner to last item ID if it is hovered or active. Equivalent to 'if (IsItemHovered() || IsItemActive())  SetKeyOwner(key, GetItemID());'.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1120).
"""
SetItemKeyOwner(key::ImGuiKey) = igSetItemKeyOwner_Nil(key)

"""
$(TYPEDSIGNATURES)

Is mouse button held?

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1126).
"""
IsMouseDown(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igIsMouseDown_Nil(button)

"""
$(TYPEDSIGNATURES)

Did mouse button clicked? (went from !Down to Down). Same as GetMouseClickedCount() == 1.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1127).
"""
IsMouseClicked(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, repeat::Bool = false) =
    igIsMouseClicked_Bool(button, repeat)

"""
$(TYPEDSIGNATURES)

Did mouse button released? (went from Down to !Down).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1128).
"""
IsMouseReleased(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igIsMouseReleased_Nil(button)

"""
$(TYPEDSIGNATURES)

Did mouse button double-clicked? Same as GetMouseClickedCount() == 2. (note that a double-click will also report IsMouseClicked() == true).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1129).
"""
IsMouseDoubleClicked(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igIsMouseDoubleClicked_Nil(button)

"""
$(TYPEDSIGNATURES)

Delayed mouse release (use very sparingly!). Generally used with 'delay >= io.MouseDoubleClickTime' + combined with a 'io.MouseClickedLastCount==1' test. This is a very rarely used UI idiom, but some apps use this: e.g. MS Explorer single click on an icon to rename.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1130).
"""
IsMouseReleasedWithDelay(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, delay) =
    igIsMouseReleasedWithDelay(button, delay)

"""
$(TYPEDSIGNATURES)

Return the number of successive mouse-clicks at the time where a click happen (otherwise 0).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1131).
"""
GetMouseClickedCount(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igGetMouseClickedCount(button)

"""
$(TYPEDSIGNATURES)

Is mouse hovering given bounding rect (in screen space). clipped by current clipping settings, but disregarding of other consideration of focus/window ordering/popup-block.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1132).
"""
IsMouseHoveringRect(r_min::Union{ImVec2,NTuple{2}}, r_max::Union{ImVec2,NTuple{2}}, clip = true) =
    igIsMouseHoveringRect(r_min, r_max, clip)

"""
$(TYPEDSIGNATURES)

By convention we use (-FLT_MAX,-FLT_MAX) to denote that there is no mouse available.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1133).
"""
IsMousePosValid(mouse_pos::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}} = C_NULL) =
    igIsMousePosValid(mouse_pos)

"""
$(TYPEDSIGNATURES)

[WILL OBSOLETE] is any mouse button held? This was designed for backends, but prefer having backend maintain a mask of held mouse buttons, because upcoming input queue system will make this invalid.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1134).
"""
IsAnyMouseDown() = igIsAnyMouseDown()

"""
$(TYPEDSIGNATURES)

Shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1135).
"""
GetMousePos() = igGetMousePos()

"""
$(TYPEDSIGNATURES)

Retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1136).
"""
GetMousePosOnOpeningCurrentPopup() = igGetMousePosOnOpeningCurrentPopup()

"""
$(TYPEDSIGNATURES)

Is mouse dragging? (uses io.MouseDraggingThreshold if lock_threshold < 0.0f).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1137).
"""
IsMouseDragging(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, lock_threshold = -1.0f0) =
    igIsMouseDragging(button, lock_threshold)

"""
$(TYPEDSIGNATURES)

Return the delta from the initial clicking position while the mouse button is pressed or was just released. This is locked and return 0.0f until the mouse moves past a distance threshold at least once (uses io.MouseDraggingThreshold if lock_threshold < 0.0f).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1138).
"""
GetMouseDragDelta(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0, lock_threshold = -1.0f0) =
    igGetMouseDragDelta(button, lock_threshold)

"""
$(TYPEDSIGNATURES)



[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1139).
"""
ResetMouseDragDelta(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer} = 0) = igResetMouseDragDelta(button)

"""
$(TYPEDSIGNATURES)

Get desired mouse cursor shape. Important: reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1140).
"""
GetMouseCursor() = igGetMouseCursor()

"""
$(TYPEDSIGNATURES)

Set desired mouse cursor shape.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1141).
"""
SetMouseCursor(cursor_type::Union{ImGuiMouseCursor,ImGuiMouseCursor_,Integer}) = igSetMouseCursor(cursor_type)

"""
$(TYPEDSIGNATURES)

Override io.WantCaptureMouse flag next frame (said flag is left for your application to handle, typical when true it instructs your app to ignore inputs). This is equivalent to setting "io.WantCaptureMouse = want_capture_mouse;" after the next NewFrame() call.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1142).
"""
SetNextFrameWantCaptureMouse(want_capture_mouse) = igSetNextFrameWantCaptureMouse(want_capture_mouse)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1146).
"""
GetClipboardText() = igGetClipboardText()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1147).
"""
SetClipboardText(text) = igSetClipboardText(text)

"""
$(TYPEDSIGNATURES)

Call after CreateContext() and before the first call to NewFrame(). NewFrame() automatically calls LoadIniSettingsFromDisk(io.IniFilename).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1153).
"""
LoadIniSettingsFromDisk(ini_filename) = igLoadIniSettingsFromDisk(ini_filename)

"""
$(TYPEDSIGNATURES)

Call after CreateContext() and before the first call to NewFrame() to provide .ini data from your own data source.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1154).
"""
LoadIniSettingsFromMemory(ini_data, ini_size = 0) = igLoadIniSettingsFromMemory(ini_data, ini_size)

"""
$(TYPEDSIGNATURES)

This is automatically called (if io.IniFilename is not empty) a few seconds after any modification that should be reflected in the .ini file (and also by DestroyContext).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1155).
"""
SaveIniSettingsToDisk(ini_filename) = igSaveIniSettingsToDisk(ini_filename)

"""
$(TYPEDSIGNATURES)

Return a zero-terminated string with the .ini data which you can save by your own mean. call when io.WantSaveIniSettings is set, then save data by your own mean and clear io.WantSaveIniSettings.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1156).
"""
SaveIniSettingsToMemory(out_ini_size = C_NULL) = igSaveIniSettingsToMemory(out_ini_size)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1160).
"""
DebugTextEncoding(text) = igDebugTextEncoding(text)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1161).
"""
DebugFlashStyleColor(idx::Union{ImGuiCol,ImGuiCol_,Integer}) = igDebugFlashStyleColor(idx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1162).
"""
DebugStartItemPicker() = igDebugStartItemPicker()

"""
$(TYPEDSIGNATURES)

This is called by IMGUI_CHECKVERSION() macro.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1163).
"""
DebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx) =
    igDebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)

"""
$(TYPEDSIGNATURES)

Call via IMGUI_DEBUG_LOG() for maximum stripping in caller code!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1165).
"""
DebugLog(fmt) = igDebugLog(fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1173).
"""
SetAllocatorFunctions(alloc_func::ImGuiMemAllocFunc, free_func::ImGuiMemFreeFunc, user_data = C_NULL) =
    igSetAllocatorFunctions(alloc_func, free_func, user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1174).
"""
GetAllocatorFunctions(
    p_alloc_func::VoidablePtrOrRef{ImGuiMemAllocFunc},
    p_free_func::VoidablePtrOrRef{ImGuiMemFreeFunc},
    p_user_data,
) = igGetAllocatorFunctions(p_alloc_func, p_free_func, p_user_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1175).
"""
MemAlloc(size) = igMemAlloc(size)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1176).
"""
MemFree(ptr) = igMemFree(ptr)

"""
$(TYPEDSIGNATURES)

Call in main loop. will call CreateWindow/ResizeWindow/etc. platform functions for each secondary viewport, and DestroyWindow for each inactive viewport.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1181).
"""
UpdatePlatformWindows() = igUpdatePlatformWindows()

"""
$(TYPEDSIGNATURES)

Call in main loop. will call RenderWindow/SwapBuffers platform functions for each secondary viewport which doesn't have the ImGuiViewportFlags_Minimized flag set. May be reimplemented by user for custom rendering needs.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1182).
"""
RenderPlatformWindowsDefault(platform_render_arg = C_NULL, renderer_render_arg = C_NULL) =
    igRenderPlatformWindowsDefault(platform_render_arg, renderer_render_arg)

"""
$(TYPEDSIGNATURES)

Call DestroyWindow platform functions for all viewports. call from backend Shutdown() if you need to close platform windows before imgui shutdown. otherwise will be called by DestroyContext().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1183).
"""
DestroyPlatformWindows() = igDestroyPlatformWindows()

"""
$(TYPEDSIGNATURES)

This is a helper for backends.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1184).
"""
FindViewportByID(viewport_id::Union{ImGuiID,Integer}) = igFindViewportByID(viewport_id)

"""
$(TYPEDSIGNATURES)

This is a helper for backends. the type platform_handle is decided by the backend (e.g. HWND, MyWindow*, GLFWwindow* etc.).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L1185).
"""
FindViewportByPlatformHandle(platform_handle) = igFindViewportByPlatformHandle(platform_handle)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2220).
"""
lib.ImGuiTableSortSpecs() = ImGuiTableSortSpecs_ImGuiTableSortSpecs()

"""
Destructor for `ImGuiTableSortSpecs`
"""
Destroy(self::Ptr{ImGuiTableSortSpecs}) = ImGuiTableSortSpecs_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2231).
"""
lib.ImGuiTableColumnSortSpecs() = ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs()

"""
Destructor for `ImGuiTableColumnSortSpecs`
"""
Destroy(self::Ptr{ImGuiTableColumnSortSpecs}) = ImGuiTableColumnSortSpecs_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2434).
"""
lib.ImGuiStyle() = ImGuiStyle_ImGuiStyle()

"""
Destructor for `ImGuiStyle`
"""
Destroy(self::Ptr{ImGuiStyle}) = ImGuiStyle_destroy(self)

"""
$(TYPEDSIGNATURES)

Scale all spacing/padding/thickness values. Do not scale fonts.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2435).
"""
ScaleAllSizes(self::Ptr{ImGuiStyle}, scale_factor) = ImGuiStyle_ScaleAllSizes(self, scale_factor)

"""
$(TYPEDSIGNATURES)

Queue a new key down/up event. Key should be "translated" (as in, generally ImGuiKey_A matches the key end-user would use to emit an 'A' character).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2605).
"""
AddKeyEvent(self::Ptr{ImGuiIO}, key::ImGuiKey, down) = ImGuiIO_AddKeyEvent(self, key, down)

"""
$(TYPEDSIGNATURES)

Queue a new key down/up event for analog values (e.g. ImGuiKey_Gamepad_ values). Dead-zones should be handled by the backend.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2606).
"""
AddKeyAnalogEvent(self::Ptr{ImGuiIO}, key::ImGuiKey, down, v) = ImGuiIO_AddKeyAnalogEvent(self, key, down, v)

"""
$(TYPEDSIGNATURES)

Queue a mouse position update. Use -FLT_MAX,-FLT_MAX to signify no mouse (e.g. app not focused and not hovered).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2607).
"""
AddMousePosEvent(self::Ptr{ImGuiIO}, x, y) = ImGuiIO_AddMousePosEvent(self, x, y)

"""
$(TYPEDSIGNATURES)

Queue a mouse button change.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2608).
"""
AddMouseButtonEvent(self::Ptr{ImGuiIO}, button, down) = ImGuiIO_AddMouseButtonEvent(self, button, down)

"""
$(TYPEDSIGNATURES)

Queue a mouse wheel update. wheel_y<0: scroll down, wheel_y>0: scroll up, wheel_x<0: scroll right, wheel_x>0: scroll left.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2609).
"""
AddMouseWheelEvent(self::Ptr{ImGuiIO}, wheel_x, wheel_y) = ImGuiIO_AddMouseWheelEvent(self, wheel_x, wheel_y)

"""
$(TYPEDSIGNATURES)

Queue a mouse source change (Mouse/TouchScreen/Pen).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2610).
"""
AddMouseSourceEvent(self::Ptr{ImGuiIO}, source::ImGuiMouseSource) = ImGuiIO_AddMouseSourceEvent(self, source)

"""
$(TYPEDSIGNATURES)

Queue a mouse hovered viewport. Requires backend to set ImGuiBackendFlags_HasMouseHoveredViewport to call this (for multi-viewport support).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2611).
"""
AddMouseViewportEvent(self::Ptr{ImGuiIO}, id::Union{ImGuiID,Integer}) = ImGuiIO_AddMouseViewportEvent(self, id)

"""
$(TYPEDSIGNATURES)

Queue a gain/loss of focus for the application (generally based on OS/platform focus of your window).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2612).
"""
AddFocusEvent(self::Ptr{ImGuiIO}, focused) = ImGuiIO_AddFocusEvent(self, focused)

"""
$(TYPEDSIGNATURES)

Queue a new character input.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2613).
"""
AddInputCharacter(self::Ptr{ImGuiIO}, c) = ImGuiIO_AddInputCharacter(self, c)

"""
$(TYPEDSIGNATURES)

Queue a new character input from a UTF-16 character, it can be a surrogate.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2614).
"""
AddInputCharacterUTF16(self::Ptr{ImGuiIO}, c::ImWchar16) = ImGuiIO_AddInputCharacterUTF16(self, c)

"""
$(TYPEDSIGNATURES)

Queue a new characters input from a UTF-8 string.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2615).
"""
AddInputCharactersUTF8(self::Ptr{ImGuiIO}, str) = ImGuiIO_AddInputCharactersUTF8(self, str)

"""
$(TYPEDSIGNATURES)

[Optional] Specify index for legacy <1.87 IsKeyXXX() functions with native indices + specify native keycode, scancode.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2617).
"""
SetKeyEventNativeData(self::Ptr{ImGuiIO}, key::ImGuiKey, native_keycode, native_scancode, native_legacy_index = -1) =
    ImGuiIO_SetKeyEventNativeData(self, key, native_keycode, native_scancode, native_legacy_index)

"""
$(TYPEDSIGNATURES)

Set master flag for accepting key/mouse/text events (default to true). Useful if you have native dialog boxes that are interrupting your application loop/refresh, and you want to disable events being queued while your app is frozen.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2618).
"""
SetAppAcceptingEvents(self::Ptr{ImGuiIO}, accepting_events) = ImGuiIO_SetAppAcceptingEvents(self, accepting_events)

"""
$(TYPEDSIGNATURES)

Clear all incoming events.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2619).
"""
ClearEventsQueue(self::Ptr{ImGuiIO}) = ImGuiIO_ClearEventsQueue(self)

"""
$(TYPEDSIGNATURES)

Clear current keyboard/gamepad state + current frame text input buffer. Equivalent to releasing all keys/buttons.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2620).
"""
ClearInputKeys(self::Ptr{ImGuiIO}) = ImGuiIO_ClearInputKeys(self)

"""
$(TYPEDSIGNATURES)

Clear current mouse state.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2621).
"""
ClearInputMouse(self::Ptr{ImGuiIO}) = ImGuiIO_ClearInputMouse(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2712).
"""
lib.ImGuiIO() = ImGuiIO_ImGuiIO()

"""
Destructor for `ImGuiIO`
"""
Destroy(self::Ptr{ImGuiIO}) = ImGuiIO_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2752).
"""
lib.ImGuiInputTextCallbackData() = ImGuiInputTextCallbackData_ImGuiInputTextCallbackData()

"""
Destructor for `ImGuiInputTextCallbackData`
"""
Destroy(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2753).
"""
DeleteChars(self::Ptr{ImGuiInputTextCallbackData}, pos, bytes_count) =
    ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2754).
"""
InsertChars(self::Ptr{ImGuiInputTextCallbackData}, pos, text, text_end = C_NULL) =
    ImGuiInputTextCallbackData_InsertChars(self, pos, text, text_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2755).
"""
SelectAll(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_SelectAll(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2756).
"""
ClearSelection(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_ClearSelection(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2757).
"""
HasSelection(self::Ptr{ImGuiInputTextCallbackData}) = ImGuiInputTextCallbackData_HasSelection(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2789).
"""
lib.ImGuiWindowClass() = ImGuiWindowClass_ImGuiWindowClass()

"""
Destructor for `ImGuiWindowClass`
"""
Destroy(self::Ptr{ImGuiWindowClass}) = ImGuiWindowClass_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2807).
"""
lib.ImGuiPayload() = ImGuiPayload_ImGuiPayload()

"""
Destructor for `ImGuiPayload`
"""
Destroy(self::Ptr{ImGuiPayload}) = ImGuiPayload_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2808).
"""
Clear(self::Ptr{ImGuiPayload}) = ImGuiPayload_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2809).
"""
IsDataType(self::Ptr{ImGuiPayload}, type) = ImGuiPayload_IsDataType(self, type)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2810).
"""
IsPreview(self::Ptr{ImGuiPayload}) = ImGuiPayload_IsPreview(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2811).
"""
IsDelivery(self::Ptr{ImGuiPayload}) = ImGuiPayload_IsDelivery(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2830).
"""
lib.ImGuiOnceUponAFrame() = ImGuiOnceUponAFrame_ImGuiOnceUponAFrame()

"""
Destructor for `ImGuiOnceUponAFrame`
"""
Destroy(self::Ptr{ImGuiOnceUponAFrame}) = ImGuiOnceUponAFrame_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2838).
"""
lib.ImGuiTextFilter(default_filter = "") = ImGuiTextFilter_ImGuiTextFilter(default_filter)

"""
Destructor for `ImGuiTextFilter`
"""
Destroy(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_destroy(self)

"""
$(TYPEDSIGNATURES)

Helper calling InputText+Build.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2839).
"""
Draw(self::Ptr{ImGuiTextFilter}, label = "Filter(inc,-exc)", width = 0.0f0) = ImGuiTextFilter_Draw(self, label, width)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2840).
"""
PassFilter(self::Ptr{ImGuiTextFilter}, text, text_end = C_NULL) = ImGuiTextFilter_PassFilter(self, text, text_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2841).
"""
Build(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_Build(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2842).
"""
Clear(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2843).
"""
IsActive(self::Ptr{ImGuiTextFilter}) = ImGuiTextFilter_IsActive(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2851).
"""
lib.ImGuiTextRange() = ImGuiTextRange_ImGuiTextRange_Nil()

"""
Destructor for `ImGuiTextRange`
"""
Destroy(self::Ptr{ImGuiTextRange}) = ImGuiTextRange_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2852).
"""
lib.ImGuiTextRange(_b::Union{String,Ptr{Cchar},Ptr{Cvoid}}, _e::Union{String,Ptr{Cchar},Ptr{Cvoid}}) =
    ImGuiTextRange_ImGuiTextRange_Str(_b, _e)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2853).
"""
Empty(self::Ptr{ImGuiTextRange}) = ImGuiTextRange_empty(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2854).
"""
Split(self::Ptr{ImGuiTextRange}, separator, out::VoidablePtrOrRef{ImVector_ImGuiTextRange}) =
    ImGuiTextRange_split(self, separator, out)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2868).
"""
lib.ImGuiTextBuffer() = ImGuiTextBuffer_ImGuiTextBuffer()

"""
Destructor for `ImGuiTextBuffer`
"""
Destroy(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2870).
"""
Begin(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_begin(self)

"""
$(TYPEDSIGNATURES)

Buf is zero-terminated, so end() will point on the zero-terminator.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2871).
"""
End(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_end(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2872).
"""
Size(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_size(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2873).
"""
Empty(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_empty(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2874).
"""
Clear(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_clear(self)

"""
$(TYPEDSIGNATURES)

Similar to resize(0) on ImVector: empty string but don't free buffer.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2875).
"""
Resize(self::Ptr{ImGuiTextBuffer}, size) = ImGuiTextBuffer_resize(self, size)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2876).
"""
Reserve(self::Ptr{ImGuiTextBuffer}, capacity) = ImGuiTextBuffer_reserve(self, capacity)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2877).
"""
C_str(self::Ptr{ImGuiTextBuffer}) = ImGuiTextBuffer_c_str(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2878).
"""
Append(self::Ptr{ImGuiTextBuffer}, str, str_end = C_NULL) = ImGuiTextBuffer_append(self, str, str_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2888).
"""
lib.ImGuiStoragePair(_key::Union{ImGuiID,Integer}, _val::Integer) = ImGuiStoragePair_ImGuiStoragePair_Int(_key, _val)

"""
Destructor for `ImGuiStoragePair`
"""
Destroy(self::Ptr{ImGuiStoragePair}) = ImGuiStoragePair_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2889).
"""
lib.ImGuiStoragePair(_key::Union{ImGuiID,Integer}, _val::Real) = ImGuiStoragePair_ImGuiStoragePair_Float(_key, _val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2890).
"""
lib.ImGuiStoragePair(_key::Union{ImGuiID,Integer}, _val::PtrOrRef{Cvoid}) =
    ImGuiStoragePair_ImGuiStoragePair_Ptr(_key, _val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2909).
"""
Clear(self::Ptr{ImGuiStorage}) = ImGuiStorage_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2910).
"""
GetInt(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0) =
    ImGuiStorage_GetInt(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2911).
"""
SetInt(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetInt(self, key, val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2912).
"""
GetBool(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = false) =
    ImGuiStorage_GetBool(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2913).
"""
SetBool(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetBool(self, key, val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2914).
"""
GetFloat(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0.0f0) =
    ImGuiStorage_GetFloat(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2915).
"""
SetFloat(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetFloat(self, key, val)

"""
$(TYPEDSIGNATURES)

Default_val is NULL.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2916).
"""
GetVoidPtr(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}) = ImGuiStorage_GetVoidPtr(self, key)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2917).
"""
SetVoidPtr(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, val) = ImGuiStorage_SetVoidPtr(self, key, val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2923).
"""
GetIntRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0) =
    ImGuiStorage_GetIntRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2924).
"""
GetBoolRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = false) =
    ImGuiStorage_GetBoolRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2925).
"""
GetFloatRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = 0.0f0) =
    ImGuiStorage_GetFloatRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2926).
"""
GetVoidPtrRef(self::Ptr{ImGuiStorage}, key::Union{ImGuiID,Integer}, default_val = C_NULL) =
    ImGuiStorage_GetVoidPtrRef(self, key, default_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2929).
"""
BuildSortByKey(self::Ptr{ImGuiStorage}) = ImGuiStorage_BuildSortByKey(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2931).
"""
SetAllInt(self::Ptr{ImGuiStorage}, val) = ImGuiStorage_SetAllInt(self, val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2979).
"""
lib.ImGuiListClipper() = ImGuiListClipper_ImGuiListClipper()

"""
Destructor for `ImGuiListClipper`
"""
Destroy(self::Ptr{ImGuiListClipper}) = ImGuiListClipper_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2981).
"""
Begin(self::Ptr{ImGuiListClipper}, items_count, items_height = -1.0f0) =
    ImGuiListClipper_Begin(self, items_count, items_height)

"""
$(TYPEDSIGNATURES)

Automatically called on the last call of Step() that returns false.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2982).
"""
End(self::Ptr{ImGuiListClipper}) = ImGuiListClipper_End(self)

"""
$(TYPEDSIGNATURES)

Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2983).
"""
Step(self::Ptr{ImGuiListClipper}) = ImGuiListClipper_Step(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2987).
"""
IncludeItemByIndex(self::Ptr{ImGuiListClipper}, item_index) = ImGuiListClipper_IncludeItemByIndex(self, item_index)

"""
$(TYPEDSIGNATURES)

Item_end is exclusive e.g. use (42, 42+1) to make item 42 never clipped.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2988).
"""
IncludeItemsByIndex(self::Ptr{ImGuiListClipper}, item_begin, item_end) =
    ImGuiListClipper_IncludeItemsByIndex(self, item_begin, item_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2993).
"""
SeekCursorForItem(self::Ptr{ImGuiListClipper}, item_index) = ImGuiListClipper_SeekCursorForItem(self, item_index)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3070).
"""
lib.ImColor() = ImColor_ImColor_Nil()

"""
Destructor for `ImColor`
"""
Destroy(self::Ptr{ImColor}) = ImColor_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3071).
"""
lib.ImColor(r::Real, g::Real, b::Real, a::Real = 1.0f0) = ImColor_ImColor_Float(r, g, b, a)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3073).
"""
lib.ImColor(r::Integer, g::Integer, b::Integer, a::Integer = 255) = ImColor_ImColor_Int(r, g, b, a)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3074).
"""
lib.ImColor(rgba::Union{ImU32,Integer}) = ImColor_ImColor_U32(rgba)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3079).
"""
SetHSV(self::Ptr{ImColor}, h, s, v, a = 1.0f0) = ImColor_SetHSV(self, h, s, v, a)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3080).
"""
HSV(h, s, v, a = 1.0f0) = (ImColor_HSV(h, s, v, a)).Value

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3209).
"""
lib.ImGuiSelectionBasicStorage() = ImGuiSelectionBasicStorage_ImGuiSelectionBasicStorage()

"""
Destructor for `ImGuiSelectionBasicStorage`
"""
Destroy(self::Ptr{ImGuiSelectionBasicStorage}) = ImGuiSelectionBasicStorage_destroy(self)

"""
$(TYPEDSIGNATURES)

Apply selection requests coming from BeginMultiSelect() and EndMultiSelect() functions. It uses 'items_count' passed to BeginMultiSelect().

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3210).
"""
ApplyRequests(self::Ptr{ImGuiSelectionBasicStorage}, ms_io::VoidablePtrOrRef{ImGuiMultiSelectIO}) =
    ImGuiSelectionBasicStorage_ApplyRequests(self, ms_io)

"""
$(TYPEDSIGNATURES)

Query if an item id is in selection.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3211).
"""
Contains(self::Ptr{ImGuiSelectionBasicStorage}, id::Union{ImGuiID,Integer}) =
    ImGuiSelectionBasicStorage_Contains(self, id)

"""
$(TYPEDSIGNATURES)

Clear selection.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3212).
"""
Clear(self::Ptr{ImGuiSelectionBasicStorage}) = ImGuiSelectionBasicStorage_Clear(self)

"""
$(TYPEDSIGNATURES)

Swap two selections.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3213).
"""
Swap(self::Ptr{ImGuiSelectionBasicStorage}, r::VoidablePtrOrRef{ImGuiSelectionBasicStorage}) =
    ImGuiSelectionBasicStorage_Swap(self, r)

"""
$(TYPEDSIGNATURES)

Add/remove an item from selection (generally done by ApplyRequests() function).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3214).
"""
SetItemSelected(self::Ptr{ImGuiSelectionBasicStorage}, id::Union{ImGuiID,Integer}, selected) =
    ImGuiSelectionBasicStorage_SetItemSelected(self, id, selected)

"""
$(TYPEDSIGNATURES)

Iterate selection with 'void* it = NULL; ImGuiID id; while (selection.GetNextSelectedItem(&it, &id))  ... '.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3215).
"""
GetNextSelectedItem(
    self::Ptr{ImGuiSelectionBasicStorage},
    opaque_it,
    out_id::Union{VoidablePtrOrRef{ImGuiID},VoidablePtrOrRef{Integer}},
) = ImGuiSelectionBasicStorage_GetNextSelectedItem(self, opaque_it, out_id)

"""
$(TYPEDSIGNATURES)

Convert index to item id based on provided adapter.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3216).
"""
GetStorageIdFromIndex(self::Ptr{ImGuiSelectionBasicStorage}, idx) =
    ImGuiSelectionBasicStorage_GetStorageIdFromIndex(self, idx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3228).
"""
lib.ImGuiSelectionExternalStorage() = ImGuiSelectionExternalStorage_ImGuiSelectionExternalStorage()

"""
Destructor for `ImGuiSelectionExternalStorage`
"""
Destroy(self::Ptr{ImGuiSelectionExternalStorage}) = ImGuiSelectionExternalStorage_destroy(self)

"""
$(TYPEDSIGNATURES)

Apply selection requests by using AdapterSetItemSelected() calls.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3229).
"""
ApplyRequests(self::Ptr{ImGuiSelectionExternalStorage}, ms_io::VoidablePtrOrRef{ImGuiMultiSelectIO}) =
    ImGuiSelectionExternalStorage_ApplyRequests(self, ms_io)

"""
$(TYPEDSIGNATURES)

Also ensure our padding fields are zeroed.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3283).
"""
lib.ImDrawCmd() = ImDrawCmd_ImDrawCmd()

"""
Destructor for `ImDrawCmd`
"""
Destroy(self::Ptr{ImDrawCmd}) = ImDrawCmd_destroy(self)

"""
$(TYPEDSIGNATURES)

== (TexRef._TexData ? TexRef._TexData->TexID : TexRef._TexID).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3287).
"""
GetTexID(self::Ptr{ImDrawCmd}) = ImDrawCmd_GetTexID(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3329).
"""
lib.ImDrawListSplitter() = ImDrawListSplitter_ImDrawListSplitter()

"""
Destructor for `ImDrawListSplitter`
"""
Destroy(self::Ptr{ImDrawListSplitter}) = ImDrawListSplitter_destroy(self)

"""
$(TYPEDSIGNATURES)

Do not clear Channels[] so our allocations are reused next frame.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3331).
"""
Clear(self::Ptr{ImDrawListSplitter}) = ImDrawListSplitter_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3332).
"""
ClearFreeMemory(self::Ptr{ImDrawListSplitter}) = ImDrawListSplitter_ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3333).
"""
Split(self::Ptr{ImDrawListSplitter}, draw_list::VoidablePtrOrRef{ImDrawList}, count) =
    ImDrawListSplitter_Split(self, draw_list, count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3334).
"""
Merge(self::Ptr{ImDrawListSplitter}, draw_list::VoidablePtrOrRef{ImDrawList}) =
    ImDrawListSplitter_Merge(self, draw_list)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3335).
"""
SetCurrentChannel(self::Ptr{ImDrawListSplitter}, draw_list::VoidablePtrOrRef{ImDrawList}, channel_idx) =
    ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3402).
"""
lib.ImDrawList(shared_data::VoidablePtrOrRef{ImDrawListSharedData}) = ImDrawList_ImDrawList(shared_data)

"""
Destructor for `ImDrawList`
"""
Destroy(self::Ptr{ImDrawList}) = ImDrawList_destroy(self)

"""
$(TYPEDSIGNATURES)

Render-level scissoring. This is passed down to your render function but not used for CPU-side coarse clipping. Prefer using higher-level ImGui::PushClipRect() to affect logic (hit-testing and widget culling).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3405).
"""
PushClipRect(
    self::Ptr{ImDrawList},
    clip_rect_min::Union{ImVec2,NTuple{2}},
    clip_rect_max::Union{ImVec2,NTuple{2}},
    intersect_with_current_clip_rect = false,
) = ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3406).
"""
PushClipRectFullScreen(self::Ptr{ImDrawList}) = ImDrawList_PushClipRectFullScreen(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3407).
"""
PopClipRect(self::Ptr{ImDrawList}) = ImDrawList_PopClipRect(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3408).
"""
PushTexture(self::Ptr{ImDrawList}, tex_ref::ImTextureRef) = ImDrawList_PushTexture(self, tex_ref)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3409).
"""
PopTexture(self::Ptr{ImDrawList}) = ImDrawList_PopTexture(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3410).
"""
GetClipRectMin(self::Ptr{ImDrawList}) = ImDrawList_GetClipRectMin(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3411).
"""
GetClipRectMax(self::Ptr{ImDrawList}) = ImDrawList_GetClipRectMax(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3420).
"""
AddLine(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
) = ImDrawList_AddLine(self, p1, p2, col, thickness)

"""
$(TYPEDSIGNATURES)

A: upper-left, b: lower-right (== upper-left + size).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3421).
"""
AddRect(
    self::Ptr{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rounding = 0.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
    thickness = 1.0f0,
) = ImDrawList_AddRect(self, p_min, p_max, col, rounding, flags, thickness)

"""
$(TYPEDSIGNATURES)

A: upper-left, b: lower-right (== upper-left + size).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3422).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3423).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3424).
"""
AddQuad(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
) = ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3425).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3426).
"""
AddTriangle(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness = 1.0f0,
) = ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3427).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3428).
"""
AddCircle(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius,
    col::Union{ImU32,Integer},
    num_segments = 0,
    thickness = 1.0f0,
) = ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3429).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3430).
"""
AddNgon(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius,
    col::Union{ImU32,Integer},
    num_segments,
    thickness = 1.0f0,
) = ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3431).
"""
AddNgonFilled(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, col::Union{ImU32,Integer}, num_segments) =
    ImDrawList_AddNgonFilled(self, center, radius, col, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3432).
"""
AddEllipse(
    self::Ptr{ImDrawList},
    center::Union{ImVec2,NTuple{2}},
    radius::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    rot = 0.0f0,
    num_segments = 0,
    thickness = 1.0f0,
) = ImDrawList_AddEllipse(self, center, radius, col, rot, num_segments, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3433).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3434).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3435).
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
    cpu_fine_clip_rect::Union{VoidablePtrOrRef{ImVec4},VoidablePtrOrRef{NTuple{4}}} = C_NULL,
) = ImDrawList_AddText_FontPtr(self, font, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect)

"""
$(TYPEDSIGNATURES)

Cubic Bezier (4 control points).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3436).
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
) = ImDrawList_AddBezierCubic(self, p1, p2, p3, p4, col, thickness, num_segments)

"""
$(TYPEDSIGNATURES)

Quadratic Bezier (3 control points).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3437).
"""
AddBezierQuadratic(
    self::Ptr{ImDrawList},
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    thickness,
    num_segments = 0,
) = ImDrawList_AddBezierQuadratic(self, p1, p2, p3, col, thickness, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3442).
"""
AddPolyline(
    self::Ptr{ImDrawList},
    points::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    num_points,
    col::Union{ImU32,Integer},
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer},
    thickness,
) = ImDrawList_AddPolyline(self, points, num_points, col, flags, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3443).
"""
AddConvexPolyFilled(
    self::Ptr{ImDrawList},
    points::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    num_points,
    col::Union{ImU32,Integer},
) = ImDrawList_AddConvexPolyFilled(self, points, num_points, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3444).
"""
AddConcavePolyFilled(
    self::Ptr{ImDrawList},
    points::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    num_points,
    col::Union{ImU32,Integer},
) = ImDrawList_AddConcavePolyFilled(self, points, num_points, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3450).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3451).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3452).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3457).
"""
PathClear(self::Ptr{ImDrawList}) = ImDrawList_PathClear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3458).
"""
PathLineTo(self::Ptr{ImDrawList}, pos::Union{ImVec2,NTuple{2}}) = ImDrawList_PathLineTo(self, pos)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3459).
"""
PathLineToMergeDuplicate(self::Ptr{ImDrawList}, pos::Union{ImVec2,NTuple{2}}) =
    ImDrawList_PathLineToMergeDuplicate(self, pos)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3460).
"""
PathFillConvex(self::Ptr{ImDrawList}, col::Union{ImU32,Integer}) = ImDrawList_PathFillConvex(self, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3461).
"""
PathFillConcave(self::Ptr{ImDrawList}, col::Union{ImU32,Integer}) = ImDrawList_PathFillConcave(self, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3462).
"""
PathStroke(
    self::Ptr{ImDrawList},
    col::Union{ImU32,Integer},
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
    thickness = 1.0f0,
) = ImDrawList_PathStroke(self, col, flags, thickness)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3463).
"""
PathArcTo(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min, a_max, num_segments = 0) =
    ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments)

"""
$(TYPEDSIGNATURES)

Use precomputed angles for a 12 steps circle.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3464).
"""
PathArcToFast(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min_of_12, a_max_of_12) =
    ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12)

"""
$(TYPEDSIGNATURES)

Ellipse.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3465).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3466).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3467).
"""
PathBezierQuadraticCurveTo(
    self::Ptr{ImDrawList},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    num_segments = 0,
) = ImDrawList_PathBezierQuadraticCurveTo(self, p2, p3, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3468).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3479).
"""
AddCallback(
    self::Ptr{ImDrawList},
    callback::Union{ImDrawCallback,Base.CFunction,Ptr{Cvoid}},
    userdata,
    userdata_size = 0,
) = ImDrawList_AddCallback(self, callback, userdata, userdata_size)

"""
$(TYPEDSIGNATURES)

This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3482).
"""
AddDrawCmd(self::Ptr{ImDrawList}) = ImDrawList_AddDrawCmd(self)

"""
$(TYPEDSIGNATURES)

Create a clone of the CmdBuffer/IdxBuffer/VtxBuffer. For multi-threaded rendering, consider using `imgui_threaded_rendering` from https://github.com/ocornut/imgui_club instead.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3483).
"""
CloneOutput(self::Ptr{ImDrawList}) = ImDrawList_CloneOutput(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3491).
"""
ChannelsSplit(self::Ptr{ImDrawList}, count) = ImDrawList_ChannelsSplit(self, count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3492).
"""
ChannelsMerge(self::Ptr{ImDrawList}) = ImDrawList_ChannelsMerge(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3493).
"""
ChannelsSetCurrent(self::Ptr{ImDrawList}, n) = ImDrawList_ChannelsSetCurrent(self, n)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3498).
"""
PrimReserve(self::Ptr{ImDrawList}, idx_count, vtx_count) = ImDrawList_PrimReserve(self, idx_count, vtx_count)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3499).
"""
PrimUnreserve(self::Ptr{ImDrawList}, idx_count, vtx_count) = ImDrawList_PrimUnreserve(self, idx_count, vtx_count)

"""
$(TYPEDSIGNATURES)

Axis aligned rectangle (composed of two triangles).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3500).
"""
PrimRect(self::Ptr{ImDrawList}, a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}) =
    ImDrawList_PrimRect(self, a, b, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3501).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3502).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3503).
"""
PrimWriteVtx(
    self::Ptr{ImDrawList},
    pos::Union{ImVec2,NTuple{2}},
    uv::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
) = ImDrawList_PrimWriteVtx(self, pos, uv, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3504).
"""
PrimWriteIdx(self::Ptr{ImDrawList}, idx::ImDrawIdx) = ImDrawList_PrimWriteIdx(self, idx)

"""
$(TYPEDSIGNATURES)

Write vertex with unique index.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3505).
"""
PrimVtx(self::Ptr{ImDrawList}, pos::Union{ImVec2,NTuple{2}}, uv::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}) =
    ImDrawList_PrimVtx(self, pos, uv, col)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3519).
"""
_SetDrawListSharedData(self::Ptr{ImDrawList}, data::VoidablePtrOrRef{ImDrawListSharedData}) =
    ImDrawList__SetDrawListSharedData(self, data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3520).
"""
_ResetForNewFrame(self::Ptr{ImDrawList}) = ImDrawList__ResetForNewFrame(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3521).
"""
_ClearFreeMemory(self::Ptr{ImDrawList}) = ImDrawList__ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3522).
"""
_PopUnusedDrawCmd(self::Ptr{ImDrawList}) = ImDrawList__PopUnusedDrawCmd(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3523).
"""
_TryMergeDrawCmds(self::Ptr{ImDrawList}) = ImDrawList__TryMergeDrawCmds(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3524).
"""
_OnChangedClipRect(self::Ptr{ImDrawList}) = ImDrawList__OnChangedClipRect(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3525).
"""
_OnChangedTexture(self::Ptr{ImDrawList}) = ImDrawList__OnChangedTexture(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3526).
"""
_OnChangedVtxOffset(self::Ptr{ImDrawList}) = ImDrawList__OnChangedVtxOffset(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3527).
"""
_SetTexture(self::Ptr{ImDrawList}, tex_ref::ImTextureRef) = ImDrawList__SetTexture(self, tex_ref)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3528).
"""
_CalcCircleAutoSegmentCount(self::Ptr{ImDrawList}, radius) = ImDrawList__CalcCircleAutoSegmentCount(self, radius)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3529).
"""
_PathArcToFastEx(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min_sample, a_max_sample, a_step) =
    ImDrawList__PathArcToFastEx(self, center, radius, a_min_sample, a_max_sample, a_step)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3530).
"""
_PathArcToN(self::Ptr{ImDrawList}, center::Union{ImVec2,NTuple{2}}, radius, a_min, a_max, num_segments) =
    ImDrawList__PathArcToN(self, center, radius, a_min, a_max, num_segments)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3550).
"""
lib.ImDrawData() = ImDrawData_ImDrawData()

"""
Destructor for `ImDrawData`
"""
Destroy(self::Ptr{ImDrawData}) = ImDrawData_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3551).
"""
Clear(self::Ptr{ImDrawData}) = ImDrawData_Clear(self)

"""
$(TYPEDSIGNATURES)

Helper to add an external draw list into an existing ImDrawData.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3552).
"""
AddDrawList(self::Ptr{ImDrawData}, draw_list::VoidablePtrOrRef{ImDrawList}) = ImDrawData_AddDrawList(self, draw_list)

"""
$(TYPEDSIGNATURES)

Helper to convert all buffers from indexed to non-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3553).
"""
DeIndexAllBuffers(self::Ptr{ImDrawData}) = ImDrawData_DeIndexAllBuffers(self)

"""
$(TYPEDSIGNATURES)

Helper to scale the ClipRect field of each ImDrawCmd. Use if your final output buffer is at a different scale than Dear ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3554).
"""
ScaleClipRects(self::Ptr{ImDrawData}, fb_scale::Union{ImVec2,NTuple{2}}) = ImDrawData_ScaleClipRects(self, fb_scale)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3622).
"""
lib.ImTextureData() = ImTextureData_ImTextureData()

"""
Destructor for `ImTextureData`
"""
Destroy(self::Ptr{ImTextureData}) = ImTextureData_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3624).
"""
Create(self::Ptr{ImTextureData}, format::ImTextureFormat, w, h) = ImTextureData_Create(self, format, w, h)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3625).
"""
DestroyPixels(self::Ptr{ImTextureData}) = ImTextureData_DestroyPixels(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3626).
"""
GetPixels(self::Ptr{ImTextureData}) = ImTextureData_GetPixels(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3627).
"""
GetPixelsAt(self::Ptr{ImTextureData}, x, y) = ImTextureData_GetPixelsAt(self, x, y)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3628).
"""
GetSizeInBytes(self::Ptr{ImTextureData}) = ImTextureData_GetSizeInBytes(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3629).
"""
GetPitch(self::Ptr{ImTextureData}) = ImTextureData_GetPitch(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3630).
"""
GetTexRef(self::Ptr{ImTextureData}) = ImTextureData_GetTexRef(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3631).
"""
GetTexID(self::Ptr{ImTextureData}) = ImTextureData_GetTexID(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3636).
"""
SetTexID(self::Ptr{ImTextureData}, tex_id::ImTextureID) = ImTextureData_SetTexID(self, tex_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3637).
"""
SetStatus(self::Ptr{ImTextureData}, status::ImTextureStatus) = ImTextureData_SetStatus(self, status)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3680).
"""
lib.ImFontConfig() = ImFontConfig_ImFontConfig()

"""
Destructor for `ImFontConfig`
"""
Destroy(self::Ptr{ImFontConfig}) = ImFontConfig_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3696).
"""
lib.ImFontGlyph() = ImFontGlyph_ImFontGlyph()

"""
Destructor for `ImFontGlyph`
"""
Destroy(self::Ptr{ImFontGlyph}) = ImFontGlyph_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3705).
"""
lib.ImFontGlyphRangesBuilder() = ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder()

"""
Destructor for `ImFontGlyphRangesBuilder`
"""
Destroy(self::Ptr{ImFontGlyphRangesBuilder}) = ImFontGlyphRangesBuilder_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3706).
"""
Clear(self::Ptr{ImFontGlyphRangesBuilder}) = ImFontGlyphRangesBuilder_Clear(self)

"""
$(TYPEDSIGNATURES)

Get bit n in the array.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3707).
"""
GetBit(self::Ptr{ImFontGlyphRangesBuilder}, n) = ImFontGlyphRangesBuilder_GetBit(self, n)

"""
$(TYPEDSIGNATURES)

Set bit n in the array.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3708).
"""
SetBit(self::Ptr{ImFontGlyphRangesBuilder}, n) = ImFontGlyphRangesBuilder_SetBit(self, n)

"""
$(TYPEDSIGNATURES)

Add character.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3709).
"""
AddChar(self::Ptr{ImFontGlyphRangesBuilder}, c::ImWchar) = ImFontGlyphRangesBuilder_AddChar(self, c)

"""
$(TYPEDSIGNATURES)

Add string (each character of the UTF-8 string are added).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3710).
"""
AddText(self::Ptr{ImFontGlyphRangesBuilder}, text, text_end = C_NULL) =
    ImFontGlyphRangesBuilder_AddText(self, text, text_end)

"""
$(TYPEDSIGNATURES)

Add ranges, e.g. builder.AddRanges(ImFontAtlas::GetGlyphRangesDefault()) to force add all of ASCII/Latin+Ext.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3711).
"""
AddRanges(self::Ptr{ImFontGlyphRangesBuilder}, ranges::VoidablePtrOrRef{ImWchar}) =
    ImFontGlyphRangesBuilder_AddRanges(self, ranges)

"""
$(TYPEDSIGNATURES)

Output new ranges.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3712).
"""
BuildRanges(self::Ptr{ImFontGlyphRangesBuilder}, out_ranges::VoidablePtrOrRef{ImVector_ImWchar}) =
    ImFontGlyphRangesBuilder_BuildRanges(self, out_ranges)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3729).
"""
lib.ImFontAtlasRect() = ImFontAtlasRect_ImFontAtlasRect()

"""
Destructor for `ImFontAtlasRect`
"""
Destroy(self::Ptr{ImFontAtlasRect}) = ImFontAtlasRect_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3762).
"""
lib.ImFontAtlas() = ImFontAtlas_ImFontAtlas()

"""
Destructor for `ImFontAtlas`
"""
Destroy(self::Ptr{ImFontAtlas}) = ImFontAtlas_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3764).
"""
AddFont(self::Ptr{ImFontAtlas}, font_cfg::VoidablePtrOrRef{ImFontConfig}) = ImFontAtlas_AddFont(self, font_cfg)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3765).
"""
AddFontDefault(self::Ptr{ImFontAtlas}, font_cfg::VoidablePtrOrRef{ImFontConfig} = C_NULL) =
    ImFontAtlas_AddFontDefault(self, font_cfg)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3766).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3767).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3768).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3769).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3770).
"""
RemoveFont(self::Ptr{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) = ImFontAtlas_RemoveFont(self, font)

"""
$(TYPEDSIGNATURES)

Clear everything (input fonts, output glyphs/textures).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3772).
"""
Clear(self::Ptr{ImFontAtlas}) = ImFontAtlas_Clear(self)

"""
$(TYPEDSIGNATURES)

Compact cached glyphs and texture.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3773).
"""
CompactCache(self::Ptr{ImFontAtlas}) = ImFontAtlas_CompactCache(self)

"""
$(TYPEDSIGNATURES)

Change font loader at runtime.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3774).
"""
SetFontLoader(self::Ptr{ImFontAtlas}, font_loader::VoidablePtrOrRef{ImFontLoader}) =
    ImFontAtlas_SetFontLoader(self, font_loader)

"""
$(TYPEDSIGNATURES)

[OBSOLETE] Clear input data (all ImFontConfig structures including sizes, TTF data, glyph ranges, etc.) = all the data used to build the texture and fonts.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3777).
"""
ClearInputData(self::Ptr{ImFontAtlas}) = ImFontAtlas_ClearInputData(self)

"""
$(TYPEDSIGNATURES)

[OBSOLETE] Clear input+output font data (same as ClearInputData() + glyphs storage, UV coordinates).

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3778).
"""
ClearFonts(self::Ptr{ImFontAtlas}) = ImFontAtlas_ClearFonts(self)

"""
$(TYPEDSIGNATURES)

[OBSOLETE] Clear CPU-side copy of the texture data. Saves RAM once the texture has been copied to graphics memory.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3779).
"""
ClearTexData(self::Ptr{ImFontAtlas}) = ImFontAtlas_ClearTexData(self)

"""
$(TYPEDSIGNATURES)

Basic Latin, Extended Latin.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3803).
"""
GetGlyphRangesDefault(self::Ptr{ImFontAtlas}) = ImFontAtlas_GetGlyphRangesDefault(self)

"""
$(TYPEDSIGNATURES)

Register a rectangle. Return -1 (ImFontAtlasRectId_Invalid) on error.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3840).
"""
AddCustomRect(self::Ptr{ImFontAtlas}, width, height, out_r::VoidablePtrOrRef{ImFontAtlasRect} = C_NULL) =
    ImFontAtlas_AddCustomRect(self, width, height, out_r)

"""
$(TYPEDSIGNATURES)

Unregister a rectangle. Existing pixels will stay in texture until resized / garbage collected.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3841).
"""
RemoveCustomRect(self::Ptr{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) = ImFontAtlas_RemoveCustomRect(self, id)

"""
$(TYPEDSIGNATURES)

Get rectangle coordinates for current texture. Valid immediately, never store this (read above)!

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3842).
"""
GetCustomRect(self::Ptr{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}, out_r::VoidablePtrOrRef{ImFontAtlasRect}) =
    ImFontAtlas_GetCustomRect(self, id, out_r)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3934).
"""
lib.ImFontBaked() = ImFontBaked_ImFontBaked()

"""
Destructor for `ImFontBaked`
"""
Destroy(self::Ptr{ImFontBaked}) = ImFontBaked_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3935).
"""
ClearOutputData(self::Ptr{ImFontBaked}) = ImFontBaked_ClearOutputData(self)

"""
$(TYPEDSIGNATURES)

Return U+FFFD glyph if requested glyph doesn't exists.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3936).
"""
FindGlyph(self::Ptr{ImFontBaked}, c::ImWchar) = ImFontBaked_FindGlyph(self, c)

"""
$(TYPEDSIGNATURES)

Return NULL if glyph doesn't exist.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3937).
"""
FindGlyphNoFallback(self::Ptr{ImFontBaked}, c::ImWchar) = ImFontBaked_FindGlyphNoFallback(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3938).
"""
GetCharAdvance(self::Ptr{ImFontBaked}, c::ImWchar) = ImFontBaked_GetCharAdvance(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3939).
"""
IsGlyphLoaded(self::Ptr{ImFontBaked}, c::ImWchar) = ImFontBaked_IsGlyphLoaded(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3980).
"""
lib.ImFont() = ImFont_ImFont()

"""
Destructor for `ImFont`
"""
Destroy(self::Ptr{ImFont}) = ImFont_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3982).
"""
IsGlyphInFont(self::Ptr{ImFont}, c::ImWchar) = ImFont_IsGlyphInFont(self, c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3983).
"""
IsLoaded(self::Ptr{ImFont}) = ImFont_IsLoaded(self)

"""
$(TYPEDSIGNATURES)

Fill ImFontConfig::Name.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3984).
"""
GetDebugName(self::Ptr{ImFont}) = ImFont_GetDebugName(self)

"""
$(TYPEDSIGNATURES)

Get or create baked data for given size.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3989).
"""
GetFontBaked(self::Ptr{ImFont}, font_size, density = -1.0f0) = ImFont_GetFontBaked(self, font_size, density)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3990).
"""
CalcTextSizeA(self::Ptr{ImFont}, size, max_width, wrap_width, text_begin, text_end = C_NULL, out_remaining = C_NULL) =
    ImFont_CalcTextSizeA(self, size, max_width, wrap_width, text_begin, text_end, out_remaining)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3991).
"""
CalcWordWrapPosition(self::Ptr{ImFont}, size, text, text_end, wrap_width) =
    ImFont_CalcWordWrapPosition(self, size, text, text_end, wrap_width)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3992).
"""
RenderChar(
    self::Ptr{ImFont},
    draw_list::VoidablePtrOrRef{ImDrawList},
    size,
    pos::Union{ImVec2,NTuple{2}},
    col::Union{ImU32,Integer},
    c::ImWchar,
    cpu_fine_clip::Union{VoidablePtrOrRef{ImVec4},VoidablePtrOrRef{NTuple{4}}} = C_NULL,
) = ImFont_RenderChar(self, draw_list, size, pos, col, c, cpu_fine_clip)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3993).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L3999).
"""
ClearOutputData(self::Ptr{ImFont}) = ImFont_ClearOutputData(self)

"""
$(TYPEDSIGNATURES)

Makes 'from_codepoint' character points to 'to_codepoint' glyph.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4000).
"""
AddRemapChar(self::Ptr{ImFont}, from_codepoint::ImWchar, to_codepoint::ImWchar) =
    ImFont_AddRemapChar(self, from_codepoint, to_codepoint)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4001).
"""
IsGlyphRangeUnused(self::Ptr{ImFont}, c_begin, c_last) = ImFont_IsGlyphRangeUnused(self, c_begin, c_last)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4083).
"""
lib.ImGuiViewport() = ImGuiViewport_ImGuiViewport()

"""
Destructor for `ImGuiViewport`
"""
Destroy(self::Ptr{ImGuiViewport}) = ImGuiViewport_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4087).
"""
GetCenter(self::Ptr{ImGuiViewport}) = ImGuiViewport_GetCenter(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4088).
"""
GetWorkCenter(self::Ptr{ImGuiViewport}) = ImGuiViewport_GetWorkCenter(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4144).
"""
lib.ImGuiPlatformIO() = ImGuiPlatformIO_ImGuiPlatformIO()

"""
Destructor for `ImGuiPlatformIO`
"""
Destroy(self::Ptr{ImGuiPlatformIO}) = ImGuiPlatformIO_destroy(self)

"""
$(TYPEDSIGNATURES)

Clear all Platform_XXX fields. Typically called on Platform Backend shutdown.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4248).
"""
ClearPlatformHandlers(self::Ptr{ImGuiPlatformIO}) = ImGuiPlatformIO_ClearPlatformHandlers(self)

"""
$(TYPEDSIGNATURES)

Clear all Renderer_XXX fields. Typically called on Renderer Backend shutdown.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4249).
"""
ClearRendererHandlers(self::Ptr{ImGuiPlatformIO}) = ImGuiPlatformIO_ClearRendererHandlers(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4260).
"""
lib.ImGuiPlatformMonitor() = ImGuiPlatformMonitor_ImGuiPlatformMonitor()

"""
Destructor for `ImGuiPlatformMonitor`
"""
Destroy(self::Ptr{ImGuiPlatformMonitor}) = ImGuiPlatformMonitor_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L4272).
"""
lib.ImGuiPlatformImeData() = ImGuiPlatformImeData_ImGuiPlatformImeData()

"""
Destructor for `ImGuiPlatformImeData`
"""
Destroy(self::Ptr{ImGuiPlatformImeData}) = ImGuiPlatformImeData_destroy(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L379).
"""
ImHashData(data, data_size, seed::Union{ImGuiID,Integer} = 0) = igImHashData(data, data_size, seed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L380).
"""
ImHashStr(data, data_size = 0, seed::Union{ImGuiID,Integer} = 0) = igImHashStr(data, data_size, seed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L381).
"""
ImHashSkipUncontributingPrefix(label) = igImHashSkipUncontributingPrefix(label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L385).
"""
ImQsort(base, count, size_of_element, compare_func) = igImQsort(base, count, size_of_element, compare_func)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L389).
"""
ImAlphaBlendColors(col_a::Union{ImU32,Integer}, col_b::Union{ImU32,Integer}) = igImAlphaBlendColors(col_a, col_b)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L392).
"""
ImIsPowerOfTwo(v::Integer) = igImIsPowerOfTwo_Int(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L393).
"""
ImIsPowerOfTwo(v::ImU64) = igImIsPowerOfTwo_U64(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L394).
"""
ImUpperPowerOfTwo(v) = igImUpperPowerOfTwo(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L395).
"""
ImCountSetBits(v) = igImCountSetBits(v)

"""
$(TYPEDSIGNATURES)

Case insensitive compare.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L400).
"""
ImStricmp(str1, str2) = igImStricmp(str1, str2)

"""
$(TYPEDSIGNATURES)

Case insensitive compare to a certain count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L401).
"""
ImStrnicmp(str1, str2, count) = igImStrnicmp(str1, str2, count)

"""
$(TYPEDSIGNATURES)

Copy to a certain count and always zero terminate (strncpy doesn't).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L402).
"""
ImStrncpy(dst, src, count) = igImStrncpy(dst, src, count)

"""
$(TYPEDSIGNATURES)

Duplicate a string.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L403).
"""
ImStrdup(str) = igImStrdup(str)

"""
$(TYPEDSIGNATURES)

Duplicate a chunk of memory.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L404).
"""
ImMemdup(src, size) = igImMemdup(src, size)

"""
$(TYPEDSIGNATURES)

Copy in provided buffer, recreate buffer if needed.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L405).
"""
ImStrdupcpy(dst, p_dst_size, str) = igImStrdupcpy(dst, p_dst_size, str)

"""
$(TYPEDSIGNATURES)

Find first occurrence of 'c' in string range.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L406).
"""
ImStrchrRange(str_begin, str_end, c) = igImStrchrRange(str_begin, str_end, c)

"""
$(TYPEDSIGNATURES)

End end-of-line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L407).
"""
ImStreolRange(str, str_end) = igImStreolRange(str, str_end)

"""
$(TYPEDSIGNATURES)

Find a substring in a string range.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L408).
"""
ImStristr(haystack, haystack_end, needle, needle_end) = igImStristr(haystack, haystack_end, needle, needle_end)

"""
$(TYPEDSIGNATURES)

Remove leading and trailing blanks from a buffer.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L409).
"""
ImStrTrimBlanks(str) = igImStrTrimBlanks(str)

"""
$(TYPEDSIGNATURES)

Find first non-blank character.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L410).
"""
ImStrSkipBlank(str) = igImStrSkipBlank(str)

"""
$(TYPEDSIGNATURES)

Computer string length (ImWchar string).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L411).
"""
ImStrlenW(str::VoidablePtrOrRef{ImWchar}) = igImStrlenW(str)

"""
$(TYPEDSIGNATURES)

Find beginning-of-line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L412).
"""
ImStrbol(buf_mid_line, buf_begin) = igImStrbol(buf_mid_line, buf_begin)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L414).
"""
ImToUpper(c) = igImToUpper(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L415).
"""
ImCharIsBlankA(c) = igImCharIsBlankA(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L416).
"""
ImCharIsBlankW(c) = igImCharIsBlankW(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L417).
"""
ImCharIsXdigitA(c) = igImCharIsXdigitA(c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L421).
"""
ImFormatString(buf, buf_size, fmt) = igImFormatString(buf, buf_size, fmt)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L423).
"""
ImFormatStringToTempBuffer(out_buf, out_buf_end, fmt) = igImFormatStringToTempBuffer(out_buf, out_buf_end, fmt)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L425).
"""
ImParseFormatFindStart(format) = igImParseFormatFindStart(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L426).
"""
ImParseFormatFindEnd(format) = igImParseFormatFindEnd(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L427).
"""
ImParseFormatTrimDecorations(format, buf, buf_size) = igImParseFormatTrimDecorations(format, buf, buf_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L428).
"""
ImParseFormatSanitizeForPrinting(fmt_in, fmt_out, fmt_out_size) =
    igImParseFormatSanitizeForPrinting(fmt_in, fmt_out, fmt_out_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L429).
"""
ImParseFormatSanitizeForScanning(fmt_in, fmt_out, fmt_out_size) =
    igImParseFormatSanitizeForScanning(fmt_in, fmt_out, fmt_out_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L430).
"""
ImParseFormatPrecision(format, default_value) = igImParseFormatPrecision(format, default_value)

"""
$(TYPEDSIGNATURES)

Return output UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L433).
"""
ImTextCharToUtf8(out_buf, c) = igImTextCharToUtf8(out_buf, c)

"""
$(TYPEDSIGNATURES)

Return output UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L434).
"""
ImTextStrToUtf8(out_buf, out_buf_size, in_text::VoidablePtrOrRef{ImWchar}, in_text_end::VoidablePtrOrRef{ImWchar}) =
    igImTextStrToUtf8(out_buf, out_buf_size, in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Read one character. return input UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L435).
"""
ImTextCharFromUtf8(out_char, in_text, in_text_end) = igImTextCharFromUtf8(out_char, in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return input UTF-8 bytes count.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L436).
"""
ImTextStrFromUtf8(out_buf::VoidablePtrOrRef{ImWchar}, out_buf_size, in_text, in_text_end, in_remaining = C_NULL) =
    igImTextStrFromUtf8(out_buf, out_buf_size, in_text, in_text_end, in_remaining)

"""
$(TYPEDSIGNATURES)

Return number of UTF-8 code-points (NOT bytes count).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L437).
"""
ImTextCountCharsFromUtf8(in_text, in_text_end) = igImTextCountCharsFromUtf8(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return number of bytes to express one char in UTF-8.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L438).
"""
ImTextCountUtf8BytesFromChar(in_text, in_text_end) = igImTextCountUtf8BytesFromChar(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return number of bytes to express string in UTF-8.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L439).
"""
ImTextCountUtf8BytesFromStr(in_text::VoidablePtrOrRef{ImWchar}, in_text_end::VoidablePtrOrRef{ImWchar}) =
    igImTextCountUtf8BytesFromStr(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

Return previous UTF-8 code-point.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L440).
"""
ImTextFindPreviousUtf8Codepoint(in_text_start, in_p) = igImTextFindPreviousUtf8Codepoint(in_text_start, in_p)

"""
$(TYPEDSIGNATURES)

Return previous UTF-8 code-point if 'in_p' is not the end of a valid one.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L441).
"""
ImTextFindValidUtf8CodepointEnd(in_text_start, in_text_end, in_p) =
    igImTextFindValidUtf8CodepointEnd(in_text_start, in_text_end, in_p)

"""
$(TYPEDSIGNATURES)

Return number of lines taken by text. trailing carriage return doesn't count as an extra line.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L442).
"""
ImTextCountLines(in_text, in_text_end) = igImTextCountLines(in_text, in_text_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L452).
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
    out_offset::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L453).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L454).
"""
ImTextCalcWordWrapNextLineStart(text, text_end, flags::Union{ImDrawTextFlags,ImDrawTextFlags_,Integer} = 0) =
    igImTextCalcWordWrapNextLineStart(text, text_end, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L468).
"""
ImFileOpen(filename, mode) = igImFileOpen(filename, mode)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L469).
"""
ImFileClose(file::ImFileHandle) = igImFileClose(file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L470).
"""
ImFileGetSize(file::ImFileHandle) = igImFileGetSize(file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L471).
"""
ImFileRead(data, size::ImU64, count::ImU64, file::ImFileHandle) = igImFileRead(data, size, count, file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L472).
"""
ImFileWrite(data, size::ImU64, count::ImU64, file::ImFileHandle) = igImFileWrite(data, size, count, file)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L476).
"""
ImFileLoadToMemory(filename, mode, out_file_size = C_NULL, padding_bytes = 0) =
    igImFileLoadToMemory(filename, mode, out_file_size, padding_bytes)

"""
$(TYPEDSIGNATURES)

DragBehaviorT/SliderBehaviorT uses ImPow with either float/double and need the precision.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L491).
"""
ImPow(x::Float32, y::Float32) = igImPow_Float(x, y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L492).
"""
ImPow(x::Float64, y::Float64) = igImPow_double(x, y)

"""
$(TYPEDSIGNATURES)

DragBehaviorT/SliderBehaviorT uses ImLog with either float/double and need the precision.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L493).
"""
ImLog(x::Float32) = igImLog_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L494).
"""
ImLog(x::Float64) = igImLog_double(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L495).
"""
ImAbs(x::Integer) = igImAbs_Int(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L496).
"""
ImAbs(x::Float32) = igImAbs_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L497).
"""
ImAbs(x::Float64) = igImAbs_double(x)

"""
$(TYPEDSIGNATURES)

Sign operator - returns -1, 0 or 1 based on sign of argument.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L498).
"""
ImSign(x::Float32) = igImSign_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L499).
"""
ImSign(x::Float64) = igImSign_double(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L501).
"""
ImRsqrt(x::Float32) = igImRsqrt_Float(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L505).
"""
ImRsqrt(x::Float64) = igImRsqrt_double(x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L517).
"""
ImMin(lhs::Union{ImVec2,NTuple{2}}, rhs::Union{ImVec2,NTuple{2}}) = igImMin(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L518).
"""
ImMax(lhs::Union{ImVec2,NTuple{2}}, rhs::Union{ImVec2,NTuple{2}}) = igImMax(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L519).
"""
ImClamp(v::Union{ImVec2,NTuple{2}}, mn::Union{ImVec2,NTuple{2}}, mx::Union{ImVec2,NTuple{2}}) = igImClamp(v, mn, mx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L520).
"""
ImLerp(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, t::Float32) = igImLerp_Vec2Float(a, b, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L521).
"""
ImLerp(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, t::Union{ImVec2,NTuple{2}}) = igImLerp_Vec2Vec2(a, b, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L522).
"""
ImLerp(a::Union{ImVec4,NTuple{4}}, b::Union{ImVec4,NTuple{4}}, t::Float32) = igImLerp_Vec4(a, b, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L523).
"""
ImSaturate(f) = igImSaturate(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L524).
"""
ImLengthSqr(lhs::Union{ImVec2,NTuple{2}}) = igImLengthSqr_Vec2(lhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L525).
"""
ImLengthSqr(lhs::Union{ImVec4,NTuple{4}}) = igImLengthSqr_Vec4(lhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L526).
"""
ImInvLength(lhs::Union{ImVec2,NTuple{2}}, fail_value) = igImInvLength(lhs, fail_value)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L527).
"""
ImTrunc(f::Real) = igImTrunc_Float(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L528).
"""
ImTrunc(v::Union{ImVec2,NTuple{2}}) = igImTrunc_Vec2(v)

"""
$(TYPEDSIGNATURES)

Decent replacement for floorf().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L529).
"""
ImFloor(f::Real) = igImFloor_Float(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L530).
"""
ImFloor(v::Union{ImVec2,NTuple{2}}) = igImFloor_Vec2(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L531).
"""
ImTrunc64(f) = igImTrunc64(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L532).
"""
ImRound64(f) = igImRound64(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L533).
"""
ImModPositive(a, b) = igImModPositive(a, b)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L534).
"""
ImDot(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}) = igImDot(a, b)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L535).
"""
ImRotate(v::Union{ImVec2,NTuple{2}}, cos_a, sin_a) = igImRotate(v, cos_a, sin_a)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L536).
"""
ImLinearSweep(current, target, speed) = igImLinearSweep(current, target, speed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L537).
"""
ImLinearRemapClamp(s0, s1, d0, d1, x) = igImLinearRemapClamp(s0, s1, d0, d1, x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L538).
"""
ImMul(lhs::Union{ImVec2,NTuple{2}}, rhs::Union{ImVec2,NTuple{2}}) = igImMul(lhs, rhs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L539).
"""
ImIsFloatAboveGuaranteedIntegerPrecision(f) = igImIsFloatAboveGuaranteedIntegerPrecision(f)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L540).
"""
ImExponentialMovingAverage(avg, sample, n) = igImExponentialMovingAverage(avg, sample, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L544).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L545).
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

For auto-tessellated curves you can use tess_tol = style.CurveTessellationTol.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L546).
"""
ImBezierCubicClosestPointCasteljau(
    p1::Union{ImVec2,NTuple{2}},
    p2::Union{ImVec2,NTuple{2}},
    p3::Union{ImVec2,NTuple{2}},
    p4::Union{ImVec2,NTuple{2}},
    p::Union{ImVec2,NTuple{2}},
    tess_tol,
) = igImBezierCubicClosestPointCasteljau(p1, p2, p3, p4, p, tess_tol)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L547).
"""
ImBezierQuadraticCalc(p1::Union{ImVec2,NTuple{2}}, p2::Union{ImVec2,NTuple{2}}, p3::Union{ImVec2,NTuple{2}}, t) =
    igImBezierQuadraticCalc(p1, p2, p3, t)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L548).
"""
ImLineClosestPoint(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, p::Union{ImVec2,NTuple{2}}) =
    igImLineClosestPoint(a, b, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L549).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L550).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L551).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L552).
"""
ImTriangleArea(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, c::Union{ImVec2,NTuple{2}}) =
    igImTriangleArea(a, b, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L553).
"""
ImTriangleIsClockwise(a::Union{ImVec2,NTuple{2}}, b::Union{ImVec2,NTuple{2}}, c::Union{ImVec2,NTuple{2}}) =
    igImTriangleIsClockwise(a, b, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L561).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L594).
"""
GetCenter(self::Ptr{ImRect}) = ImRect_GetCenter(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L595).
"""
GetSize(self::Ptr{ImRect}) = ImRect_GetSize(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L596).
"""
GetWidth(self::Ptr{ImRect}) = ImRect_GetWidth(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L597).
"""
GetHeight(self::Ptr{ImRect}) = ImRect_GetHeight(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L598).
"""
GetArea(self::Ptr{ImRect}) = ImRect_GetArea(self)

"""
$(TYPEDSIGNATURES)

Top-left.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L599).
"""
GetTL(self::Ptr{ImRect}) = ImRect_GetTL(self)

"""
$(TYPEDSIGNATURES)

Top-right.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L600).
"""
GetTR(self::Ptr{ImRect}) = ImRect_GetTR(self)

"""
$(TYPEDSIGNATURES)

Bottom-left.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L601).
"""
GetBL(self::Ptr{ImRect}) = ImRect_GetBL(self)

"""
$(TYPEDSIGNATURES)

Bottom-right.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L602).
"""
GetBR(self::Ptr{ImRect}) = ImRect_GetBR(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L605).
"""
ContainsWithPad(self::Ptr{ImRect}, p::Union{ImVec2,NTuple{2}}, pad::Union{ImVec2,NTuple{2}}) =
    ImRect_ContainsWithPad(self, p, pad)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L606).
"""
Overlaps(self::Ptr{ImRect}, r::ImRect) = ImRect_Overlaps(self, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L611).
"""
Translate(self::Ptr{ImRect}, d::Union{ImVec2,NTuple{2}}) = ImRect_Translate(self, d)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L612).
"""
TranslateX(self::Ptr{ImRect}, dx) = ImRect_TranslateX(self, dx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L613).
"""
TranslateY(self::Ptr{ImRect}, dy) = ImRect_TranslateY(self, dy)

"""
$(TYPEDSIGNATURES)

Simple version, may lead to an inverted rectangle, which is fine for Contains/Overlaps test but not for display.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L614).
"""
ClipWith(self::Ptr{ImRect}, r::ImRect) = ImRect_ClipWith(self, r)

"""
$(TYPEDSIGNATURES)

Full version, ensure both points are fully clipped.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L615).
"""
ClipWithFull(self::Ptr{ImRect}, r::ImRect) = ImRect_ClipWithFull(self, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L616).
"""
Floor(self::Ptr{ImRect}) = ImRect_Floor(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L617).
"""
IsInverted(self::Ptr{ImRect}) = ImRect_IsInverted(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L618).
"""
ToVec4(self::Ptr{ImRect}) = ImRect_ToVec4(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L619).
"""
AsVec4(self::Ptr{ImRect}) = ImRect_AsVec4(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L625).
"""
ImBitArrayGetStorageSizeInBytes(bitcount) = igImBitArrayGetStorageSizeInBytes(bitcount)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L626).
"""
ImBitArrayClearAllBits(arr::Union{VoidablePtrOrRef{ImU32},VoidablePtrOrRef{Integer}}, bitcount) =
    igImBitArrayClearAllBits(arr, bitcount)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L627).
"""
ImBitArrayTestBit(arr::Union{VoidablePtrOrRef{ImU32},VoidablePtrOrRef{Integer}}, n) = igImBitArrayTestBit(arr, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L628).
"""
ImBitArrayClearBit(arr::Union{VoidablePtrOrRef{ImU32},VoidablePtrOrRef{Integer}}, n) = igImBitArrayClearBit(arr, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L629).
"""
ImBitArraySetBit(arr::Union{VoidablePtrOrRef{ImU32},VoidablePtrOrRef{Integer}}, n) = igImBitArraySetBit(arr, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L630).
"""
ImBitArraySetBitRange(arr::Union{VoidablePtrOrRef{ImU32},VoidablePtrOrRef{Integer}}, n, n2) =
    igImBitArraySetBitRange(arr, n, n2)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L666).
"""
Create(self::Ptr{ImBitVector}, sz) = ImBitVector_Create(self, sz)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L667).
"""
Clear(self::Ptr{ImBitVector}) = ImBitVector_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L668).
"""
TestBit(self::Ptr{ImBitVector}, n) = ImBitVector_TestBit(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L669).
"""
SetBit(self::Ptr{ImBitVector}, n) = ImBitVector_SetBit(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L670).
"""
ClearBit(self::Ptr{ImBitVector}, n) = ImBitVector_ClearBit(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L821).
"""
Clear(self::Ptr{ImGuiTextIndex}) = ImGuiTextIndex_clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L822).
"""
Size(self::Ptr{ImGuiTextIndex}) = ImGuiTextIndex_size(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L823).
"""
Get_line_begin(self::Ptr{ImGuiTextIndex}, base, n) = ImGuiTextIndex_get_line_begin(self, base, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L824).
"""
Get_line_end(self::Ptr{ImGuiTextIndex}, base, n) = ImGuiTextIndex_get_line_end(self, base, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L825).
"""
Append(self::Ptr{ImGuiTextIndex}, base, old_size, new_size) = ImGuiTextIndex_append(self, base, old_size, new_size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L829).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L886).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L888).
"""
SetCircleTessellationMaxError(self::Ptr{ImDrawListSharedData}, max_error) =
    ImDrawListSharedData_SetCircleTessellationMaxError(self, max_error)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L896).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L915).
"""
GetVarPtr(self::Ptr{ImGuiStyleVarInfo}, parent) = ImGuiStyleVarInfo_GetVarPtr(self, parent)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L930).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L931).
"""
lib.ImGuiStyleMod(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, v::Real) = ImGuiStyleMod_ImGuiStyleMod_Float(idx, v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L932).
"""
lib.ImGuiStyleMod(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}, v::Union{ImVec2,NTuple{2}}) =
    ImGuiStyleMod_ImGuiStyleMod_Vec2(idx, v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1172).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1206).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1207).
"""
Update(self::Ptr{ImGuiMenuColumns}, spacing, window_reappearing) =
    ImGuiMenuColumns_Update(self, spacing, window_reappearing)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1208).
"""
DeclColumns(self::Ptr{ImGuiMenuColumns}, w_icon, w_label, w_shortcut, w_mark) =
    ImGuiMenuColumns_DeclColumns(self, w_icon, w_label, w_shortcut, w_mark)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1209).
"""
CalcNextTotalWidth(self::Ptr{ImGuiMenuColumns}, update_offsets) =
    ImGuiMenuColumns_CalcNextTotalWidth(self, update_offsets)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1218).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1219).
"""
ClearFreeMemory(self::Ptr{ImGuiInputTextDeactivatedState}) = ImGuiInputTextDeactivatedState_ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1260).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1262).
"""
ClearText(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ClearText(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1263).
"""
ClearFreeMemory(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ClearFreeMemory(self)

"""
$(TYPEDSIGNATURES)

Cannot be inline because we call in code in stb_textedit.h implementation.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1264).
"""
OnKeyPressed(self::Ptr{ImGuiInputTextState}, key) = ImGuiInputTextState_OnKeyPressed(self, key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1265).
"""
OnCharPressed(self::Ptr{ImGuiInputTextState}, c) = ImGuiInputTextState_OnCharPressed(self, c)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1266).
"""
GetPreferredOffsetX(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetPreferredOffsetX(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1269).
"""
CursorAnimReset(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_CursorAnimReset(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1270).
"""
CursorClamp(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_CursorClamp(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1271).
"""
HasSelection(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_HasSelection(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1272).
"""
ClearSelection(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ClearSelection(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1273).
"""
GetCursorPos(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetCursorPos(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1274).
"""
GetSelectionStart(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetSelectionStart(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1275).
"""
GetSelectionEnd(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_GetSelectionEnd(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1276).
"""
SelectAll(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_SelectAll(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1283).
"""
ReloadUserBufAndSelectAll(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ReloadUserBufAndSelectAll(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1284).
"""
ReloadUserBufAndKeepSelection(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ReloadUserBufAndKeepSelection(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1285).
"""
ReloadUserBufAndMoveToEnd(self::Ptr{ImGuiInputTextState}) = ImGuiInputTextState_ReloadUserBufAndMoveToEnd(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1351).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1352).
"""
ClearFlags(self::Ptr{ImGuiNextWindowData}) = ImGuiNextWindowData_ClearFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1381).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1382).
"""
ClearFlags(self::Ptr{ImGuiNextItemData}) = ImGuiNextItemData_ClearFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1398).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1431).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1456).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1457).
"""
lib.ImGuiPtrOrIndex(index::Integer) = ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1492).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1573).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1593).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1604).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1605).
"""
Clear(self::Ptr{ImGuiKeyRoutingTable}) = ImGuiKeyRoutingTable_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1617).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1675).
"""
FromIndices(min, max) = ImGuiListClipperRange_FromIndices(min, max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1676).
"""
FromPositions(y1, y2, off_min, off_max) = ImGuiListClipperRange_FromPositions(y1, y2, off_min, off_max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1688).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1689).
"""
Reset(self::Ptr{ImGuiListClipperData}, clipper::VoidablePtrOrRef{ImGuiListClipper}) =
    ImGuiListClipperData_Reset(self, clipper)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1779).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1780).
"""
Clear(self::Ptr{ImGuiNavItemData}) = ImGuiNavItemData_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1823).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1824).
"""
Clear(self::Ptr{ImGuiTypingSelectState}) = ImGuiTypingSelectState_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1859).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1880).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1908).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1938).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1939).
"""
Clear(self::Ptr{ImGuiMultiSelectTempData}) = ImGuiMultiSelectTempData_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1940).
"""
ClearIO(self::Ptr{ImGuiMultiSelectTempData}) = ImGuiMultiSelectTempData_ClearIO(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L1955).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2062).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2064).
"""
IsRootNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsRootNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2065).
"""
IsDockSpace(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsDockSpace(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2066).
"""
IsFloatingNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsFloatingNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2067).
"""
IsCentralNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsCentralNode(self)

"""
$(TYPEDSIGNATURES)

Hidden tab bar can be shown back by clicking the small triangle.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2068).
"""
IsHiddenTabBar(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsHiddenTabBar(self)

"""
$(TYPEDSIGNATURES)

Never show a tab bar.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2069).
"""
IsNoTabBar(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsNoTabBar(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2070).
"""
IsSplitNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsSplitNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2071).
"""
IsLeafNode(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsLeafNode(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2072).
"""
IsEmpty(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_IsEmpty(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2073).
"""
Rect(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_Rect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2075).
"""
SetLocalFlags(self::Ptr{ImGuiDockNode}, flags::Union{ImGuiDockNodeFlags,ImGuiDockNodeFlags_,Integer}) =
    ImGuiDockNode_SetLocalFlags(self, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2076).
"""
UpdateMergedFlags(self::Ptr{ImGuiDockNode}) = ImGuiDockNode_UpdateMergedFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2109).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2150).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2152).
"""
ClearRequestFlags(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_ClearRequestFlags(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2155).
"""
CalcWorkRectPos(self::Ptr{ImGuiViewportP}, inset_min::Union{ImVec2,NTuple{2}}) =
    ImGuiViewportP_CalcWorkRectPos(self, inset_min)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2156).
"""
CalcWorkRectSize(self::Ptr{ImGuiViewportP}, inset_min::Union{ImVec2,NTuple{2}}, inset_max::Union{ImVec2,NTuple{2}}) =
    ImGuiViewportP_CalcWorkRectSize(self, inset_min, inset_max)

"""
$(TYPEDSIGNATURES)

Update public fields.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2157).
"""
UpdateWorkRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_UpdateWorkRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2160).
"""
GetMainRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_GetMainRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2161).
"""
GetWorkRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_GetWorkRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2162).
"""
GetBuildWorkRect(self::Ptr{ImGuiViewportP}) = ImGuiViewportP_GetBuildWorkRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2187).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2188).
"""
GetName(self::Ptr{ImGuiWindowSettings}) = ImGuiWindowSettings_GetName(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2203).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2292).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2322).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2335).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2346).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2364).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2766).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2966).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2970).
"""
GetID(self::Ptr{ImGuiWindow}, str::Union{String,Ptr{Cchar}}, str_end::Union{String,Ptr{Cchar},Ptr{Cvoid}} = C_NULL) =
    ImGuiWindow_GetID_Str(self, str, str_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2971).
"""
GetID(self::Ptr{ImGuiWindow}, ptr::PtrOrRef{Cvoid}) = ImGuiWindow_GetID_Ptr(self, ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2972).
"""
GetID(self::Ptr{ImGuiWindow}, n::Integer) = ImGuiWindow_GetID_Int(self, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2973).
"""
GetIDFromPos(self::Ptr{ImGuiWindow}, p_abs::Union{ImVec2,NTuple{2}}) = ImGuiWindow_GetIDFromPos(self, p_abs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2974).
"""
GetIDFromRectangle(self::Ptr{ImGuiWindow}, r_abs::ImRect) = ImGuiWindow_GetIDFromRectangle(self, r_abs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2977).
"""
Rect(self::Ptr{ImGuiWindow}) = ImGuiWindow_Rect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2978).
"""
TitleBarRect(self::Ptr{ImGuiWindow}) = ImGuiWindow_TitleBarRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L2979).
"""
MenuBarRect(self::Ptr{ImGuiWindow}) = ImGuiWindow_MenuBarRect(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3024).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3067).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3126).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3169).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3289).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3318).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3333).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3355).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3356).
"""
GetColumnSettings(self::Ptr{ImGuiTableSettings}) = ImGuiTableSettings_GetColumnSettings(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3371).
"""
GetIO(ctx::VoidablePtrOrRef{ImGuiContext}) = igGetIO_ContextPtr(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3372).
"""
GetPlatformIO(ctx::VoidablePtrOrRef{ImGuiContext}) = igGetPlatformIO_ContextPtr(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3373).
"""
GetCurrentWindowRead() = igGetCurrentWindowRead()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3374).
"""
GetCurrentWindow() = igGetCurrentWindow()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3375).
"""
FindWindowByID(id::Union{ImGuiID,Integer}) = igFindWindowByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3376).
"""
FindWindowByName(name) = igFindWindowByName(name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3377).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3378).
"""
UpdateWindowSkipRefresh(window::VoidablePtrOrRef{ImGuiWindow}) = igUpdateWindowSkipRefresh(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3379).
"""
CalcWindowNextAutoFitSize(window::VoidablePtrOrRef{ImGuiWindow}) = igCalcWindowNextAutoFitSize(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3380).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3381).
"""
IsWindowInBeginStack(window::VoidablePtrOrRef{ImGuiWindow}) = igIsWindowInBeginStack(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3382).
"""
IsWindowWithinBeginStackOf(window::VoidablePtrOrRef{ImGuiWindow}, potential_parent::VoidablePtrOrRef{ImGuiWindow}) =
    igIsWindowWithinBeginStackOf(window, potential_parent)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3383).
"""
IsWindowAbove(potential_above::VoidablePtrOrRef{ImGuiWindow}, potential_below::VoidablePtrOrRef{ImGuiWindow}) =
    igIsWindowAbove(potential_above, potential_below)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3384).
"""
IsWindowNavFocusable(window::VoidablePtrOrRef{ImGuiWindow}) = igIsWindowNavFocusable(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3385).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3386).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3387).
"""
SetWindowCollapsed(window::PtrOrRef{ImGuiWindow}, collapsed::Bool, cond::Union{ImGuiCond,ImGuiCond_,Integer} = 0) =
    igSetWindowCollapsed_WindowPtr(window, collapsed, cond)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3388).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3389).
"""
SetWindowHiddenAndSkipItemsForCurrentFrame(window::VoidablePtrOrRef{ImGuiWindow}) =
    igSetWindowHiddenAndSkipItemsForCurrentFrame(window)

"""
$(TYPEDSIGNATURES)

You may also use SetNextWindowClass()'s FocusRouteParentWindowId field.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3390).
"""
SetWindowParentWindowForFocusRoute(
    window::VoidablePtrOrRef{ImGuiWindow},
    parent_window::VoidablePtrOrRef{ImGuiWindow},
) = igSetWindowParentWindowForFocusRoute(window, parent_window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3391).
"""
WindowRectAbsToRel(window::VoidablePtrOrRef{ImGuiWindow}, r::ImRect) = igWindowRectAbsToRel(window, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3392).
"""
WindowRectRelToAbs(window::VoidablePtrOrRef{ImGuiWindow}, r::ImRect) = igWindowRectRelToAbs(window, r)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3393).
"""
WindowPosAbsToRel(window::VoidablePtrOrRef{ImGuiWindow}, p::Union{ImVec2,NTuple{2}}) = igWindowPosAbsToRel(window, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3394).
"""
WindowPosRelToAbs(window::VoidablePtrOrRef{ImGuiWindow}, p::Union{ImVec2,NTuple{2}}) = igWindowPosRelToAbs(window, p)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3397).
"""
FocusWindow(
    window::VoidablePtrOrRef{ImGuiWindow},
    flags::Union{ImGuiFocusRequestFlags,ImGuiFocusRequestFlags_,Integer} = 0,
) = igFocusWindow(window, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3398).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3399).
"""
BringWindowToFocusFront(window::VoidablePtrOrRef{ImGuiWindow}) = igBringWindowToFocusFront(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3400).
"""
BringWindowToDisplayFront(window::VoidablePtrOrRef{ImGuiWindow}) = igBringWindowToDisplayFront(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3401).
"""
BringWindowToDisplayBack(window::VoidablePtrOrRef{ImGuiWindow}) = igBringWindowToDisplayBack(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3402).
"""
BringWindowToDisplayBehind(window::VoidablePtrOrRef{ImGuiWindow}, above_window::VoidablePtrOrRef{ImGuiWindow}) =
    igBringWindowToDisplayBehind(window, above_window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3403).
"""
FindWindowDisplayIndex(window::VoidablePtrOrRef{ImGuiWindow}) = igFindWindowDisplayIndex(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3404).
"""
FindBottomMostVisibleWindowWithinBeginStack(window::VoidablePtrOrRef{ImGuiWindow}) =
    igFindBottomMostVisibleWindowWithinBeginStack(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3407).
"""
SetNextWindowRefreshPolicy(flags::Union{ImGuiWindowRefreshFlags,ImGuiWindowRefreshFlags_,Integer}) =
    igSetNextWindowRefreshPolicy(flags)

"""
$(TYPEDSIGNATURES)

Register external texture. EXPERIMENTAL: DO NOT USE YET.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3410).
"""
RegisterUserTexture(tex::VoidablePtrOrRef{ImTextureData}) = igRegisterUserTexture(tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3411).
"""
UnregisterUserTexture(tex::VoidablePtrOrRef{ImTextureData}) = igUnregisterUserTexture(tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3412).
"""
RegisterFontAtlas(atlas::VoidablePtrOrRef{ImFontAtlas}) = igRegisterFontAtlas(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3413).
"""
UnregisterFontAtlas(atlas::VoidablePtrOrRef{ImFontAtlas}) = igUnregisterFontAtlas(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3414).
"""
SetCurrentFont(font::VoidablePtrOrRef{ImFont}, font_size_before_scaling, font_size_after_scaling) =
    igSetCurrentFont(font, font_size_before_scaling, font_size_after_scaling)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3415).
"""
UpdateCurrentFontSize(restore_font_size_after_scaling) = igUpdateCurrentFontSize(restore_font_size_after_scaling)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3416).
"""
SetFontRasterizerDensity(rasterizer_density) = igSetFontRasterizerDensity(rasterizer_density)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3417).
"""
GetFontRasterizerDensity() = igGetFontRasterizerDensity()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3418).
"""
GetRoundedFontSize(size) = igGetRoundedFontSize(size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3419).
"""
GetDefaultFont() = igGetDefaultFont()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3420).
"""
PushPasswordFont() = igPushPasswordFont()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3421).
"""
PopPasswordFont() = igPopPasswordFont()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3423).
"""
AddDrawListToDrawDataEx(
    draw_data::VoidablePtrOrRef{ImDrawData},
    out_list::VoidablePtrOrRef{ImVector_ImDrawListPtr},
    draw_list::VoidablePtrOrRef{ImDrawList},
) = igAddDrawListToDrawDataEx(draw_data, out_list, draw_list)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3426).
"""
Initialize() = igInitialize()

"""
$(TYPEDSIGNATURES)

Since 1.60 this is a _private_ function. You can call DestroyContext() to destroy the context created by CreateContext().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3427).
"""
Shutdown() = igShutdown()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3430).
"""
UpdateInputEvents(trickle_fast_inputs) = igUpdateInputEvents(trickle_fast_inputs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3431).
"""
UpdateHoveredWindowAndCaptureFlags(mouse_pos::Union{ImVec2,NTuple{2}}) = igUpdateHoveredWindowAndCaptureFlags(mouse_pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3433).
"""
StartMouseMovingWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igStartMouseMovingWindow(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3434).
"""
StartMouseMovingWindowOrNode(window::VoidablePtrOrRef{ImGuiWindow}, node::VoidablePtrOrRef{ImGuiDockNode}, undock) =
    igStartMouseMovingWindowOrNode(window, node, undock)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3435).
"""
StopMouseMovingWindow() = igStopMouseMovingWindow()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3436).
"""
UpdateMouseMovingWindowNewFrame() = igUpdateMouseMovingWindowNewFrame()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3437).
"""
UpdateMouseMovingWindowEndFrame() = igUpdateMouseMovingWindowEndFrame()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3440).
"""
AddContextHook(context::VoidablePtrOrRef{ImGuiContext}, hook::VoidablePtrOrRef{ImGuiContextHook}) =
    igAddContextHook(context, hook)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3441).
"""
RemoveContextHook(context::VoidablePtrOrRef{ImGuiContext}, hook_to_remove::Union{ImGuiID,Integer}) =
    igRemoveContextHook(context, hook_to_remove)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3442).
"""
CallContextHooks(context::VoidablePtrOrRef{ImGuiContext}, type::ImGuiContextHookType) =
    igCallContextHooks(context, type)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3445).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3446).
"""
ScaleWindowsInViewport(viewport::VoidablePtrOrRef{ImGuiViewportP}, scale) = igScaleWindowsInViewport(viewport, scale)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3447).
"""
DestroyPlatformWindow(viewport::VoidablePtrOrRef{ImGuiViewportP}) = igDestroyPlatformWindow(viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3448).
"""
SetWindowViewport(window::VoidablePtrOrRef{ImGuiWindow}, viewport::VoidablePtrOrRef{ImGuiViewportP}) =
    igSetWindowViewport(window, viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3449).
"""
SetCurrentViewport(window::VoidablePtrOrRef{ImGuiWindow}, viewport::VoidablePtrOrRef{ImGuiViewportP}) =
    igSetCurrentViewport(window, viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3450).
"""
GetViewportPlatformMonitor(viewport::VoidablePtrOrRef{ImGuiViewport}) = igGetViewportPlatformMonitor(viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3451).
"""
FindHoveredViewportFromPlatformWindowStack(mouse_platform_pos::Union{ImVec2,NTuple{2}}) =
    igFindHoveredViewportFromPlatformWindowStack(mouse_platform_pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3454).
"""
MarkIniSettingsDirty() = igMarkIniSettingsDirty_Nil()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3455).
"""
MarkIniSettingsDirty(window::VoidablePtrOrRef{ImGuiWindow}) = igMarkIniSettingsDirty_WindowPtr(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3456).
"""
ClearIniSettings() = igClearIniSettings()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3457).
"""
AddSettingsHandler(handler::VoidablePtrOrRef{ImGuiSettingsHandler}) = igAddSettingsHandler(handler)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3458).
"""
RemoveSettingsHandler(type_name) = igRemoveSettingsHandler(type_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3459).
"""
FindSettingsHandler(type_name) = igFindSettingsHandler(type_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3462).
"""
CreateNewWindowSettings(name) = igCreateNewWindowSettings(name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3463).
"""
FindWindowSettingsByID(id::Union{ImGuiID,Integer}) = igFindWindowSettingsByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3464).
"""
FindWindowSettingsByWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igFindWindowSettingsByWindow(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3465).
"""
ClearWindowSettings(name) = igClearWindowSettings(name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3468).
"""
LocalizeRegisterEntries(entries::VoidablePtrOrRef{ImGuiLocEntry}, count) = igLocalizeRegisterEntries(entries, count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3469).
"""
LocalizeGetMsg(key::ImGuiLocKey) = igLocalizeGetMsg(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3472).
"""
SetScrollX(window::VoidablePtrOrRef{ImGuiWindow}, scroll_x::Real) = igSetScrollX_WindowPtr(window, scroll_x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3473).
"""
SetScrollY(window::VoidablePtrOrRef{ImGuiWindow}, scroll_y::Real) = igSetScrollY_WindowPtr(window, scroll_y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3474).
"""
SetScrollFromPosX(window::VoidablePtrOrRef{ImGuiWindow}, local_x::Real, center_x_ratio::Real) =
    igSetScrollFromPosX_WindowPtr(window, local_x, center_x_ratio)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3475).
"""
SetScrollFromPosY(window::VoidablePtrOrRef{ImGuiWindow}, local_y::Real, center_y_ratio::Real) =
    igSetScrollFromPosY_WindowPtr(window, local_y, center_y_ratio)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3478).
"""
ScrollToItem(flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer} = 0) = igScrollToItem(flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3479).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3480).
"""
ScrollToRectEx(
    window::VoidablePtrOrRef{ImGuiWindow},
    rect::ImRect,
    flags::Union{ImGuiScrollFlags,ImGuiScrollFlags_,Integer} = 0,
) = igScrollToRectEx(window, rect, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3482).
"""
ScrollToBringRectIntoView(window::VoidablePtrOrRef{ImGuiWindow}, rect::ImRect) =
    igScrollToBringRectIntoView(window, rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3486).
"""
GetItemStatusFlags() = igGetItemStatusFlags()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3487).
"""
GetItemFlags() = igGetItemFlags()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3488).
"""
GetActiveID() = igGetActiveID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3489).
"""
GetFocusID() = igGetFocusID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3490).
"""
SetActiveID(id::Union{ImGuiID,Integer}, window::VoidablePtrOrRef{ImGuiWindow}) = igSetActiveID(id, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3491).
"""
SetFocusID(id::Union{ImGuiID,Integer}, window::VoidablePtrOrRef{ImGuiWindow}) = igSetFocusID(id, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3492).
"""
ClearActiveID() = igClearActiveID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3493).
"""
GetHoveredID() = igGetHoveredID()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3494).
"""
SetHoveredID(id::Union{ImGuiID,Integer}) = igSetHoveredID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3495).
"""
KeepAliveID(id::Union{ImGuiID,Integer}) = igKeepAliveID(id)

"""
$(TYPEDSIGNATURES)

Mark data associated to given item as "edited", used by IsItemDeactivatedAfterEdit() function.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3496).
"""
MarkItemEdited(id::Union{ImGuiID,Integer}) = igMarkItemEdited(id)

"""
$(TYPEDSIGNATURES)

Push given value as-is at the top of the ID stack (whereas PushID combines old and new hashes).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3497).
"""
PushOverrideID(id::Union{ImGuiID,Integer}) = igPushOverrideID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3498).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3499).
"""
GetIDWithSeed(n::Integer, seed::Union{ImGuiID,Integer}) = igGetIDWithSeed_Int(n, seed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3502).
"""
ItemSize(size::Union{ImVec2,NTuple{2}}, text_baseline_y::Real = -1.0f0) = igItemSize_Vec2(size, text_baseline_y)

"""
$(TYPEDSIGNATURES)

FIXME: This is a misleading API since we expect CursorPos to be bb.Min.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3503).
"""
ItemSize(bb::ImRect, text_baseline_y::Real = -1.0f0) = igItemSize_Rect(bb, text_baseline_y)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3504).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3505).
"""
ItemHoverable(bb::ImRect, id::Union{ImGuiID,Integer}, item_flags::Union{ImGuiItemFlags,ImGuiItemFlags_,Integer}) =
    igItemHoverable(bb, id, item_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3506).
"""
IsWindowContentHoverable(
    window::VoidablePtrOrRef{ImGuiWindow},
    flags::Union{ImGuiHoveredFlags,ImGuiHoveredFlags_,Integer} = 0,
) = igIsWindowContentHoverable(window, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3507).
"""
IsClippedEx(bb::ImRect, id::Union{ImGuiID,Integer}) = igIsClippedEx(bb, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3508).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3509).
"""
CalcItemSize(size::Union{ImVec2,NTuple{2}}, default_w, default_h) = igCalcItemSize(size, default_w, default_h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3510).
"""
CalcWrapWidthForPos(pos::Union{ImVec2,NTuple{2}}, wrap_pos_x) = igCalcWrapWidthForPos(pos, wrap_pos_x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3511).
"""
PushMultiItemsWidths(components, width_full) = igPushMultiItemsWidths(components, width_full)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3512).
"""
ShrinkWidths(items::VoidablePtrOrRef{ImGuiShrinkWidthItem}, count, width_excess, width_min) =
    igShrinkWidths(items, count, width_excess, width_min)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3513).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3516).
"""
GetStyleVarInfo(idx::Union{ImGuiStyleVar,ImGuiStyleVar_,Integer}) = igGetStyleVarInfo(idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3517).
"""
BeginDisabledOverrideReenable() = igBeginDisabledOverrideReenable()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3518).
"""
EndDisabledOverrideReenable() = igEndDisabledOverrideReenable()

"""
$(TYPEDSIGNATURES)

-> BeginCapture() when we design v2 api, for now stay under the radar by using the old name.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3521).
"""
LogBegin(flags::Union{ImGuiLogFlags,ImGuiLogFlags_,Integer}, auto_open_depth) = igLogBegin(flags, auto_open_depth)

"""
$(TYPEDSIGNATURES)

Start logging/capturing to internal buffer.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3522).
"""
LogToBuffer(auto_open_depth = -1) = igLogToBuffer(auto_open_depth)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3523).
"""
LogRenderedText(ref_pos::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}}, text, text_end = C_NULL) =
    igLogRenderedText(ref_pos, text, text_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3524).
"""
LogSetNextTextDecoration(prefix, suffix) = igLogSetNextTextDecoration(prefix, suffix)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3527).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3530).
"""
BeginPopupEx(id::Union{ImGuiID,Integer}, extra_window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer}) =
    igBeginPopupEx(id, extra_window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3531).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3532).
"""
OpenPopupEx(
    id::Union{ImGuiID,Integer},
    popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer} = ImGuiPopupFlags_None,
) = igOpenPopupEx(id, popup_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3533).
"""
ClosePopupToLevel(remaining, restore_focus_to_window_under_popup) =
    igClosePopupToLevel(remaining, restore_focus_to_window_under_popup)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3534).
"""
ClosePopupsOverWindow(ref_window::VoidablePtrOrRef{ImGuiWindow}, restore_focus_to_window_under_popup) =
    igClosePopupsOverWindow(ref_window, restore_focus_to_window_under_popup)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3535).
"""
ClosePopupsExceptModals() = igClosePopupsExceptModals()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3536).
"""
IsPopupOpen(id::Union{ImGuiID,Integer}, popup_flags::Union{ImGuiPopupFlags,ImGuiPopupFlags_,Integer}) =
    igIsPopupOpen_ID(id, popup_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3537).
"""
GetPopupAllowedExtentRect(window::VoidablePtrOrRef{ImGuiWindow}) = igGetPopupAllowedExtentRect(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3538).
"""
GetTopMostPopupModal() = igGetTopMostPopupModal()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3539).
"""
GetTopMostAndVisiblePopupModal() = igGetTopMostAndVisiblePopupModal()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3540).
"""
FindBlockingModal(window::VoidablePtrOrRef{ImGuiWindow}) = igFindBlockingModal(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3541).
"""
FindBestWindowPosForPopup(window::VoidablePtrOrRef{ImGuiWindow}) = igFindBestWindowPosForPopup(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3542).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3545).
"""
BeginTooltipEx(
    tooltip_flags::Union{ImGuiTooltipFlags,ImGuiTooltipFlags_,Integer},
    extra_window_flags::Union{ImGuiWindowFlags,ImGuiWindowFlags_,Integer},
) = igBeginTooltipEx(tooltip_flags, extra_window_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3546).
"""
BeginTooltipHidden() = igBeginTooltipHidden()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3549).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3550).
"""
BeginMenuEx(label, icon, enabled = true) = igBeginMenuEx(label, icon, enabled)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3551).
"""
MenuItemEx(label, icon, shortcut = C_NULL, selected = false, enabled = true) =
    igMenuItemEx(label, icon, shortcut, selected, enabled)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3554).
"""
BeginComboPopup(popup_id::Union{ImGuiID,Integer}, bb::ImRect, flags::Union{ImGuiComboFlags,ImGuiComboFlags_,Integer}) =
    igBeginComboPopup(popup_id, bb, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3555).
"""
BeginComboPreview() = igBeginComboPreview()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3556).
"""
EndComboPreview() = igEndComboPreview()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3559).
"""
NavInitWindow(window::VoidablePtrOrRef{ImGuiWindow}, force_reinit) = igNavInitWindow(window, force_reinit)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3560).
"""
NavInitRequestApplyResult() = igNavInitRequestApplyResult()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3561).
"""
NavMoveRequestButNoResultYet() = igNavMoveRequestButNoResultYet()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3562).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3563).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3564).
"""
NavMoveRequestResolveWithLastItem(result::VoidablePtrOrRef{ImGuiNavItemData}) =
    igNavMoveRequestResolveWithLastItem(result)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3565).
"""
NavMoveRequestResolveWithPastTreeNode(
    result::VoidablePtrOrRef{ImGuiNavItemData},
    tree_node_data::VoidablePtrOrRef{ImGuiTreeNodeStackData},
) = igNavMoveRequestResolveWithPastTreeNode(result, tree_node_data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3566).
"""
NavMoveRequestCancel() = igNavMoveRequestCancel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3567).
"""
NavMoveRequestApplyResult() = igNavMoveRequestApplyResult()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3568).
"""
NavMoveRequestTryWrapping(
    window::VoidablePtrOrRef{ImGuiWindow},
    move_flags::Union{ImGuiNavMoveFlags,ImGuiNavMoveFlags_,Integer},
) = igNavMoveRequestTryWrapping(window, move_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3569).
"""
NavHighlightActivated(id::Union{ImGuiID,Integer}) = igNavHighlightActivated(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3570).
"""
NavClearPreferredPosForAxis(axis::ImGuiAxis) = igNavClearPreferredPosForAxis(axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3571).
"""
SetNavCursorVisibleAfterMove() = igSetNavCursorVisibleAfterMove()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3572).
"""
NavUpdateCurrentWindowIsScrollPushableX() = igNavUpdateCurrentWindowIsScrollPushableX()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3573).
"""
SetNavWindow(window::VoidablePtrOrRef{ImGuiWindow}) = igSetNavWindow(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3574).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3575).
"""
SetNavFocusScope(focus_scope_id::Union{ImGuiID,Integer}) = igSetNavFocusScope(focus_scope_id)

"""
$(TYPEDSIGNATURES)

Focus last item (no selection/activation).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3580).
"""
FocusItem() = igFocusItem()

"""
$(TYPEDSIGNATURES)

Activate an item by ID (button, checkbox, tree node etc.). Activation is queued and processed on the next frame when the item is encountered again. Was called 'ActivateItem()' before 1.89.7.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3581).
"""
ActivateItemByID(id::Union{ImGuiID,Integer}) = igActivateItemByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3585).
"""
IsNamedKey(key::ImGuiKey) = igIsNamedKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3586).
"""
IsNamedKeyOrMod(key::ImGuiKey) = igIsNamedKeyOrMod(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3587).
"""
IsLegacyKey(key::ImGuiKey) = igIsLegacyKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3588).
"""
IsKeyboardKey(key::ImGuiKey) = igIsKeyboardKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3589).
"""
IsGamepadKey(key::ImGuiKey) = igIsGamepadKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3590).
"""
IsMouseKey(key::ImGuiKey) = igIsMouseKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3591).
"""
IsAliasKey(key::ImGuiKey) = igIsAliasKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3592).
"""
IsLRModKey(key::ImGuiKey) = igIsLRModKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3593).
"""
FixupKeyChord(key_chord::Union{ImGuiKeyChord,Integer}) = igFixupKeyChord(key_chord)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3594).
"""
ConvertSingleModFlagToKey(key::ImGuiKey) = igConvertSingleModFlagToKey(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3603).
"""
GetKeyData(ctx::VoidablePtrOrRef{ImGuiContext}, key::ImGuiKey) = igGetKeyData_ContextPtr(ctx, key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3604).
"""
GetKeyData(key::ImGuiKey) = igGetKeyData_Key(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3605).
"""
GetKeyChordName(key_chord::Union{ImGuiKeyChord,Integer}) = igGetKeyChordName(key_chord)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3606).
"""
MouseButtonToKey(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}) = igMouseButtonToKey(button)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3607).
"""
IsMouseDragPastThreshold(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, lock_threshold = -1.0f0) =
    igIsMouseDragPastThreshold(button, lock_threshold)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3608).
"""
GetKeyMagnitude2d(key_left::ImGuiKey, key_right::ImGuiKey, key_up::ImGuiKey, key_down::ImGuiKey) =
    igGetKeyMagnitude2d(key_left, key_right, key_up, key_down)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3609).
"""
GetNavTweakPressedAmount(axis::ImGuiAxis) = igGetNavTweakPressedAmount(axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3610).
"""
CalcTypematicRepeatAmount(t0, t1, repeat_delay, repeat_rate) =
    igCalcTypematicRepeatAmount(t0, t1, repeat_delay, repeat_rate)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3611).
"""
GetTypematicRepeatRate(flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer}, repeat_delay, repeat_rate) =
    igGetTypematicRepeatRate(flags, repeat_delay, repeat_rate)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3612).
"""
TeleportMousePos(pos::Union{ImVec2,NTuple{2}}) = igTeleportMousePos(pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3613).
"""
SetActiveIdUsingAllKeyboardKeys() = igSetActiveIdUsingAllKeyboardKeys()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3614).
"""
IsActiveIdUsingNavDir(dir::ImGuiDir) = igIsActiveIdUsingNavDir(dir)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3627).
"""
GetKeyOwner(key::ImGuiKey) = igGetKeyOwner(key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3628).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3629).
"""
SetKeyOwnersForKeyChord(
    key::Union{ImGuiKeyChord,Integer},
    owner_id::Union{ImGuiID,Integer},
    flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer} = 0,
) = igSetKeyOwnersForKeyChord(key, owner_id, flags)

"""
$(TYPEDSIGNATURES)

Set key owner to last item if it is hovered or active. Equivalent to 'if (IsItemHovered() || IsItemActive())  SetKeyOwner(key, GetItemID());'.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3630).
"""
SetItemKeyOwner(key::ImGuiKey, flags::Union{ImGuiInputFlags,ImGuiInputFlags_,Integer}) =
    igSetItemKeyOwner_InputFlags(key, flags)

"""
$(TYPEDSIGNATURES)

Test that key is either not owned, either owned by 'owner_id'.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3631).
"""
TestKeyOwner(key::ImGuiKey, owner_id::Union{ImGuiID,Integer}) = igTestKeyOwner(key, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3632).
"""
GetKeyOwnerData(ctx::VoidablePtrOrRef{ImGuiContext}, key::ImGuiKey) = igGetKeyOwnerData(ctx, key)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3640).
"""
IsKeyDown(key::ImGuiKey, owner_id::Union{ImGuiID,Integer}) = igIsKeyDown_ID(key, owner_id)

"""
$(TYPEDSIGNATURES)

Important: when transitioning from old to new IsKeyPressed(): old API has "bool repeat = true", so would default to repeat. New API requires explicit ImGuiInputFlags_Repeat.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3641).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3642).
"""
IsKeyReleased(key::ImGuiKey, owner_id::Union{ImGuiID,Integer}) = igIsKeyReleased_ID(key, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3643).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3644).
"""
IsMouseDown(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igIsMouseDown_ID(button, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3645).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3646).
"""
IsMouseReleased(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igIsMouseReleased_ID(button, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3647).
"""
IsMouseDoubleClicked(button::Union{ImGuiMouseButton,ImGuiMouseButton_,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igIsMouseDoubleClicked_ID(button, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3663).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3664).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3665).
"""
TestShortcutRouting(key_chord::Union{ImGuiKeyChord,Integer}, owner_id::Union{ImGuiID,Integer}) =
    igTestShortcutRouting(key_chord, owner_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3666).
"""
GetShortcutRoutingData(key_chord::Union{ImGuiKeyChord,Integer}) = igGetShortcutRoutingData(key_chord)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3670).
"""
DockContextInitialize(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextInitialize(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3671).
"""
DockContextShutdown(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextShutdown(ctx)

"""
$(TYPEDSIGNATURES)

Use root_id==0 to clear all.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3672).
"""
DockContextClearNodes(ctx::VoidablePtrOrRef{ImGuiContext}, root_id::Union{ImGuiID,Integer}, clear_settings_refs) =
    igDockContextClearNodes(ctx, root_id, clear_settings_refs)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3673).
"""
DockContextRebuildNodes(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextRebuildNodes(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3674).
"""
DockContextNewFrameUpdateUndocking(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextNewFrameUpdateUndocking(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3675).
"""
DockContextNewFrameUpdateDocking(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextNewFrameUpdateDocking(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3676).
"""
DockContextEndFrame(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextEndFrame(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3677).
"""
DockContextGenNodeID(ctx::VoidablePtrOrRef{ImGuiContext}) = igDockContextGenNodeID(ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3678).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3679).
"""
DockContextQueueUndockWindow(ctx::VoidablePtrOrRef{ImGuiContext}, window::VoidablePtrOrRef{ImGuiWindow}) =
    igDockContextQueueUndockWindow(ctx, window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3680).
"""
DockContextQueueUndockNode(ctx::VoidablePtrOrRef{ImGuiContext}, node::VoidablePtrOrRef{ImGuiDockNode}) =
    igDockContextQueueUndockNode(ctx, node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3681).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3682).
"""
DockContextProcessUndockNode(ctx::VoidablePtrOrRef{ImGuiContext}, node::VoidablePtrOrRef{ImGuiDockNode}) =
    igDockContextProcessUndockNode(ctx, node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3683).
"""
DockContextCalcDropPosForDocking(
    target::VoidablePtrOrRef{ImGuiWindow},
    target_node::VoidablePtrOrRef{ImGuiDockNode},
    payload_window::VoidablePtrOrRef{ImGuiWindow},
    payload_node::VoidablePtrOrRef{ImGuiDockNode},
    split_dir::ImGuiDir,
    split_outer,
    out_pos::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3684).
"""
DockContextFindNodeByID(ctx::VoidablePtrOrRef{ImGuiContext}, id::Union{ImGuiID,Integer}) =
    igDockContextFindNodeByID(ctx, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3685).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3686).
"""
DockNodeBeginAmendTabBar(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeBeginAmendTabBar(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3687).
"""
DockNodeEndAmendTabBar() = igDockNodeEndAmendTabBar()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3688).
"""
DockNodeGetRootNode(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeGetRootNode(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3689).
"""
DockNodeIsInHierarchyOf(node::VoidablePtrOrRef{ImGuiDockNode}, parent::VoidablePtrOrRef{ImGuiDockNode}) =
    igDockNodeIsInHierarchyOf(node, parent)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3690).
"""
DockNodeGetDepth(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeGetDepth(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3691).
"""
DockNodeGetWindowMenuButtonId(node::VoidablePtrOrRef{ImGuiDockNode}) = igDockNodeGetWindowMenuButtonId(node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3692).
"""
GetWindowDockNode() = igGetWindowDockNode()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3693).
"""
GetWindowAlwaysWantOwnTabBar(window::VoidablePtrOrRef{ImGuiWindow}) = igGetWindowAlwaysWantOwnTabBar(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3694).
"""
BeginDocked(window::VoidablePtrOrRef{ImGuiWindow}, p_open) = igBeginDocked(window, p_open)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3695).
"""
BeginDockableDragDropSource(window::VoidablePtrOrRef{ImGuiWindow}) = igBeginDockableDragDropSource(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3696).
"""
BeginDockableDragDropTarget(window::VoidablePtrOrRef{ImGuiWindow}) = igBeginDockableDragDropTarget(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3697).
"""
SetWindowDock(
    window::VoidablePtrOrRef{ImGuiWindow},
    dock_id::Union{ImGuiID,Integer},
    cond::Union{ImGuiCond,ImGuiCond_,Integer},
) = igSetWindowDock(window, dock_id, cond)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3708).
"""
DockBuilderDockWindow(window_name, node_id::Union{ImGuiID,Integer}) = igDockBuilderDockWindow(window_name, node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3709).
"""
DockBuilderGetNode(node_id::Union{ImGuiID,Integer}) = igDockBuilderGetNode(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3710).
"""
DockBuilderGetCentralNode(node_id::Union{ImGuiID,Integer}) = igDockBuilderGetCentralNode(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3711).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3712).
"""
DockBuilderRemoveNode(node_id::Union{ImGuiID,Integer}) = igDockBuilderRemoveNode(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3713).
"""
DockBuilderRemoveNodeDockedWindows(node_id::Union{ImGuiID,Integer}, clear_settings_refs = true) =
    igDockBuilderRemoveNodeDockedWindows(node_id, clear_settings_refs)

"""
$(TYPEDSIGNATURES)

Remove all split/hierarchy. All remaining docked windows will be re-docked to the remaining root node (node_id).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3714).
"""
DockBuilderRemoveNodeChildNodes(node_id::Union{ImGuiID,Integer}) = igDockBuilderRemoveNodeChildNodes(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3715).
"""
DockBuilderSetNodePos(node_id::Union{ImGuiID,Integer}, pos::Union{ImVec2,NTuple{2}}) =
    igDockBuilderSetNodePos(node_id, pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3716).
"""
DockBuilderSetNodeSize(node_id::Union{ImGuiID,Integer}, size::Union{ImVec2,NTuple{2}}) =
    igDockBuilderSetNodeSize(node_id, size)

"""
$(TYPEDSIGNATURES)

Create 2 child nodes in this parent node.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3717).
"""
DockBuilderSplitNode(
    node_id::Union{ImGuiID,Integer},
    split_dir::ImGuiDir,
    size_ratio_for_node_at_dir,
    out_id_at_dir::Union{VoidablePtrOrRef{ImGuiID},VoidablePtrOrRef{Integer}},
    out_id_at_opposite_dir::Union{VoidablePtrOrRef{ImGuiID},VoidablePtrOrRef{Integer}},
) = igDockBuilderSplitNode(node_id, split_dir, size_ratio_for_node_at_dir, out_id_at_dir, out_id_at_opposite_dir)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3718).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3719).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3720).
"""
DockBuilderCopyWindowSettings(src_name, dst_name) = igDockBuilderCopyWindowSettings(src_name, dst_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3721).
"""
DockBuilderFinish(node_id::Union{ImGuiID,Integer}) = igDockBuilderFinish(node_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3731).
"""
PushFocusScope(id::Union{ImGuiID,Integer}) = igPushFocusScope(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3732).
"""
PopFocusScope() = igPopFocusScope()

"""
$(TYPEDSIGNATURES)

Focus scope we are outputting into, set by PushFocusScope().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3733).
"""
GetCurrentFocusScope() = igGetCurrentFocusScope()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3736).
"""
IsDragDropActive() = igIsDragDropActive()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3737).
"""
BeginDragDropTargetCustom(bb::ImRect, id::Union{ImGuiID,Integer}) = igBeginDragDropTargetCustom(bb, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3738).
"""
BeginDragDropTargetViewport(viewport::VoidablePtrOrRef{ImGuiViewport}, p_bb::VoidablePtrOrRef{ImRect} = C_NULL) =
    igBeginDragDropTargetViewport(viewport, p_bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3739).
"""
ClearDragDrop() = igClearDragDrop()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3740).
"""
IsDragDropPayloadBeingAccepted() = igIsDragDropPayloadBeingAccepted()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3741).
"""
RenderDragDropTargetRectForItem(bb::ImRect) = igRenderDragDropTargetRectForItem(bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3742).
"""
RenderDragDropTargetRectEx(draw_list::VoidablePtrOrRef{ImDrawList}, bb::ImRect) =
    igRenderDragDropTargetRectEx(draw_list, bb)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3747).
"""
GetTypingSelectRequest(
    flags::Union{ImGuiTypingSelectFlags,ImGuiTypingSelectFlags_,Integer} = ImGuiTypingSelectFlags_None,
) = igGetTypingSelectRequest(flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3748).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3749).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3750).
"""
TypingSelectFindBestLeadingMatch(
    req::VoidablePtrOrRef{ImGuiTypingSelectRequest},
    items_count,
    get_item_name_func,
    user_data,
) = igTypingSelectFindBestLeadingMatch(req, items_count, get_item_name_func, user_data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3753).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3754).
"""
EndBoxSelect(scope_rect::ImRect, ms_flags::Union{ImGuiMultiSelectFlags,ImGuiMultiSelectFlags_,Integer}) =
    igEndBoxSelect(scope_rect, ms_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3757).
"""
MultiSelectItemHeader(
    id::Union{ImGuiID,Integer},
    p_selected,
    p_button_flags::Union{
        VoidablePtrOrRef{ImGuiButtonFlags},
        VoidablePtrOrRef{ImGuiButtonFlags_},
        VoidablePtrOrRef{Integer},
    },
) = igMultiSelectItemHeader(id, p_selected, p_button_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3758).
"""
MultiSelectItemFooter(id::Union{ImGuiID,Integer}, p_selected, p_pressed) =
    igMultiSelectItemFooter(id, p_selected, p_pressed)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3759).
"""
MultiSelectAddSetAll(ms::VoidablePtrOrRef{ImGuiMultiSelectTempData}, selected) = igMultiSelectAddSetAll(ms, selected)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3760).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3761).
"""
GetBoxSelectState(id::Union{ImGuiID,Integer}) = igGetBoxSelectState(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3762).
"""
GetMultiSelectState(id::Union{ImGuiID,Integer}) = igGetMultiSelectState(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3765).
"""
SetWindowClipRectBeforeSetChannel(window::VoidablePtrOrRef{ImGuiWindow}, clip_rect::ImRect) =
    igSetWindowClipRectBeforeSetChannel(window, clip_rect)

"""
$(TYPEDSIGNATURES)

Setup number of columns. use an identifier to distinguish multiple column sets. close with EndColumns().

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3766).
"""
BeginColumns(str_id, count, flags::Union{ImGuiOldColumnFlags,ImGuiOldColumnFlags_,Integer} = 0) =
    igBeginColumns(str_id, count, flags)

"""
$(TYPEDSIGNATURES)

Close columns.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3767).
"""
EndColumns() = igEndColumns()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3768).
"""
PushColumnClipRect(column_index) = igPushColumnClipRect(column_index)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3769).
"""
PushColumnsBackground() = igPushColumnsBackground()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3770).
"""
PopColumnsBackground() = igPopColumnsBackground()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3771).
"""
GetColumnsID(str_id, count) = igGetColumnsID(str_id, count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3772).
"""
FindOrCreateColumns(window::VoidablePtrOrRef{ImGuiWindow}, id::Union{ImGuiID,Integer}) =
    igFindOrCreateColumns(window, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3773).
"""
GetColumnOffsetFromNorm(columns::VoidablePtrOrRef{ImGuiOldColumns}, offset_norm) =
    igGetColumnOffsetFromNorm(columns, offset_norm)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3774).
"""
GetColumnNormFromOffset(columns::VoidablePtrOrRef{ImGuiOldColumns}, offset) = igGetColumnNormFromOffset(columns, offset)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3777).
"""
TableOpenContextMenu(column_n = -1) = igTableOpenContextMenu(column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3778).
"""
TableSetColumnWidth(column_n, width) = igTableSetColumnWidth(column_n, width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3779).
"""
TableSetColumnSortDirection(column_n, sort_direction::ImGuiSortDirection, append_to_sort_specs) =
    igTableSetColumnSortDirection(column_n, sort_direction, append_to_sort_specs)

"""
$(TYPEDSIGNATURES)

Retrieve *PREVIOUS FRAME* hovered row. This difference with TableGetHoveredColumn() is the reason why this is not public yet.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3780).
"""
TableGetHoveredRow() = igTableGetHoveredRow()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3781).
"""
TableGetHeaderRowHeight() = igTableGetHeaderRowHeight()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3782).
"""
TableGetHeaderAngledMaxLabelWidth() = igTableGetHeaderAngledMaxLabelWidth()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3783).
"""
TablePushBackgroundChannel() = igTablePushBackgroundChannel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3784).
"""
TablePopBackgroundChannel() = igTablePopBackgroundChannel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3785).
"""
TablePushColumnChannel(column_n) = igTablePushColumnChannel(column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3786).
"""
TablePopColumnChannel() = igTablePopColumnChannel()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3787).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3790).
"""
GetCurrentTable() = igGetCurrentTable()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3791).
"""
TableFindByID(id::Union{ImGuiID,Integer}) = igTableFindByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3792).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3793).
"""
TableBeginInitMemory(table::VoidablePtrOrRef{ImGuiTable}, columns_count) = igTableBeginInitMemory(table, columns_count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3794).
"""
TableBeginApplyRequests(table::VoidablePtrOrRef{ImGuiTable}) = igTableBeginApplyRequests(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3795).
"""
TableSetupDrawChannels(table::VoidablePtrOrRef{ImGuiTable}) = igTableSetupDrawChannels(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3796).
"""
TableUpdateLayout(table::VoidablePtrOrRef{ImGuiTable}) = igTableUpdateLayout(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3797).
"""
TableUpdateBorders(table::VoidablePtrOrRef{ImGuiTable}) = igTableUpdateBorders(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3798).
"""
TableUpdateColumnsWeightFromWidth(table::VoidablePtrOrRef{ImGuiTable}) = igTableUpdateColumnsWeightFromWidth(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3799).
"""
TableDrawBorders(table::VoidablePtrOrRef{ImGuiTable}) = igTableDrawBorders(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3800).
"""
TableDrawDefaultContextMenu(
    table::VoidablePtrOrRef{ImGuiTable},
    flags_for_section_to_display::Union{ImGuiTableFlags,ImGuiTableFlags_,Integer},
) = igTableDrawDefaultContextMenu(table, flags_for_section_to_display)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3801).
"""
TableBeginContextMenuPopup(table::VoidablePtrOrRef{ImGuiTable}) = igTableBeginContextMenuPopup(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3802).
"""
TableMergeDrawChannels(table::VoidablePtrOrRef{ImGuiTable}) = igTableMergeDrawChannels(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3803).
"""
TableGetInstanceData(table::VoidablePtrOrRef{ImGuiTable}, instance_no) = igTableGetInstanceData(table, instance_no)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3804).
"""
TableGetInstanceID(table::VoidablePtrOrRef{ImGuiTable}, instance_no) = igTableGetInstanceID(table, instance_no)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3805).
"""
TableSortSpecsSanitize(table::VoidablePtrOrRef{ImGuiTable}) = igTableSortSpecsSanitize(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3806).
"""
TableSortSpecsBuild(table::VoidablePtrOrRef{ImGuiTable}) = igTableSortSpecsBuild(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3807).
"""
TableGetColumnNextSortDirection(column::VoidablePtrOrRef{ImGuiTableColumn}) = igTableGetColumnNextSortDirection(column)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3808).
"""
TableFixColumnSortDirection(table::VoidablePtrOrRef{ImGuiTable}, column::VoidablePtrOrRef{ImGuiTableColumn}) =
    igTableFixColumnSortDirection(table, column)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3809).
"""
TableGetColumnWidthAuto(table::VoidablePtrOrRef{ImGuiTable}, column::VoidablePtrOrRef{ImGuiTableColumn}) =
    igTableGetColumnWidthAuto(table, column)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3810).
"""
TableBeginRow(table::VoidablePtrOrRef{ImGuiTable}) = igTableBeginRow(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3811).
"""
TableEndRow(table::VoidablePtrOrRef{ImGuiTable}) = igTableEndRow(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3812).
"""
TableBeginCell(table::VoidablePtrOrRef{ImGuiTable}, column_n) = igTableBeginCell(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3813).
"""
TableEndCell(table::VoidablePtrOrRef{ImGuiTable}) = igTableEndCell(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3814).
"""
TableGetCellBgRect(table::VoidablePtrOrRef{ImGuiTable}, column_n) = igTableGetCellBgRect(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3815).
"""
TableGetColumnName(table::VoidablePtrOrRef{ImGuiTable}, column_n::Integer) =
    igTableGetColumnName_TablePtr(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3816).
"""
TableGetColumnResizeID(table::VoidablePtrOrRef{ImGuiTable}, column_n, instance_no = 0) =
    igTableGetColumnResizeID(table, column_n, instance_no)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3817).
"""
TableCalcMaxColumnWidth(table::VoidablePtrOrRef{ImGuiTable}, column_n) = igTableCalcMaxColumnWidth(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3818).
"""
TableSetColumnWidthAutoSingle(table::VoidablePtrOrRef{ImGuiTable}, column_n) =
    igTableSetColumnWidthAutoSingle(table, column_n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3819).
"""
TableSetColumnWidthAutoAll(table::VoidablePtrOrRef{ImGuiTable}) = igTableSetColumnWidthAutoAll(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3820).
"""
TableRemove(table::VoidablePtrOrRef{ImGuiTable}) = igTableRemove(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3821).
"""
TableGcCompactTransientBuffers(table::PtrOrRef{ImGuiTable}) = igTableGcCompactTransientBuffers_TablePtr(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3822).
"""
TableGcCompactTransientBuffers(table::PtrOrRef{ImGuiTableTempData}) =
    igTableGcCompactTransientBuffers_TableTempDataPtr(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3823).
"""
TableGcCompactSettings() = igTableGcCompactSettings()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3826).
"""
TableLoadSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableLoadSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3827).
"""
TableSaveSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableSaveSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3828).
"""
TableResetSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableResetSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3829).
"""
TableGetBoundSettings(table::VoidablePtrOrRef{ImGuiTable}) = igTableGetBoundSettings(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3830).
"""
TableSettingsAddSettingsHandler() = igTableSettingsAddSettingsHandler()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3831).
"""
TableSettingsCreate(id::Union{ImGuiID,Integer}, columns_count) = igTableSettingsCreate(id, columns_count)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3832).
"""
TableSettingsFindByID(id::Union{ImGuiID,Integer}) = igTableSettingsFindByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3835).
"""
GetCurrentTabBar() = igGetCurrentTabBar()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3836).
"""
TabBarFindByID(id::Union{ImGuiID,Integer}) = igTabBarFindByID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3837).
"""
TabBarRemove(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) = igTabBarRemove(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3838).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3839).
"""
TabBarFindTabByID(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab_id::Union{ImGuiID,Integer}) =
    igTabBarFindTabByID(tab_bar, tab_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3840).
"""
TabBarFindTabByOrder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, order) = igTabBarFindTabByOrder(tab_bar, order)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3841).
"""
TabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) =
    igTabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3842).
"""
TabBarGetCurrentTab(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) = igTabBarGetCurrentTab(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3843).
"""
TabBarGetTabOrder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarGetTabOrder(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3844).
"""
TabBarGetTabName(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarGetTabName(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3845).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3846).
"""
TabBarRemoveTab(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab_id::Union{ImGuiID,Integer}) =
    igTabBarRemoveTab(tab_bar, tab_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3847).
"""
TabBarCloseTab(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}) =
    igTabBarCloseTab(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3848).
"""
TabBarQueueFocus(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::PtrOrRef{ImGuiTabItem}) =
    igTabBarQueueFocus_TabItemPtr(tab_bar, tab)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3849).
"""
TabBarQueueFocus(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab_name::Union{String,Ptr{Cchar}}) =
    igTabBarQueueFocus_Str(tab_bar, tab_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3850).
"""
TabBarQueueReorder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, tab::VoidablePtrOrRef{ImGuiTabItem}, offset) =
    igTabBarQueueReorder(tab_bar, tab, offset)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3851).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3852).
"""
TabBarProcessReorder(tab_bar::VoidablePtrOrRef{ImGuiTabBar}) = igTabBarProcessReorder(tab_bar)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3853).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3854).
"""
TabItemSpacing(str_id, flags::Union{ImGuiTabItemFlags,ImGuiTabItemFlags_,Integer}, width) =
    igTabItemSpacing(str_id, flags, width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3855).
"""
TabItemCalcSize(label::Union{String,Ptr{Cchar}}, has_close_button_or_unsaved_marker::Bool) =
    igTabItemCalcSize_Str(label, has_close_button_or_unsaved_marker)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3856).
"""
TabItemCalcSize(window::VoidablePtrOrRef{ImGuiWindow}) = igTabItemCalcSize_WindowPtr(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3857).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3858).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3863).
"""
RenderText(pos::Union{ImVec2,NTuple{2}}, text, text_end = C_NULL, hide_text_after_hash = true) =
    igRenderText(pos, text, text_end, hide_text_after_hash)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3864).
"""
RenderTextWrapped(pos::Union{ImVec2,NTuple{2}}, text, text_end, wrap_width) =
    igRenderTextWrapped(pos, text, text_end, wrap_width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3865).
"""
RenderTextClipped(
    pos_min::Union{ImVec2,NTuple{2}},
    pos_max::Union{ImVec2,NTuple{2}},
    text,
    text_end,
    text_size_if_known::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    align::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    clip_rect::VoidablePtrOrRef{ImRect} = C_NULL,
) = igRenderTextClipped(pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3866).
"""
RenderTextClippedEx(
    draw_list::VoidablePtrOrRef{ImDrawList},
    pos_min::Union{ImVec2,NTuple{2}},
    pos_max::Union{ImVec2,NTuple{2}},
    text,
    text_end,
    text_size_if_known::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    align::Union{ImVec2,NTuple{2}} = ImVec2(0, 0),
    clip_rect::VoidablePtrOrRef{ImRect} = C_NULL,
) = igRenderTextClippedEx(draw_list, pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3867).
"""
RenderTextEllipsis(
    draw_list::VoidablePtrOrRef{ImDrawList},
    pos_min::Union{ImVec2,NTuple{2}},
    pos_max::Union{ImVec2,NTuple{2}},
    ellipsis_max_x,
    text,
    text_end,
    text_size_if_known::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
) = igRenderTextEllipsis(draw_list, pos_min, pos_max, ellipsis_max_x, text, text_end, text_size_if_known)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3868).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3869).
"""
RenderFrameBorder(p_min::Union{ImVec2,NTuple{2}}, p_max::Union{ImVec2,NTuple{2}}, rounding = 0.0f0) =
    igRenderFrameBorder(p_min, p_max, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3870).
"""
RenderColorRectWithAlphaCheckerboard(
    draw_list::VoidablePtrOrRef{ImDrawList},
    p_min::Union{ImVec2,NTuple{2}},
    p_max::Union{ImVec2,NTuple{2}},
    fill_col::Union{ImU32,Integer},
    grid_step,
    grid_off::Union{ImVec2,NTuple{2}},
    rounding = 0.0f0,
    flags::Union{ImDrawFlags,ImDrawFlags_,Integer} = 0,
) = igRenderColorRectWithAlphaCheckerboard(draw_list, p_min, p_max, fill_col, grid_step, grid_off, rounding, flags)

"""
$(TYPEDSIGNATURES)

Navigation highlight.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3871).
"""
RenderNavCursor(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    flags::Union{ImGuiNavRenderCursorFlags,ImGuiNavRenderCursorFlags_,Integer} = ImGuiNavRenderCursorFlags_None,
) = igRenderNavCursor(bb, id, flags)

"""
$(TYPEDSIGNATURES)

Find the optional ## from which we stop displaying text.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3875).
"""
FindRenderedTextEnd(text, text_end = C_NULL) = igFindRenderedTextEnd(text, text_end)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3876).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3879).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3880).
"""
RenderBullet(draw_list::VoidablePtrOrRef{ImDrawList}, pos::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}) =
    igRenderBullet(draw_list, pos, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3881).
"""
RenderCheckMark(draw_list::VoidablePtrOrRef{ImDrawList}, pos::Union{ImVec2,NTuple{2}}, col::Union{ImU32,Integer}, sz) =
    igRenderCheckMark(draw_list, pos, col, sz)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3882).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3883).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3884).
"""
RenderRectFilledRangeH(
    draw_list::VoidablePtrOrRef{ImDrawList},
    rect::ImRect,
    col::Union{ImU32,Integer},
    x_start_norm,
    x_end_norm,
    rounding,
) = igRenderRectFilledRangeH(draw_list, rect, col, x_start_norm, x_end_norm, rounding)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3885).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3886).
"""
CalcRoundingFlagsForRectInRect(r_in::ImRect, r_outer::ImRect, threshold) =
    igCalcRoundingFlagsForRectInRect(r_in, r_outer, threshold)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3889).
"""
TextEx(text, text_end = C_NULL, flags::Union{ImGuiTextFlags,ImGuiTextFlags_,Integer} = 0) =
    igTextEx(text, text_end, flags)

"""
$(TYPEDSIGNATURES)

FIXME-WIP: Works but API is likely to be reworked. This is designed for 1 item on the line. (#7024).

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3890).
"""
TextAligned(align_x, size_x, fmt) = igTextAligned(align_x, size_x, fmt)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3894).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3895).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3896).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3897).
"""
SeparatorEx(flags::Union{ImGuiSeparatorFlags,ImGuiSeparatorFlags_,Integer}, thickness = 1.0f0) =
    igSeparatorEx(flags, thickness)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3898).
"""
SeparatorTextEx(id::Union{ImGuiID,Integer}, label, label_end, extra_width) =
    igSeparatorTextEx(id, label, label_end, extra_width)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3903).
"""
CloseButton(id::Union{ImGuiID,Integer}, pos::Union{ImVec2,NTuple{2}}) = igCloseButton(id, pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3904).
"""
CollapseButton(id::Union{ImGuiID,Integer}, pos::Union{ImVec2,NTuple{2}}, dock_node::VoidablePtrOrRef{ImGuiDockNode}) =
    igCollapseButton(id, pos, dock_node)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3905).
"""
Scrollbar(axis::ImGuiAxis) = igScrollbar(axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3906).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3907).
"""
GetWindowScrollbarRect(window::VoidablePtrOrRef{ImGuiWindow}, axis::ImGuiAxis) = igGetWindowScrollbarRect(window, axis)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3908).
"""
GetWindowScrollbarID(window::VoidablePtrOrRef{ImGuiWindow}, axis::ImGuiAxis) = igGetWindowScrollbarID(window, axis)

"""
$(TYPEDSIGNATURES)

0..3: corners.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3909).
"""
GetWindowResizeCornerID(window::VoidablePtrOrRef{ImGuiWindow}, n) = igGetWindowResizeCornerID(window, n)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3910).
"""
GetWindowResizeBorderID(window::VoidablePtrOrRef{ImGuiWindow}, dir::ImGuiDir) = igGetWindowResizeBorderID(window, dir)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3913).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3914).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3915).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3916).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3919).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3920).
"""
TreeNodeDrawLineToChildNode(target_pos::Union{ImVec2,NTuple{2}}) = igTreeNodeDrawLineToChildNode(target_pos)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3921).
"""
TreeNodeDrawLineToTreePop(data::VoidablePtrOrRef{ImGuiTreeNodeStackData}) = igTreeNodeDrawLineToTreePop(data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3922).
"""
TreePushOverrideID(id::Union{ImGuiID,Integer}) = igTreePushOverrideID(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3923).
"""
TreeNodeGetOpen(storage_id::Union{ImGuiID,Integer}) = igTreeNodeGetOpen(storage_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3924).
"""
TreeNodeSetOpen(storage_id::Union{ImGuiID,Integer}, open) = igTreeNodeSetOpen(storage_id, open)

"""
$(TYPEDSIGNATURES)

Return open state. Consume previous SetNextItemOpen() data, if any. May return true when logging.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3925).
"""
TreeNodeUpdateNextOpen(
    storage_id::Union{ImGuiID,Integer},
    flags::Union{ImGuiTreeNodeFlags,ImGuiTreeNodeFlags_,Integer},
) = igTreeNodeUpdateNextOpen(storage_id, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3938).
"""
DataTypeGetInfo(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}) = igDataTypeGetInfo(data_type)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3939).
"""
DataTypeFormatString(buf, buf_size, data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data, format) =
    igDataTypeFormatString(buf, buf_size, data_type, p_data, format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3940).
"""
DataTypeApplyOp(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, op, output, arg_1, arg_2) =
    igDataTypeApplyOp(data_type, op, output, arg_1, arg_2)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3941).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3942).
"""
DataTypeCompare(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, arg_1, arg_2) =
    igDataTypeCompare(data_type, arg_1, arg_2)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3943).
"""
DataTypeClamp(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data, p_min, p_max) =
    igDataTypeClamp(data_type, p_data, p_min, p_max)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3944).
"""
DataTypeIsZero(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data) = igDataTypeIsZero(data_type, p_data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3947).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3948).
"""
InputTextDeactivateHook(id::Union{ImGuiID,Integer}) = igInputTextDeactivateHook(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3949).
"""
TempInputText(
    bb::ImRect,
    id::Union{ImGuiID,Integer},
    label,
    buf,
    buf_size,
    flags::Union{ImGuiInputTextFlags,ImGuiInputTextFlags_,Integer},
) = igTempInputText(bb, id, label, buf, buf_size, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3950).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3951).
"""
TempInputIsActive(id::Union{ImGuiID,Integer}) = igTempInputIsActive(id)

"""
$(TYPEDSIGNATURES)

Get input text state if active.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3952).
"""
GetInputTextState(id::Union{ImGuiID,Integer}) = igGetInputTextState(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3953).
"""
SetNextItemRefVal(data_type::Union{ImGuiDataType,ImGuiDataType_,Integer}, p_data) =
    igSetNextItemRefVal(data_type, p_data)

"""
$(TYPEDSIGNATURES)

This may be useful to apply workaround that a based on distinguish whenever an item is active as a text input field.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3954).
"""
IsItemActiveAsInputText() = igIsItemActiveAsInputText()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3957).
"""
ColorTooltip(text, col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) =
    igColorTooltip(text, col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3958).
"""
ColorEditOptionsPopup(col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) =
    igColorEditOptionsPopup(col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3959).
"""
ColorPickerOptionsPopup(ref_col, flags::Union{ImGuiColorEditFlags,ImGuiColorEditFlags_,Integer}) =
    igColorPickerOptionsPopup(ref_col, flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3962).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3965).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3966).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3967).
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

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3970).
"""
GcCompactTransientMiscBuffers() = igGcCompactTransientMiscBuffers()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3971).
"""
GcCompactTransientWindowBuffers(window::VoidablePtrOrRef{ImGuiWindow}) = igGcCompactTransientWindowBuffers(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3972).
"""
GcAwakeTransientWindowBuffers(window::VoidablePtrOrRef{ImGuiWindow}) = igGcAwakeTransientWindowBuffers(window)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3975).
"""
ErrorLog(msg) = igErrorLog(msg)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3976).
"""
ErrorRecoveryStoreState(state_out::VoidablePtrOrRef{ImGuiErrorRecoveryState}) = igErrorRecoveryStoreState(state_out)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3977).
"""
ErrorRecoveryTryToRecoverState(state_in::VoidablePtrOrRef{ImGuiErrorRecoveryState}) =
    igErrorRecoveryTryToRecoverState(state_in)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3978).
"""
ErrorRecoveryTryToRecoverWindowState(state_in::VoidablePtrOrRef{ImGuiErrorRecoveryState}) =
    igErrorRecoveryTryToRecoverWindowState(state_in)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3979).
"""
ErrorCheckUsingSetCursorPosToExtendParentBoundaries() = igErrorCheckUsingSetCursorPosToExtendParentBoundaries()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3980).
"""
ErrorCheckEndFrameFinalizeErrorTooltip() = igErrorCheckEndFrameFinalizeErrorTooltip()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3981).
"""
BeginErrorTooltip() = igBeginErrorTooltip()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3982).
"""
EndErrorTooltip() = igEndErrorTooltip()

"""
$(TYPEDSIGNATURES)

Size >= 0 : alloc, size = -1 : free.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3985).
"""
DebugAllocHook(info::VoidablePtrOrRef{ImGuiDebugAllocInfo}, frame_count, ptr, size) =
    igDebugAllocHook(info, frame_count, ptr, size)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3986).
"""
DebugDrawCursorPos(col::Union{ImU32,Integer} = 4278190335) = igDebugDrawCursorPos(col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3987).
"""
DebugDrawLineExtents(col::Union{ImU32,Integer} = 4278190335) = igDebugDrawLineExtents(col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3988).
"""
DebugDrawItemRect(col::Union{ImU32,Integer} = 4278190335) = igDebugDrawItemRect(col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3989).
"""
DebugTextUnformattedWithLocateItem(line_begin, line_end) = igDebugTextUnformattedWithLocateItem(line_begin, line_end)

"""
$(TYPEDSIGNATURES)

Call sparingly: only 1 at the same time!

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3990).
"""
DebugLocateItem(target_id::Union{ImGuiID,Integer}) = igDebugLocateItem(target_id)

"""
$(TYPEDSIGNATURES)

Only call on reaction to a mouse Hover: because only 1 at the same time!

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3991).
"""
DebugLocateItemOnHover(target_id::Union{ImGuiID,Integer}) = igDebugLocateItemOnHover(target_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3992).
"""
DebugLocateItemResolveWithLastItem() = igDebugLocateItemResolveWithLastItem()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3993).
"""
DebugBreakClearData() = igDebugBreakClearData()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3994).
"""
DebugBreakButton(label, description_of_location) = igDebugBreakButton(label, description_of_location)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3995).
"""
DebugBreakButtonTooltip(keyboard_only, description_of_location) =
    igDebugBreakButtonTooltip(keyboard_only, description_of_location)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3996).
"""
ShowFontAtlas(atlas::VoidablePtrOrRef{ImFontAtlas}) = igShowFontAtlas(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3997).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3998).
"""
DebugNodeColumns(columns::VoidablePtrOrRef{ImGuiOldColumns}) = igDebugNodeColumns(columns)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L3999).
"""
DebugNodeDockNode(node::VoidablePtrOrRef{ImGuiDockNode}, label) = igDebugNodeDockNode(node, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4000).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4001).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4002).
"""
DebugNodeFont(font::VoidablePtrOrRef{ImFont}) = igDebugNodeFont(font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4003).
"""
DebugNodeFontGlyphesForSrcMask(font::VoidablePtrOrRef{ImFont}, baked::VoidablePtrOrRef{ImFontBaked}, src_mask) =
    igDebugNodeFontGlyphesForSrcMask(font, baked, src_mask)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4004).
"""
DebugNodeFontGlyph(font::VoidablePtrOrRef{ImFont}, glyph::VoidablePtrOrRef{ImFontGlyph}) =
    igDebugNodeFontGlyph(font, glyph)

"""
$(TYPEDSIGNATURES)

ID used to facilitate persisting the "current" texture.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4005).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4006).
"""
DebugNodeStorage(storage::VoidablePtrOrRef{ImGuiStorage}, label) = igDebugNodeStorage(storage, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4007).
"""
DebugNodeTabBar(tab_bar::VoidablePtrOrRef{ImGuiTabBar}, label) = igDebugNodeTabBar(tab_bar, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4008).
"""
DebugNodeTable(table::VoidablePtrOrRef{ImGuiTable}) = igDebugNodeTable(table)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4009).
"""
DebugNodeTableSettings(settings::VoidablePtrOrRef{ImGuiTableSettings}) = igDebugNodeTableSettings(settings)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4010).
"""
DebugNodeInputTextState(state::VoidablePtrOrRef{ImGuiInputTextState}) = igDebugNodeInputTextState(state)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4011).
"""
DebugNodeTypingSelectState(state::VoidablePtrOrRef{ImGuiTypingSelectState}) = igDebugNodeTypingSelectState(state)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4012).
"""
DebugNodeMultiSelectState(state::VoidablePtrOrRef{ImGuiMultiSelectState}) = igDebugNodeMultiSelectState(state)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4013).
"""
DebugNodeWindow(window::VoidablePtrOrRef{ImGuiWindow}, label) = igDebugNodeWindow(window, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4014).
"""
DebugNodeWindowSettings(settings::VoidablePtrOrRef{ImGuiWindowSettings}) = igDebugNodeWindowSettings(settings)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4015).
"""
DebugNodeWindowsList(windows::VoidablePtrOrRef{ImVector_ImGuiWindowPtr}, label) = igDebugNodeWindowsList(windows, label)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4017).
"""
DebugNodeViewport(viewport::VoidablePtrOrRef{ImGuiViewportP}) = igDebugNodeViewport(viewport)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4018).
"""
DebugNodePlatformMonitor(monitor::VoidablePtrOrRef{ImGuiPlatformMonitor}, label, idx) =
    igDebugNodePlatformMonitor(monitor, label, idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4019).
"""
DebugRenderKeyboardPreview(draw_list::VoidablePtrOrRef{ImDrawList}) = igDebugRenderKeyboardPreview(draw_list)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4020).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4062).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4066).
"""
ImFontAtlasGetFontLoaderForStbTruetype() = igImFontAtlasGetFontLoaderForStbTruetype()

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4088).
"""
ImFontAtlasRectId_GetIndex(id::Union{ImFontAtlasRectId,Integer}) = igImFontAtlasRectId_GetIndex(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4089).
"""
ImFontAtlasRectId_GetGeneration(id::Union{ImFontAtlasRectId,Integer}) = igImFontAtlasRectId_GetGeneration(id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4090).
"""
ImFontAtlasRectId_Make(index_idx, gen_idx) = igImFontAtlasRectId_Make(index_idx, gen_idx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4159).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4162).
"""
ImFontAtlasBuildInit(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildInit(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4163).
"""
ImFontAtlasBuildDestroy(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildDestroy(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4164).
"""
ImFontAtlasBuildMain(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildMain(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4165).
"""
ImFontAtlasBuildSetupFontLoader(atlas::VoidablePtrOrRef{ImFontAtlas}, font_loader::VoidablePtrOrRef{ImFontLoader}) =
    igImFontAtlasBuildSetupFontLoader(atlas, font_loader)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4166).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4167).
"""
ImFontAtlasBuildUpdatePointers(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildUpdatePointers(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4168).
"""
ImFontAtlasBuildRenderBitmapFromString(atlas::VoidablePtrOrRef{ImFontAtlas}, x, y, w, h, in_str, in_marker_char) =
    igImFontAtlasBuildRenderBitmapFromString(atlas, x, y, w, h, in_str, in_marker_char)

"""
$(TYPEDSIGNATURES)

Clear output and custom rects.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4169).
"""
ImFontAtlasBuildClear(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasBuildClear(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4171).
"""
ImFontAtlasTextureAdd(atlas::VoidablePtrOrRef{ImFontAtlas}, w, h) = igImFontAtlasTextureAdd(atlas, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4172).
"""
ImFontAtlasTextureMakeSpace(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasTextureMakeSpace(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4173).
"""
ImFontAtlasTextureRepack(atlas::VoidablePtrOrRef{ImFontAtlas}, w, h) = igImFontAtlasTextureRepack(atlas, w, h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4174).
"""
ImFontAtlasTextureGrow(atlas::VoidablePtrOrRef{ImFontAtlas}, old_w = -1, old_h = -1) =
    igImFontAtlasTextureGrow(atlas, old_w, old_h)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4175).
"""
ImFontAtlasTextureCompact(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasTextureCompact(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4176).
"""
ImFontAtlasTextureGetSizeEstimate(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasTextureGetSizeEstimate(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4178).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4179).
"""
ImFontAtlasBuildLegacyPreloadAllGlyphRanges(atlas::VoidablePtrOrRef{ImFontAtlas}) =
    igImFontAtlasBuildLegacyPreloadAllGlyphRanges(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4180).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4181).
"""
ImFontAtlasBuildDiscardBakes(atlas::VoidablePtrOrRef{ImFontAtlas}, unused_frames) =
    igImFontAtlasBuildDiscardBakes(atlas, unused_frames)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4183).
"""
ImFontAtlasFontSourceInit(atlas::VoidablePtrOrRef{ImFontAtlas}, src::VoidablePtrOrRef{ImFontConfig}) =
    igImFontAtlasFontSourceInit(atlas, src)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4184).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4185).
"""
ImFontAtlasFontDestroySourceData(atlas::VoidablePtrOrRef{ImFontAtlas}, src::VoidablePtrOrRef{ImFontConfig}) =
    igImFontAtlasFontDestroySourceData(atlas, src)

"""
$(TYPEDSIGNATURES)

Using FontDestroyOutput/FontInitOutput sequence useful notably if font loader params have changed.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4186).
"""
ImFontAtlasFontInitOutput(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) =
    igImFontAtlasFontInitOutput(atlas, font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4187).
"""
ImFontAtlasFontDestroyOutput(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}) =
    igImFontAtlasFontDestroyOutput(atlas, font)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4188).
"""
ImFontAtlasFontDiscardBakes(atlas::VoidablePtrOrRef{ImFontAtlas}, font::VoidablePtrOrRef{ImFont}, unused_frames) =
    igImFontAtlasFontDiscardBakes(atlas, font, unused_frames)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4190).
"""
ImFontAtlasBakedGetId(font_id::Union{ImGuiID,Integer}, baked_size, rasterizer_density) =
    igImFontAtlasBakedGetId(font_id, baked_size, rasterizer_density)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4191).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4192).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4193).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4194).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4195).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4196).
"""
ImFontAtlasBakedAddFontGlyphAdvancedX(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    baked::VoidablePtrOrRef{ImFontBaked},
    src::VoidablePtrOrRef{ImFontConfig},
    codepoint::ImWchar,
    advance_x,
) = igImFontAtlasBakedAddFontGlyphAdvancedX(atlas, baked, src, codepoint, advance_x)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4197).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4198).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4200).
"""
ImFontAtlasPackInit(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasPackInit(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4201).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4202).
"""
ImFontAtlasPackGetRect(atlas::VoidablePtrOrRef{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) =
    igImFontAtlasPackGetRect(atlas, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4203).
"""
ImFontAtlasPackGetRectSafe(atlas::VoidablePtrOrRef{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) =
    igImFontAtlasPackGetRectSafe(atlas, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4204).
"""
ImFontAtlasPackDiscardRect(atlas::VoidablePtrOrRef{ImFontAtlas}, id::Union{ImFontAtlasRectId,Integer}) =
    igImFontAtlasPackDiscardRect(atlas, id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4206).
"""
ImFontAtlasUpdateNewFrame(atlas::VoidablePtrOrRef{ImFontAtlas}, frame_count, renderer_has_textures) =
    igImFontAtlasUpdateNewFrame(atlas, frame_count, renderer_has_textures)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4207).
"""
ImFontAtlasAddDrawListSharedData(atlas::VoidablePtrOrRef{ImFontAtlas}, data::VoidablePtrOrRef{ImDrawListSharedData}) =
    igImFontAtlasAddDrawListSharedData(atlas, data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4208).
"""
ImFontAtlasRemoveDrawListSharedData(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    data::VoidablePtrOrRef{ImDrawListSharedData},
) = igImFontAtlasRemoveDrawListSharedData(atlas, data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4209).
"""
ImFontAtlasUpdateDrawListsTextures(atlas::VoidablePtrOrRef{ImFontAtlas}, old_tex::ImTextureRef, new_tex::ImTextureRef) =
    igImFontAtlasUpdateDrawListsTextures(atlas, old_tex, new_tex)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4210).
"""
ImFontAtlasUpdateDrawListsSharedData(atlas::VoidablePtrOrRef{ImFontAtlas}) =
    igImFontAtlasUpdateDrawListsSharedData(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4212).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4213).
"""
ImFontAtlasTextureBlockPostProcess(data::VoidablePtrOrRef{ImFontAtlasPostProcessData}) =
    igImFontAtlasTextureBlockPostProcess(data)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4214).
"""
ImFontAtlasTextureBlockPostProcessMultiply(data::VoidablePtrOrRef{ImFontAtlasPostProcessData}, multiply_factor) =
    igImFontAtlasTextureBlockPostProcessMultiply(data, multiply_factor)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4215).
"""
ImFontAtlasTextureBlockFill(dst_tex::VoidablePtrOrRef{ImTextureData}, dst_x, dst_y, w, h, col::Union{ImU32,Integer}) =
    igImFontAtlasTextureBlockFill(dst_tex, dst_x, dst_y, w, h, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4216).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4217).
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

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4219).
"""
ImTextureDataGetFormatBytesPerPixel(format::ImTextureFormat) = igImTextureDataGetFormatBytesPerPixel(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4220).
"""
ImTextureDataGetStatusName(status::ImTextureStatus) = igImTextureDataGetStatusName(status)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4221).
"""
ImTextureDataGetFormatName(format::ImTextureFormat) = igImTextureDataGetFormatName(format)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4224).
"""
ImFontAtlasDebugLogTextureRequests(atlas::VoidablePtrOrRef{ImFontAtlas}) = igImFontAtlasDebugLogTextureRequests(atlas)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui_internal.h#L4227).
"""
ImFontAtlasGetMouseCursorTexData(
    atlas::VoidablePtrOrRef{ImFontAtlas},
    cursor_type::Union{ImGuiMouseCursor,ImGuiMouseCursor_,Integer},
    out_offset::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    out_size::Union{VoidablePtrOrRef{ImVec2},VoidablePtrOrRef{NTuple{2}}},
    out_uv_border,
    out_uv_fill,
) = igImFontAtlasGetMouseCursorTexData(atlas, cursor_type, out_offset, out_size, out_uv_border, out_uv_fill)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui/blob/v1.92.5-docking/imgui.h#L2879).
"""
Appendf(self::Ptr{ImGuiTextBuffer}, fmt) = ImGuiTextBuffer_appendf(self, fmt)

@static if VERSION >= v"1.11"
    eval(
        Meta.parse(
            "public Destroy, GetTexID, CreateContext, DestroyContext, GetCurrentContext, SetCurrentContext, GetIO, GetPlatformIO, GetStyle, NewFrame, EndFrame, Render, GetDrawData, ShowDemoWindow, ShowMetricsWindow, ShowDebugLogWindow, ShowIDStackToolWindow, ShowAboutWindow, ShowStyleEditor, ShowStyleSelector, ShowFontSelector, ShowUserGuide, GetVersion, StyleColorsDark, StyleColorsLight, StyleColorsClassic, Begin, End, BeginChild, EndChild, IsWindowAppearing, IsWindowCollapsed, IsWindowFocused, IsWindowHovered, GetWindowDrawList, GetWindowDpiScale, GetWindowPos, GetWindowSize, GetWindowWidth, GetWindowHeight, GetWindowViewport, SetNextWindowPos, SetNextWindowSize, SetNextWindowSizeConstraints, SetNextWindowContentSize, SetNextWindowCollapsed, SetNextWindowFocus, SetNextWindowScroll, SetNextWindowBgAlpha, SetNextWindowViewport, SetWindowPos, SetWindowSize, SetWindowCollapsed, SetWindowFocus, GetScrollX, GetScrollY, SetScrollX, SetScrollY, GetScrollMaxX, GetScrollMaxY, SetScrollHereX, SetScrollHereY, SetScrollFromPosX, SetScrollFromPosY, PushFont, PopFont, GetFont, GetFontSize, GetFontBaked, PushStyleColor, PopStyleColor, PushStyleVar, PushStyleVarX, PushStyleVarY, PopStyleVar, PushItemFlag, PopItemFlag, PushItemWidth, PopItemWidth, SetNextItemWidth, CalcItemWidth, PushTextWrapPos, PopTextWrapPos, GetFontTexUvWhitePixel, GetColorU32, GetStyleColorVec4, GetCursorScreenPos, SetCursorScreenPos, GetContentRegionAvail, GetCursorPos, GetCursorPosX, GetCursorPosY, SetCursorPos, SetCursorPosX, SetCursorPosY, GetCursorStartPos, Separator, SameLine, NewLine, Spacing, Dummy, Indent, Unindent, BeginGroup, EndGroup, AlignTextToFramePadding, GetTextLineHeight, GetTextLineHeightWithSpacing, GetFrameHeight, GetFrameHeightWithSpacing, PushID, PopID, GetID, TextUnformatted, Text, TextColored, TextDisabled, TextWrapped, LabelText, BulletText, SeparatorText, Button, SmallButton, InvisibleButton, ArrowButton, Checkbox, CheckboxFlags, RadioButton, ProgressBar, Bullet, TextLink, TextLinkOpenURL, Image, ImageWithBg, ImageButton, BeginCombo, EndCombo, Combo, DragFloat, DragFloat2, DragFloat3, DragFloat4, DragFloatRange2, DragInt, DragInt2, DragInt3, DragInt4, DragIntRange2, DragScalar, DragScalarN, SliderFloat, SliderFloat2, SliderFloat3, SliderFloat4, SliderAngle, SliderInt, SliderInt2, SliderInt3, SliderInt4, SliderScalar, SliderScalarN, VSliderFloat, VSliderInt, VSliderScalar, InputText, InputTextMultiline, InputTextWithHint, InputFloat, InputFloat2, InputFloat3, InputFloat4, InputInt, InputInt2, InputInt3, InputInt4, InputDouble, InputScalar, InputScalarN, ColorEdit3, ColorEdit4, ColorPicker3, ColorPicker4, ColorButton, SetColorEditOptions, TreeNode, TreeNodeEx, TreePush, TreePop, GetTreeNodeToLabelSpacing, CollapsingHeader, SetNextItemOpen, SetNextItemStorageID, Selectable, BeginMultiSelect, EndMultiSelect, SetNextItemSelectionUserData, IsItemToggledSelection, BeginListBox, EndListBox, ListBox, Value, BeginMenuBar, EndMenuBar, BeginMainMenuBar, EndMainMenuBar, BeginMenu, EndMenu, MenuItem, BeginTooltip, EndTooltip, SetTooltip, BeginItemTooltip, SetItemTooltip, BeginPopup, BeginPopupModal, EndPopup, OpenPopup, OpenPopupOnItemClick, CloseCurrentPopup, BeginPopupContextItem, BeginPopupContextWindow, BeginPopupContextVoid, IsPopupOpen, BeginTable, EndTable, TableNextRow, TableNextColumn, TableSetColumnIndex, TableSetupColumn, TableSetupScrollFreeze, TableHeader, TableHeadersRow, TableAngledHeadersRow, TableGetSortSpecs, TableGetColumnCount, TableGetColumnIndex, TableGetRowIndex, TableGetColumnName, TableGetColumnFlags, TableSetColumnEnabled, TableGetHoveredColumn, TableSetBgColor, Columns, NextColumn, GetColumnIndex, GetColumnWidth, SetColumnWidth, GetColumnOffset, SetColumnOffset, GetColumnsCount, BeginTabBar, EndTabBar, BeginTabItem, EndTabItem, TabItemButton, SetTabItemClosed, DockSpace, DockSpaceOverViewport, SetNextWindowDockID, SetNextWindowClass, GetWindowDockID, IsWindowDocked, LogToTTY, LogToFile, LogToClipboard, LogFinish, LogButtons, LogText, BeginDragDropSource, SetDragDropPayload, EndDragDropSource, BeginDragDropTarget, AcceptDragDropPayload, EndDragDropTarget, GetDragDropPayload, BeginDisabled, EndDisabled, PushClipRect, PopClipRect, SetItemDefaultFocus, SetKeyboardFocusHere, SetNavCursorVisible, SetNextItemAllowOverlap, IsItemHovered, IsItemActive, IsItemFocused, IsItemClicked, IsItemVisible, IsItemEdited, IsItemActivated, IsItemDeactivated, IsItemDeactivatedAfterEdit, IsItemToggledOpen, IsAnyItemHovered, IsAnyItemActive, IsAnyItemFocused, GetItemID, GetItemRectMin, GetItemRectMax, GetItemRectSize, GetMainViewport, GetBackgroundDrawList, GetForegroundDrawList, IsRectVisible, GetTime, GetFrameCount, GetDrawListSharedData, GetStyleColorName, SetStateStorage, GetStateStorage, CalcTextSize, ColorConvertU32ToFloat4, ColorConvertFloat4ToU32, ColorConvertRGBtoHSV, ColorConvertHSVtoRGB, IsKeyDown, IsKeyPressed, IsKeyReleased, IsKeyChordPressed, GetKeyPressedAmount, GetKeyName, SetNextFrameWantCaptureKeyboard, Shortcut, SetNextItemShortcut, SetItemKeyOwner, IsMouseDown, IsMouseClicked, IsMouseReleased, IsMouseDoubleClicked, IsMouseReleasedWithDelay, GetMouseClickedCount, IsMouseHoveringRect, IsMousePosValid, IsAnyMouseDown, GetMousePos, GetMousePosOnOpeningCurrentPopup, IsMouseDragging, GetMouseDragDelta, ResetMouseDragDelta, GetMouseCursor, SetMouseCursor, SetNextFrameWantCaptureMouse, GetClipboardText, SetClipboardText, LoadIniSettingsFromDisk, LoadIniSettingsFromMemory, SaveIniSettingsToDisk, SaveIniSettingsToMemory, DebugTextEncoding, DebugFlashStyleColor, DebugStartItemPicker, DebugCheckVersionAndDataLayout, DebugLog, SetAllocatorFunctions, GetAllocatorFunctions, MemAlloc, MemFree, UpdatePlatformWindows, RenderPlatformWindowsDefault, DestroyPlatformWindows, FindViewportByID, FindViewportByPlatformHandle, ScaleAllSizes, AddKeyEvent, AddKeyAnalogEvent, AddMousePosEvent, AddMouseButtonEvent, AddMouseWheelEvent, AddMouseSourceEvent, AddMouseViewportEvent, AddFocusEvent, AddInputCharacter, AddInputCharacterUTF16, AddInputCharactersUTF8, SetKeyEventNativeData, SetAppAcceptingEvents, ClearEventsQueue, ClearInputKeys, ClearInputMouse, DeleteChars, InsertChars, SelectAll, ClearSelection, HasSelection, Clear, IsDataType, IsPreview, IsDelivery, Draw, PassFilter, Build, IsActive, Empty, Split, Size, Resize, Reserve, C_str, Append, GetInt, SetInt, GetBool, SetBool, GetFloat, SetFloat, GetVoidPtr, SetVoidPtr, GetIntRef, GetBoolRef, GetFloatRef, GetVoidPtrRef, BuildSortByKey, SetAllInt, Step, IncludeItemByIndex, IncludeItemsByIndex, SeekCursorForItem, SetHSV, HSV, ApplyRequests, Contains, Swap, SetItemSelected, GetNextSelectedItem, GetStorageIdFromIndex, ClearFreeMemory, Merge, SetCurrentChannel, PushClipRectFullScreen, PushTexture, PopTexture, GetClipRectMin, GetClipRectMax, AddLine, AddRect, AddRectFilled, AddRectFilledMultiColor, AddQuad, AddQuadFilled, AddTriangle, AddTriangleFilled, AddCircle, AddCircleFilled, AddNgon, AddNgonFilled, AddEllipse, AddEllipseFilled, AddText, AddBezierCubic, AddBezierQuadratic, AddPolyline, AddConvexPolyFilled, AddConcavePolyFilled, AddImage, AddImageQuad, AddImageRounded, PathClear, PathLineTo, PathLineToMergeDuplicate, PathFillConvex, PathFillConcave, PathStroke, PathArcTo, PathArcToFast, PathEllipticalArcTo, PathBezierCubicCurveTo, PathBezierQuadraticCurveTo, PathRect, AddCallback, AddDrawCmd, CloneOutput, ChannelsSplit, ChannelsMerge, ChannelsSetCurrent, PrimReserve, PrimUnreserve, PrimRect, PrimRectUV, PrimQuadUV, PrimWriteVtx, PrimWriteIdx, PrimVtx, AddDrawList, DeIndexAllBuffers, ScaleClipRects, Create, DestroyPixels, GetPixels, GetPixelsAt, GetSizeInBytes, GetPitch, GetTexRef, SetTexID, SetStatus, GetBit, SetBit, AddChar, AddRanges, BuildRanges, AddFont, AddFontDefault, AddFontFromFileTTF, AddFontFromMemoryTTF, AddFontFromMemoryCompressedTTF, AddFontFromMemoryCompressedBase85TTF, RemoveFont, CompactCache, SetFontLoader, ClearInputData, ClearFonts, ClearTexData, GetGlyphRangesDefault, AddCustomRect, RemoveCustomRect, GetCustomRect, ClearOutputData, FindGlyph, FindGlyphNoFallback, GetCharAdvance, IsGlyphLoaded, IsGlyphInFont, IsLoaded, GetDebugName, CalcTextSizeA, CalcWordWrapPosition, RenderChar, RenderText, AddRemapChar, IsGlyphRangeUnused, GetCenter, GetWorkCenter, ClearPlatformHandlers, ClearRendererHandlers, Appendf",
        ),
    )
end

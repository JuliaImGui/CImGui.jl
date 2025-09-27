const PtrOrRef{T} = Union{Ptr{T},Ref{T}} where {T}
const VoidablePtrOrRef{T} = Union{Ptr{T},Ref{T},Ptr{Cvoid}} where {T}

const TestRef = Union{String,Int,lib.ImGuiTestRef}

const ImGuiCaptureImageBuf = lib.ImGuiCaptureImageBuf
const ImGuiCaptureArgs = lib.ImGuiCaptureArgs
const ImGuiCaptureWindowData = lib.ImGuiCaptureWindowData
const ImGuiCaptureContext = lib.ImGuiCaptureContext
const ImGuiCaptureToolUI = lib.ImGuiCaptureToolUI
const ImGuiTestEngineResultSummary = lib.ImGuiTestEngineResultSummary
const ImGuiTestCoroutineInterface = lib.ImGuiTestCoroutineInterface
const ImGuiTestEngineIO = lib.ImGuiTestEngineIO
const ImGuiTestItemInfo = lib.ImGuiTestItemInfo
const ImGuiTestItemList = lib.ImGuiTestItemList
const ImGuiTestLogLineInfo = lib.ImGuiTestLogLineInfo
const ImGuiTestLog = lib.ImGuiTestLog
const ImGuiTestOutput = lib.ImGuiTestOutput
const ImGuiTestRunTask = lib.ImGuiTestRunTask
const ImGuiTestRef = lib.ImGuiTestRef
const ImGuiTestRefDesc = lib.ImGuiTestRefDesc
const ImGuiTestActionFilter = lib.ImGuiTestActionFilter
const ImGuiTestGenericItemStatus = lib.ImGuiTestGenericItemStatus
const ImGuiTestGenericVars = lib.ImGuiTestGenericVars
const ImGuiTestInfoTask = lib.ImGuiTestInfoTask
const ImGuiTestGatherTask = lib.ImGuiTestGatherTask
const ImGuiTestFindByLabelTask = lib.ImGuiTestFindByLabelTask
const ImGuiTestInput = lib.ImGuiTestInput
const ImGuiTestInputs = lib.ImGuiTestInputs
const ImGuiPerfToolEntry = lib.ImGuiPerfToolEntry
const ImGuiPerfToolBatch = lib.ImGuiPerfToolBatch
const ImGuiCsvParser = lib.ImGuiCsvParser
const ImGuiPerfTool = lib.ImGuiPerfTool
const ImGuiTestContext = lib.ImGuiTestContext
const ImBuildInfo = lib.ImBuildInfo

const RunSpeed = lib.ImGuiTestRunSpeed
const RunSpeed_Fast = lib.ImGuiTestRunSpeed_Fast
const RunSpeed_Normal = lib.ImGuiTestRunSpeed_Normal
const RunSpeed_Cinematic = lib.ImGuiTestRunSpeed_Cinematic
const RunSpeed_COUNT = lib.ImGuiTestRunSpeed_COUNT

const VerboseLevel = lib.ImGuiTestVerboseLevel
const VerboseLevel_Silent = lib.ImGuiTestVerboseLevel_Silent
const VerboseLevel_Error = lib.ImGuiTestVerboseLevel_Error
const VerboseLevel_Warning = lib.ImGuiTestVerboseLevel_Warning
const VerboseLevel_Info = lib.ImGuiTestVerboseLevel_Info
const VerboseLevel_Debug = lib.ImGuiTestVerboseLevel_Debug
const VerboseLevel_Trace = lib.ImGuiTestVerboseLevel_Trace
const VerboseLevel_COUNT = lib.ImGuiTestVerboseLevel_COUNT

const EngineExportFormat = lib.ImGuiTestEngineExportFormat
const EngineExportFormat_None = lib.ImGuiTestEngineExportFormat_None
const EngineExportFormat_JUnitXml = lib.ImGuiTestEngineExportFormat_JUnitXml

const Status = lib.ImGuiTestStatus
const Status_Unknown = lib.ImGuiTestStatus_Unknown
const Status_Success = lib.ImGuiTestStatus_Success
const Status_Queued = lib.ImGuiTestStatus_Queued
const Status_Running = lib.ImGuiTestStatus_Running
const Status_Error = lib.ImGuiTestStatus_Error
const Status_Suspended = lib.ImGuiTestStatus_Suspended
const Status_COUNT = lib.ImGuiTestStatus_COUNT

const Group = lib.ImGuiTestGroup
const Group_Unknown = lib.ImGuiTestGroup_Unknown
const Group_Tests = lib.ImGuiTestGroup_Tests
const Group_Perfs = lib.ImGuiTestGroup_Perfs
const Group_COUNT = lib.ImGuiTestGroup_COUNT

const InputType = lib.ImGuiTestInputType
const InputType_None = lib.ImGuiTestInputType_None
const InputType_Key = lib.ImGuiTestInputType_Key
const InputType_Char = lib.ImGuiTestInputType_Char
const InputType_ViewportFocus = lib.ImGuiTestInputType_ViewportFocus
const InputType_ViewportSetPos = lib.ImGuiTestInputType_ViewportSetPos
const InputType_ViewportSetSize = lib.ImGuiTestInputType_ViewportSetSize
const InputType_ViewportClose = lib.ImGuiTestInputType_ViewportClose

const PerfToolDisplayType = lib.ImGuiPerfToolDisplayType
const PerfToolDisplayType_Simple = lib.ImGuiPerfToolDisplayType_Simple
const PerfToolDisplayType_PerBranchColors = lib.ImGuiPerfToolDisplayType_PerBranchColors
const PerfToolDisplayType_CombineByBuildInfo = lib.ImGuiPerfToolDisplayType_CombineByBuildInfo

const ActiveFunc = lib.ImGuiTestActiveFunc
const ActiveFunc_None = lib.ImGuiTestActiveFunc_None
const ActiveFunc_GuiFunc = lib.ImGuiTestActiveFunc_GuiFunc
const ActiveFunc_TestFunc = lib.ImGuiTestActiveFunc_TestFunc

const CaptureFlags_ = lib.ImGuiCaptureFlags_
const CaptureFlags_None = lib.ImGuiCaptureFlags_None
const CaptureFlags_StitchAll = lib.ImGuiCaptureFlags_StitchAll
const CaptureFlags_IncludeOtherWindows = lib.ImGuiCaptureFlags_IncludeOtherWindows
const CaptureFlags_IncludePopups = lib.ImGuiCaptureFlags_IncludePopups
const CaptureFlags_HideMouseCursor = lib.ImGuiCaptureFlags_HideMouseCursor
const CaptureFlags_Instant = lib.ImGuiCaptureFlags_Instant
const CaptureFlags_NoSave = lib.ImGuiCaptureFlags_NoSave

const CaptureStatus = lib.ImGuiCaptureStatus
const CaptureStatus_InProgress = lib.ImGuiCaptureStatus_InProgress
const CaptureStatus_Done = lib.ImGuiCaptureStatus_Done
const CaptureStatus_Error = lib.ImGuiCaptureStatus_Error

const Flags_ = lib.ImGuiTestFlags_
const Flags_None = lib.ImGuiTestFlags_None
const Flags_NoGuiWarmUp = lib.ImGuiTestFlags_NoGuiWarmUp
const Flags_NoAutoFinish = lib.ImGuiTestFlags_NoAutoFinish
const Flags_NoRecoveryWarnings = lib.ImGuiTestFlags_NoRecoveryWarnings

const CheckFlags_ = lib.ImGuiTestCheckFlags_
const CheckFlags_None = lib.ImGuiTestCheckFlags_None
const CheckFlags_SilentSuccess = lib.ImGuiTestCheckFlags_SilentSuccess

const LogFlags_ = lib.ImGuiTestLogFlags_
const LogFlags_None = lib.ImGuiTestLogFlags_None
const LogFlags_NoHeader = lib.ImGuiTestLogFlags_NoHeader

const RunFlags_ = lib.ImGuiTestRunFlags_
const RunFlags_None = lib.ImGuiTestRunFlags_None
const RunFlags_GuiFuncDisable = lib.ImGuiTestRunFlags_GuiFuncDisable
const RunFlags_GuiFuncOnly = lib.ImGuiTestRunFlags_GuiFuncOnly
const RunFlags_NoSuccessMsg = lib.ImGuiTestRunFlags_NoSuccessMsg
const RunFlags_EnableRawInputs = lib.ImGuiTestRunFlags_EnableRawInputs
const RunFlags_RunFromGui = lib.ImGuiTestRunFlags_RunFromGui
const RunFlags_RunFromCommandLine = lib.ImGuiTestRunFlags_RunFromCommandLine
const RunFlags_NoError = lib.ImGuiTestRunFlags_NoError
const RunFlags_ShareVars = lib.ImGuiTestRunFlags_ShareVars
const RunFlags_ShareTestContext = lib.ImGuiTestRunFlags_ShareTestContext

const Action = lib.ImGuiTestAction
const Action_Unknown = lib.ImGuiTestAction_Unknown
const Action_Hover = lib.ImGuiTestAction_Hover
const Action_Click = lib.ImGuiTestAction_Click
const Action_DoubleClick = lib.ImGuiTestAction_DoubleClick
const Action_Check = lib.ImGuiTestAction_Check
const Action_Uncheck = lib.ImGuiTestAction_Uncheck
const Action_Open = lib.ImGuiTestAction_Open
const Action_Close = lib.ImGuiTestAction_Close
const Action_Input = lib.ImGuiTestAction_Input
const Action_NavActivate = lib.ImGuiTestAction_NavActivate
const Action_COUNT = lib.ImGuiTestAction_COUNT

const OpFlags_ = lib.ImGuiTestOpFlags_
const OpFlags_None = lib.ImGuiTestOpFlags_None
const OpFlags_NoCheckHoveredId = lib.ImGuiTestOpFlags_NoCheckHoveredId
const OpFlags_NoError = lib.ImGuiTestOpFlags_NoError
const OpFlags_NoFocusWindow = lib.ImGuiTestOpFlags_NoFocusWindow
const OpFlags_NoAutoUncollapse = lib.ImGuiTestOpFlags_NoAutoUncollapse
const OpFlags_NoAutoOpenFullPath = lib.ImGuiTestOpFlags_NoAutoOpenFullPath
const OpFlags_NoYield = lib.ImGuiTestOpFlags_NoYield
const OpFlags_IsSecondAttempt = lib.ImGuiTestOpFlags_IsSecondAttempt
const OpFlags_MoveToEdgeL = lib.ImGuiTestOpFlags_MoveToEdgeL
const OpFlags_MoveToEdgeR = lib.ImGuiTestOpFlags_MoveToEdgeR
const OpFlags_MoveToEdgeU = lib.ImGuiTestOpFlags_MoveToEdgeU
const OpFlags_MoveToEdgeD = lib.ImGuiTestOpFlags_MoveToEdgeD

const ImOsConsoleStream = lib.ImOsConsoleStream
const ImOsConsoleStream_StandardOutput = lib.ImOsConsoleStream_StandardOutput
const ImOsConsoleStream_StandardError = lib.ImOsConsoleStream_StandardError

const ImOsConsoleTextColor = lib.ImOsConsoleTextColor
const ImOsConsoleTextColor_Black = lib.ImOsConsoleTextColor_Black
const ImOsConsoleTextColor_White = lib.ImOsConsoleTextColor_White
const ImOsConsoleTextColor_BrightWhite = lib.ImOsConsoleTextColor_BrightWhite
const ImOsConsoleTextColor_BrightRed = lib.ImOsConsoleTextColor_BrightRed
const ImOsConsoleTextColor_BrightGreen = lib.ImOsConsoleTextColor_BrightGreen
const ImOsConsoleTextColor_BrightBlue = lib.ImOsConsoleTextColor_BrightBlue
const ImOsConsoleTextColor_BrightYellow = lib.ImOsConsoleTextColor_BrightYellow

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L218).
"""
FindItemInfo(engine::Engine, id, debug_id) = lib.cImGuiTestEngine_FindItemInfo(engine.ptr, id, debug_id)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L219).
"""
Yield(engine::Engine) = lib.cImGuiTestEngine_Yield(engine.ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L220).
"""
SetDeltaTime(engine::Engine, delta_time) = lib.cImGuiTestEngine_SetDeltaTime(engine.ptr, delta_time)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L221).
"""
GetFrameCount(engine::Engine) = lib.cImGuiTestEngine_GetFrameCount(engine.ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L222).
"""
PassFilter(test::ImGuiTest, filter) = lib.cImGuiTestEngine_PassFilter(test.ptr, filter)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L223).
"""
RunTest(engine::Engine, ctx::VoidablePtrOrRef{lib.ImGuiTestContext}, test::ImGuiTest, run_flags) =
    lib.cImGuiTestEngine_RunTest(engine.ptr, ctx, test.ptr, run_flags)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L225).
"""
BindImGuiContext(engine::Engine, ui_ctx::VoidablePtrOrRef{libig.ImGuiContext}) =
    lib.cImGuiTestEngine_BindImGuiContext(engine.ptr, ui_ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L226).
"""
UnbindImGuiContext(engine::Engine, ui_ctx::VoidablePtrOrRef{libig.ImGuiContext}) =
    lib.cImGuiTestEngine_UnbindImGuiContext(engine.ptr, ui_ctx)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L228).
"""
RebootUiContext(engine::Engine) = lib.cImGuiTestEngine_RebootUiContext(engine.ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L229).
"""
GetPerfTool(engine::Engine) = lib.cImGuiTestEngine_GetPerfTool(engine.ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L230).
"""
UpdateTestsSourceLines(engine::Engine) = lib.cImGuiTestEngine_UpdateTestsSourceLines(engine.ptr)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L233).
"""
CaptureScreenshot(engine::Engine, args::VoidablePtrOrRef{lib.ImGuiCaptureArgs}) =
    lib.cImGuiTestEngine_CaptureScreenshot(engine.ptr, args)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L234).
"""
CaptureBeginVideo(engine::Engine, args::VoidablePtrOrRef{lib.ImGuiCaptureArgs}) =
    lib.cImGuiTestEngine_CaptureBeginVideo(engine.ptr, args)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L235).
"""
CaptureEndVideo(engine::Engine, args::VoidablePtrOrRef{lib.ImGuiCaptureArgs}) =
    lib.cImGuiTestEngine_CaptureEndVideo(engine.ptr, args)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L238).
"""
GetStatusName(v::lib.ImGuiTestStatus) = lib.cImGuiTestEngine_GetStatusName(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L239).
"""
GetRunSpeedName(v::lib.ImGuiTestRunSpeed) = lib.cImGuiTestEngine_GetRunSpeedName(v)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L240).
"""
GetVerboseLevelName(v::lib.ImGuiTestVerboseLevel) = lib.cImGuiTestEngine_GetVerboseLevelName(v)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L23).
"""
ImHashDecoratedPath(str, str_end = C_NULL, seed = 0) = lib.cImHashDecoratedPath(str, str_end, seed)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L24).
"""
ImFindNextDecoratedPartInPath(str, str_end = C_NULL) = lib.cImFindNextDecoratedPartInPath(str, str_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L30).
"""
ImFileExist(filename) = lib.cImFileExist(filename)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L31).
"""
ImFileDelete(filename) = lib.cImFileDelete(filename)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L32).
"""
ImFileCreateDirectoryChain(path, path_end = C_NULL) = lib.cImFileCreateDirectoryChain(path, path_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L33).
"""
ImFileFindInParents(sub_path, max_parent_count, output) = lib.cImFileFindInParents(sub_path, max_parent_count, output)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L34).
"""
ImFileLoadSourceBlurb(filename, line_no_start, line_no_end, out_buf::VoidablePtrOrRef{libig.ImGuiTextBuffer}) =
    lib.cImFileLoadSourceBlurb(filename, line_no_start, line_no_end, out_buf)

"""
$(TYPEDSIGNATURES)

Return value always between path and path_end.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L41).
"""
ImPathFindFilename(path, path_end = C_NULL) = lib.cImPathFindFilename(path, path_end)

"""
$(TYPEDSIGNATURES)

Return value always between path and path_end.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L42).
"""
ImPathFindExtension(path, path_end = C_NULL) = lib.cImPathFindExtension(path, path_end)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L43).
"""
ImPathFixSeparatorsForCurrentOS(buf) = lib.cImPathFixSeparatorsForCurrentOS(buf)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L49).
"""
ImStrReplace(s, find, repl) = lib.cImStrReplace(s, find, repl)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L50).
"""
ImStrchrRangeWithEscaping(str, str_end, find_c) = lib.cImStrchrRangeWithEscaping(str, str_end, find_c)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L51).
"""
ImStrXmlEscape(s) = lib.cImStrXmlEscape(s)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L52).
"""
ImStrBase64Encode(src, dst, length) = lib.cImStrBase64Encode(src, dst, length)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L58).
"""
ImParseExtractArgcArgvFromCommandLine(out_argc, out_argv, cmd_line) =
    lib.cImParseExtractArgcArgvFromCommandLine(out_argc, out_argv, cmd_line)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L59).
"""
ImParseFindIniSection(ini_config, header, result::VoidablePtrOrRef{libig.ImVector_char}) =
    lib.cImParseFindIniSection(ini_config, header, result)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L65).
"""
ImTimeGetInMicroseconds() = lib.cImTimeGetInMicroseconds()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L66).
"""
ImTimestampToISO8601(timestamp, out_date) = lib.cImTimestampToISO8601(timestamp, out_date)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L72).
"""
ImThreadSleepInMilliseconds(ms) = lib.cImThreadSleepInMilliseconds(ms)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L73).
"""
ImThreadSetCurrentThreadDescription(description) = lib.cImThreadSetCurrentThreadDescription(description)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L90).
"""
ImBuildGetCompilationInfo() = lib.cImBuildGetCompilationInfo()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L91).
"""
ImBuildFindGitBranchName(git_repo_path, branch_name) = lib.cImBuildFindGitBranchName(git_repo_path, branch_name)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L114).
"""
ImOsCreateProcess(cmd_line) = lib.cImOsCreateProcess(cmd_line)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L115).
"""
ImOsPOpen(cmd_line, mode) = lib.cImOsPOpen(cmd_line, mode)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L116).
"""
ImOsPClose(fp) = lib.cImOsPClose(fp)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L117).
"""
ImOsOpenInShell(path) = lib.cImOsOpenInShell(path)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L118).
"""
ImOsIsDebuggerPresent() = lib.cImOsIsDebuggerPresent()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L119).
"""
ImOsOutputDebugString(message) = lib.cImOsOutputDebugString(message)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L120).
"""
ImOsConsoleSetTextColor(stream::lib.ImOsConsoleStream, color::lib.ImOsConsoleTextColor) =
    lib.cImOsConsoleSetTextColor(stream, color)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L128).
"""
TableGetHeaderID(
    table::VoidablePtrOrRef{libig.ImGuiTable},
    column::Union{String,Ptr{Cchar},Ptr{Cvoid}},
    instance_no::Integer = 0,
) = lib.cTableGetHeaderID_Str(table, column, instance_no)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L129).
"""
TableGetHeaderID(table::VoidablePtrOrRef{libig.ImGuiTable}, column_n::Integer, instance_no::Integer = 0) =
    lib.cTableGetHeaderID_int(table, column_n, instance_no)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L130).
"""
TableDiscardInstanceAndSettings(table_id) = lib.cTableDiscardInstanceAndSettings(table_id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L133).
"""
DrawDataVerifyMatchingBufferCount(draw_data::VoidablePtrOrRef{libig.ImDrawData}) =
    lib.cDrawDataVerifyMatchingBufferCount(draw_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_exporters.h#L59).
"""
PrintResultSummary(engine::Engine) = lib.cImGuiTestEngine_PrintResultSummary(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_exporters.h#L61).
"""
Export(engine::Engine) = lib.cImGuiTestEngine_Export(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_exporters.h#L62).
"""
ExportEx(engine::Engine, format::lib.ImGuiTestEngineExportFormat, filename) =
    lib.cImGuiTestEngine_ExportEx(engine.ptr, format, filename)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_ui.h#L24).
"""
ShowTestEngineWindows(engine::Engine, p_open) = lib.cImGuiTestEngine_ShowTestEngineWindows(engine.ptr, p_open)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_ui.h#L25).
"""
OpenSourceFile(engine::Engine, source_filename, source_line_no) =
    lib.cImGuiTestEngine_OpenSourceFile(engine.ptr, source_filename, source_line_no)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L169).
"""
ImGuiTestEngineHook_ItemAdd(
    ui_ctx::VoidablePtrOrRef{libig.ImGuiContext},
    id,
    bb::VoidablePtrOrRef{libig.ImRect},
    item_data::VoidablePtrOrRef{libig.ImGuiLastItemData},
) = lib.cImGuiTestEngineHook_ItemAdd(ui_ctx, id, bb, item_data)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L176).
"""
ImGuiTestEngineHook_ItemInfo(ui_ctx::VoidablePtrOrRef{libig.ImGuiContext}, id, label, flags) =
    lib.cImGuiTestEngineHook_ItemInfo(ui_ctx, id, label, flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L178).
"""
ImGuiTestEngineHook_Log(ui_ctx::VoidablePtrOrRef{libig.ImGuiContext}, fmt) = lib.cImGuiTestEngineHook_Log(ui_ctx, fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L179).
"""
FindItemDebugLabel(ui_ctx::VoidablePtrOrRef{libig.ImGuiContext}, id) =
    lib.cImGuiTestEngine_FindItemDebugLabel(ui_ctx, id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L182).
"""
Check(file, func, line, flags, result, expr) = lib.cImGuiTestEngine_Check(file, func, line, flags, result, expr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L183).
"""
CheckStrOp(file, func, line, flags, op, lhs_var, lhs_value, rhs_var, rhs_value, out_result) =
    lib.cImGuiTestEngine_CheckStrOp(file, func, line, flags, op, lhs_var, lhs_value, rhs_var, rhs_value, out_result)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L184).
"""
Error(file, func, line, flags, fmt) = lib.cImGuiTestEngine_Error(file, func, line, flags, fmt)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L185).
"""
AssertLog(expr, file, _function, line) = lib.cImGuiTestEngine_AssertLog(expr, file, _function, line)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L186).
"""
GetTempStringBuilder() = lib.cImGuiTestEngine_GetTempStringBuilder()

"""
$(TYPEDSIGNATURES)

Bind to a dear imgui context. Start coroutine.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L195).
"""
Start(engine::Engine, ui_ctx::VoidablePtrOrRef{libig.ImGuiContext}) = lib.cImGuiTestEngine_Start(engine.ptr, ui_ctx)

"""
$(TYPEDSIGNATURES)

Stop coroutine and export if any. (Unbind will lazily happen on context shutdown).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L196).
"""
Stop(engine::Engine) = lib.cImGuiTestEngine_Stop(engine.ptr)

"""
$(TYPEDSIGNATURES)

Call every frame after framebuffer swap, will process screen capture and call test_io.ScreenCaptureFunc().

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L197).
"""
PostSwap(engine::Engine) = lib.cImGuiTestEngine_PostSwap(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L198).
"""
GetIO(engine::Engine) = lib.cImGuiTestEngine_GetIO(engine.ptr)

"""
$(TYPEDSIGNATURES)

Prefer calling IM_REGISTER_TEST().

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L202).
"""
RegisterTest(engine::Engine, category, name, src_file = C_NULL, src_line = 0) =
    lib.cImGuiTestEngine_RegisterTest(engine.ptr, category, name, src_file, src_line)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L203).
"""
UnregisterTest(engine::Engine, test::ImGuiTest) = lib.cImGuiTestEngine_UnregisterTest(engine.ptr, test.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L204).
"""
UnregisterAllTests(engine::Engine) = lib.cImGuiTestEngine_UnregisterAllTests(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L207).
"""
QueueTest(engine::Engine, test::ImGuiTest, run_flags = 0) =
    lib.cImGuiTestEngine_QueueTest(engine.ptr, test.ptr, run_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L208).
"""
QueueTests(engine::Engine, group::lib.ImGuiTestGroup, filter = C_NULL, run_flags = 0) =
    lib.cImGuiTestEngine_QueueTests(engine.ptr, group, filter, run_flags)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L209).
"""
TryAbortEngine(engine::Engine) = lib.cImGuiTestEngine_TryAbortEngine(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L210).
"""
AbortCurrentTest(engine::Engine) = lib.cImGuiTestEngine_AbortCurrentTest(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L211).
"""
FindTestByName(engine::Engine, category, name) = lib.cImGuiTestEngine_FindTestByName(engine.ptr, category, name)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L215).
"""
IsTestQueueEmpty(engine::Engine) = lib.cImGuiTestEngine_IsTestQueueEmpty(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L216).
"""
IsUsingSimulatedInputs(engine::Engine) = lib.cImGuiTestEngine_IsUsingSimulatedInputs(engine.ptr)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L217).
"""
GetResultSummary(engine::Engine, out_results::VoidablePtrOrRef{lib.ImGuiTestEngineResultSummary}) =
    lib.cImGuiTestEngine_GetResultSummary(engine.ptr, out_results)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L218).
"""
GetTestList(engine::Engine, out_tests::VoidablePtrOrRef{lib.ImVector_ImGuiTest_Ptr}) =
    lib.cImGuiTestEngine_GetTestList(engine.ptr, out_tests)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L219).
"""
GetTestQueue(engine::Engine, out_tests::VoidablePtrOrRef{lib.ImVector_ImGuiTestRunTask}) =
    lib.cImGuiTestEngine_GetTestQueue(engine.ptr, out_tests)

"""
$(TYPEDSIGNATURES)

Install default crash handler (if you don't have one).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L228).
"""
InstallDefaultCrashHandler() = lib.cImGuiTestEngine_InstallDefaultCrashHandler()

"""
$(TYPEDSIGNATURES)

Default crash handler, should be called from a custom crash handler if such exists.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L229).
"""
CrashHandler() = lib.cImGuiTestEngine_CrashHandler()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L134).
"""
PerfToolAppendToCSV(
    perf_log::VoidablePtrOrRef{lib.ImGuiPerfTool},
    entry::VoidablePtrOrRef{lib.ImGuiPerfToolEntry},
    filename = C_NULL,
) = lib.cImGuiTestEngine_PerfToolAppendToCSV(perf_log, entry, filename)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L40).
"""
ImGuiCaptureImageBuf() = lib.ImGuiCaptureImageBuf_ImGuiCaptureImageBuf()

"""
Destructor for `ImGuiCaptureImageBuf`
"""
Destroy(self::Ptr{lib.ImGuiCaptureImageBuf}) = ImGuiCaptureImageBuf_destroy(self)

"""
$(TYPEDSIGNATURES)

Free allocated memory buffer if such exists.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L43).
"""
Clear(self::Ptr{lib.ImGuiCaptureImageBuf}) = lib.ImGuiCaptureImageBuf_Clear(self)

"""
$(TYPEDSIGNATURES)

Reallocate buffer for pixel data and zero it.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L44).
"""
CreateEmpty(self::Ptr{lib.ImGuiCaptureImageBuf}, w, h) = lib.ImGuiCaptureImageBuf_CreateEmpty(self, w, h)

"""
$(TYPEDSIGNATURES)

Save pixel data to specified image file.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L45).
"""
SaveFile(self::Ptr{lib.ImGuiCaptureImageBuf}, filename) = lib.ImGuiCaptureImageBuf_SaveFile(self, filename)

"""
$(TYPEDSIGNATURES)

Clear alpha channel from all pixels.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L46).
"""
RemoveAlpha(self::Ptr{lib.ImGuiCaptureImageBuf}) = lib.ImGuiCaptureImageBuf_RemoveAlpha(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L130).
"""
ImGuiCaptureContext(capture_func::VoidablePtrOrRef{lib.ImGuiScreenCaptureFunc} = C_NULL) =
    lib.ImGuiCaptureContext_ImGuiCaptureContext(capture_func)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L134).
"""
PreNewFrame(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_PreNewFrame(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L135).
"""
PreRender(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_PreRender(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L136).
"""
PostRender(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_PostRender(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L139).
"""
CaptureUpdate(self::Ptr{lib.ImGuiCaptureContext}, args::VoidablePtrOrRef{lib.ImGuiCaptureArgs}) =
    lib.ImGuiCaptureContext_CaptureUpdate(self, args)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L140).
"""
RestoreBackedUpData(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_RestoreBackedUpData(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L141).
"""
ClearState(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_ClearState(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L144).
"""
BeginVideoCapture(self::Ptr{lib.ImGuiCaptureContext}, args::VoidablePtrOrRef{lib.ImGuiCaptureArgs}) =
    lib.ImGuiCaptureContext_BeginVideoCapture(self, args)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L145).
"""
EndVideoCapture(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_EndVideoCapture(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L146).
"""
IsCapturingVideo(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_IsCapturingVideo(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L147).
"""
IsCapturing(self::Ptr{lib.ImGuiCaptureContext}) = lib.ImGuiCaptureContext_IsCapturing(self)

"""
Destructor for `ImGuiCaptureContext`
"""
Destroy(self::Ptr{lib.ImGuiCaptureContext}) = ImGuiCaptureContext_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L171).
"""
ImGuiCaptureToolUI() = lib.ImGuiCaptureToolUI_ImGuiCaptureToolUI()

"""
$(TYPEDSIGNATURES)

Render a capture tool window with various options and utilities.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L172).
"""
ShowCaptureToolWindow(
    self::Ptr{lib.ImGuiCaptureToolUI},
    context::VoidablePtrOrRef{lib.ImGuiCaptureContext},
    p_open = C_NULL,
) = lib.ImGuiCaptureToolUI_ShowCaptureToolWindow(self, context, p_open)

"""
$(TYPEDSIGNATURES)

Render a window picker that captures picked window to file specified in file_name.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L175).
"""
_CaptureWindowPicker(self::Ptr{lib.ImGuiCaptureToolUI}, args::VoidablePtrOrRef{lib.ImGuiCaptureArgs}) =
    lib.ImGuiCaptureToolUI__CaptureWindowPicker(self, args)

"""
$(TYPEDSIGNATURES)

Render a selector for selecting multiple windows for capture.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L176).
"""
_CaptureWindowsSelector(
    self::Ptr{lib.ImGuiCaptureToolUI},
    context::VoidablePtrOrRef{lib.ImGuiCaptureContext},
    args::VoidablePtrOrRef{lib.ImGuiCaptureArgs},
) = lib.ImGuiCaptureToolUI__CaptureWindowsSelector(self, context, args)

"""
$(TYPEDSIGNATURES)

Snap edges of all visible windows to a virtual grid.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L177).
"""
_SnapWindowsToGrid(self::Ptr{lib.ImGuiCaptureToolUI}, cell_size) =
    lib.ImGuiCaptureToolUI__SnapWindowsToGrid(self, cell_size)

"""
$(TYPEDSIGNATURES)

Format output file template into capture args struct and ensure target directory exists.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L178).
"""
_InitializeOutputFile(self::Ptr{lib.ImGuiCaptureToolUI}) = lib.ImGuiCaptureToolUI__InitializeOutputFile(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_capture_tool.h#L179).
"""
_ShowEncoderConfigFields(self::Ptr{lib.ImGuiCaptureToolUI}, context::VoidablePtrOrRef{lib.ImGuiCaptureContext}) =
    lib.ImGuiCaptureToolUI__ShowEncoderConfigFields(self, context)

"""
Destructor for `ImGuiCaptureToolUI`
"""
Destroy(self::Ptr{lib.ImGuiCaptureToolUI}) = ImGuiCaptureToolUI_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L331).
"""
ImGuiTestItemInfo() = lib.ImGuiTestItemInfo_ImGuiTestItemInfo()

"""
Destructor for `ImGuiTestItemInfo`
"""
Destroy(self::Ptr{lib.ImGuiTestItemInfo}) = ImGuiTestItemInfo_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L339).
"""
Clear(self::Ptr{lib.ImGuiTestItemList}) = lib.ImGuiTestItemList_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L340).
"""
Reserve(self::Ptr{lib.ImGuiTestItemList}, capacity) = lib.ImGuiTestItemList_Reserve(self, capacity)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L341).
"""
GetSize(self::Ptr{lib.ImGuiTestItemList}) = lib.ImGuiTestItemList_GetSize(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L342).
"""
GetByIndex(self::Ptr{lib.ImGuiTestItemList}, n) = lib.ImGuiTestItemList_GetByIndex(self, n)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L343).
"""
GetByID(self::Ptr{lib.ImGuiTestItemList}, id) = lib.ImGuiTestItemList_GetByID(self, id)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L346).
"""
Size(self::Ptr{lib.ImGuiTestItemList}) = lib.ImGuiTestItemList_size(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L347).
"""
Begin(self::Ptr{lib.ImGuiTestItemList}) = lib.ImGuiTestItemList_begin(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L348).
"""
End(self::Ptr{lib.ImGuiTestItemList}) = lib.ImGuiTestItemList_end(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L369).
"""
ImGuiTestLog() = lib.ImGuiTestLog_ImGuiTestLog()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L370).
"""
IsEmpty(self::Ptr{lib.ImGuiTestLog}) = lib.ImGuiTestLog_IsEmpty(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L371).
"""
Clear(self::Ptr{lib.ImGuiTestLog}) = lib.ImGuiTestLog_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L382).
"""
ExtractLinesForVerboseLevels(
    self::Ptr{lib.ImGuiTestLog},
    level_min::lib.ImGuiTestVerboseLevel,
    level_max::lib.ImGuiTestVerboseLevel,
    out_buffer::VoidablePtrOrRef{libig.ImGuiTextBuffer},
) = lib.ImGuiTestLog_ExtractLinesForVerboseLevels(self, level_min, level_max, out_buffer)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L385).
"""
UpdateLineOffsets(
    self::Ptr{lib.ImGuiTestLog},
    engine_io::VoidablePtrOrRef{lib.ImGuiTestEngineIO},
    level::lib.ImGuiTestVerboseLevel,
    start,
) = lib.ImGuiTestLog_UpdateLineOffsets(self, engine_io, level, start)

"""
Destructor for `ImGuiTestLog`
"""
Destroy(self::Ptr{lib.ImGuiTestLog}) = ImGuiTestLog_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L443).
"""
ImGuiTest() = lib.ImGuiTest_ImGuiTest()

"""
Destructor for `ImGuiTest`
"""
Destroy(self::Ptr{ImGuiTest}) = ImGuiTest_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_engine.h#L446).
"""
SetOwnedName(self::Ptr{ImGuiTest}, name) = lib.ImGuiTest_SetOwnedName(self, name)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L83).
"""
function ImGuiTestRef()
    pOut = Ref{ImGuiTestRef}()
    lib.ImGuiTestRef_ImGuiTestRef_TestRefPtr(pOut)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L84).
"""
function ImGuiTestRef(id::Integer)
    pOut = Ref{ImGuiTestRef}()
    lib.ImGuiTestRef_ImGuiTestRef_TestRefPtrUint(pOut, id)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L85).
"""
function ImGuiTestRef(path::Union{String,Ptr{Cchar},Ptr{Cvoid}})
    pOut = Ref{ImGuiTestRef}()
    lib.ImGuiTestRef_ImGuiTestRef_TestRefPtrStr(pOut, path)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L86).
"""
IsEmpty(self::Ptr{lib.ImGuiTestRef}) = lib.ImGuiTestRef_IsEmpty(self)

"""
Destructor for `ImGuiTestRef`
"""
Destroy(self::Ptr{lib.ImGuiTestRef}) = ImGuiTestRef_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L95).
"""
C_str(self::Ptr{lib.ImGuiTestRefDesc}) = lib.ImGuiTestRefDesc_c_str(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L96).
"""
function ImGuiTestRefDesc(ref::VoidablePtrOrRef{lib.ImGuiTestRef})
    pOut = Ref{ImGuiTestRefDesc}()
    lib.ImGuiTestRefDesc_ImGuiTestRefDesc_constTestRefPtr(pOut, ref)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L97).
"""
function ImGuiTestRefDesc(ref::VoidablePtrOrRef{lib.ImGuiTestRef}, item::VoidablePtrOrRef{lib.ImGuiTestItemInfo})
    pOut = Ref{ImGuiTestRefDesc}()
    lib.ImGuiTestRefDesc_ImGuiTestRefDesc_constTestRefPtrconstTestItemInfoPtr(pOut, ref, item)
    return pOut[]
end

"""
Destructor for `ImGuiTestRefDesc`
"""
Destroy(self::Ptr{lib.ImGuiTestRefDesc}) = ImGuiTestRefDesc_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L147).
"""
ImGuiTestActionFilter() = lib.ImGuiTestActionFilter_ImGuiTestActionFilter()

"""
Destructor for `ImGuiTestActionFilter`
"""
Destroy(self::Ptr{lib.ImGuiTestActionFilter}) = ImGuiTestActionFilter_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L169).
"""
ImGuiTestGenericItemStatus() = lib.ImGuiTestGenericItemStatus_ImGuiTestGenericItemStatus()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L170).
"""
Clear(self::Ptr{lib.ImGuiTestGenericItemStatus}) = lib.ImGuiTestGenericItemStatus_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L171).
"""
QuerySet(self::Ptr{lib.ImGuiTestGenericItemStatus}, ret_val = false) =
    lib.ImGuiTestGenericItemStatus_QuerySet(self, ret_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L172).
"""
QueryInc(self::Ptr{lib.ImGuiTestGenericItemStatus}, ret_val = false) =
    lib.ImGuiTestGenericItemStatus_QueryInc(self, ret_val)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L173).
"""
Draw(self::Ptr{lib.ImGuiTestGenericItemStatus}) = lib.ImGuiTestGenericItemStatus_Draw(self)

"""
Destructor for `ImGuiTestGenericItemStatus`
"""
Destroy(self::Ptr{lib.ImGuiTestGenericItemStatus}) = ImGuiTestGenericItemStatus_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L207).
"""
ImGuiTestGenericVars() = lib.ImGuiTestGenericVars_ImGuiTestGenericVars()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L208).
"""
Clear(self::Ptr{lib.ImGuiTestGenericVars}) = lib.ImGuiTestGenericVars_Clear(self)

"""
Destructor for `ImGuiTestGenericVars`
"""
Destroy(self::Ptr{lib.ImGuiTestGenericVars}) = ImGuiTestGenericVars_destroy(self)

"""
$(TYPEDSIGNATURES)

Set test status and stop running. Usually called when running test logic from GuiFunc() only.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L266).
"""
function Finish(status::lib.ImGuiTestStatus = lib.ImGuiTestStatus_Success)
    self = _current_test_context[]
    lib.ImGuiTestContext_Finish(self, status)
end

"""
$(TYPEDSIGNATURES)

[Experimental] Run another test from the current test.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L267).
"""
function RunChildTest(test_name, flags = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_RunChildTest(self, test_name, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L271).
"""
function IsError()
    self = _current_test_context[]
    lib.ImGuiTestContext_IsError(self)
end

"""
$(TYPEDSIGNATURES)

Unless test->Flags has ImGuiTestFlags_NoGuiWarmUp, we run GuiFunc() twice before running TestFunc(). Those frames are called "WarmUp" frames.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L272).
"""
function IsWarmUpGuiFrame()
    self = _current_test_context[]
    lib.ImGuiTestContext_IsWarmUpGuiFrame(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L273).
"""
function IsFirstGuiFrame()
    self = _current_test_context[]
    lib.ImGuiTestContext_IsFirstGuiFrame(self)
end

"""
$(TYPEDSIGNATURES)

First frame where TestFunc is running (after warm-up frame).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L274).
"""
function IsFirstTestFrame()
    self = _current_test_context[]
    lib.ImGuiTestContext_IsFirstTestFrame(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L275).
"""
function IsGuiFuncOnly()
    self = _current_test_context[]
    lib.ImGuiTestContext_IsGuiFuncOnly(self)
end

"""
$(TYPEDSIGNATURES)

[DEBUG] Generally called via IM_SUSPEND_TESTFUNC.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L278).
"""
function SuspendTestFunc(file = C_NULL, line = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_SuspendTestFunc(self, file, line)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L281).
"""
function LogEx(level::lib.ImGuiTestVerboseLevel, flags, fmt)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogEx(self, level, flags, fmt)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L283).
"""
function LogToTTY(level::lib.ImGuiTestVerboseLevel, message, message_end = C_NULL)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogToTTY(self, level, message, message_end)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L284).
"""
function LogToDebugger(level::lib.ImGuiTestVerboseLevel, message)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogToDebugger(self, level, message)
end

"""
$(TYPEDSIGNATURES)

ImGuiTestVerboseLevel_Debug or ImGuiTestVerboseLevel_Trace depending on context depth.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L285).
"""
function LogDebug(fmt)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogDebug(self, fmt)
end

"""
$(TYPEDSIGNATURES)

ImGuiTestVerboseLevel_Info.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L286).
"""
function LogInfo(fmt)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogInfo(self, fmt)
end

"""
$(TYPEDSIGNATURES)

ImGuiTestVerboseLevel_Warning.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L287).
"""
function LogWarning(fmt)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogWarning(self, fmt)
end

"""
$(TYPEDSIGNATURES)

ImGuiTestVerboseLevel_Error.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L288).
"""
function LogError(fmt)
    self = _current_test_context[]
    lib.ImGuiTestContext_LogError(self, fmt)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L289).
"""
function LogBasicUiState()
    self = _current_test_context[]
    lib.ImGuiTestContext_LogBasicUiState(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L290).
"""
function LogItemList(list::VoidablePtrOrRef{lib.ImGuiTestItemList})
    self = _current_test_context[]
    lib.ImGuiTestContext_LogItemList(self, list)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L293).
"""
function Yield(count = 1)
    self = _current_test_context[]
    lib.ImGuiTestContext_Yield(self, count)
end

"""
$(TYPEDSIGNATURES)

Sleep for a given simulation time, unless in Fast mode.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L294).
"""
function Sleep(time_in_second)
    self = _current_test_context[]
    lib.ImGuiTestContext_Sleep(self, time_in_second)
end

"""
$(TYPEDSIGNATURES)

Standard short delay of io.ActionDelayShort (~0.15f), unless in Fast mode.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L295).
"""
function SleepShort()
    self = _current_test_context[]
    lib.ImGuiTestContext_SleepShort(self)
end

"""
$(TYPEDSIGNATURES)

Standard regular delay of io.ActionDelayStandard (~0.40f), unless in Fast mode.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L296).
"""
function SleepStandard()
    self = _current_test_context[]
    lib.ImGuiTestContext_SleepStandard(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L297).
"""
function SleepNoSkip(time_in_second, framestep_in_second)
    self = _current_test_context[]
    lib.ImGuiTestContext_SleepNoSkip(self, time_in_second, framestep_in_second)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L308).
"""
function SetRef(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_SetRef_TestRef(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

Shortcut to SetRef(window->Name) which works for ChildWindow (see code).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L309).
"""
function SetRef(window::PtrOrRef{libig.ImGuiWindow})
    self = _current_test_context[]
    lib.ImGuiTestContext_SetRef_WindowPtr(self, window)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L310).
"""
function GetRef()
    self = _current_test_context[]
    pOut = Ref{ImGuiTestRef}()
    lib.ImGuiTestContext_GetRef(pOut, self)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L315).
"""
function WindowInfo(window_ref::TestRef, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    pOut = Ref{ImGuiTestItemInfo}()
    GC.@preserve window_ref lib.ImGuiTestContext_WindowInfo(pOut, self, lib.ImGuiTestRef(window_ref), flags)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L316).
"""
function WindowClose(window_ref::TestRef)
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowClose(self, lib.ImGuiTestRef(window_ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L317).
"""
function WindowCollapse(window_ref::TestRef, collapsed)
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowCollapse(self, lib.ImGuiTestRef(window_ref), collapsed)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L318).
"""
function WindowFocus(window_ref::TestRef, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowFocus(self, lib.ImGuiTestRef(window_ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L319).
"""
function WindowBringToFront(window_ref::TestRef, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowBringToFront(self, lib.ImGuiTestRef(window_ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L320).
"""
function WindowMove(
    window_ref::TestRef,
    pos::Union{libig.ImVec2,NTuple{2}},
    pivot::Union{libig.ImVec2,NTuple{2}} = libig.ImVec2(0.0f0, 0.0f0),
    flags = lib.ImGuiTestOpFlags_None,
)
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowMove(self, lib.ImGuiTestRef(window_ref), pos, pivot, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L321).
"""
function WindowResize(window_ref::TestRef, sz::Union{libig.ImVec2,NTuple{2}})
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowResize(self, lib.ImGuiTestRef(window_ref), sz)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L322).
"""
function WindowTeleportToMakePosVisible(window_ref::TestRef, pos_in_window::Union{libig.ImVec2,NTuple{2}})
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_WindowTeleportToMakePosVisible(
        self,
        lib.ImGuiTestRef(window_ref),
        pos_in_window,
    )
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L323).
"""
function GetWindowByRef(window_ref::TestRef)
    self = _current_test_context[]
    GC.@preserve window_ref lib.ImGuiTestContext_GetWindowByRef(self, lib.ImGuiTestRef(window_ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L326).
"""
function PopupCloseOne()
    self = _current_test_context[]
    lib.ImGuiTestContext_PopupCloseOne(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L327).
"""
function PopupCloseAll()
    self = _current_test_context[]
    lib.ImGuiTestContext_PopupCloseAll(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L328).
"""
function PopupGetWindowID(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_PopupGetWindowID(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L332).
"""
function GetID(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_GetID_TestRef(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L333).
"""
function GetID(ref::TestRef, seed_ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref seed_ref lib.ImGuiTestContext_GetID_TestRefTestRef(
        self,
        lib.ImGuiTestRef(ref),
        lib.ImGuiTestRef(seed_ref),
    )
end

"""
$(TYPEDSIGNATURES)

Find a point that has no windows // FIXME: This needs error return and flag to enable/disable forcefully finding void.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L336).
"""
function GetPosOnVoid(viewport::VoidablePtrOrRef{libig.ImGuiViewport})
    self = _current_test_context[]
    pOut = Ref{ImVec2}()
    lib.ImGuiTestContext_GetPosOnVoid(pOut, self, viewport)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

Return a clickable point on window title-bar (window tab for docked windows).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L337).
"""
function GetWindowTitlebarPoint(window_ref::TestRef)
    self = _current_test_context[]
    pOut = Ref{ImVec2}()
    GC.@preserve window_ref lib.ImGuiTestContext_GetWindowTitlebarPoint(pOut, self, lib.ImGuiTestRef(window_ref))
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

Work pos and size of main viewport when viewports are disabled, or work pos and size of monitor containing main viewport when viewports are enabled.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L338).
"""
function GetMainMonitorWorkPos()
    self = _current_test_context[]
    pOut = Ref{ImVec2}()
    lib.ImGuiTestContext_GetMainMonitorWorkPos(pOut, self)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L339).
"""
function GetMainMonitorWorkSize()
    self = _current_test_context[]
    pOut = Ref{ImVec2}()
    lib.ImGuiTestContext_GetMainMonitorWorkSize(pOut, self)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

Reset state (use when doing multiple captures).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L342).
"""
function CaptureReset()
    self = _current_test_context[]
    lib.ImGuiTestContext_CaptureReset(self)
end

"""
$(TYPEDSIGNATURES)

Set capture file format (otherwise for video this default to EngineIO->VideoCaptureExtension).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L343).
"""
function CaptureSetExtension(ext)
    self = _current_test_context[]
    lib.ImGuiTestContext_CaptureSetExtension(self, ext)
end

"""
$(TYPEDSIGNATURES)

Add window to be captured (default to capture everything).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L344).
"""
function CaptureAddWindow(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_CaptureAddWindow(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

Trigger a screen capture of a single window (== CaptureAddWindow() + CaptureScreenshot()).

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L345).
"""
function CaptureScreenshotWindow(ref::TestRef, capture_flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_CaptureScreenshotWindow(self, lib.ImGuiTestRef(ref), capture_flags)
end

"""
$(TYPEDSIGNATURES)

Trigger a screen capture.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L346).
"""
function CaptureScreenshot(capture_flags = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_CaptureScreenshot(self, capture_flags)
end

"""
$(TYPEDSIGNATURES)

Start a video capture.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L347).
"""
function CaptureBeginVideo()
    self = _current_test_context[]
    lib.ImGuiTestContext_CaptureBeginVideo(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L348).
"""
function CaptureEndVideo()
    self = _current_test_context[]
    lib.ImGuiTestContext_CaptureEndVideo(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L351).
"""
function MouseMove(ref::TestRef, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_MouseMove(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L352).
"""
function MouseMoveToPos(pos::Union{libig.ImVec2,NTuple{2}})
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseMoveToPos(self, pos)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L353).
"""
function MouseTeleportToPos(pos::Union{libig.ImVec2,NTuple{2}}, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseTeleportToPos(self, pos, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L354).
"""
function MouseClick(button = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseClick(self, button)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L355).
"""
function MouseClickMulti(button, count)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseClickMulti(self, button, count)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L356).
"""
function MouseDoubleClick(button = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseDoubleClick(self, button)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L357).
"""
function MouseDown(button = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseDown(self, button)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L358).
"""
function MouseUp(button = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseUp(self, button)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L359).
"""
function MouseLiftDragThreshold(button = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseLiftDragThreshold(self, button)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L360).
"""
function MouseDragWithDelta(delta::Union{libig.ImVec2,NTuple{2}}, button = 0)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseDragWithDelta(self, delta, button)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L361).
"""
function MouseWheel(delta::Union{libig.ImVec2,NTuple{2}})
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseWheel(self, delta)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L362).
"""
function MouseWheelX(dx)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseWheelX(self, dx)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L363).
"""
function MouseWheelY(dy)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseWheelY(self, dy)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L364).
"""
function MouseMoveToVoid(viewport::VoidablePtrOrRef{libig.ImGuiViewport} = C_NULL)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseMoveToVoid(self, viewport)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L365).
"""
function MouseClickOnVoid(button = 0, viewport::VoidablePtrOrRef{libig.ImGuiViewport} = C_NULL)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseClickOnVoid(self, button, viewport)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L366).
"""
function FindHoveredWindowAtPos(pos::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}})
    self = _current_test_context[]
    lib.ImGuiTestContext_FindHoveredWindowAtPos(self, pos)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L367).
"""
function FindExistingVoidPosOnViewport(
    viewport::VoidablePtrOrRef{libig.ImGuiViewport},
    out::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
)
    self = _current_test_context[]
    lib.ImGuiTestContext_FindExistingVoidPosOnViewport(self, viewport, out)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L372).
"""
function MouseSetViewport(window::VoidablePtrOrRef{libig.ImGuiWindow})
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseSetViewport(self, window)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L373).
"""
function MouseSetViewportID(viewport_id)
    self = _current_test_context[]
    lib.ImGuiTestContext_MouseSetViewportID(self, viewport_id)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L376).
"""
function KeyDown(key_chord)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyDown(self, key_chord)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L377).
"""
function KeyUp(key_chord)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyUp(self, key_chord)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L378).
"""
function KeyPress(key_chord, count = 1)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyPress(self, key_chord, count)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L379).
"""
function KeyHold(key_chord, time)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyHold(self, key_chord, time)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L380).
"""
function KeySetEx(key_chord, is_down, time)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeySetEx(self, key_chord, is_down, time)
end

"""
$(TYPEDSIGNATURES)

Input characters.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L381).
"""
function KeyChars(chars)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyChars(self, chars)
end

"""
$(TYPEDSIGNATURES)

Input characters at end of field.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L382).
"""
function KeyCharsAppend(chars)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyCharsAppend(self, chars)
end

"""
$(TYPEDSIGNATURES)

Input characters at end of field, press Enter.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L383).
"""
function KeyCharsAppendEnter(chars)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyCharsAppendEnter(self, chars)
end

"""
$(TYPEDSIGNATURES)

Delete existing field then input characters.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L384).
"""
function KeyCharsReplace(chars)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyCharsReplace(self, chars)
end

"""
$(TYPEDSIGNATURES)

Delete existing field then input characters, press Enter.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L385).
"""
function KeyCharsReplaceEnter(chars)
    self = _current_test_context[]
    lib.ImGuiTestContext_KeyCharsReplaceEnter(self, chars)
end

"""
$(TYPEDSIGNATURES)

Mouse or Keyboard or Gamepad. In Keyboard or Gamepad mode, actions such as ItemClick or ItemInput are using nav facilities instead of Mouse.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L392).
"""
function SetInputMode(input_mode::libig.ImGuiInputSource)
    self = _current_test_context[]
    lib.ImGuiTestContext_SetInputMode(self, input_mode)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L393).
"""
function NavMoveTo(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_NavMoveTo(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

Activate current selected item: activate button, tweak sliders/drags. Equivalent of pressing Space on keyboard, ImGuiKey_GamepadFaceUp on a gamepad.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L394).
"""
function NavActivate()
    self = _current_test_context[]
    lib.ImGuiTestContext_NavActivate(self)
end

"""
$(TYPEDSIGNATURES)

Input into select item: input sliders/drags. Equivalent of pressing Enter on keyboard, ImGuiKey_GamepadFaceDown on a gamepad.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L395).
"""
function NavInput()
    self = _current_test_context[]
    lib.ImGuiTestContext_NavInput(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L398).
"""
function ScrollTo(ref::TestRef, axis::libig.ImGuiAxis, scroll_v, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollTo(self, lib.ImGuiTestRef(ref), axis, scroll_v, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L399).
"""
function ScrollToX(ref::TestRef, scroll_x)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToX(self, lib.ImGuiTestRef(ref), scroll_x)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L400).
"""
function ScrollToY(ref::TestRef, scroll_y)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToY(self, lib.ImGuiTestRef(ref), scroll_y)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L401).
"""
function ScrollToTop(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToTop(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L402).
"""
function ScrollToBottom(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToBottom(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L403).
"""
function ScrollToItem(ref::TestRef, axis::libig.ImGuiAxis, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToItem(self, lib.ImGuiTestRef(ref), axis, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L404).
"""
function ScrollToItemX(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToItemX(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L405).
"""
function ScrollToItemY(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollToItemY(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L406).
"""
function ScrollToTabItem(tab_bar::VoidablePtrOrRef{libig.ImGuiTabBar}, tab_id)
    self = _current_test_context[]
    lib.ImGuiTestContext_ScrollToTabItem(self, tab_bar, tab_id)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L407).
"""
function ScrollErrorCheck(axis::libig.ImGuiAxis, expected, actual, remaining_attempts)
    self = _current_test_context[]
    lib.ImGuiTestContext_ScrollErrorCheck(self, axis, expected, actual, remaining_attempts)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L408).
"""
function ScrollVerifyScrollMax(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ScrollVerifyScrollMax(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L413).
"""
function ItemInfo(ref::TestRef, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    pOut = Ref{ImGuiTestItemInfo}()
    GC.@preserve ref lib.ImGuiTestContext_ItemInfo(pOut, self, lib.ImGuiTestRef(ref), flags)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L414).
"""
function ItemInfoOpenFullPath(ref::TestRef, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    pOut = Ref{ImGuiTestItemInfo}()
    GC.@preserve ref lib.ImGuiTestContext_ItemInfoOpenFullPath(pOut, self, lib.ImGuiTestRef(ref), flags)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L415).
"""
function ItemInfoHandleWildcardSearch(wildcard_prefix_start, wildcard_prefix_end, wildcard_suffix_start)
    self = _current_test_context[]
    lib.ImGuiTestContext_ItemInfoHandleWildcardSearch(
        self,
        wildcard_prefix_start,
        wildcard_prefix_end,
        wildcard_suffix_start,
    )
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L416).
"""
function ItemInfoNull()
    self = _current_test_context[]
    pOut = Ref{ImGuiTestItemInfo}()
    lib.ImGuiTestContext_ItemInfoNull(pOut, self)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L417).
"""
function GatherItems(out_list::VoidablePtrOrRef{lib.ImGuiTestItemList}, parent::TestRef, depth = -1)
    self = _current_test_context[]
    GC.@preserve parent lib.ImGuiTestContext_GatherItems(self, out_list, lib.ImGuiTestRef(parent), depth)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L420).
"""
function ItemAction(action::lib.ImGuiTestAction, ref::TestRef, flags = 0, action_arg = C_NULL)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemAction(self, action, lib.ImGuiTestRef(ref), flags, action_arg)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L421).
"""
function ItemClick(ref::TestRef, button = 0, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemClick(self, lib.ImGuiTestRef(ref), button, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L422).
"""
function ItemDoubleClick(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemDoubleClick(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L423).
"""
function ItemCheck(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemCheck(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L424).
"""
function ItemUncheck(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemUncheck(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L425).
"""
function ItemOpen(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemOpen(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L426).
"""
function ItemClose(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemClose(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L427).
"""
function ItemInput(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemInput(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L428).
"""
function ItemNavActivate(ref::TestRef, flags = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemNavActivate(self, lib.ImGuiTestRef(ref), flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L431).
"""
function ItemActionAll(
    action::lib.ImGuiTestAction,
    ref_parent::TestRef,
    filter::VoidablePtrOrRef{lib.ImGuiTestActionFilter} = C_NULL,
)
    self = _current_test_context[]
    GC.@preserve ref_parent lib.ImGuiTestContext_ItemActionAll(self, action, lib.ImGuiTestRef(ref_parent), filter)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L432).
"""
function ItemOpenAll(ref_parent::TestRef, depth = -1, passes = -1)
    self = _current_test_context[]
    GC.@preserve ref_parent lib.ImGuiTestContext_ItemOpenAll(self, lib.ImGuiTestRef(ref_parent), depth, passes)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L433).
"""
function ItemCloseAll(ref_parent::TestRef, depth = -1, passes = -1)
    self = _current_test_context[]
    GC.@preserve ref_parent lib.ImGuiTestContext_ItemCloseAll(self, lib.ImGuiTestRef(ref_parent), depth, passes)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L436).
"""
function ItemInputValue(ref::TestRef, v::Integer)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemInputValue_int(self, lib.ImGuiTestRef(ref), v)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L437).
"""
function ItemInputValue(ref::TestRef, f::Real)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemInputValue_float(self, lib.ImGuiTestRef(ref), f)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L438).
"""
function ItemInputValue(ref::TestRef, str::Union{String,Ptr{Cchar},Ptr{Cvoid}})
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemInputValue_Str(self, lib.ImGuiTestRef(ref), str)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L444).
"""
function ItemReadAsInt(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemReadAsInt(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L445).
"""
function ItemReadAsFloat(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemReadAsFloat(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L446).
"""
function ItemReadAsScalar(ref::TestRef, data_type, out_data, flags = lib.ImGuiTestOpFlags_None)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemReadAsScalar(self, lib.ImGuiTestRef(ref), data_type, out_data, flags)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L447).
"""
function ItemReadAsString(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemReadAsString_TestRef(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L448).
"""
function ItemReadAsString(ref::TestRef, out_buf::Union{String,Ptr{Cchar},Ptr{Cvoid}}, out_buf_size::Real)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemReadAsString_TestRefStr(
        self,
        lib.ImGuiTestRef(ref),
        out_buf,
        out_buf_size,
    )
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L451).
"""
function ItemExists(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemExists(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L452).
"""
function ItemIsChecked(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemIsChecked(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L453).
"""
function ItemIsOpened(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemIsOpened(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L454).
"""
function ItemVerifyCheckedIfAlive(ref::TestRef, checked)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemVerifyCheckedIfAlive(self, lib.ImGuiTestRef(ref), checked)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L457).
"""
function ItemHold(ref::TestRef, time)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemHold(self, lib.ImGuiTestRef(ref), time)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L458).
"""
function ItemHoldForFrames(ref::TestRef, frames)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ItemHoldForFrames(self, lib.ImGuiTestRef(ref), frames)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L459).
"""
function ItemDragOverAndHold(ref_src::TestRef, ref_dst::TestRef)
    self = _current_test_context[]
    GC.@preserve ref_src ref_dst lib.ImGuiTestContext_ItemDragOverAndHold(
        self,
        lib.ImGuiTestRef(ref_src),
        lib.ImGuiTestRef(ref_dst),
    )
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L460).
"""
function ItemDragAndDrop(ref_src::TestRef, ref_dst::TestRef, button = 0)
    self = _current_test_context[]
    GC.@preserve ref_src ref_dst lib.ImGuiTestContext_ItemDragAndDrop(
        self,
        lib.ImGuiTestRef(ref_src),
        lib.ImGuiTestRef(ref_dst),
        button,
    )
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L461).
"""
function ItemDragWithDelta(ref_src::TestRef, pos_delta::Union{libig.ImVec2,NTuple{2}})
    self = _current_test_context[]
    GC.@preserve ref_src lib.ImGuiTestContext_ItemDragWithDelta(self, lib.ImGuiTestRef(ref_src), pos_delta)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L464).
"""
function TabClose(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_TabClose(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L465).
"""
function TabBarCompareOrder(tab_bar::VoidablePtrOrRef{libig.ImGuiTabBar}, tab_order)
    self = _current_test_context[]
    lib.ImGuiTestContext_TabBarCompareOrder(self, tab_bar, tab_order)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L470).
"""
function MenuAction(action::lib.ImGuiTestAction, ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_MenuAction(self, action, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L471).
"""
function MenuActionAll(action::lib.ImGuiTestAction, ref_parent::TestRef)
    self = _current_test_context[]
    GC.@preserve ref_parent lib.ImGuiTestContext_MenuActionAll(self, action, lib.ImGuiTestRef(ref_parent))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L472).
"""
function MenuClick(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_MenuClick(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L473).
"""
function MenuCheck(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_MenuCheck(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L474).
"""
function MenuUncheck(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_MenuUncheck(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L475).
"""
function MenuCheckAll(ref_parent::TestRef)
    self = _current_test_context[]
    GC.@preserve ref_parent lib.ImGuiTestContext_MenuCheckAll(self, lib.ImGuiTestRef(ref_parent))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L476).
"""
function MenuUncheckAll(ref_parent::TestRef)
    self = _current_test_context[]
    GC.@preserve ref_parent lib.ImGuiTestContext_MenuUncheckAll(self, lib.ImGuiTestRef(ref_parent))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L479).
"""
function ComboClick(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ComboClick(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L480).
"""
function ComboClickAll(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_ComboClickAll(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L483).
"""
function TableOpenContextMenu(ref::TestRef, column_n = -1)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_TableOpenContextMenu(self, lib.ImGuiTestRef(ref), column_n)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L484).
"""
function TableClickHeader(ref::TestRef, label, key_mods = 0)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_TableClickHeader(self, lib.ImGuiTestRef(ref), label, key_mods)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L485).
"""
function TableSetColumnEnabled(ref::TestRef, label, enabled)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_TableSetColumnEnabled(self, lib.ImGuiTestRef(ref), label, enabled)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L486).
"""
function TableResizeColumn(ref::TestRef, column_n, width)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_TableResizeColumn(self, lib.ImGuiTestRef(ref), column_n, width)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L487).
"""
function TableGetSortSpecs(ref::TestRef)
    self = _current_test_context[]
    GC.@preserve ref lib.ImGuiTestContext_TableGetSortSpecs(self, lib.ImGuiTestRef(ref))
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L493).
"""
function ViewportPlatform_SetWindowPos(
    viewport::VoidablePtrOrRef{libig.ImGuiViewport},
    pos::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
)
    self = _current_test_context[]
    lib.ImGuiTestContext_ViewportPlatform_SetWindowPos(self, viewport, pos)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L494).
"""
function ViewportPlatform_SetWindowSize(
    viewport::VoidablePtrOrRef{libig.ImGuiViewport},
    size::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
)
    self = _current_test_context[]
    lib.ImGuiTestContext_ViewportPlatform_SetWindowSize(self, viewport, size)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L495).
"""
function ViewportPlatform_SetWindowFocus(viewport::VoidablePtrOrRef{libig.ImGuiViewport})
    self = _current_test_context[]
    lib.ImGuiTestContext_ViewportPlatform_SetWindowFocus(self, viewport)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L496).
"""
function ViewportPlatform_CloseWindow(viewport::VoidablePtrOrRef{libig.ImGuiViewport})
    self = _current_test_context[]
    lib.ImGuiTestContext_ViewportPlatform_CloseWindow(self, viewport)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L501).
"""
function DockClear(window_name)
    self = _current_test_context[]
    lib.ImGuiTestContext_DockClear(self, window_name)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L502).
"""
function DockInto(
    src_id::TestRef,
    dst_id::TestRef,
    split_dir::libig.ImGuiDir = libig.ImGuiDir_None,
    is_outer_docking = false,
    flags = 0,
)
    self = _current_test_context[]
    GC.@preserve src_id dst_id lib.ImGuiTestContext_DockInto(
        self,
        lib.ImGuiTestRef(src_id),
        lib.ImGuiTestRef(dst_id),
        split_dir,
        is_outer_docking,
        flags,
    )
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L503).
"""
function UndockNode(dock_id)
    self = _current_test_context[]
    lib.ImGuiTestContext_UndockNode(self, dock_id)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L504).
"""
function UndockWindow(window_name)
    self = _current_test_context[]
    lib.ImGuiTestContext_UndockWindow(self, window_name)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L505).
"""
function WindowIsUndockedOrStandalone(window::VoidablePtrOrRef{libig.ImGuiWindow})
    self = _current_test_context[]
    lib.ImGuiTestContext_WindowIsUndockedOrStandalone(self, window)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L506).
"""
function DockIdIsUndockedOrStandalone(dock_id)
    self = _current_test_context[]
    lib.ImGuiTestContext_DockIdIsUndockedOrStandalone(self, dock_id)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L507).
"""
function DockNodeHideTabBar(node::VoidablePtrOrRef{libig.ImGuiDockNode}, hidden)
    self = _current_test_context[]
    lib.ImGuiTestContext_DockNodeHideTabBar(self, node, hidden)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L511).
"""
function PerfCalcRef()
    self = _current_test_context[]
    lib.ImGuiTestContext_PerfCalcRef(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L512).
"""
function PerfCapture(category = C_NULL, test_name = C_NULL, csv_file = C_NULL)
    self = _current_test_context[]
    lib.ImGuiTestContext_PerfCapture(self, category, test_name, csv_file)
end

"""
$(TYPEDSIGNATURES)

Move windows covering 'window' at pos.

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L534).
"""
function _MakeAimingSpaceOverPos(
    viewport::VoidablePtrOrRef{libig.ImGuiViewport},
    over_window::VoidablePtrOrRef{libig.ImGuiWindow},
    over_pos::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
)
    self = _current_test_context[]
    lib.ImGuiTestContext__MakeAimingSpaceOverPos(self, viewport, over_window, over_pos)
end

"""
$(TYPEDSIGNATURES)

FIXME: Aim to remove this system...

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L535).
"""
function _ForeignWindowsHideOverPos(
    pos::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
    ignore_list::VoidablePtrOrRef{Ptr{Ptr{libig.ImGuiWindow}}},
)
    self = _current_test_context[]
    lib.ImGuiTestContext__ForeignWindowsHideOverPos(self, pos, ignore_list)
end

"""
$(TYPEDSIGNATURES)

FIXME: Aim to remove this system...

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_context.h#L536).
"""
function _ForeignWindowsUnhideAll()
    self = _current_test_context[]
    lib.ImGuiTestContext__ForeignWindowsUnhideAll(self)
end

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L172).
"""
ImGuiCsvParser(columns = -1) = lib.ImGuiCsvParser_ImGuiCsvParser(columns)

"""
Destructor for `ImGuiCsvParser`
"""
Destroy(self::Ptr{lib.ImGuiCsvParser}) = ImGuiCsvParser_destroy(self)

"""
$(TYPEDSIGNATURES)

Open and parse a CSV file.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L174).
"""
Load(self::Ptr{lib.ImGuiCsvParser}, file_name) = lib.ImGuiCsvParser_Load(self, file_name)

"""
$(TYPEDSIGNATURES)

Free allocated buffers.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L175).
"""
Clear(self::Ptr{lib.ImGuiCsvParser}) = lib.ImGuiCsvParser_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_utils.h#L176).
"""
GetCell(self::Ptr{lib.ImGuiCsvParser}, row, col) = lib.ImGuiCsvParser_GetCell(self, row, col)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L48).
"""
Clear(self::Ptr{lib.ImGuiTestGatherTask}) = lib.ImGuiTestGatherTask_Clear(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L88).
"""
function ForKeyChord(self::Ptr{lib.ImGuiTestInput}, key_chord, down)
    pOut = Ref{ImGuiTestInput}()
    lib.ImGuiTestInput_ForKeyChord(pOut, self, key_chord, down)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L97).
"""
function ForChar(self::Ptr{lib.ImGuiTestInput}, v)
    pOut = Ref{ImGuiTestInput}()
    lib.ImGuiTestInput_ForChar(pOut, self, v)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L105).
"""
function ForViewportFocus(self::Ptr{lib.ImGuiTestInput}, viewport_id)
    pOut = Ref{ImGuiTestInput}()
    lib.ImGuiTestInput_ForViewportFocus(pOut, self, viewport_id)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L113).
"""
function ForViewportSetPos(
    self::Ptr{lib.ImGuiTestInput},
    viewport_id,
    pos::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
)
    pOut = Ref{ImGuiTestInput}()
    lib.ImGuiTestInput_ForViewportSetPos(pOut, self, viewport_id, pos)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L122).
"""
function ForViewportSetSize(
    self::Ptr{lib.ImGuiTestInput},
    viewport_id,
    size::Union{VoidablePtrOrRef{libig.ImVec2},VoidablePtrOrRef{NTuple{2}}},
)
    pOut = Ref{ImGuiTestInput}()
    lib.ImGuiTestInput_ForViewportSetSize(pOut, self, viewport_id, size)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L131).
"""
function ForViewportClose(self::Ptr{lib.ImGuiTestInput}, viewport_id)
    pOut = Ref{ImGuiTestInput}()
    lib.ImGuiTestInput_ForViewportClose(pOut, self, viewport_id)
    return pOut[]
end

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_internal.h#L210).
"""
TestEngine() = lib.ImGuiTestEngine_ImGuiTestEngine()

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L48).
"""
ImGuiPerfToolEntry(rhs::VoidablePtrOrRef{lib.ImGuiPerfToolEntry}) =
    lib.ImGuiPerfToolEntry_ImGuiPerfToolEntry_constPerfToolEntryPtr(rhs)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L50).
"""
function Set end
Set(self::Ptr{lib.ImGuiPerfToolEntry}, rhs::VoidablePtrOrRef{lib.ImGuiPerfToolEntry}) =
    lib.ImGuiPerfToolEntry_Set(self, rhs)

"""
Destructor for `ImGuiPerfToolEntry`
"""
Destroy(self::Ptr{lib.ImGuiPerfToolEntry}) = ImGuiPerfToolEntry_destroy(self)

"""
Destructor for `ImGuiPerfToolBatch`
"""
Destroy(self::Ptr{lib.ImGuiPerfToolBatch}) = ImGuiPerfToolBatch_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L108).
"""
ImGuiPerfTool() = lib.ImGuiPerfTool_ImGuiPerfTool()

"""
Destructor for `ImGuiPerfTool`
"""
Destroy(self::Ptr{lib.ImGuiPerfTool}) = ImGuiPerfTool_destroy(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L111).
"""
Clear(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool_Clear(self)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L112).
"""
LoadCSV(self::Ptr{lib.ImGuiPerfTool}, filename = C_NULL) = lib.ImGuiPerfTool_LoadCSV(self, filename)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L113).
"""
AddEntry(self::Ptr{lib.ImGuiPerfTool}, entry::VoidablePtrOrRef{lib.ImGuiPerfToolEntry}) =
    lib.ImGuiPerfTool_AddEntry(self, entry)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L115).
"""
ShowPerfToolWindow(self::Ptr{lib.ImGuiPerfTool}, engine::Engine, p_open) =
    lib.ImGuiPerfTool_ShowPerfToolWindow(self, engine.ptr, p_open)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L116).
"""
ViewOnly(self::Ptr{lib.ImGuiPerfTool}, perf_name::Union{String,Ptr{Cchar}}) =
    lib.ImGuiPerfTool_ViewOnly_Str(self, perf_name)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L117).
"""
ViewOnly(self::Ptr{lib.ImGuiPerfTool}, perf_names::PtrOrRef{Vector{String}}) =
    lib.ImGuiPerfTool_ViewOnly_StrPtr(self, perf_names)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L118).
"""
GetEntryByBatchIdx(self::Ptr{lib.ImGuiPerfTool}, idx, perf_name = C_NULL) =
    lib.ImGuiPerfTool_GetEntryByBatchIdx(self, idx, perf_name)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L119).
"""
SaveHtmlReport(self::Ptr{lib.ImGuiPerfTool}, file_name, image_file = C_NULL) =
    lib.ImGuiPerfTool_SaveHtmlReport(self, file_name, image_file)

"""
$(TYPEDSIGNATURES)

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L120).
"""
Empty(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool_Empty(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L122).
"""
_Rebuild(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool__Rebuild(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L123).
"""
_IsVisibleBuild(self::Ptr{lib.ImGuiPerfTool}, batch::PtrOrRef{lib.ImGuiPerfToolBatch}) =
    lib.ImGuiPerfTool__IsVisibleBuild_PerfToolBatchPtr(self, batch)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L124).
"""
_IsVisibleBuild(self::Ptr{lib.ImGuiPerfTool}, batch::PtrOrRef{lib.ImGuiPerfToolEntry}) =
    lib.ImGuiPerfTool__IsVisibleBuild_PerfToolEntryPtr(self, batch)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L125).
"""
_IsVisibleTest(self::Ptr{lib.ImGuiPerfTool}, test_name) = lib.ImGuiPerfTool__IsVisibleTest(self, test_name)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L126).
"""
_CalculateLegendAlignment(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool__CalculateLegendAlignment(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L127).
"""
_ShowEntriesPlot(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool__ShowEntriesPlot(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L128).
"""
_ShowEntriesTable(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool__ShowEntriesTable(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L129).
"""
_SetBaseline(self::Ptr{lib.ImGuiPerfTool}, batch_index) = lib.ImGuiPerfTool__SetBaseline(self, batch_index)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L130).
"""
_AddSettingsHandler(self::Ptr{lib.ImGuiPerfTool}) = lib.ImGuiPerfTool__AddSettingsHandler(self)

"""
$(TYPEDSIGNATURES)

!!! warning
    This function is internal, it may change in the future.

[Upstream link](https://github.com/ocornut/imgui_test_engine/blob/v1.92.1/imgui_test_engine/imgui_te_perftool.h#L131).
"""
_UnpackSortedKey(self::Ptr{lib.ImGuiPerfTool}, key, batch_index, entry_index, monotonic_index = C_NULL) =
    lib.ImGuiPerfTool__UnpackSortedKey(self, key, batch_index, entry_index, monotonic_index)

@static if VERSION >= v"1.11"
    eval(
        Meta.parse(
            "public ImHashDecoratedPath, ImFindNextDecoratedPartInPath, ImFileExist, ImFileDelete, ImFileCreateDirectoryChain, ImFileFindInParents, ImFileLoadSourceBlurb, ImPathFindFilename, ImPathFindExtension, ImPathFixSeparatorsForCurrentOS, ImStrReplace, ImStrchrRangeWithEscaping, ImStrXmlEscape, ImStrBase64Encode, ImParseExtractArgcArgvFromCommandLine, ImParseFindIniSection, ImTimeGetInMicroseconds, ImTimestampToISO8601, ImThreadSleepInMilliseconds, ImThreadSetCurrentThreadDescription, ImBuildGetCompilationInfo, ImBuildFindGitBranchName, ImOsCreateProcess, ImOsPOpen, ImOsPClose, ImOsOpenInShell, ImOsIsDebuggerPresent, ImOsOutputDebugString, ImOsConsoleSetTextColor, TableGetHeaderID, TableDiscardInstanceAndSettings, DrawDataVerifyMatchingBufferCount, PrintResultSummary, Export, ExportEx, ShowTestEngineWindows, OpenSourceFile, ImGuiTestEngineHook_ItemAdd, ImGuiTestEngineHook_ItemInfo, ImGuiTestEngineHook_Log, FindItemDebugLabel, Check, CheckStrOp, Error, AssertLog, GetTempStringBuilder, Start, Stop, PostSwap, GetIO, RegisterTest, UnregisterTest, UnregisterAllTests, QueueTest, QueueTests, TryAbortEngine, AbortCurrentTest, FindTestByName, IsTestQueueEmpty, IsUsingSimulatedInputs, GetResultSummary, GetTestList, GetTestQueue, InstallDefaultCrashHandler, CrashHandler, PerfToolAppendToCSV, ImGuiCaptureImageBuf, Destroy, Clear, CreateEmpty, SaveFile, RemoveAlpha, ImGuiCaptureContext, PreNewFrame, PreRender, PostRender, CaptureUpdate, RestoreBackedUpData, ClearState, BeginVideoCapture, EndVideoCapture, IsCapturingVideo, IsCapturing, ImGuiCaptureToolUI, ShowCaptureToolWindow, ImGuiTestItemInfo, Reserve, GetSize, GetByIndex, GetByID, Size, Begin, End, ImGuiTestLog, IsEmpty, ExtractLinesForVerboseLevels, UpdateLineOffsets, ImGuiTest, SetOwnedName, ImGuiTestRef, C_str, ImGuiTestRefDesc, ImGuiTestActionFilter, ImGuiTestGenericItemStatus, QuerySet, QueryInc, Draw, ImGuiTestGenericVars, Finish, RunChildTest, IsError, IsWarmUpGuiFrame, IsFirstGuiFrame, IsFirstTestFrame, IsGuiFuncOnly, SuspendTestFunc, LogEx, LogToTTY, LogToDebugger, LogDebug, LogInfo, LogWarning, LogError, LogBasicUiState, LogItemList, Sleep, SleepShort, SleepStandard, SleepNoSkip, WindowInfo, WindowClose, WindowCollapse, WindowFocus, WindowBringToFront, WindowMove, WindowResize, WindowTeleportToMakePosVisible, PopupCloseOne, PopupCloseAll, PopupGetWindowID, GetID, GetPosOnVoid, GetWindowTitlebarPoint, GetMainMonitorWorkPos, GetMainMonitorWorkSize, CaptureReset, CaptureSetExtension, CaptureAddWindow, CaptureScreenshotWindow, CaptureScreenshot, CaptureBeginVideo, CaptureEndVideo, MouseTeleportToPos, MouseClickMulti, MouseDoubleClick, MouseDown, MouseUp, MouseLiftDragThreshold, MouseDragWithDelta, MouseWheel, MouseWheelX, MouseWheelY, MouseMoveToVoid, MouseClickOnVoid, FindHoveredWindowAtPos, FindExistingVoidPosOnViewport, MouseSetViewport, MouseSetViewportID, KeyDown, KeyUp, KeyPress, KeyHold, KeySetEx, KeyChars, KeyCharsAppend, KeyCharsAppendEnter, KeyCharsReplace, KeyCharsReplaceEnter, SetInputMode, NavMoveTo, NavActivate, NavInput, ScrollTo, ScrollToX, ScrollToY, ScrollToTop, ScrollToBottom, ScrollToItem, ScrollToItemX, ScrollToItemY, ScrollToTabItem, ScrollErrorCheck, ScrollVerifyScrollMax, ItemInfo, ItemInfoOpenFullPath, ItemInfoHandleWildcardSearch, ItemInfoNull, GatherItems, ItemAction, ItemUncheck, ItemInput, ItemNavActivate, ItemActionAll, ItemOpenAll, ItemCloseAll, ItemInputValue, ItemReadAsInt, ItemReadAsFloat, ItemReadAsScalar, ItemReadAsString, ItemExists, ItemIsChecked, ItemIsOpened, ItemVerifyCheckedIfAlive, ItemHold, ItemHoldForFrames, ItemDragOverAndHold, ItemDragAndDrop, ItemDragWithDelta, TabClose, TabBarCompareOrder, MenuAction, MenuActionAll, MenuCheck, MenuUncheck, MenuCheckAll, MenuUncheckAll, TableOpenContextMenu, TableClickHeader, TableSetColumnEnabled, TableResizeColumn, TableGetSortSpecs, ViewportPlatform_SetWindowPos, ViewportPlatform_SetWindowSize, ViewportPlatform_SetWindowFocus, ViewportPlatform_CloseWindow, DockClear, DockInto, UndockNode, UndockWindow, WindowIsUndockedOrStandalone, DockIdIsUndockedOrStandalone, DockNodeHideTabBar, PerfCalcRef, PerfCapture, ImGuiCsvParser, Load, GetCell, ImGuiPerfToolEntry, Set, ImGuiPerfTool, LoadCSV, AddEntry, ShowPerfToolWindow, ViewOnly, GetEntryByBatchIdx, SaveHtmlReport, Empty",
        ),
    )
end

export SetRef,
    GetRef,
    GetWindowByRef,
    ItemClick,
    ItemDoubleClick,
    ItemCheck,
    ItemOpen,
    ItemClose,
    MenuClick,
    ComboClick,
    ComboClickAll,
    MouseClick,
    MouseMove,
    MouseMoveToPos,
    Yield,
    OpenAndClose

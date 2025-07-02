module lib

using CEnum

to_c_type(t::Type) = t
to_c_type_pairs(va_list) = map(enumerate(to_c_type.(va_list))) do (ind, type)
    :(va_list[$ind]::$type)
end

import CImGuiPack_jll: libcimgui

import CImGui: ImVec2, ImVec4, ImRect,
    ImGuiWindow, ImGuiStorage, ImPoolIdx,
    ImGuiTextBuffer, ImGuiTableSortSpecs,
    ImGuiContext, ImGuiInputSource, ImGuiID, ImGuiTable,
    ImDrawData, ImGuiLastItemData, ImGuiViewport, ImGuiAxis, ImGuiTabBar,
    ImGuiSortDirection, ImGuiDir, ImGuiDockNode,
    ImVector_ImGuiWindowPtr, ImVector_const_charPtr, ImVector_char


struct ImGuiCaptureImageBuf
    Width::Cint
    Height::Cint
    Data::Ptr{Cuint}
end

struct ImGuiCaptureArgs
    InFlags::Cuint
    InCaptureWindows::ImVector_ImGuiWindowPtr
    InCaptureRect::ImRect
    InPadding::Cfloat
    InOutputFile::NTuple{256, Cchar}
    InOutputImageBuf::Ptr{ImGuiCaptureImageBuf}
    InRecordFPSTarget::Cint
    InSizeAlign::Cint
    OutImageSize::ImVec2
end

struct ImGuiCaptureWindowData
    Window::Ptr{ImGuiWindow}
    BackupRect::ImRect
    PosDuringCapture::ImVec2
end

# typedef bool ( ImGuiScreenCaptureFunc ) ( ImGuiID viewport_id , int x , int y , int w , int h , unsigned int * pixels , void * user_data )
const ImGuiScreenCaptureFunc = Cvoid

struct ImVector_ImGuiCaptureWindowData
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiCaptureWindowData}
end

struct ImGuiCaptureContext
    ScreenCaptureFunc::Ptr{ImGuiScreenCaptureFunc}
    ScreenCaptureUserData::Ptr{Cvoid}
    VideoCaptureEncoderPath::Ptr{Cchar}
    VideoCaptureEncoderPathSize::Cint
    VideoCaptureEncoderParams::Ptr{Cchar}
    VideoCaptureEncoderParamsSize::Cint
    GifCaptureEncoderParams::Ptr{Cchar}
    GifCaptureEncoderParamsSize::Cint
    _CaptureRect::ImRect
    _CapturedWindowRect::ImRect
    _ChunkNo::Cint
    _FrameNo::Cint
    _MouseRelativeToWindowPos::ImVec2
    _HoveredWindow::Ptr{ImGuiWindow}
    _CaptureBuf::ImGuiCaptureImageBuf
    _CaptureArgs::Ptr{ImGuiCaptureArgs}
    _WindowsData::ImVector_ImGuiCaptureWindowData
    _VideoRecording::Bool
    _VideoLastFrameTime::Cdouble
    _VideoEncoderPipe::Ptr{Libc.FILE}
    _BackupMouseDrawCursor::Bool
    _BackupDisplayWindowPadding::ImVec2
    _BackupDisplaySafeAreaPadding::ImVec2
end

struct ImVector_Uint
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cuint}
end

struct ImGuiCaptureToolUI
    SnapGridSize::Cfloat
    OutputLastFilename::NTuple{256, Cchar}
    VideoCaptureExtension::Ptr{Cchar}
    VideoCaptureExtensionSize::Cint
    _CaptureArgs::ImGuiCaptureArgs
    _StateIsPickingWindow::Bool
    _StateIsCapturing::Bool
    _SelectedWindows::ImVector_Uint
    _OutputFileTemplate::NTuple{256, Cchar}
    _FileCounter::Cint
end

struct ImGuiTestEngineResultSummary
    CountTested::Cint
    CountSuccess::Cint
    CountInQueue::Cint
end

mutable struct ImGuiTestCoroutineInterface
    CreateFunc::Ptr{Cvoid}
    DestroyFunc::Ptr{Cvoid}
    RunFunc::Ptr{Cvoid}
    YieldFunc::Ptr{Cvoid}
end
function Base.getproperty(x::Ptr{ImGuiTestCoroutineInterface}, f::Symbol)
    f === :CreateFunc && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :DestroyFunc && return Ptr{Ptr{Cvoid}}(x + 4)
    f === :RunFunc && return Ptr{Ptr{Cvoid}}(x + 8)
    f === :YieldFunc && return Ptr{Ptr{Cvoid}}(x + 12)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImGuiTestCoroutineInterface}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


# typedef void ( ImGuiTestEngineSrcFileOpenFunc ) ( const char * filename , int line_no , void * user_data )
const ImGuiTestEngineSrcFileOpenFunc = Cvoid

@cenum ImGuiTestRunSpeed::UInt32 begin
    ImGuiTestRunSpeed_Fast = 0
    ImGuiTestRunSpeed_Normal = 1
    ImGuiTestRunSpeed_Cinematic = 2
    ImGuiTestRunSpeed_COUNT = 3
end

@cenum ImGuiTestVerboseLevel::UInt32 begin
    ImGuiTestVerboseLevel_Silent = 0
    ImGuiTestVerboseLevel_Error = 1
    ImGuiTestVerboseLevel_Warning = 2
    ImGuiTestVerboseLevel_Info = 3
    ImGuiTestVerboseLevel_Debug = 4
    ImGuiTestVerboseLevel_Trace = 5
    ImGuiTestVerboseLevel_COUNT = 6
end

@cenum ImGuiTestEngineExportFormat::UInt32 begin
    ImGuiTestEngineExportFormat_None = 0
    ImGuiTestEngineExportFormat_JUnitXml = 1
end

struct ImGuiTestEngineIO
    CoroutineFuncs::Ptr{ImGuiTestCoroutineInterface}
    SrcFileOpenFunc::Ptr{ImGuiTestEngineSrcFileOpenFunc}
    ScreenCaptureFunc::Ptr{ImGuiScreenCaptureFunc}
    SrcFileOpenUserData::Ptr{Cvoid}
    ScreenCaptureUserData::Ptr{Cvoid}
    ConfigSavedSettings::Bool
    ConfigRunSpeed::ImGuiTestRunSpeed
    ConfigStopOnError::Bool
    ConfigBreakOnError::Bool
    ConfigKeepGuiFunc::Bool
    ConfigVerboseLevel::ImGuiTestVerboseLevel
    ConfigVerboseLevelOnError::ImGuiTestVerboseLevel
    ConfigLogToTTY::Bool
    ConfigLogToDebugger::Bool
    ConfigRestoreFocusAfterTests::Bool
    ConfigCaptureEnabled::Bool
    ConfigCaptureOnError::Bool
    ConfigNoThrottle::Bool
    ConfigMouseDrawCursor::Bool
    ConfigFixedDeltaTime::Cfloat
    PerfStressAmount::Cint
    GitBranchName::NTuple{64, Cchar}
    MouseSpeed::Cfloat
    MouseWobble::Cfloat
    ScrollSpeed::Cfloat
    TypingSpeed::Cfloat
    ActionDelayShort::Cfloat
    ActionDelayStandard::Cfloat
    VideoCaptureEncoderPath::NTuple{256, Cchar}
    VideoCaptureEncoderParams::NTuple{256, Cchar}
    GifCaptureEncoderParams::NTuple{512, Cchar}
    VideoCaptureExtension::NTuple{8, Cchar}
    ConfigWatchdogWarning::Cfloat
    ConfigWatchdogKillTest::Cfloat
    ConfigWatchdogKillApp::Cfloat
    ExportResultsFilename::Ptr{Cchar}
    ExportResultsFormat::ImGuiTestEngineExportFormat
    CheckDrawDataIntegrity::Bool
    IsRunningTests::Bool
    IsRequestingMaxAppSpeed::Bool
    IsCapturing::Bool
end
function Base.getproperty(x::Ptr{ImGuiTestEngineIO}, f::Symbol)
    f === :CoroutineFuncs && return Ptr{Ptr{ImGuiTestCoroutineInterface}}(x + 0)
    f === :SrcFileOpenFunc && return Ptr{Ptr{ImGuiTestEngineSrcFileOpenFunc}}(x + 4)
    f === :ScreenCaptureFunc && return Ptr{Ptr{ImGuiScreenCaptureFunc}}(x + 8)
    f === :SrcFileOpenUserData && return Ptr{Ptr{Cvoid}}(x + 12)
    f === :ScreenCaptureUserData && return Ptr{Ptr{Cvoid}}(x + 16)
    f === :ConfigSavedSettings && return Ptr{Bool}(x + 20)
    f === :ConfigRunSpeed && return Ptr{ImGuiTestRunSpeed}(x + 24)
    f === :ConfigStopOnError && return Ptr{Bool}(x + 28)
    f === :ConfigBreakOnError && return Ptr{Bool}(x + 29)
    f === :ConfigKeepGuiFunc && return Ptr{Bool}(x + 30)
    f === :ConfigVerboseLevel && return Ptr{ImGuiTestVerboseLevel}(x + 32)
    f === :ConfigVerboseLevelOnError && return Ptr{ImGuiTestVerboseLevel}(x + 36)
    f === :ConfigLogToTTY && return Ptr{Bool}(x + 40)
    f === :ConfigLogToDebugger && return Ptr{Bool}(x + 41)
    f === :ConfigRestoreFocusAfterTests && return Ptr{Bool}(x + 42)
    f === :ConfigCaptureEnabled && return Ptr{Bool}(x + 43)
    f === :ConfigCaptureOnError && return Ptr{Bool}(x + 44)
    f === :ConfigNoThrottle && return Ptr{Bool}(x + 45)
    f === :ConfigMouseDrawCursor && return Ptr{Bool}(x + 46)
    f === :ConfigFixedDeltaTime && return Ptr{Cfloat}(x + 48)
    f === :PerfStressAmount && return Ptr{Cint}(x + 52)
    f === :GitBranchName && return Ptr{NTuple{64, Cchar}}(x + 56)
    f === :MouseSpeed && return Ptr{Cfloat}(x + 120)
    f === :MouseWobble && return Ptr{Cfloat}(x + 124)
    f === :ScrollSpeed && return Ptr{Cfloat}(x + 128)
    f === :TypingSpeed && return Ptr{Cfloat}(x + 132)
    f === :ActionDelayShort && return Ptr{Cfloat}(x + 136)
    f === :ActionDelayStandard && return Ptr{Cfloat}(x + 140)
    f === :VideoCaptureEncoderPath && return Ptr{NTuple{256, Cchar}}(x + 144)
    f === :VideoCaptureEncoderParams && return Ptr{NTuple{256, Cchar}}(x + 400)
    f === :GifCaptureEncoderParams && return Ptr{NTuple{512, Cchar}}(x + 656)
    f === :VideoCaptureExtension && return Ptr{NTuple{8, Cchar}}(x + 1168)
    f === :ConfigWatchdogWarning && return Ptr{Cfloat}(x + 1176)
    f === :ConfigWatchdogKillTest && return Ptr{Cfloat}(x + 1180)
    f === :ConfigWatchdogKillApp && return Ptr{Cfloat}(x + 1184)
    f === :ExportResultsFilename && return Ptr{Ptr{Cchar}}(x + 1188)
    f === :ExportResultsFormat && return Ptr{ImGuiTestEngineExportFormat}(x + 1192)
    f === :CheckDrawDataIntegrity && return Ptr{Bool}(x + 1196)
    f === :IsRunningTests && return Ptr{Bool}(x + 1197)
    f === :IsRequestingMaxAppSpeed && return Ptr{Bool}(x + 1198)
    f === :IsCapturing && return Ptr{Bool}(x + 1199)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImGuiTestEngineIO}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct ImGuiTestItemInfo
    ID::Cuint
    DebugLabel::NTuple{32, Cchar}
    Window::Ptr{ImGuiWindow}
    NavLayer::Cuint
    Depth::Cint
    TimestampMain::Cint
    TimestampStatus::Cint
    ParentID::Cuint
    RectFull::ImRect
    RectClipped::ImRect
    ItemFlags::Cint
    StatusFlags::Cint
end
function Base.getproperty(x::Ptr{ImGuiTestItemInfo}, f::Symbol)
    f === :ID && return Ptr{Cuint}(x + 0)
    f === :DebugLabel && return Ptr{NTuple{32, Cchar}}(x + 4)
    f === :Window && return Ptr{Ptr{ImGuiWindow}}(x + 36)
    f === :NavLayer && return Ptr{Cuint}(x + 40)
    f === :Depth && return Ptr{Cint}(x + 44)
    f === :TimestampMain && return Ptr{Cint}(x + 48)
    f === :TimestampStatus && return Ptr{Cint}(x + 52)
    f === :ParentID && return Ptr{Cuint}(x + 56)
    f === :RectFull && return Ptr{ImRect}(x + 60)
    f === :RectClipped && return Ptr{ImRect}(x + 76)
    f === :ItemFlags && return Ptr{Cint}(x + 92)
    f === :StatusFlags && return Ptr{Cint}(x + 96)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImGuiTestItemInfo}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct ImVector_ImGuiTestItemInfo
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiTestItemInfo}
end

struct ImPool_ImGuiTestItemInfo
    Buf::ImVector_ImGuiTestItemInfo
    Map::ImGuiStorage
    FreeIdx::ImPoolIdx
    AliveCount::ImPoolIdx
end

struct ImGuiTestItemList
    Pool::ImPool_ImGuiTestItemInfo
end

struct ImGuiTestLogLineInfo
    Level::ImGuiTestVerboseLevel
    LineOffset::Cint
end

struct ImVector_ImGuiTestLogLineInfo
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiTestLogLineInfo}
end

struct ImGuiTestLog
    Buffer::ImGuiTextBuffer
    LineInfo::ImVector_ImGuiTestLogLineInfo
    CountPerLevel::NTuple{6, Cint}
end

@cenum ImGuiTestStatus::UInt32 begin
    ImGuiTestStatus_Unknown = 0
    ImGuiTestStatus_Success = 1
    ImGuiTestStatus_Queued = 2
    ImGuiTestStatus_Running = 3
    ImGuiTestStatus_Error = 4
    ImGuiTestStatus_Suspended = 5
    ImGuiTestStatus_COUNT = 6
end

struct ImGuiTestOutput
    Status::ImGuiTestStatus
    Log::ImGuiTestLog
    StartTime::Culonglong
    EndTime::Culonglong
end

@cenum ImGuiTestGroup::Int32 begin
    ImGuiTestGroup_Unknown = -1
    ImGuiTestGroup_Tests = 0
    ImGuiTestGroup_Perfs = 1
    ImGuiTestGroup_COUNT = 2
end

# typedef void ( ImGuiTestGuiFunc ) ( ImGuiTestContext * ctx )
const ImGuiTestGuiFunc = Cvoid

# typedef void ( ImGuiTestTestFunc ) ( ImGuiTestContext * ctx )
const ImGuiTestTestFunc = Cvoid

# typedef void ( ImGuiTestVarsConstructor ) ( void * buffer )
const ImGuiTestVarsConstructor = Cvoid

# typedef void ( ImGuiTestVarsPostConstructor ) ( ImGuiTestContext * ctx , void * ptr , void * fn )
const ImGuiTestVarsPostConstructor = Cvoid

# typedef void ( ImGuiTestVarsDestructor ) ( void * ptr )
const ImGuiTestVarsDestructor = Cvoid

struct ImGuiTest
    Category::Ptr{Cchar}
    Name::Ptr{Cchar}
    Group::ImGuiTestGroup
    NameOwned::Bool
    ArgVariant::Cint
    Flags::Cint
    GuiFunc::Ptr{ImGuiTestGuiFunc}
    TestFunc::Ptr{ImGuiTestTestFunc}
    UserData::Ptr{Cvoid}
    SourceFile::Ptr{Cchar}
    SourceLine::Cint
    SourceLineEnd::Cint
    Output::ImGuiTestOutput
    VarsSize::Culong
    VarsConstructor::Ptr{ImGuiTestVarsConstructor}
    VarsPostConstructor::Ptr{ImGuiTestVarsPostConstructor}
    VarsPostConstructorUserFn::Ptr{Cvoid}
    VarsDestructor::Ptr{ImGuiTestVarsDestructor}
end
function Base.getproperty(x::Ptr{ImGuiTest}, f::Symbol)
    f === :Category && return Ptr{Ptr{Cchar}}(x + 0)
    f === :Name && return Ptr{Ptr{Cchar}}(x + 4)
    f === :Group && return Ptr{ImGuiTestGroup}(x + 8)
    f === :NameOwned && return Ptr{Bool}(x + 12)
    f === :ArgVariant && return Ptr{Cint}(x + 16)
    f === :Flags && return Ptr{Cint}(x + 20)
    f === :GuiFunc && return Ptr{Ptr{ImGuiTestGuiFunc}}(x + 24)
    f === :TestFunc && return Ptr{Ptr{ImGuiTestTestFunc}}(x + 28)
    f === :UserData && return Ptr{Ptr{Cvoid}}(x + 32)
    f === :SourceFile && return Ptr{Ptr{Cchar}}(x + 36)
    f === :SourceLine && return Ptr{Cint}(x + 40)
    f === :SourceLineEnd && return Ptr{Cint}(x + 44)
    f === :Output && return Ptr{ImGuiTestOutput}(x + 48)
    f === :VarsSize && return Ptr{Culong}(x + 116)
    f === :VarsConstructor && return Ptr{Ptr{ImGuiTestVarsConstructor}}(x + 120)
    f === :VarsPostConstructor && return Ptr{Ptr{ImGuiTestVarsPostConstructor}}(x + 124)
    f === :VarsPostConstructorUserFn && return Ptr{Ptr{Cvoid}}(x + 128)
    f === :VarsDestructor && return Ptr{Ptr{ImGuiTestVarsDestructor}}(x + 132)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImGuiTest}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct ImGuiTestRunTask
    Test::Ptr{ImGuiTest}
    RunFlags::Cint
end

struct ImGuiTestRef
    ID::Cuint
    Path::Ptr{Cchar}
end

struct ImGuiTestRefDesc
    Buf::NTuple{80, Cchar}
end

mutable struct ImGuiTestActionFilter
    MaxDepth::Cint
    MaxPasses::Cint
    MaxItemCountPerDepth::Ptr{Cint}
    RequireAllStatusFlags::Cint
    RequireAnyStatusFlags::Cint
end

struct ImGuiTestGenericItemStatus
    RetValue::Cint
    Hovered::Cint
    Active::Cint
    Focused::Cint
    Clicked::Cint
    Visible::Cint
    Edited::Cint
    Activated::Cint
    Deactivated::Cint
    DeactivatedAfterEdit::Cint
end

struct ImGuiTestGenericVars
    Step::Cint
    Count::Cint
    DockId::Cuint
    OwnerId::Cuint
    WindowSize::ImVec2
    WindowFlags::Cint
    TableFlags::Cint
    PopupFlags::Cint
    Status::ImGuiTestGenericItemStatus
    ShowWindow1::Bool
    ShowWindow2::Bool
    UseClipper::Bool
    UseViewports::Bool
    Width::Cfloat
    Pos::ImVec2
    Pivot::ImVec2
    ItemSize::ImVec2
    Color1::ImVec4
    Color2::ImVec4
    Int1::Cint
    Int2::Cint
    IntArray::NTuple{10, Cint}
    Float1::Cfloat
    Float2::Cfloat
    FloatArray::NTuple{10, Cfloat}
    Bool1::Bool
    Bool2::Bool
    BoolArray::NTuple{10, Bool}
    Id::Cuint
    IdArray::NTuple{10, Cuint}
    Str1::NTuple{256, Cchar}
    Str2::NTuple{256, Cchar}
end

struct ImVector_ImGuiTest_Ptr
    Size::Cint
    Capacity::Cint
    Data::Ptr{Ptr{ImGuiTest}}
end

struct ImVector_ImGuiTestRunTask
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiTestRunTask}
end

struct ImGuiTestInfoTask
    ID::Cuint
    FrameCount::Cint
    DebugName::NTuple{64, Cchar}
    Result::ImGuiTestItemInfo
end

struct ImVector_ImGuiTestInfoTask_Ptr
    Size::Cint
    Capacity::Cint
    Data::Ptr{Ptr{ImGuiTestInfoTask}}
end

struct ImGuiTestGatherTask
    InParentID::Cuint
    InMaxDepth::Cint
    InLayerMask::Cshort
    OutList::Ptr{ImGuiTestItemList}
    LastItemInfo::Ptr{ImGuiTestItemInfo}
end

struct ImGuiTestFindByLabelTask
    InPrefixId::Cuint
    InSuffixDepth::Cint
    InSuffix::Ptr{Cchar}
    InSuffixLastItem::Ptr{Cchar}
    InSuffixLastItemHash::Cuint
    InFilterItemStatusFlags::Cint
    OutItemId::Cuint
end

@cenum ImGuiTestInputType::UInt32 begin
    ImGuiTestInputType_None = 0
    ImGuiTestInputType_Key = 1
    ImGuiTestInputType_Char = 2
    ImGuiTestInputType_ViewportFocus = 3
    ImGuiTestInputType_ViewportSetPos = 4
    ImGuiTestInputType_ViewportSetSize = 5
    ImGuiTestInputType_ViewportClose = 6
end

struct ImGuiTestInput
    Type::ImGuiTestInputType
    KeyChord::Cint
    Char::Cushort
    Down::Bool
    ViewportId::Cuint
    ViewportPosSize::ImVec2
end

struct ImVector_ImGuiTestInput
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiTestInput}
end

struct ImGuiTestInputs
    MousePosValue::ImVec2
    MouseWheel::ImVec2
    MouseHoveredViewport::Cuint
    MouseButtonsValue::Cint
    Queue::ImVector_ImGuiTestInput
    HostEscDown::Bool
    HostEscDownDuration::Cfloat
end

const Str = Cvoid

struct ImVector_double
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cdouble}
end

struct ImMovingAverage_double
    Samples::ImVector_double
    Accum::Cdouble
    Idx::Cint
    FillAmount::Cint
end

struct ImGuiPerfToolEntry
    Timestamp::Culonglong
    Category::Ptr{Cchar}
    TestName::Ptr{Cchar}
    DtDeltaMs::Cdouble
    DtDeltaMsMin::Cdouble
    DtDeltaMsMax::Cdouble
    NumSamples::Cint
    PerfStressAmount::Cint
    GitBranchName::Ptr{Cchar}
    BuildType::Ptr{Cchar}
    Cpu::Ptr{Cchar}
    OS::Ptr{Cchar}
    Compiler::Ptr{Cchar}
    Date::Ptr{Cchar}
    VsBaseline::Cdouble
    LabelIndex::Cint
end

struct ImVector_ImGuiPerfToolEntry
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiPerfToolEntry}
end

struct ImGuiPerfToolBatch
    BatchID::Culonglong
    NumSamples::Cint
    BranchIndex::Cint
    Entries::ImVector_ImGuiPerfToolEntry
end

struct ImVector_ImGuiPerfToolBatch
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiPerfToolBatch}
end

@cenum ImGuiPerfToolDisplayType::UInt32 begin
    ImGuiPerfToolDisplayType_Simple = 0
    ImGuiPerfToolDisplayType_PerBranchColors = 1
    ImGuiPerfToolDisplayType_CombineByBuildInfo = 2
end

struct ImVector_Ulonglong
    Size::Cint
    Capacity::Cint
    Data::Ptr{Culonglong}
end

struct ImVector_charPtr
    Size::Cint
    Capacity::Cint
    Data::Ptr{Ptr{Cchar}}
end

struct ImGuiCsvParser
    Columns::Cint
    Rows::Cint
    _Data::Ptr{Cchar}
    _Index::ImVector_charPtr
end

struct ImGuiPerfTool
    _SrcData::ImVector_ImGuiPerfToolEntry
    _Labels::ImVector_const_charPtr
    _LabelsVisible::ImVector_const_charPtr
    _Batches::ImVector_ImGuiPerfToolBatch
    _LabelBarCounts::ImGuiStorage
    _NumVisibleBuilds::Cint
    _NumUniqueBuilds::Cint
    _DisplayType::ImGuiPerfToolDisplayType
    _BaselineBatchIndex::Cint
    _BaselineTimestamp::Culonglong
    _BaselineBuildId::Culonglong
    _Filter::NTuple{128, Cchar}
    _FilterDateFrom::NTuple{11, Cchar}
    _FilterDateTo::NTuple{11, Cchar}
    _InfoTableHeight::Cfloat
    _AlignStress::Cint
    _AlignType::Cint
    _AlignOs::Cint
    _AlignCpu::Cint
    _AlignCompiler::Cint
    _AlignBranch::Cint
    _AlignSamples::Cint
    _InfoTableSortDirty::Bool
    _InfoTableSort::ImVector_Ulonglong
    _InfoTableSortSpecs::Ptr{ImGuiTableSortSpecs}
    _TempSet::ImGuiStorage
    _TableHoveredTest::Cint
    _TableHoveredBatch::Cint
    _PlotHoverTest::Cint
    _PlotHoverBatch::Cint
    _PlotHoverTestLabel::Bool
    _ReportGenerating::Bool
    _Visibility::ImGuiStorage
    _CsvParser::Ptr{ImGuiCsvParser}
end

struct ImGuiTestEngine
    IO::ImGuiTestEngineIO
    UiContextTarget::Ptr{ImGuiContext}
    UiContextActive::Ptr{ImGuiContext}
    Started::Bool
    BatchStartTime::Culonglong
    BatchEndTime::Culonglong
    FrameCount::Cint
    OverrideDeltaTime::Cfloat
    TestsAll::ImVector_ImGuiTest_Ptr
    TestsQueue::ImVector_ImGuiTestRunTask
    TestContext::Ptr{Cvoid} # TestContext::Ptr{ImGuiTestContext}
    TestsSourceLinesDirty::Bool
    InfoTasks::ImVector_ImGuiTestInfoTask_Ptr
    GatherTask::ImGuiTestGatherTask
    FindByLabelTask::ImGuiTestFindByLabelTask
    TestQueueCoroutine::Ptr{Cvoid}
    TestQueueCoroutineShouldExit::Bool
    Inputs::ImGuiTestInputs
    Abort::Bool
    UiSelectAndScrollToTest::Ptr{ImGuiTest}
    UiSelectedTest::Ptr{ImGuiTest}
    UiFilterTests::Ptr{Str}
    UiFilterPerfs::Ptr{Str}
    UiFilterByStatusMask::Cuint
    UiMetricsOpen::Bool
    UiDebugLogOpen::Bool
    UiCaptureToolOpen::Bool
    UiStackToolOpen::Bool
    UiPerfToolOpen::Bool
    UiLogHeight::Cfloat
    PerfRefDeltaTime::Cdouble
    PerfDeltaTime100::ImMovingAverage_double
    PerfDeltaTime500::ImMovingAverage_double
    PerfTool::Ptr{ImGuiPerfTool}
    CaptureTool::ImGuiCaptureToolUI
    CaptureContext::ImGuiCaptureContext
    CaptureCurrentArgs::Ptr{ImGuiCaptureArgs}
    PostSwapCalled::Bool
    ToolDebugRebootUiContext::Bool
    ToolSlowDown::Bool
    ToolSlowDownMs::Cint
    BackupConfigRunSpeed::ImGuiTestRunSpeed
    BackupConfigNoThrottle::Bool
end

function Base.getproperty(x::ImGuiTestEngine, f::Symbol)
    f === :TestContext && return Ptr{ImGuiTestContext}(getfield(x, f))
    return getfield(x, f)
end

function Base.getproperty(x::Ptr{ImGuiTestEngine}, f::Symbol)
    f === :IO && return Ptr{ImGuiTestEngineIO}(x + 0)
    f === :UiContextTarget && return Ptr{Ptr{ImGuiContext}}(x + 1200)
    f === :UiContextActive && return Ptr{Ptr{ImGuiContext}}(x + 1204)
    f === :Started && return Ptr{Bool}(x + 1208)
    f === :BatchStartTime && return Ptr{Culonglong}(x + 1212)
    f === :BatchEndTime && return Ptr{Culonglong}(x + 1220)
    f === :FrameCount && return Ptr{Cint}(x + 1228)
    f === :OverrideDeltaTime && return Ptr{Cfloat}(x + 1232)
    f === :TestsAll && return Ptr{ImVector_ImGuiTest_Ptr}(x + 1236)
    f === :TestsQueue && return Ptr{ImVector_ImGuiTestRunTask}(x + 1248)
    f === :TestContext && return Ptr{Ptr{ImGuiTestContext}}(x + 1260)
    f === :TestsSourceLinesDirty && return Ptr{Bool}(x + 1264)
    f === :InfoTasks && return Ptr{ImVector_ImGuiTestInfoTask_Ptr}(x + 1268)
    f === :GatherTask && return Ptr{ImGuiTestGatherTask}(x + 1280)
    f === :FindByLabelTask && return Ptr{ImGuiTestFindByLabelTask}(x + 1300)
    f === :TestQueueCoroutine && return Ptr{Ptr{Cvoid}}(x + 1328)
    f === :TestQueueCoroutineShouldExit && return Ptr{Bool}(x + 1332)
    f === :Inputs && return Ptr{ImGuiTestInputs}(x + 1336)
    f === :Abort && return Ptr{Bool}(x + 1380)
    f === :UiSelectAndScrollToTest && return Ptr{Ptr{ImGuiTest}}(x + 1384)
    f === :UiSelectedTest && return Ptr{Ptr{ImGuiTest}}(x + 1388)
    f === :UiFilterTests && return Ptr{Ptr{Str}}(x + 1392)
    f === :UiFilterPerfs && return Ptr{Ptr{Str}}(x + 1396)
    f === :UiFilterByStatusMask && return Ptr{Cuint}(x + 1400)
    f === :UiMetricsOpen && return Ptr{Bool}(x + 1404)
    f === :UiDebugLogOpen && return Ptr{Bool}(x + 1405)
    f === :UiCaptureToolOpen && return Ptr{Bool}(x + 1406)
    f === :UiStackToolOpen && return Ptr{Bool}(x + 1407)
    f === :UiPerfToolOpen && return Ptr{Bool}(x + 1408)
    f === :UiLogHeight && return Ptr{Cfloat}(x + 1412)
    f === :PerfRefDeltaTime && return Ptr{Cdouble}(x + 1416)
    f === :PerfDeltaTime100 && return Ptr{ImMovingAverage_double}(x + 1424)
    f === :PerfDeltaTime500 && return Ptr{ImMovingAverage_double}(x + 1452)
    f === :PerfTool && return Ptr{Ptr{ImGuiPerfTool}}(x + 1480)
    f === :CaptureTool && return Ptr{ImGuiCaptureToolUI}(x + 1484)
    f === :CaptureContext && return Ptr{ImGuiCaptureContext}(x + 2340)
    f === :CaptureCurrentArgs && return Ptr{Ptr{ImGuiCaptureArgs}}(x + 2488)
    f === :PostSwapCalled && return Ptr{Bool}(x + 2492)
    f === :ToolDebugRebootUiContext && return Ptr{Bool}(x + 2493)
    f === :ToolSlowDown && return Ptr{Bool}(x + 2494)
    f === :ToolSlowDownMs && return Ptr{Cint}(x + 2496)
    f === :BackupConfigRunSpeed && return Ptr{ImGuiTestRunSpeed}(x + 2500)
    f === :BackupConfigNoThrottle && return Ptr{Bool}(x + 2504)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImGuiTestEngine}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

@cenum ImGuiTestActiveFunc::UInt32 begin
    ImGuiTestActiveFunc_None = 0
    ImGuiTestActiveFunc_GuiFunc = 1
    ImGuiTestActiveFunc_TestFunc = 2
end

struct ImGuiTestContext
    GenericVars::ImGuiTestGenericVars
    UserVars::Ptr{Cvoid}
    UiContext::Ptr{ImGuiContext}
    EngineIO::Ptr{ImGuiTestEngineIO}
    Test::Ptr{ImGuiTest}
    TestOutput::Ptr{ImGuiTestOutput}
    OpFlags::Cint
    PerfStressAmount::Cint
    FrameCount::Cint
    FirstTestFrameCount::Cint
    FirstGuiFrame::Bool
    HasDock::Bool
    CaptureArgs::Ptr{ImGuiCaptureArgs}
    Engine::Ptr{ImGuiTestEngine}
    Inputs::Ptr{ImGuiTestInputs}
    RunFlags::Cint
    ActiveFunc::ImGuiTestActiveFunc
    RunningTime::Cdouble
    ActionDepth::Cint
    CaptureCounter::Cint
    ErrorCounter::Cint
    Abort::Bool
    PerfRefDt::Cdouble
    PerfIterations::Cint
    RefStr::NTuple{256, Cchar}
    RefID::Cuint
    RefWindowID::Cuint
    InputMode::ImGuiInputSource
    TempString::ImVector_char
    Clipboard::ImVector_char
    ForeignWindowsToHide::ImVector_ImGuiWindowPtr
    DummyItemInfoNull::ImGuiTestItemInfo
    CachedLinesPrintedToTTY::Bool
end
function Base.getproperty(x::Ptr{ImGuiTestContext}, f::Symbol)
    f === :GenericVars && return Ptr{ImGuiTestGenericVars}(x + 0)
    f === :UserVars && return Ptr{Ptr{Cvoid}}(x + 804)
    f === :UiContext && return Ptr{Ptr{ImGuiContext}}(x + 808)
    f === :EngineIO && return Ptr{Ptr{ImGuiTestEngineIO}}(x + 812)
    f === :Test && return Ptr{Ptr{ImGuiTest}}(x + 816)
    f === :TestOutput && return Ptr{Ptr{ImGuiTestOutput}}(x + 820)
    f === :OpFlags && return Ptr{Cint}(x + 824)
    f === :PerfStressAmount && return Ptr{Cint}(x + 828)
    f === :FrameCount && return Ptr{Cint}(x + 832)
    f === :FirstTestFrameCount && return Ptr{Cint}(x + 836)
    f === :FirstGuiFrame && return Ptr{Bool}(x + 840)
    f === :HasDock && return Ptr{Bool}(x + 841)
    f === :CaptureArgs && return Ptr{Ptr{ImGuiCaptureArgs}}(x + 844)
    f === :Engine && return Ptr{Ptr{ImGuiTestEngine}}(x + 848)
    f === :Inputs && return Ptr{Ptr{ImGuiTestInputs}}(x + 852)
    f === :RunFlags && return Ptr{Cint}(x + 856)
    f === :ActiveFunc && return Ptr{ImGuiTestActiveFunc}(x + 860)
    f === :RunningTime && return Ptr{Cdouble}(x + 864)
    f === :ActionDepth && return Ptr{Cint}(x + 872)
    f === :CaptureCounter && return Ptr{Cint}(x + 876)
    f === :ErrorCounter && return Ptr{Cint}(x + 880)
    f === :Abort && return Ptr{Bool}(x + 884)
    f === :PerfRefDt && return Ptr{Cdouble}(x + 888)
    f === :PerfIterations && return Ptr{Cint}(x + 896)
    f === :RefStr && return Ptr{NTuple{256, Cchar}}(x + 900)
    f === :RefID && return Ptr{Cuint}(x + 1156)
    f === :RefWindowID && return Ptr{Cuint}(x + 1160)
    f === :InputMode && return Ptr{ImGuiInputSource}(x + 1164)
    f === :TempString && return Ptr{ImVector_char}(x + 1168)
    f === :Clipboard && return Ptr{ImVector_char}(x + 1180)
    f === :ForeignWindowsToHide && return Ptr{ImVector_ImGuiWindowPtr}(x + 1192)
    f === :DummyItemInfoNull && return Ptr{ImGuiTestItemInfo}(x + 1204)
    f === :CachedLinesPrintedToTTY && return Ptr{Bool}(x + 1304)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImGuiTestContext}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


mutable struct ImBuildInfo
    Type::Ptr{Cchar}
    Cpu::Ptr{Cchar}
    OS::Ptr{Cchar}
    Compiler::Ptr{Cchar}
    Date::NTuple{32, Cchar}
    Time::Ptr{Cchar}
end

const ImGuiCaptureFlags = Cuint

const ImGuiTestFlags = Cint

const ImGuiTestCheckFlags = Cint

const ImGuiTestLogFlags = Cint

const ImGuiTestRunFlags = Cint

const ImGuiTestOpFlags = Cint

const ImGuiTestCoroutineHandle = Ptr{Cvoid}

# typedef void ( ImGuiTestCoroutineMainFunc ) ( void * data )
const ImGuiTestCoroutineMainFunc = Cvoid

@cenum ImGuiCaptureFlags_::UInt32 begin
    ImGuiCaptureFlags_None = 0
    ImGuiCaptureFlags_StitchAll = 1
    ImGuiCaptureFlags_IncludeOtherWindows = 2
    ImGuiCaptureFlags_IncludePopups = 4
    ImGuiCaptureFlags_HideMouseCursor = 8
    ImGuiCaptureFlags_Instant = 16
    ImGuiCaptureFlags_NoSave = 32
end

@cenum ImGuiCaptureStatus::UInt32 begin
    ImGuiCaptureStatus_InProgress = 0
    ImGuiCaptureStatus_Done = 1
    ImGuiCaptureStatus_Error = 2
end

@cenum ImGuiTestFlags_::UInt32 begin
    ImGuiTestFlags_None = 0
    ImGuiTestFlags_NoGuiWarmUp = 1
    ImGuiTestFlags_NoAutoFinish = 2
    ImGuiTestFlags_NoRecoveryWarnings = 4
end

@cenum ImGuiTestCheckFlags_::UInt32 begin
    ImGuiTestCheckFlags_None = 0
    ImGuiTestCheckFlags_SilentSuccess = 1
end

@cenum ImGuiTestLogFlags_::UInt32 begin
    ImGuiTestLogFlags_None = 0
    ImGuiTestLogFlags_NoHeader = 1
end

@cenum ImGuiTestRunFlags_::UInt32 begin
    ImGuiTestRunFlags_None = 0
    ImGuiTestRunFlags_GuiFuncDisable = 1
    ImGuiTestRunFlags_GuiFuncOnly = 2
    ImGuiTestRunFlags_NoSuccessMsg = 4
    ImGuiTestRunFlags_EnableRawInputs = 8
    ImGuiTestRunFlags_RunFromGui = 16
    ImGuiTestRunFlags_RunFromCommandLine = 32
    ImGuiTestRunFlags_NoError = 1024
    ImGuiTestRunFlags_ShareVars = 2048
    ImGuiTestRunFlags_ShareTestContext = 4096
end

@cenum ImGuiTestAction::UInt32 begin
    ImGuiTestAction_Unknown = 0
    ImGuiTestAction_Hover = 1
    ImGuiTestAction_Click = 2
    ImGuiTestAction_DoubleClick = 3
    ImGuiTestAction_Check = 4
    ImGuiTestAction_Uncheck = 5
    ImGuiTestAction_Open = 6
    ImGuiTestAction_Close = 7
    ImGuiTestAction_Input = 8
    ImGuiTestAction_NavActivate = 9
    ImGuiTestAction_COUNT = 10
end

@cenum ImGuiTestOpFlags_::UInt32 begin
    ImGuiTestOpFlags_None = 0
    ImGuiTestOpFlags_NoCheckHoveredId = 2
    ImGuiTestOpFlags_NoError = 4
    ImGuiTestOpFlags_NoFocusWindow = 8
    ImGuiTestOpFlags_NoAutoUncollapse = 16
    ImGuiTestOpFlags_NoAutoOpenFullPath = 32
    ImGuiTestOpFlags_NoYield = 64
    ImGuiTestOpFlags_IsSecondAttempt = 128
    ImGuiTestOpFlags_MoveToEdgeL = 256
    ImGuiTestOpFlags_MoveToEdgeR = 512
    ImGuiTestOpFlags_MoveToEdgeU = 1024
    ImGuiTestOpFlags_MoveToEdgeD = 2048
end

@cenum ImOsConsoleStream::UInt32 begin
    ImOsConsoleStream_StandardOutput = 0
    ImOsConsoleStream_StandardError = 1
end

@cenum ImOsConsoleTextColor::UInt32 begin
    ImOsConsoleTextColor_Black = 0
    ImOsConsoleTextColor_White = 1
    ImOsConsoleTextColor_BrightWhite = 2
    ImOsConsoleTextColor_BrightRed = 3
    ImOsConsoleTextColor_BrightGreen = 4
    ImOsConsoleTextColor_BrightBlue = 5
    ImOsConsoleTextColor_BrightYellow = 6
end

function cImGuiTestEngine_FindItemInfo(engine, id, debug_id)
    ccall((:cImGuiTestEngine_FindItemInfo, libcimgui), Ptr{ImGuiTestItemInfo}, (Ptr{ImGuiTestEngine}, Cuint, Ptr{Cchar}), engine, id, debug_id)
end

function cImGuiTestEngine_Yield(engine)
    ccall((:cImGuiTestEngine_Yield, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_SetDeltaTime(engine, delta_time)
    ccall((:cImGuiTestEngine_SetDeltaTime, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Cfloat), engine, delta_time)
end

function cImGuiTestEngine_GetFrameCount(engine)
    ccall((:cImGuiTestEngine_GetFrameCount, libcimgui), Cint, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_PassFilter(test, filter)
    ccall((:cImGuiTestEngine_PassFilter, libcimgui), Bool, (Ptr{ImGuiTest}, Ptr{Cchar}), test, filter)
end

function cImGuiTestEngine_RunTest(engine, ctx, test, run_flags)
    ccall((:cImGuiTestEngine_RunTest, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiTestContext}, Ptr{ImGuiTest}, Cint), engine, ctx, test, run_flags)
end

function cImGuiTestEngine_BindImGuiContext(engine, ui_ctx)
    ccall((:cImGuiTestEngine_BindImGuiContext, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiContext}), engine, ui_ctx)
end

function cImGuiTestEngine_UnbindImGuiContext(engine, ui_ctx)
    ccall((:cImGuiTestEngine_UnbindImGuiContext, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiContext}), engine, ui_ctx)
end

function cImGuiTestEngine_RebootUiContext(engine)
    ccall((:cImGuiTestEngine_RebootUiContext, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_GetPerfTool(engine)
    ccall((:cImGuiTestEngine_GetPerfTool, libcimgui), Ptr{ImGuiPerfTool}, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_UpdateTestsSourceLines(engine)
    ccall((:cImGuiTestEngine_UpdateTestsSourceLines, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_CaptureScreenshot(engine, args)
    ccall((:cImGuiTestEngine_CaptureScreenshot, libcimgui), Bool, (Ptr{ImGuiTestEngine}, Ptr{ImGuiCaptureArgs}), engine, args)
end

function cImGuiTestEngine_CaptureBeginVideo(engine, args)
    ccall((:cImGuiTestEngine_CaptureBeginVideo, libcimgui), Bool, (Ptr{ImGuiTestEngine}, Ptr{ImGuiCaptureArgs}), engine, args)
end

function cImGuiTestEngine_CaptureEndVideo(engine, args)
    ccall((:cImGuiTestEngine_CaptureEndVideo, libcimgui), Bool, (Ptr{ImGuiTestEngine}, Ptr{ImGuiCaptureArgs}), engine, args)
end

function cImGuiTestEngine_GetStatusName(v)
    ccall((:cImGuiTestEngine_GetStatusName, libcimgui), Ptr{Cchar}, (ImGuiTestStatus,), v)
end

function cImGuiTestEngine_GetRunSpeedName(v)
    ccall((:cImGuiTestEngine_GetRunSpeedName, libcimgui), Ptr{Cchar}, (ImGuiTestRunSpeed,), v)
end

function cImGuiTestEngine_GetVerboseLevelName(v)
    ccall((:cImGuiTestEngine_GetVerboseLevelName, libcimgui), Ptr{Cchar}, (ImGuiTestVerboseLevel,), v)
end

function cImHashDecoratedPath(str, str_end, seed)
    ccall((:cImHashDecoratedPath, libcimgui), ImGuiID, (Ptr{Cchar}, Ptr{Cchar}, Cuint), str, str_end, seed)
end

function cImFindNextDecoratedPartInPath(str, str_end)
    ccall((:cImFindNextDecoratedPartInPath, libcimgui), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}), str, str_end)
end

function cImFileExist(filename)
    ccall((:cImFileExist, libcimgui), Bool, (Ptr{Cchar},), filename)
end

function cImFileDelete(filename)
    ccall((:cImFileDelete, libcimgui), Bool, (Ptr{Cchar},), filename)
end

function cImFileCreateDirectoryChain(path, path_end)
    ccall((:cImFileCreateDirectoryChain, libcimgui), Bool, (Ptr{Cchar}, Ptr{Cchar}), path, path_end)
end

function cImFileFindInParents(sub_path, max_parent_count, output)
    ccall((:cImFileFindInParents, libcimgui), Bool, (Ptr{Cchar}, Cint, Ptr{Str}), sub_path, max_parent_count, output)
end

function cImFileLoadSourceBlurb(filename, line_no_start, line_no_end, out_buf)
    ccall((:cImFileLoadSourceBlurb, libcimgui), Bool, (Ptr{Cchar}, Cint, Cint, Ptr{ImGuiTextBuffer}), filename, line_no_start, line_no_end, out_buf)
end

function cImPathFindFilename(path, path_end)
    ccall((:cImPathFindFilename, libcimgui), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}), path, path_end)
end

function cImPathFindExtension(path, path_end)
    ccall((:cImPathFindExtension, libcimgui), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}), path, path_end)
end

function cImPathFixSeparatorsForCurrentOS(buf)
    ccall((:cImPathFixSeparatorsForCurrentOS, libcimgui), Cvoid, (Ptr{Cchar},), buf)
end

function cImStrReplace(s, find, repl)
    ccall((:cImStrReplace, libcimgui), Cvoid, (Ptr{Str}, Ptr{Cchar}, Ptr{Cchar}), s, find, repl)
end

function cImStrchrRangeWithEscaping(str, str_end, find_c)
    ccall((:cImStrchrRangeWithEscaping, libcimgui), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}, Cchar), str, str_end, find_c)
end

function cImStrXmlEscape(s)
    ccall((:cImStrXmlEscape, libcimgui), Cvoid, (Ptr{Str},), s)
end

function cImStrBase64Encode(src, dst, length)
    ccall((:cImStrBase64Encode, libcimgui), Cint, (Ptr{Cuchar}, Ptr{Cchar}, Cint), src, dst, length)
end

function cImParseExtractArgcArgvFromCommandLine(out_argc, out_argv, cmd_line)
    ccall((:cImParseExtractArgcArgvFromCommandLine, libcimgui), Cvoid, (Ptr{Cint}, Ptr{Ptr{Ptr{Cchar}}}, Ptr{Cchar}), out_argc, out_argv, cmd_line)
end

function cImParseFindIniSection(ini_config, header, result)
    ccall((:cImParseFindIniSection, libcimgui), Bool, (Ptr{Cchar}, Ptr{Cchar}, Ptr{ImVector_char}), ini_config, header, result)
end

# no prototype is found for this function at cimgui_te.h:839:24, please use with caution
function cImTimeGetInMicroseconds()
    ccall((:cImTimeGetInMicroseconds, libcimgui), UInt64, ())
end

function cImTimestampToISO8601(timestamp, out_date)
    ccall((:cImTimestampToISO8601, libcimgui), Cvoid, (Culong, Ptr{Str}), timestamp, out_date)
end

function cImThreadSleepInMilliseconds(ms)
    ccall((:cImThreadSleepInMilliseconds, libcimgui), Cvoid, (Cint,), ms)
end

function cImThreadSetCurrentThreadDescription(description)
    ccall((:cImThreadSetCurrentThreadDescription, libcimgui), Cvoid, (Ptr{Cchar},), description)
end

# no prototype is found for this function at cimgui_te.h:843:35, please use with caution
function cImBuildGetCompilationInfo()
    ccall((:cImBuildGetCompilationInfo, libcimgui), Ptr{ImBuildInfo}, ())
end

function cImBuildFindGitBranchName(git_repo_path, branch_name)
    ccall((:cImBuildFindGitBranchName, libcimgui), Bool, (Ptr{Cchar}, Ptr{Str}), git_repo_path, branch_name)
end

function cImOsCreateProcess(cmd_line)
    ccall((:cImOsCreateProcess, libcimgui), Bool, (Ptr{Cchar},), cmd_line)
end

function cImOsPOpen(cmd_line, mode)
    ccall((:cImOsPOpen, libcimgui), Ptr{Libc.FILE}, (Ptr{Cchar}, Ptr{Cchar}), cmd_line, mode)
end

function cImOsPClose(fp)
    ccall((:cImOsPClose, libcimgui), Cvoid, (Ptr{Libc.FILE},), fp)
end

function cImOsOpenInShell(path)
    ccall((:cImOsOpenInShell, libcimgui), Cvoid, (Ptr{Cchar},), path)
end

# no prototype is found for this function at cimgui_te.h:849:20, please use with caution
function cImOsIsDebuggerPresent()
    ccall((:cImOsIsDebuggerPresent, libcimgui), Bool, ())
end

function cImOsOutputDebugString(message)
    ccall((:cImOsOutputDebugString, libcimgui), Cvoid, (Ptr{Cchar},), message)
end

function cImOsConsoleSetTextColor(stream, color)
    ccall((:cImOsConsoleSetTextColor, libcimgui), Cvoid, (ImOsConsoleStream, ImOsConsoleTextColor), stream, color)
end

function cTableGetHeaderID_Str(table, column, instance_no)
    ccall((:cTableGetHeaderID_Str, libcimgui), ImGuiID, (Ptr{ImGuiTable}, Ptr{Cchar}, Cint), table, column, instance_no)
end

function cTableGetHeaderID_int(table, column_n, instance_no)
    ccall((:cTableGetHeaderID_int, libcimgui), ImGuiID, (Ptr{ImGuiTable}, Cint, Cint), table, column_n, instance_no)
end

function cTableDiscardInstanceAndSettings(table_id)
    ccall((:cTableDiscardInstanceAndSettings, libcimgui), Cvoid, (Cuint,), table_id)
end

function cDrawDataVerifyMatchingBufferCount(draw_data)
    ccall((:cDrawDataVerifyMatchingBufferCount, libcimgui), Cvoid, (Ptr{ImDrawData},), draw_data)
end

function cImGuiTestEngine_PrintResultSummary(engine)
    ccall((:cImGuiTestEngine_PrintResultSummary, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_Export(engine)
    ccall((:cImGuiTestEngine_Export, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_ExportEx(engine, format, filename)
    ccall((:cImGuiTestEngine_ExportEx, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, ImGuiTestEngineExportFormat, Ptr{Cchar}), engine, format, filename)
end

function cImGuiTestEngine_ShowTestEngineWindows(engine, p_open)
    ccall((:cImGuiTestEngine_ShowTestEngineWindows, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{Bool}), engine, p_open)
end

function cImGuiTestEngine_OpenSourceFile(engine, source_filename, source_line_no)
    ccall((:cImGuiTestEngine_OpenSourceFile, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{Cchar}, Cint), engine, source_filename, source_line_no)
end

function cImGuiTestEngineHook_ItemAdd(ui_ctx, id, bb, item_data)
    ccall((:cImGuiTestEngineHook_ItemAdd, libcimgui), Cvoid, (Ptr{ImGuiContext}, Cuint, Ptr{ImRect}, Ptr{ImGuiLastItemData}), ui_ctx, id, bb, item_data)
end

function cImGuiTestEngineHook_ItemInfo(ui_ctx, id, label, flags)
    ccall((:cImGuiTestEngineHook_ItemInfo, libcimgui), Cvoid, (Ptr{ImGuiContext}, Cuint, Ptr{Cchar}, Cint), ui_ctx, id, label, flags)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function cImGuiTestEngineHook_Log(ui_ctx, fmt, va_list...)
        :(@ccall(libcimgui.cImGuiTestEngineHook_Log(ui_ctx::Ptr{ImGuiContext}, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

function cImGuiTestEngine_FindItemDebugLabel(ui_ctx, id)
    ccall((:cImGuiTestEngine_FindItemDebugLabel, libcimgui), Ptr{Cchar}, (Ptr{ImGuiContext}, Cuint), ui_ctx, id)
end

function cImGuiTestEngine_Check(file, func, line, flags, result, expr)
    ccall((:cImGuiTestEngine_Check, libcimgui), Bool, (Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Bool, Ptr{Cchar}), file, func, line, flags, result, expr)
end

function cImGuiTestEngine_CheckStrOp(file, func, line, flags, op, lhs_var, lhs_value, rhs_var, rhs_value, out_result)
    ccall((:cImGuiTestEngine_CheckStrOp, libcimgui), Bool, (Ptr{Cchar}, Ptr{Cchar}, Cint, Cint, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Bool}), file, func, line, flags, op, lhs_var, lhs_value, rhs_var, rhs_value, out_result)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function cImGuiTestEngine_Error(file, func, line, flags, fmt, va_list...)
        :(@ccall(libcimgui.cImGuiTestEngine_Error(file::Ptr{Cchar}, func::Ptr{Cchar}, line::Cint, flags::Cint, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Bool))
    end

function cImGuiTestEngine_AssertLog(expr, file, _function, line)
    ccall((:cImGuiTestEngine_AssertLog, libcimgui), Cvoid, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), expr, file, _function, line)
end

# no prototype is found for this function at cimgui_te.h:875:33, please use with caution
function cImGuiTestEngine_GetTempStringBuilder()
    ccall((:cImGuiTestEngine_GetTempStringBuilder, libcimgui), Ptr{ImGuiTextBuffer}, ())
end

# no prototype is found for this function at cimgui_te.h:877:33, please use with caution
function cImGuiTestEngine_CreateContext()
    ccall((:cImGuiTestEngine_CreateContext, libcimgui), Ptr{ImGuiTestEngine}, ())
end

function cImGuiTestEngine_DestroyContext(engine)
    ccall((:cImGuiTestEngine_DestroyContext, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_Start(engine, ui_ctx)
    ccall((:cImGuiTestEngine_Start, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiContext}), engine, ui_ctx)
end

function cImGuiTestEngine_Stop(engine)
    ccall((:cImGuiTestEngine_Stop, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_PostSwap(engine)
    ccall((:cImGuiTestEngine_PostSwap, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_GetIO(engine)
    ccall((:cImGuiTestEngine_GetIO, libcimgui), Ptr{ImGuiTestEngineIO}, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_RegisterTest(engine, category, name, src_file, src_line)
    ccall((:cImGuiTestEngine_RegisterTest, libcimgui), Ptr{ImGuiTest}, (Ptr{ImGuiTestEngine}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), engine, category, name, src_file, src_line)
end

function cImGuiTestEngine_UnregisterTest(engine, test)
    ccall((:cImGuiTestEngine_UnregisterTest, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiTest}), engine, test)
end

function cImGuiTestEngine_UnregisterAllTests(engine)
    ccall((:cImGuiTestEngine_UnregisterAllTests, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_QueueTest(engine, test, run_flags)
    ccall((:cImGuiTestEngine_QueueTest, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiTest}, Cint), engine, test, run_flags)
end

function cImGuiTestEngine_QueueTests(engine, group, filter, run_flags)
    ccall((:cImGuiTestEngine_QueueTests, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, ImGuiTestGroup, Ptr{Cchar}, Cint), engine, group, filter, run_flags)
end

function cImGuiTestEngine_TryAbortEngine(engine)
    ccall((:cImGuiTestEngine_TryAbortEngine, libcimgui), Bool, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_AbortCurrentTest(engine)
    ccall((:cImGuiTestEngine_AbortCurrentTest, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_FindTestByName(engine, category, name)
    ccall((:cImGuiTestEngine_FindTestByName, libcimgui), Ptr{ImGuiTest}, (Ptr{ImGuiTestEngine}, Ptr{Cchar}, Ptr{Cchar}), engine, category, name)
end

function cImGuiTestEngine_IsTestQueueEmpty(engine)
    ccall((:cImGuiTestEngine_IsTestQueueEmpty, libcimgui), Bool, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_IsUsingSimulatedInputs(engine)
    ccall((:cImGuiTestEngine_IsUsingSimulatedInputs, libcimgui), Bool, (Ptr{ImGuiTestEngine},), engine)
end

function cImGuiTestEngine_GetResultSummary(engine, out_results)
    ccall((:cImGuiTestEngine_GetResultSummary, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImGuiTestEngineResultSummary}), engine, out_results)
end

function cImGuiTestEngine_GetTestList(engine, out_tests)
    ccall((:cImGuiTestEngine_GetTestList, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImVector_ImGuiTest_Ptr}), engine, out_tests)
end

function cImGuiTestEngine_GetTestQueue(engine, out_tests)
    ccall((:cImGuiTestEngine_GetTestQueue, libcimgui), Cvoid, (Ptr{ImGuiTestEngine}, Ptr{ImVector_ImGuiTestRunTask}), engine, out_tests)
end

# no prototype is found for this function at cimgui_te.h:902:20, please use with caution
function cImGuiTestEngine_InstallDefaultCrashHandler()
    ccall((:cImGuiTestEngine_InstallDefaultCrashHandler, libcimgui), Cvoid, ())
end

# no prototype is found for this function at cimgui_te.h:904:20, please use with caution
function cImGuiTestEngine_CrashHandler()
    ccall((:cImGuiTestEngine_CrashHandler, libcimgui), Cvoid, ())
end

function cImGuiTestEngine_PerfToolAppendToCSV(perf_log, entry, filename)
    ccall((:cImGuiTestEngine_PerfToolAppendToCSV, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Ptr{ImGuiPerfToolEntry}, Ptr{Cchar}), perf_log, entry, filename)
end

# no prototype is found for this function at cimgui_te.h:915:38, please use with caution
function ImGuiCaptureImageBuf_ImGuiCaptureImageBuf()
    ccall((:ImGuiCaptureImageBuf_ImGuiCaptureImageBuf, libcimgui), Ptr{ImGuiCaptureImageBuf}, ())
end

function ImGuiCaptureImageBuf_destroy(self)
    ccall((:ImGuiCaptureImageBuf_destroy, libcimgui), Cvoid, (Ptr{ImGuiCaptureImageBuf},), self)
end

function ImGuiCaptureImageBuf_Clear(self)
    ccall((:ImGuiCaptureImageBuf_Clear, libcimgui), Cvoid, (Ptr{ImGuiCaptureImageBuf},), self)
end

function ImGuiCaptureImageBuf_CreateEmpty(self, w, h)
    ccall((:ImGuiCaptureImageBuf_CreateEmpty, libcimgui), Cvoid, (Ptr{ImGuiCaptureImageBuf}, Cint, Cint), self, w, h)
end

function ImGuiCaptureImageBuf_SaveFile(self, filename)
    ccall((:ImGuiCaptureImageBuf_SaveFile, libcimgui), Bool, (Ptr{ImGuiCaptureImageBuf}, Ptr{Cchar}), self, filename)
end

function ImGuiCaptureImageBuf_RemoveAlpha(self)
    ccall((:ImGuiCaptureImageBuf_RemoveAlpha, libcimgui), Cvoid, (Ptr{ImGuiCaptureImageBuf},), self)
end

function ImGuiCaptureContext_ImGuiCaptureContext(capture_func)
    ccall((:ImGuiCaptureContext_ImGuiCaptureContext, libcimgui), Ptr{ImGuiCaptureContext}, (Ptr{ImGuiScreenCaptureFunc},), capture_func)
end

function ImGuiCaptureContext_PreNewFrame(self)
    ccall((:ImGuiCaptureContext_PreNewFrame, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_PreRender(self)
    ccall((:ImGuiCaptureContext_PreRender, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_PostRender(self)
    ccall((:ImGuiCaptureContext_PostRender, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_CaptureUpdate(self, args)
    ccall((:ImGuiCaptureContext_CaptureUpdate, libcimgui), ImGuiCaptureStatus, (Ptr{ImGuiCaptureContext}, Ptr{ImGuiCaptureArgs}), self, args)
end

function ImGuiCaptureContext_RestoreBackedUpData(self)
    ccall((:ImGuiCaptureContext_RestoreBackedUpData, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_ClearState(self)
    ccall((:ImGuiCaptureContext_ClearState, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_BeginVideoCapture(self, args)
    ccall((:ImGuiCaptureContext_BeginVideoCapture, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext}, Ptr{ImGuiCaptureArgs}), self, args)
end

function ImGuiCaptureContext_EndVideoCapture(self)
    ccall((:ImGuiCaptureContext_EndVideoCapture, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_IsCapturingVideo(self)
    ccall((:ImGuiCaptureContext_IsCapturingVideo, libcimgui), Bool, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_IsCapturing(self)
    ccall((:ImGuiCaptureContext_IsCapturing, libcimgui), Bool, (Ptr{ImGuiCaptureContext},), self)
end

function ImGuiCaptureContext_destroy(self)
    ccall((:ImGuiCaptureContext_destroy, libcimgui), Cvoid, (Ptr{ImGuiCaptureContext},), self)
end

# no prototype is found for this function at cimgui_te.h:942:36, please use with caution
function ImGuiCaptureToolUI_ImGuiCaptureToolUI()
    ccall((:ImGuiCaptureToolUI_ImGuiCaptureToolUI, libcimgui), Ptr{ImGuiCaptureToolUI}, ())
end

function ImGuiCaptureToolUI_ShowCaptureToolWindow(self, context, p_open)
    ccall((:ImGuiCaptureToolUI_ShowCaptureToolWindow, libcimgui), Cvoid, (Ptr{ImGuiCaptureToolUI}, Ptr{ImGuiCaptureContext}, Ptr{Bool}), self, context, p_open)
end

function ImGuiCaptureToolUI__CaptureWindowPicker(self, args)
    ccall((:ImGuiCaptureToolUI__CaptureWindowPicker, libcimgui), Cvoid, (Ptr{ImGuiCaptureToolUI}, Ptr{ImGuiCaptureArgs}), self, args)
end

function ImGuiCaptureToolUI__CaptureWindowsSelector(self, context, args)
    ccall((:ImGuiCaptureToolUI__CaptureWindowsSelector, libcimgui), Cvoid, (Ptr{ImGuiCaptureToolUI}, Ptr{ImGuiCaptureContext}, Ptr{ImGuiCaptureArgs}), self, context, args)
end

function ImGuiCaptureToolUI__SnapWindowsToGrid(self, cell_size)
    ccall((:ImGuiCaptureToolUI__SnapWindowsToGrid, libcimgui), Cvoid, (Ptr{ImGuiCaptureToolUI}, Cfloat), self, cell_size)
end

function ImGuiCaptureToolUI__InitializeOutputFile(self)
    ccall((:ImGuiCaptureToolUI__InitializeOutputFile, libcimgui), Bool, (Ptr{ImGuiCaptureToolUI},), self)
end

function ImGuiCaptureToolUI__ShowEncoderConfigFields(self, context)
    ccall((:ImGuiCaptureToolUI__ShowEncoderConfigFields, libcimgui), Bool, (Ptr{ImGuiCaptureToolUI}, Ptr{ImGuiCaptureContext}), self, context)
end

function ImGuiCaptureToolUI_destroy(self)
    ccall((:ImGuiCaptureToolUI_destroy, libcimgui), Cvoid, (Ptr{ImGuiCaptureToolUI},), self)
end

# no prototype is found for this function at cimgui_te.h:958:35, please use with caution
function ImGuiTestItemInfo_ImGuiTestItemInfo()
    ccall((:ImGuiTestItemInfo_ImGuiTestItemInfo, libcimgui), Ptr{ImGuiTestItemInfo}, ())
end

function ImGuiTestItemInfo_destroy(self)
    ccall((:ImGuiTestItemInfo_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestItemInfo},), self)
end

function ImGuiTestItemList_Clear(self)
    ccall((:ImGuiTestItemList_Clear, libcimgui), Cvoid, (Ptr{ImGuiTestItemList},), self)
end

function ImGuiTestItemList_Reserve(self, capacity)
    ccall((:ImGuiTestItemList_Reserve, libcimgui), Cvoid, (Ptr{ImGuiTestItemList}, Cint), self, capacity)
end

function ImGuiTestItemList_GetSize(self)
    ccall((:ImGuiTestItemList_GetSize, libcimgui), Cint, (Ptr{ImGuiTestItemList},), self)
end

function ImGuiTestItemList_GetByIndex(self, n)
    ccall((:ImGuiTestItemList_GetByIndex, libcimgui), Ptr{ImGuiTestItemInfo}, (Ptr{ImGuiTestItemList}, Cint), self, n)
end

function ImGuiTestItemList_GetByID(self, id)
    ccall((:ImGuiTestItemList_GetByID, libcimgui), Ptr{ImGuiTestItemInfo}, (Ptr{ImGuiTestItemList}, Cuint), self, id)
end

function ImGuiTestItemList_size(self)
    ccall((:ImGuiTestItemList_size, libcimgui), Csize_t, (Ptr{ImGuiTestItemList},), self)
end

function ImGuiTestItemList_begin(self)
    ccall((:ImGuiTestItemList_begin, libcimgui), Ptr{ImGuiTestItemInfo}, (Ptr{ImGuiTestItemList},), self)
end

function ImGuiTestItemList_end(self)
    ccall((:ImGuiTestItemList_end, libcimgui), Ptr{ImGuiTestItemInfo}, (Ptr{ImGuiTestItemList},), self)
end

# no prototype is found for this function at cimgui_te.h:973:30, please use with caution
function ImGuiTestLog_ImGuiTestLog()
    ccall((:ImGuiTestLog_ImGuiTestLog, libcimgui), Ptr{ImGuiTestLog}, ())
end

function ImGuiTestLog_IsEmpty(self)
    ccall((:ImGuiTestLog_IsEmpty, libcimgui), Bool, (Ptr{ImGuiTestLog},), self)
end

function ImGuiTestLog_Clear(self)
    ccall((:ImGuiTestLog_Clear, libcimgui), Cvoid, (Ptr{ImGuiTestLog},), self)
end

function ImGuiTestLog_ExtractLinesForVerboseLevels(self, level_min, level_max, out_buffer)
    ccall((:ImGuiTestLog_ExtractLinesForVerboseLevels, libcimgui), Cint, (Ptr{ImGuiTestLog}, ImGuiTestVerboseLevel, ImGuiTestVerboseLevel, Ptr{ImGuiTextBuffer}), self, level_min, level_max, out_buffer)
end

function ImGuiTestLog_UpdateLineOffsets(self, engine_io, level, start)
    ccall((:ImGuiTestLog_UpdateLineOffsets, libcimgui), Cvoid, (Ptr{ImGuiTestLog}, Ptr{ImGuiTestEngineIO}, ImGuiTestVerboseLevel, Ptr{Cchar}), self, engine_io, level, start)
end

function ImGuiTestLog_destroy(self)
    ccall((:ImGuiTestLog_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestLog},), self)
end

# no prototype is found for this function at cimgui_te.h:982:27, please use with caution
function ImGuiTest_ImGuiTest()
    ccall((:ImGuiTest_ImGuiTest, libcimgui), Ptr{ImGuiTest}, ())
end

function ImGuiTest_destroy(self)
    ccall((:ImGuiTest_destroy, libcimgui), Cvoid, (Ptr{ImGuiTest},), self)
end

function ImGuiTest_SetOwnedName(self, name)
    ccall((:ImGuiTest_SetOwnedName, libcimgui), Cvoid, (Ptr{ImGuiTest}, Ptr{Cchar}), self, name)
end

function ImGuiTestRef_ImGuiTestRef_TestRefPtr(pOut)
    ccall((:ImGuiTestRef_ImGuiTestRef_TestRefPtr, libcimgui), Cvoid, (Ptr{ImGuiTestRef},), pOut)
end

function ImGuiTestRef_ImGuiTestRef_TestRefPtrUint(pOut, id)
    ccall((:ImGuiTestRef_ImGuiTestRef_TestRefPtrUint, libcimgui), Cvoid, (Ptr{ImGuiTestRef}, Cuint), pOut, id)
end

function ImGuiTestRef_ImGuiTestRef_TestRefPtrStr(pOut, path)
    ccall((:ImGuiTestRef_ImGuiTestRef_TestRefPtrStr, libcimgui), Cvoid, (Ptr{ImGuiTestRef}, Ptr{Cchar}), pOut, path)
end

function ImGuiTestRef_IsEmpty(self)
    ccall((:ImGuiTestRef_IsEmpty, libcimgui), Bool, (Ptr{ImGuiTestRef},), self)
end

function ImGuiTestRef_destroy(self)
    ccall((:ImGuiTestRef_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestRef},), self)
end

function ImGuiTestRefDesc_c_str(self)
    ccall((:ImGuiTestRefDesc_c_str, libcimgui), Ptr{Cchar}, (Ptr{ImGuiTestRefDesc},), self)
end

function ImGuiTestRefDesc_ImGuiTestRefDesc_constTestRefPtr(pOut, ref)
    ccall((:ImGuiTestRefDesc_ImGuiTestRefDesc_constTestRefPtr, libcimgui), Cvoid, (Ptr{ImGuiTestRefDesc}, Ptr{ImGuiTestRef}), pOut, ref)
end

function ImGuiTestRefDesc_ImGuiTestRefDesc_constTestRefPtrconstTestItemInfoPtr(pOut, ref, item)
    ccall((:ImGuiTestRefDesc_ImGuiTestRefDesc_constTestRefPtrconstTestItemInfoPtr, libcimgui), Cvoid, (Ptr{ImGuiTestRefDesc}, Ptr{ImGuiTestRef}, Ptr{ImGuiTestItemInfo}), pOut, ref, item)
end

function ImGuiTestRefDesc_destroy(self)
    ccall((:ImGuiTestRefDesc_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestRefDesc},), self)
end

# no prototype is found for this function at cimgui_te.h:1002:39, please use with caution
function ImGuiTestActionFilter_ImGuiTestActionFilter()
    ccall((:ImGuiTestActionFilter_ImGuiTestActionFilter, libcimgui), Ptr{ImGuiTestActionFilter}, ())
end

function ImGuiTestActionFilter_destroy(self)
    ccall((:ImGuiTestActionFilter_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestActionFilter},), self)
end

# no prototype is found for this function at cimgui_te.h:1007:44, please use with caution
function ImGuiTestGenericItemStatus_ImGuiTestGenericItemStatus()
    ccall((:ImGuiTestGenericItemStatus_ImGuiTestGenericItemStatus, libcimgui), Ptr{ImGuiTestGenericItemStatus}, ())
end

function ImGuiTestGenericItemStatus_Clear(self)
    ccall((:ImGuiTestGenericItemStatus_Clear, libcimgui), Cvoid, (Ptr{ImGuiTestGenericItemStatus},), self)
end

function ImGuiTestGenericItemStatus_QuerySet(self, ret_val)
    ccall((:ImGuiTestGenericItemStatus_QuerySet, libcimgui), Cvoid, (Ptr{ImGuiTestGenericItemStatus}, Bool), self, ret_val)
end

function ImGuiTestGenericItemStatus_QueryInc(self, ret_val)
    ccall((:ImGuiTestGenericItemStatus_QueryInc, libcimgui), Cvoid, (Ptr{ImGuiTestGenericItemStatus}, Bool), self, ret_val)
end

function ImGuiTestGenericItemStatus_Draw(self)
    ccall((:ImGuiTestGenericItemStatus_Draw, libcimgui), Cvoid, (Ptr{ImGuiTestGenericItemStatus},), self)
end

function ImGuiTestGenericItemStatus_destroy(self)
    ccall((:ImGuiTestGenericItemStatus_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestGenericItemStatus},), self)
end

# no prototype is found for this function at cimgui_te.h:1016:38, please use with caution
function ImGuiTestGenericVars_ImGuiTestGenericVars()
    ccall((:ImGuiTestGenericVars_ImGuiTestGenericVars, libcimgui), Ptr{ImGuiTestGenericVars}, ())
end

function ImGuiTestGenericVars_Clear(self)
    ccall((:ImGuiTestGenericVars_Clear, libcimgui), Cvoid, (Ptr{ImGuiTestGenericVars},), self)
end

function ImGuiTestGenericVars_destroy(self)
    ccall((:ImGuiTestGenericVars_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestGenericVars},), self)
end

function ImGuiTestContext_Finish(self, status)
    ccall((:ImGuiTestContext_Finish, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestStatus), self, status)
end

function ImGuiTestContext_RunChildTest(self, test_name, flags)
    ccall((:ImGuiTestContext_RunChildTest, libcimgui), ImGuiTestStatus, (Ptr{ImGuiTestContext}, Ptr{Cchar}, Cint), self, test_name, flags)
end

function ImGuiTestContext_IsError(self)
    ccall((:ImGuiTestContext_IsError, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_IsWarmUpGuiFrame(self)
    ccall((:ImGuiTestContext_IsWarmUpGuiFrame, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_IsFirstGuiFrame(self)
    ccall((:ImGuiTestContext_IsFirstGuiFrame, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_IsFirstTestFrame(self)
    ccall((:ImGuiTestContext_IsFirstTestFrame, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_IsGuiFuncOnly(self)
    ccall((:ImGuiTestContext_IsGuiFuncOnly, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_SuspendTestFunc(self, file, line)
    ccall((:ImGuiTestContext_SuspendTestFunc, libcimgui), Bool, (Ptr{ImGuiTestContext}, Ptr{Cchar}, Cint), self, file, line)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function ImGuiTestContext_LogEx(self, level, flags, fmt, va_list...)
        :(@ccall(libcimgui.ImGuiTestContext_LogEx(self::Ptr{ImGuiTestContext}, level::ImGuiTestVerboseLevel, flags::Cint, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

function ImGuiTestContext_LogToTTY(self, level, message, message_end)
    ccall((:ImGuiTestContext_LogToTTY, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestVerboseLevel, Ptr{Cchar}, Ptr{Cchar}), self, level, message, message_end)
end

function ImGuiTestContext_LogToDebugger(self, level, message)
    ccall((:ImGuiTestContext_LogToDebugger, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestVerboseLevel, Ptr{Cchar}), self, level, message)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function ImGuiTestContext_LogDebug(self, fmt, va_list...)
        :(@ccall(libcimgui.ImGuiTestContext_LogDebug(self::Ptr{ImGuiTestContext}, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function ImGuiTestContext_LogInfo(self, fmt, va_list...)
        :(@ccall(libcimgui.ImGuiTestContext_LogInfo(self::Ptr{ImGuiTestContext}, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function ImGuiTestContext_LogWarning(self, fmt, va_list...)
        :(@ccall(libcimgui.ImGuiTestContext_LogWarning(self::Ptr{ImGuiTestContext}, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function ImGuiTestContext_LogError(self, fmt, va_list...)
        :(@ccall(libcimgui.ImGuiTestContext_LogError(self::Ptr{ImGuiTestContext}, fmt::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

function ImGuiTestContext_LogBasicUiState(self)
    ccall((:ImGuiTestContext_LogBasicUiState, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_LogItemList(self, list)
    ccall((:ImGuiTestContext_LogItemList, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiTestItemList}), self, list)
end

function ImGuiTestContext_Yield(self, count)
    ccall((:ImGuiTestContext_Yield, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, count)
end

function ImGuiTestContext_Sleep(self, time_in_second)
    ccall((:ImGuiTestContext_Sleep, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cfloat), self, time_in_second)
end

function ImGuiTestContext_SleepShort(self)
    ccall((:ImGuiTestContext_SleepShort, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_SleepStandard(self)
    ccall((:ImGuiTestContext_SleepStandard, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_SleepNoSkip(self, time_in_second, framestep_in_second)
    ccall((:ImGuiTestContext_SleepNoSkip, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cfloat, Cfloat), self, time_in_second, framestep_in_second)
end

function ImGuiTestContext_SetRef_TestRef(self, ref)
    ccall((:ImGuiTestContext_SetRef_TestRef, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_SetRef_WindowPtr(self, window)
    ccall((:ImGuiTestContext_SetRef_WindowPtr, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiWindow}), self, window)
end

function ImGuiTestContext_GetRef(pOut, self)
    ccall((:ImGuiTestContext_GetRef, libcimgui), Cvoid, (Ptr{ImGuiTestRef}, Ptr{ImGuiTestContext}), pOut, self)
end

function ImGuiTestContext_WindowInfo(pOut, self, window_ref, flags)
    ccall((:ImGuiTestContext_WindowInfo, libcimgui), Cvoid, (Ptr{ImGuiTestItemInfo}, Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), pOut, self, window_ref, flags)
end

function ImGuiTestContext_WindowClose(self, window_ref)
    ccall((:ImGuiTestContext_WindowClose, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, window_ref)
end

function ImGuiTestContext_WindowCollapse(self, window_ref, collapsed)
    ccall((:ImGuiTestContext_WindowCollapse, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Bool), self, window_ref, collapsed)
end

function ImGuiTestContext_WindowFocus(self, window_ref, flags)
    ccall((:ImGuiTestContext_WindowFocus, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, window_ref, flags)
end

function ImGuiTestContext_WindowBringToFront(self, window_ref, flags)
    ccall((:ImGuiTestContext_WindowBringToFront, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, window_ref, flags)
end

function ImGuiTestContext_WindowMove(self, window_ref, pos, pivot, flags)
    ccall((:ImGuiTestContext_WindowMove, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImVec2, ImVec2, Cint), self, window_ref, pos, pivot, flags)
end

function ImGuiTestContext_WindowResize(self, window_ref, sz)
    ccall((:ImGuiTestContext_WindowResize, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImVec2), self, window_ref, sz)
end

function ImGuiTestContext_WindowTeleportToMakePosVisible(self, window_ref, pos_in_window)
    ccall((:ImGuiTestContext_WindowTeleportToMakePosVisible, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImVec2), self, window_ref, pos_in_window)
end

function ImGuiTestContext_GetWindowByRef(self, window_ref)
    ccall((:ImGuiTestContext_GetWindowByRef, libcimgui), Ptr{ImGuiWindow}, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, window_ref)
end

function ImGuiTestContext_PopupCloseOne(self)
    ccall((:ImGuiTestContext_PopupCloseOne, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_PopupCloseAll(self)
    ccall((:ImGuiTestContext_PopupCloseAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_PopupGetWindowID(self, ref)
    ccall((:ImGuiTestContext_PopupGetWindowID, libcimgui), ImGuiID, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_GetID_TestRef(self, ref)
    ccall((:ImGuiTestContext_GetID_TestRef, libcimgui), ImGuiID, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_GetID_TestRefTestRef(self, ref, seed_ref)
    ccall((:ImGuiTestContext_GetID_TestRefTestRef, libcimgui), ImGuiID, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImGuiTestRef), self, ref, seed_ref)
end

function ImGuiTestContext_GetPosOnVoid(pOut, self, viewport)
    ccall((:ImGuiTestContext_GetPosOnVoid, libcimgui), Cvoid, (Ptr{ImVec2}, Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}), pOut, self, viewport)
end

function ImGuiTestContext_GetWindowTitlebarPoint(pOut, self, window_ref)
    ccall((:ImGuiTestContext_GetWindowTitlebarPoint, libcimgui), Cvoid, (Ptr{ImVec2}, Ptr{ImGuiTestContext}, ImGuiTestRef), pOut, self, window_ref)
end

function ImGuiTestContext_GetMainMonitorWorkPos(pOut, self)
    ccall((:ImGuiTestContext_GetMainMonitorWorkPos, libcimgui), Cvoid, (Ptr{ImVec2}, Ptr{ImGuiTestContext}), pOut, self)
end

function ImGuiTestContext_GetMainMonitorWorkSize(pOut, self)
    ccall((:ImGuiTestContext_GetMainMonitorWorkSize, libcimgui), Cvoid, (Ptr{ImVec2}, Ptr{ImGuiTestContext}), pOut, self)
end

function ImGuiTestContext_CaptureReset(self)
    ccall((:ImGuiTestContext_CaptureReset, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_CaptureSetExtension(self, ext)
    ccall((:ImGuiTestContext_CaptureSetExtension, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, ext)
end

function ImGuiTestContext_CaptureAddWindow(self, ref)
    ccall((:ImGuiTestContext_CaptureAddWindow, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_CaptureScreenshotWindow(self, ref, capture_flags)
    ccall((:ImGuiTestContext_CaptureScreenshotWindow, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, capture_flags)
end

function ImGuiTestContext_CaptureScreenshot(self, capture_flags)
    ccall((:ImGuiTestContext_CaptureScreenshot, libcimgui), Bool, (Ptr{ImGuiTestContext}, Cint), self, capture_flags)
end

function ImGuiTestContext_CaptureBeginVideo(self)
    ccall((:ImGuiTestContext_CaptureBeginVideo, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_CaptureEndVideo(self)
    ccall((:ImGuiTestContext_CaptureEndVideo, libcimgui), Bool, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_MouseMove(self, ref, flags)
    ccall((:ImGuiTestContext_MouseMove, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_MouseMoveToPos(self, pos)
    ccall((:ImGuiTestContext_MouseMoveToPos, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImVec2), self, pos)
end

function ImGuiTestContext_MouseTeleportToPos(self, pos, flags)
    ccall((:ImGuiTestContext_MouseTeleportToPos, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImVec2, Cint), self, pos, flags)
end

function ImGuiTestContext_MouseClick(self, button)
    ccall((:ImGuiTestContext_MouseClick, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, button)
end

function ImGuiTestContext_MouseClickMulti(self, button, count)
    ccall((:ImGuiTestContext_MouseClickMulti, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint, Cint), self, button, count)
end

function ImGuiTestContext_MouseDoubleClick(self, button)
    ccall((:ImGuiTestContext_MouseDoubleClick, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, button)
end

function ImGuiTestContext_MouseDown(self, button)
    ccall((:ImGuiTestContext_MouseDown, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, button)
end

function ImGuiTestContext_MouseUp(self, button)
    ccall((:ImGuiTestContext_MouseUp, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, button)
end

function ImGuiTestContext_MouseLiftDragThreshold(self, button)
    ccall((:ImGuiTestContext_MouseLiftDragThreshold, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, button)
end

function ImGuiTestContext_MouseDragWithDelta(self, delta, button)
    ccall((:ImGuiTestContext_MouseDragWithDelta, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImVec2, Cint), self, delta, button)
end

function ImGuiTestContext_MouseWheel(self, delta)
    ccall((:ImGuiTestContext_MouseWheel, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImVec2), self, delta)
end

function ImGuiTestContext_MouseWheelX(self, dx)
    ccall((:ImGuiTestContext_MouseWheelX, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cfloat), self, dx)
end

function ImGuiTestContext_MouseWheelY(self, dy)
    ccall((:ImGuiTestContext_MouseWheelY, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cfloat), self, dy)
end

function ImGuiTestContext_MouseMoveToVoid(self, viewport)
    ccall((:ImGuiTestContext_MouseMoveToVoid, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}), self, viewport)
end

function ImGuiTestContext_MouseClickOnVoid(self, button, viewport)
    ccall((:ImGuiTestContext_MouseClickOnVoid, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint, Ptr{ImGuiViewport}), self, button, viewport)
end

function ImGuiTestContext_FindHoveredWindowAtPos(self, pos)
    ccall((:ImGuiTestContext_FindHoveredWindowAtPos, libcimgui), Ptr{ImGuiWindow}, (Ptr{ImGuiTestContext}, Ptr{ImVec2}), self, pos)
end

function ImGuiTestContext_FindExistingVoidPosOnViewport(self, viewport, out)
    ccall((:ImGuiTestContext_FindExistingVoidPosOnViewport, libcimgui), Bool, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}, Ptr{ImVec2}), self, viewport, out)
end

function ImGuiTestContext_MouseSetViewport(self, window)
    ccall((:ImGuiTestContext_MouseSetViewport, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiWindow}), self, window)
end

function ImGuiTestContext_MouseSetViewportID(self, viewport_id)
    ccall((:ImGuiTestContext_MouseSetViewportID, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cuint), self, viewport_id)
end

function ImGuiTestContext_KeyDown(self, key_chord)
    ccall((:ImGuiTestContext_KeyDown, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, key_chord)
end

function ImGuiTestContext_KeyUp(self, key_chord)
    ccall((:ImGuiTestContext_KeyUp, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint), self, key_chord)
end

function ImGuiTestContext_KeyPress(self, key_chord, count)
    ccall((:ImGuiTestContext_KeyPress, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint, Cint), self, key_chord, count)
end

function ImGuiTestContext_KeyHold(self, key_chord, time)
    ccall((:ImGuiTestContext_KeyHold, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint, Cfloat), self, key_chord, time)
end

function ImGuiTestContext_KeySetEx(self, key_chord, is_down, time)
    ccall((:ImGuiTestContext_KeySetEx, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cint, Bool, Cfloat), self, key_chord, is_down, time)
end

function ImGuiTestContext_KeyChars(self, chars)
    ccall((:ImGuiTestContext_KeyChars, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, chars)
end

function ImGuiTestContext_KeyCharsAppend(self, chars)
    ccall((:ImGuiTestContext_KeyCharsAppend, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, chars)
end

function ImGuiTestContext_KeyCharsAppendEnter(self, chars)
    ccall((:ImGuiTestContext_KeyCharsAppendEnter, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, chars)
end

function ImGuiTestContext_KeyCharsReplace(self, chars)
    ccall((:ImGuiTestContext_KeyCharsReplace, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, chars)
end

function ImGuiTestContext_KeyCharsReplaceEnter(self, chars)
    ccall((:ImGuiTestContext_KeyCharsReplaceEnter, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, chars)
end

function ImGuiTestContext_SetInputMode(self, input_mode)
    ccall((:ImGuiTestContext_SetInputMode, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiInputSource), self, input_mode)
end

function ImGuiTestContext_NavMoveTo(self, ref)
    ccall((:ImGuiTestContext_NavMoveTo, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_NavActivate(self)
    ccall((:ImGuiTestContext_NavActivate, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_NavInput(self)
    ccall((:ImGuiTestContext_NavInput, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_ScrollTo(self, ref, axis, scroll_v, flags)
    ccall((:ImGuiTestContext_ScrollTo, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImGuiAxis, Cfloat, Cint), self, ref, axis, scroll_v, flags)
end

function ImGuiTestContext_ScrollToX(self, ref, scroll_x)
    ccall((:ImGuiTestContext_ScrollToX, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cfloat), self, ref, scroll_x)
end

function ImGuiTestContext_ScrollToY(self, ref, scroll_y)
    ccall((:ImGuiTestContext_ScrollToY, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cfloat), self, ref, scroll_y)
end

function ImGuiTestContext_ScrollToTop(self, ref)
    ccall((:ImGuiTestContext_ScrollToTop, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ScrollToBottom(self, ref)
    ccall((:ImGuiTestContext_ScrollToBottom, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ScrollToItem(self, ref, axis, flags)
    ccall((:ImGuiTestContext_ScrollToItem, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImGuiAxis, Cint), self, ref, axis, flags)
end

function ImGuiTestContext_ScrollToItemX(self, ref)
    ccall((:ImGuiTestContext_ScrollToItemX, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ScrollToItemY(self, ref)
    ccall((:ImGuiTestContext_ScrollToItemY, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ScrollToTabItem(self, tab_bar, tab_id)
    ccall((:ImGuiTestContext_ScrollToTabItem, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiTabBar}, Cuint), self, tab_bar, tab_id)
end

function ImGuiTestContext_ScrollErrorCheck(self, axis, expected, actual, remaining_attempts)
    ccall((:ImGuiTestContext_ScrollErrorCheck, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiAxis, Cfloat, Cfloat, Ptr{Cint}), self, axis, expected, actual, remaining_attempts)
end

function ImGuiTestContext_ScrollVerifyScrollMax(self, ref)
    ccall((:ImGuiTestContext_ScrollVerifyScrollMax, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemInfo(pOut, self, ref, flags)
    ccall((:ImGuiTestContext_ItemInfo, libcimgui), Cvoid, (Ptr{ImGuiTestItemInfo}, Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), pOut, self, ref, flags)
end

function ImGuiTestContext_ItemInfoOpenFullPath(pOut, self, ref, flags)
    ccall((:ImGuiTestContext_ItemInfoOpenFullPath, libcimgui), Cvoid, (Ptr{ImGuiTestItemInfo}, Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), pOut, self, ref, flags)
end

function ImGuiTestContext_ItemInfoHandleWildcardSearch(self, wildcard_prefix_start, wildcard_prefix_end, wildcard_suffix_start)
    ccall((:ImGuiTestContext_ItemInfoHandleWildcardSearch, libcimgui), ImGuiID, (Ptr{ImGuiTestContext}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), self, wildcard_prefix_start, wildcard_prefix_end, wildcard_suffix_start)
end

function ImGuiTestContext_ItemInfoNull(pOut, self)
    ccall((:ImGuiTestContext_ItemInfoNull, libcimgui), Cvoid, (Ptr{ImGuiTestItemInfo}, Ptr{ImGuiTestContext}), pOut, self)
end

function ImGuiTestContext_GatherItems(self, out_list, parent, depth)
    ccall((:ImGuiTestContext_GatherItems, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiTestItemList}, ImGuiTestRef, Cint), self, out_list, parent, depth)
end

function ImGuiTestContext_ItemAction(self, action, ref, flags, action_arg)
    ccall((:ImGuiTestContext_ItemAction, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestAction, ImGuiTestRef, Cint, Ptr{Cvoid}), self, action, ref, flags, action_arg)
end

function ImGuiTestContext_ItemClick(self, ref, button, flags)
    ccall((:ImGuiTestContext_ItemClick, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint, Cint), self, ref, button, flags)
end

function ImGuiTestContext_ItemDoubleClick(self, ref, flags)
    ccall((:ImGuiTestContext_ItemDoubleClick, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemCheck(self, ref, flags)
    ccall((:ImGuiTestContext_ItemCheck, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemUncheck(self, ref, flags)
    ccall((:ImGuiTestContext_ItemUncheck, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemOpen(self, ref, flags)
    ccall((:ImGuiTestContext_ItemOpen, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemClose(self, ref, flags)
    ccall((:ImGuiTestContext_ItemClose, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemInput(self, ref, flags)
    ccall((:ImGuiTestContext_ItemInput, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemNavActivate(self, ref, flags)
    ccall((:ImGuiTestContext_ItemNavActivate, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, flags)
end

function ImGuiTestContext_ItemActionAll(self, action, ref_parent, filter)
    ccall((:ImGuiTestContext_ItemActionAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestAction, ImGuiTestRef, Ptr{ImGuiTestActionFilter}), self, action, ref_parent, filter)
end

function ImGuiTestContext_ItemOpenAll(self, ref_parent, depth, passes)
    ccall((:ImGuiTestContext_ItemOpenAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint, Cint), self, ref_parent, depth, passes)
end

function ImGuiTestContext_ItemCloseAll(self, ref_parent, depth, passes)
    ccall((:ImGuiTestContext_ItemCloseAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint, Cint), self, ref_parent, depth, passes)
end

function ImGuiTestContext_ItemInputValue_int(self, ref, v)
    ccall((:ImGuiTestContext_ItemInputValue_int, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, v)
end

function ImGuiTestContext_ItemInputValue_float(self, ref, f)
    ccall((:ImGuiTestContext_ItemInputValue_float, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cfloat), self, ref, f)
end

function ImGuiTestContext_ItemInputValue_Str(self, ref, str)
    ccall((:ImGuiTestContext_ItemInputValue_Str, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Ptr{Cchar}), self, ref, str)
end

function ImGuiTestContext_ItemReadAsInt(self, ref)
    ccall((:ImGuiTestContext_ItemReadAsInt, libcimgui), Cint, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemReadAsFloat(self, ref)
    ccall((:ImGuiTestContext_ItemReadAsFloat, libcimgui), Cfloat, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemReadAsScalar(self, ref, data_type, out_data, flags)
    ccall((:ImGuiTestContext_ItemReadAsScalar, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint, Ptr{Cvoid}, Cint), self, ref, data_type, out_data, flags)
end

function ImGuiTestContext_ItemReadAsString_TestRef(self, ref)
    ccall((:ImGuiTestContext_ItemReadAsString_TestRef, libcimgui), Ptr{Cchar}, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemReadAsString_TestRefStr(self, ref, out_buf, out_buf_size)
    ccall((:ImGuiTestContext_ItemReadAsString_TestRefStr, libcimgui), Csize_t, (Ptr{ImGuiTestContext}, ImGuiTestRef, Ptr{Cchar}, Culong), self, ref, out_buf, out_buf_size)
end

function ImGuiTestContext_ItemExists(self, ref)
    ccall((:ImGuiTestContext_ItemExists, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemIsChecked(self, ref)
    ccall((:ImGuiTestContext_ItemIsChecked, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemIsOpened(self, ref)
    ccall((:ImGuiTestContext_ItemIsOpened, libcimgui), Bool, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ItemVerifyCheckedIfAlive(self, ref, checked)
    ccall((:ImGuiTestContext_ItemVerifyCheckedIfAlive, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Bool), self, ref, checked)
end

function ImGuiTestContext_ItemHold(self, ref, time)
    ccall((:ImGuiTestContext_ItemHold, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cfloat), self, ref, time)
end

function ImGuiTestContext_ItemHoldForFrames(self, ref, frames)
    ccall((:ImGuiTestContext_ItemHoldForFrames, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, frames)
end

function ImGuiTestContext_ItemDragOverAndHold(self, ref_src, ref_dst)
    ccall((:ImGuiTestContext_ItemDragOverAndHold, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImGuiTestRef), self, ref_src, ref_dst)
end

function ImGuiTestContext_ItemDragAndDrop(self, ref_src, ref_dst, button)
    ccall((:ImGuiTestContext_ItemDragAndDrop, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImGuiTestRef, Cint), self, ref_src, ref_dst, button)
end

function ImGuiTestContext_ItemDragWithDelta(self, ref_src, pos_delta)
    ccall((:ImGuiTestContext_ItemDragWithDelta, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImVec2), self, ref_src, pos_delta)
end

function ImGuiTestContext_TabClose(self, ref)
    ccall((:ImGuiTestContext_TabClose, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_TabBarCompareOrder(self, tab_bar, tab_order)
    ccall((:ImGuiTestContext_TabBarCompareOrder, libcimgui), Bool, (Ptr{ImGuiTestContext}, Ptr{ImGuiTabBar}, Ptr{Ptr{Cchar}}), self, tab_bar, tab_order)
end

function ImGuiTestContext_MenuAction(self, action, ref)
    ccall((:ImGuiTestContext_MenuAction, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestAction, ImGuiTestRef), self, action, ref)
end

function ImGuiTestContext_MenuActionAll(self, action, ref_parent)
    ccall((:ImGuiTestContext_MenuActionAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestAction, ImGuiTestRef), self, action, ref_parent)
end

function ImGuiTestContext_MenuClick(self, ref)
    ccall((:ImGuiTestContext_MenuClick, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_MenuCheck(self, ref)
    ccall((:ImGuiTestContext_MenuCheck, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_MenuUncheck(self, ref)
    ccall((:ImGuiTestContext_MenuUncheck, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_MenuCheckAll(self, ref_parent)
    ccall((:ImGuiTestContext_MenuCheckAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref_parent)
end

function ImGuiTestContext_MenuUncheckAll(self, ref_parent)
    ccall((:ImGuiTestContext_MenuUncheckAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref_parent)
end

function ImGuiTestContext_ComboClick(self, ref)
    ccall((:ImGuiTestContext_ComboClick, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ComboClickAll(self, ref)
    ccall((:ImGuiTestContext_ComboClickAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_TableOpenContextMenu(self, ref, column_n)
    ccall((:ImGuiTestContext_TableOpenContextMenu, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint), self, ref, column_n)
end

function ImGuiTestContext_TableClickHeader(self, ref, label, key_mods)
    ccall((:ImGuiTestContext_TableClickHeader, libcimgui), ImGuiSortDirection, (Ptr{ImGuiTestContext}, ImGuiTestRef, Ptr{Cchar}, Cint), self, ref, label, key_mods)
end

function ImGuiTestContext_TableSetColumnEnabled(self, ref, label, enabled)
    ccall((:ImGuiTestContext_TableSetColumnEnabled, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Ptr{Cchar}, Bool), self, ref, label, enabled)
end

function ImGuiTestContext_TableResizeColumn(self, ref, column_n, width)
    ccall((:ImGuiTestContext_TableResizeColumn, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, Cint, Cfloat), self, ref, column_n, width)
end

function ImGuiTestContext_TableGetSortSpecs(self, ref)
    ccall((:ImGuiTestContext_TableGetSortSpecs, libcimgui), Ptr{ImGuiTableSortSpecs}, (Ptr{ImGuiTestContext}, ImGuiTestRef), self, ref)
end

function ImGuiTestContext_ViewportPlatform_SetWindowPos(self, viewport, pos)
    ccall((:ImGuiTestContext_ViewportPlatform_SetWindowPos, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}, Ptr{ImVec2}), self, viewport, pos)
end

function ImGuiTestContext_ViewportPlatform_SetWindowSize(self, viewport, size)
    ccall((:ImGuiTestContext_ViewportPlatform_SetWindowSize, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}, Ptr{ImVec2}), self, viewport, size)
end

function ImGuiTestContext_ViewportPlatform_SetWindowFocus(self, viewport)
    ccall((:ImGuiTestContext_ViewportPlatform_SetWindowFocus, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}), self, viewport)
end

function ImGuiTestContext_ViewportPlatform_CloseWindow(self, viewport)
    ccall((:ImGuiTestContext_ViewportPlatform_CloseWindow, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}), self, viewport)
end

# automatic type deduction for variadic arguments may not be what you want, please use with caution
@generated function ImGuiTestContext_DockClear(self, window_name, va_list...)
        :(@ccall(libcimgui.ImGuiTestContext_DockClear(self::Ptr{ImGuiTestContext}, window_name::Ptr{Cchar}; $(to_c_type_pairs(va_list)...))::Cvoid))
    end

function ImGuiTestContext_DockInto(self, src_id, dst_id, split_dir, is_outer_docking, flags)
    ccall((:ImGuiTestContext_DockInto, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, ImGuiTestRef, ImGuiTestRef, ImGuiDir, Bool, Cint), self, src_id, dst_id, split_dir, is_outer_docking, flags)
end

function ImGuiTestContext_UndockNode(self, dock_id)
    ccall((:ImGuiTestContext_UndockNode, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Cuint), self, dock_id)
end

function ImGuiTestContext_UndockWindow(self, window_name)
    ccall((:ImGuiTestContext_UndockWindow, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}), self, window_name)
end

function ImGuiTestContext_WindowIsUndockedOrStandalone(self, window)
    ccall((:ImGuiTestContext_WindowIsUndockedOrStandalone, libcimgui), Bool, (Ptr{ImGuiTestContext}, Ptr{ImGuiWindow}), self, window)
end

function ImGuiTestContext_DockIdIsUndockedOrStandalone(self, dock_id)
    ccall((:ImGuiTestContext_DockIdIsUndockedOrStandalone, libcimgui), Bool, (Ptr{ImGuiTestContext}, Cuint), self, dock_id)
end

function ImGuiTestContext_DockNodeHideTabBar(self, node, hidden)
    ccall((:ImGuiTestContext_DockNodeHideTabBar, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiDockNode}, Bool), self, node, hidden)
end

function ImGuiTestContext_PerfCalcRef(self)
    ccall((:ImGuiTestContext_PerfCalcRef, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiTestContext_PerfCapture(self, category, test_name, csv_file)
    ccall((:ImGuiTestContext_PerfCapture, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), self, category, test_name, csv_file)
end

function ImGuiTestContext__MakeAimingSpaceOverPos(self, viewport, over_window, over_pos)
    ccall((:ImGuiTestContext__MakeAimingSpaceOverPos, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImGuiViewport}, Ptr{ImGuiWindow}, Ptr{ImVec2}), self, viewport, over_window, over_pos)
end

function ImGuiTestContext__ForeignWindowsHideOverPos(self, pos, ignore_list)
    ccall((:ImGuiTestContext__ForeignWindowsHideOverPos, libcimgui), Cvoid, (Ptr{ImGuiTestContext}, Ptr{ImVec2}, Ptr{Ptr{ImGuiWindow}}), self, pos, ignore_list)
end

function ImGuiTestContext__ForeignWindowsUnhideAll(self)
    ccall((:ImGuiTestContext__ForeignWindowsUnhideAll, libcimgui), Cvoid, (Ptr{ImGuiTestContext},), self)
end

function ImGuiCsvParser_ImGuiCsvParser(columns)
    ccall((:ImGuiCsvParser_ImGuiCsvParser, libcimgui), Ptr{ImGuiCsvParser}, (Cint,), columns)
end

function ImGuiCsvParser_destroy(self)
    ccall((:ImGuiCsvParser_destroy, libcimgui), Cvoid, (Ptr{ImGuiCsvParser},), self)
end

function ImGuiCsvParser_Load(self, file_name)
    ccall((:ImGuiCsvParser_Load, libcimgui), Bool, (Ptr{ImGuiCsvParser}, Ptr{Cchar}), self, file_name)
end

function ImGuiCsvParser_Clear(self)
    ccall((:ImGuiCsvParser_Clear, libcimgui), Cvoid, (Ptr{ImGuiCsvParser},), self)
end

function ImGuiCsvParser_GetCell(self, row, col)
    ccall((:ImGuiCsvParser_GetCell, libcimgui), Ptr{Cchar}, (Ptr{ImGuiCsvParser}, Cint, Cint), self, row, col)
end

function ImGuiTestGatherTask_Clear(self)
    ccall((:ImGuiTestGatherTask_Clear, libcimgui), Cvoid, (Ptr{ImGuiTestGatherTask},), self)
end

function ImGuiTestInput_ForKeyChord(pOut, self, key_chord, down)
    ccall((:ImGuiTestInput_ForKeyChord, libcimgui), Cvoid, (Ptr{ImGuiTestInput}, Ptr{ImGuiTestInput}, Cint, Bool), pOut, self, key_chord, down)
end

function ImGuiTestInput_ForChar(pOut, self, v)
    ccall((:ImGuiTestInput_ForChar, libcimgui), Cvoid, (Ptr{ImGuiTestInput}, Ptr{ImGuiTestInput}, Cushort), pOut, self, v)
end

function ImGuiTestInput_ForViewportFocus(pOut, self, viewport_id)
    ccall((:ImGuiTestInput_ForViewportFocus, libcimgui), Cvoid, (Ptr{ImGuiTestInput}, Ptr{ImGuiTestInput}, Cuint), pOut, self, viewport_id)
end

function ImGuiTestInput_ForViewportSetPos(pOut, self, viewport_id, pos)
    ccall((:ImGuiTestInput_ForViewportSetPos, libcimgui), Cvoid, (Ptr{ImGuiTestInput}, Ptr{ImGuiTestInput}, Cuint, Ptr{ImVec2}), pOut, self, viewport_id, pos)
end

function ImGuiTestInput_ForViewportSetSize(pOut, self, viewport_id, size)
    ccall((:ImGuiTestInput_ForViewportSetSize, libcimgui), Cvoid, (Ptr{ImGuiTestInput}, Ptr{ImGuiTestInput}, Cuint, Ptr{ImVec2}), pOut, self, viewport_id, size)
end

function ImGuiTestInput_ForViewportClose(pOut, self, viewport_id)
    ccall((:ImGuiTestInput_ForViewportClose, libcimgui), Cvoid, (Ptr{ImGuiTestInput}, Ptr{ImGuiTestInput}, Cuint), pOut, self, viewport_id)
end

# no prototype is found for this function at cimgui_te.h:1238:33, please use with caution
function ImGuiTestEngine_ImGuiTestEngine()
    ccall((:ImGuiTestEngine_ImGuiTestEngine, libcimgui), Ptr{ImGuiTestEngine}, ())
end

function ImGuiTestEngine_destroy(self)
    ccall((:ImGuiTestEngine_destroy, libcimgui), Cvoid, (Ptr{ImGuiTestEngine},), self)
end

# no prototype is found for this function at cimgui_te.h:1242:36, please use with caution
function ImGuiPerfToolEntry_ImGuiPerfToolEntry()
    ccall((:ImGuiPerfToolEntry_ImGuiPerfToolEntry, libcimgui), Ptr{ImGuiPerfToolEntry}, ())
end

function ImGuiPerfToolEntry_ImGuiPerfToolEntry_constPerfToolEntryPtr(rhs)
    ccall((:ImGuiPerfToolEntry_ImGuiPerfToolEntry_constPerfToolEntryPtr, libcimgui), Ptr{ImGuiPerfToolEntry}, (Ptr{ImGuiPerfToolEntry},), rhs)
end

function ImGuiPerfToolEntry_Set(self, rhs)
    ccall((:ImGuiPerfToolEntry_Set, libcimgui), Cvoid, (Ptr{ImGuiPerfToolEntry}, Ptr{ImGuiPerfToolEntry}), self, rhs)
end

function ImGuiPerfToolEntry_destroy(self)
    ccall((:ImGuiPerfToolEntry_destroy, libcimgui), Cvoid, (Ptr{ImGuiPerfToolEntry},), self)
end

function ImGuiPerfToolBatch_destroy(self)
    ccall((:ImGuiPerfToolBatch_destroy, libcimgui), Cvoid, (Ptr{ImGuiPerfToolBatch},), self)
end

# no prototype is found for this function at cimgui_te.h:1253:31, please use with caution
function ImGuiPerfTool_ImGuiPerfTool()
    ccall((:ImGuiPerfTool_ImGuiPerfTool, libcimgui), Ptr{ImGuiPerfTool}, ())
end

function ImGuiPerfTool_destroy(self)
    ccall((:ImGuiPerfTool_destroy, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool_Clear(self)
    ccall((:ImGuiPerfTool_Clear, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool_LoadCSV(self, filename)
    ccall((:ImGuiPerfTool_LoadCSV, libcimgui), Bool, (Ptr{ImGuiPerfTool}, Ptr{Cchar}), self, filename)
end

function ImGuiPerfTool_AddEntry(self, entry)
    ccall((:ImGuiPerfTool_AddEntry, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Ptr{ImGuiPerfToolEntry}), self, entry)
end

function ImGuiPerfTool_ShowPerfToolWindow(self, engine, p_open)
    ccall((:ImGuiPerfTool_ShowPerfToolWindow, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Ptr{ImGuiTestEngine}, Ptr{Bool}), self, engine, p_open)
end

function ImGuiPerfTool_ViewOnly_Str(self, perf_name)
    ccall((:ImGuiPerfTool_ViewOnly_Str, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Ptr{Cchar}), self, perf_name)
end

function ImGuiPerfTool_ViewOnly_StrPtr(self, perf_names)
    ccall((:ImGuiPerfTool_ViewOnly_StrPtr, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Ptr{Ptr{Cchar}}), self, perf_names)
end

function ImGuiPerfTool_GetEntryByBatchIdx(self, idx, perf_name)
    ccall((:ImGuiPerfTool_GetEntryByBatchIdx, libcimgui), Ptr{ImGuiPerfToolEntry}, (Ptr{ImGuiPerfTool}, Cint, Ptr{Cchar}), self, idx, perf_name)
end

function ImGuiPerfTool_SaveHtmlReport(self, file_name, image_file)
    ccall((:ImGuiPerfTool_SaveHtmlReport, libcimgui), Bool, (Ptr{ImGuiPerfTool}, Ptr{Cchar}, Ptr{Cchar}), self, file_name, image_file)
end

function ImGuiPerfTool_Empty(self)
    ccall((:ImGuiPerfTool_Empty, libcimgui), Bool, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool__Rebuild(self)
    ccall((:ImGuiPerfTool__Rebuild, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool__IsVisibleBuild_PerfToolBatchPtr(self, batch)
    ccall((:ImGuiPerfTool__IsVisibleBuild_PerfToolBatchPtr, libcimgui), Bool, (Ptr{ImGuiPerfTool}, Ptr{ImGuiPerfToolBatch}), self, batch)
end

function ImGuiPerfTool__IsVisibleBuild_PerfToolEntryPtr(self, batch)
    ccall((:ImGuiPerfTool__IsVisibleBuild_PerfToolEntryPtr, libcimgui), Bool, (Ptr{ImGuiPerfTool}, Ptr{ImGuiPerfToolEntry}), self, batch)
end

function ImGuiPerfTool__IsVisibleTest(self, test_name)
    ccall((:ImGuiPerfTool__IsVisibleTest, libcimgui), Bool, (Ptr{ImGuiPerfTool}, Ptr{Cchar}), self, test_name)
end

function ImGuiPerfTool__CalculateLegendAlignment(self)
    ccall((:ImGuiPerfTool__CalculateLegendAlignment, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool__ShowEntriesPlot(self)
    ccall((:ImGuiPerfTool__ShowEntriesPlot, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool__ShowEntriesTable(self)
    ccall((:ImGuiPerfTool__ShowEntriesTable, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool__SetBaseline(self, batch_index)
    ccall((:ImGuiPerfTool__SetBaseline, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Cint), self, batch_index)
end

function ImGuiPerfTool__AddSettingsHandler(self)
    ccall((:ImGuiPerfTool__AddSettingsHandler, libcimgui), Cvoid, (Ptr{ImGuiPerfTool},), self)
end

function ImGuiPerfTool__UnpackSortedKey(self, key, batch_index, entry_index, monotonic_index)
    ccall((:ImGuiPerfTool__UnpackSortedKey, libcimgui), Cvoid, (Ptr{ImGuiPerfTool}, Culonglong, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), self, key, batch_index, entry_index, monotonic_index)
end

end # module

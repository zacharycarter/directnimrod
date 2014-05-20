# Forward Declarations 


# interface __MIDL_itf_dxgi_0000_0000 
# [local] 
import windows, dxgitype, dxgiformat
export dxgitype
export dxgiformat
type IID = TIID
type GUID = TGUID
type IUnknown = object

const DXGI_CPU_ACCESS_NONE*  = ( 0 )
const DXGI_CPU_ACCESS_DYNAMIC*  = ( 1 )
const DXGI_CPU_ACCESS_READ_WRITE*  = ( 2 )
const DXGI_CPU_ACCESS_SCRATCH*  = ( 3 )
const DXGI_CPU_ACCESS_FIELD*  = 15
const DXGI_USAGE_SHADER_INPUT*  = ( 1 shl (0 + 4) )
const DXGI_USAGE_RENDER_TARGET_OUTPUT*  = ( 1 shl (1 + 4) )
const DXGI_USAGE_BACK_BUFFER*  = ( 1 shl (2 + 4) )
const DXGI_USAGE_SHARED*  = ( 1 shl (3 + 4) )
const DXGI_USAGE_READ_ONLY*  = ( 1 shl (4 + 4) )
const DXGI_USAGE_DISCARD_ON_PRESENT*  = ( 1 shl (5 + 4) )
const DXGI_USAGE_UNORDERED_ACCESS*  = ( 1 shl (6 + 4) )


const DXGI_RESOURCE_PRIORITY_MINIMUM*  = ( 0x28000000 )
const DXGI_RESOURCE_PRIORITY_LOW*  = ( 0x50000000 )
const DXGI_RESOURCE_PRIORITY_NORMAL*  = ( 0x78000000 )
const DXGI_RESOURCE_PRIORITY_HIGH*  = ( 0xa0000000 )
const DXGI_RESOURCE_PRIORITY_MAXIMUM*  = ( 0xc8000000 )

type

  DXGI_USAGE* = UINT
  DXGI_FRAME_STATISTICS* = object 
    PresentCount*: UINT
    PresentRefreshCount*: UINT
    SyncRefreshCount*: UINT
    SyncQPCTime*: LARGE_INTEGER
    SyncGPUTime*: LARGE_INTEGER

  DXGI_MAPPED_RECT* = object 
    Pitch*: INT
    pBits*: ptr BYTE

  DXGI_ADAPTER_DESC* = object 
    Description*: array[128, WCHAR]
    VendorId*: UINT
    DeviceId*: UINT
    SubSysId*: UINT
    Revision*: UINT
    DedicatedVideoMemory*: SIZE_T
    DedicatedSystemMemory*: SIZE_T
    SharedSystemMemory*: SIZE_T
    AdapterLuid*: LUID

  DXGI_OUTPUT_DESC* = object 
    DeviceName*: array[32, WCHAR]
    DesktopCoordinates*: RECT
    AttachedToDesktop*: BOOL
    Rotation*: DXGI_MODE_ROTATION
    Monitor*: HMONITOR

  DXGI_SHARED_RESOURCE* = object 
    Handle*: HANDLE

  DXGI_RESIDENCY* {.size: sizeof(cint).} = enum 
    DXGI_RESIDENCY_FULLY_RESIDENT = 1, 
    DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY = 2, 
    DXGI_RESIDENCY_EVICTED_TO_DISK = 3
  DXGI_SURFACE_DESC* = object 
    Width*: UINT
    Height*: UINT
    Format*: DXGI_FORMAT
    SampleDesc*: DXGI_SAMPLE_DESC

  DXGI_SWAP_EFFECT* {.size: sizeof(cint).} = enum 
    DXGI_SWAP_EFFECT_DISCARD = 0, DXGI_SWAP_EFFECT_SEQUENTIAL = 1, 
    DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL = 3
  DXGI_SWAP_CHAIN_FLAG* {.size: sizeof(cint).} = enum 
    DXGI_SWAP_CHAIN_FLAG_NONPREROTATED = 1, 
    DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH = 2, 
    DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE = 4, 
    DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT = 8, 
    DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER = 16, 
    DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY = 32, 
    DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT = 64, 
    DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER = 128, 
    DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO = 256, 
    DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO = 512
  DXGI_SWAP_CHAIN_DESC* = object 
    BufferDesc*: DXGI_MODE_DESC
    SampleDesc*: DXGI_SAMPLE_DESC
    BufferUsage*: DXGI_USAGE
    BufferCount*: UINT
    OutputWindow*: HWND
    Windowed*: BOOL
    SwapEffect*: DXGI_SWAP_EFFECT
    Flags*: UINT


#var __MIDL_itf_dxgi_0000_0000_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0000_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGIObject 
# [unique][local][uuid][object] 

var IID_IDXGIObject* {.importc.}: IID

# interface IDXGIDeviceSubObject 
# [unique][local][uuid][object] 

var IID_IDXGIDeviceSubObject* {.importc.}: IID

# interface IDXGIResource 
# [unique][local][uuid][object] 

var IID_IDXGIResource* {.importc.}: IID

# interface IDXGIKeyedMutex 
# [unique][local][uuid][object] 

var IID_IDXGIKeyedMutex* {.importc.}: IID

# interface __MIDL_itf_dxgi_0000_0004 
# [local] 

const DXGI_MAP_READ: culong = 1
const DXGI_MAP_WRITE: culong = 2
const DXGI_MAP_DISCARD: culong = 4

#var __MIDL_itf_dxgi_0000_0004_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0004_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGISurface 
# [unique][local][uuid][object] 

var IID_IDXGISurface* {.importc.}: IID

# interface IDXGISurface1 
# [unique][local][uuid][object] 

var IID_IDXGISurface1* {.importc.}: IID

# interface __MIDL_itf_dxgi_0000_0006 
# [local] 

#var __MIDL_itf_dxgi_0000_0006_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0006_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGIAdapter 
# [unique][local][uuid][object] 

var IID_IDXGIAdapter* {.importc.}: IID

# interface __MIDL_itf_dxgi_0000_0007 
# [local] 

const DXGI_ENUM_MODES_INTERLACED: culong = 1
const DXGI_ENUM_MODES_SCALING: culong = 2

#var __MIDL_itf_dxgi_0000_0007_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0007_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGIOutput 
# [unique][local][uuid][object] 

var IID_IDXGIOutput* {.importc.}: IID

# interface __MIDL_itf_dxgi_0000_0008 
# [local] 

const DXGI_MAX_SWAP_CHAIN_BUFFERS = ( 16 )
const DXGI_PRESENT_TEST : culong = 0x00000001
const DXGI_PRESENT_DO_NOT_SEQUENCE : culong = 0x00000002
const DXGI_PRESENT_RESTART : culong = 0x00000004
const DXGI_PRESENT_DO_NOT_WAIT : culong = 0x00000008
const DXGI_PRESENT_STEREO_PREFER_RIGHT : culong = 0x00000010
const DXGI_PRESENT_STEREO_TEMPORARY_MONO : culong = 0x00000020
const DXGI_PRESENT_RESTRICT_TO_OUTPUT : culong = 0x00000040
const DXGI_PRESENT_USE_DURATION : culong = 0x00000100

#var __MIDL_itf_dxgi_0000_0008_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0008_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGISwapChain 
# [unique][local][uuid][object] 

var IID_IDXGISwapChain* {.importc.}: IID


# interface __MIDL_itf_dxgi_0000_0009 
# [local] 

const DXGI_MWA_NO_WINDOW_CHANGES = ( 1 shl 0 )
const DXGI_MWA_NO_ALT_ENTER = ( 1 shl 1 )
const DXGI_MWA_NO_PRINT_SCREEN = ( 1 shl 2 )
const DXGI_MWA_VALID = ( 0x7 )

#var __MIDL_itf_dxgi_0000_0009_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0009_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGIFactory 
# [unique][local][uuid][object] 

var IID_IDXGIFactory* {.importc.}: IID

# interface __MIDL_itf_dxgi_0000_0010 
# [local] 

proc CreateDXGIFactory*(riid: ptr IID; ppFactory: ptr pointer): HRESULT {.
    stdcall, importc, dynlib:"dxgi.dll".}
proc CreateDXGIFactory1*(riid: ptr IID; ppFactory: ptr pointer): HRESULT {.
    stdcall, importc, dynlib:"dxgi.dll".}
#var __MIDL_itf_dxgi_0000_0010_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0010_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGIDevice 
# [unique][local][uuid][object] 

var IID_IDXGIDevice* {.importc.}: IID

# interface __MIDL_itf_dxgi_0000_0011 
# [local] 

type 
  DXGI_ADAPTER_FLAG* {.size: sizeof(cint).} = enum 
    DXGI_ADAPTER_FLAG_NONE = 0, DXGI_ADAPTER_FLAG_REMOTE = 1, 
    DXGI_ADAPTER_FLAG_SOFTWARE = 2, DXGI_ADAPTER_FLAG_FORCE_DWORD = 0xFFFFFFFF
  DXGI_ADAPTER_DESC1* = object 
    Description*: array[128, WCHAR]
    VendorId*: UINT
    DeviceId*: UINT
    SubSysId*: UINT
    Revision*: UINT
    DedicatedVideoMemory*: SIZE_T
    DedicatedSystemMemory*: SIZE_T
    SharedSystemMemory*: SIZE_T
    AdapterLuid*: LUID
    Flags*: UINT

  DXGI_DISPLAY_COLOR_SPACE* = object 
    PrimaryCoordinates*: array[2, array[8, FLOAT]]
    WhitePoints*: array[2, array[16, FLOAT]]


#var __MIDL_itf_dxgi_0000_0011_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE

#var __MIDL_itf_dxgi_0000_0011_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE

# interface IDXGIFactory1 
# [unique][local][uuid][object] 

var IID_IDXGIFactory1* {.importc.}: IID

# interface IDXGIAdapter1 
# [unique][local][uuid][object] 

var IID_IDXGIAdapter1* {.importc.}: IID


# interface IDXGIDevice1 
# [unique][local][uuid][object] 

var IID_IDXGIDevice1* {.importc.}: IID


type 
  IDXGIObjectVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIObject; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIObject): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIObject): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIObject; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIObject; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIObject; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIObject; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
  
  IDXGIObject* = object 
    lpVtbl*: ptr IDXGIObjectVtbl



  IDXGIDeviceSubObjectVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDeviceSubObject; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIDeviceSubObject): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDeviceSubObject): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIDeviceSubObject; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIDeviceSubObject; 
                                    Name: ptr GUID; pUnknown: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIDeviceSubObject; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIDeviceSubObject; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGIDeviceSubObject; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
  
  IDXGIDeviceSubObject* = object 
    lpVtbl*: ptr IDXGIDeviceSubObjectVtbl


 
  IDXGIResourceVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIResource; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIResource): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIResource): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIResource; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIResource; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIResource; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIResource; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGIResource; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetSharedHandle*: proc (This: ptr IDXGIResource; pSharedHandle: ptr HANDLE): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetUsage*: proc (This: ptr IDXGIResource; pUsage: ptr DXGI_USAGE): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetEvictionPriority*: proc (This: ptr IDXGIResource; EvictionPriority: UINT): HRESULT {.
        stdcall.}             # [in] 
    GetEvictionPriority*: proc (This: ptr IDXGIResource; 
                                pEvictionPriority: ptr UINT): HRESULT {.stdcall.} # 
                                                                                  # [annotation][retval][out] 
  
  IDXGIResource* = object 
    lpVtbl*: ptr IDXGIResourceVtbl


 
  IDXGIKeyedMutexVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIKeyedMutex; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIKeyedMutex): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIKeyedMutex): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIKeyedMutex; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIKeyedMutex; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIKeyedMutex; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIKeyedMutex; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGIKeyedMutex; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    AcquireSync*: proc (This: ptr IDXGIKeyedMutex; Key: UINT64; 
                        dwMilliseconds: DWORD): HRESULT {.stdcall.} # [in] 
                                                                    # [in] 
    ReleaseSync*: proc (This: ptr IDXGIKeyedMutex; Key: UINT64): HRESULT {.
        stdcall.}             # [in] 
  
  IDXGIKeyedMutex* = object 
    lpVtbl*: ptr IDXGIKeyedMutexVtbl



 
  IDXGISurfaceVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISurface; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGISurface): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISurface): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISurface; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGISurface; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGISurface; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGISurface; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGISurface; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDesc*: proc (This: ptr IDXGISurface; pDesc: ptr DXGI_SURFACE_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    Map*: proc (This: ptr IDXGISurface; pLockedRect: ptr DXGI_MAPPED_RECT; 
                MapFlags: UINT): HRESULT {.stdcall.} # [annotation][out] 
                                                     # [in] 
    Unmap*: proc (This: ptr IDXGISurface): HRESULT {.stdcall.}

  IDXGISurface* = object 
    lpVtbl*: ptr IDXGISurfaceVtbl


 
  IDXGISurface1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISurface1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGISurface1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISurface1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISurface1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGISurface1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGISurface1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGISurface1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGISurface1; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDesc*: proc (This: ptr IDXGISurface1; pDesc: ptr DXGI_SURFACE_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    Map*: proc (This: ptr IDXGISurface1; pLockedRect: ptr DXGI_MAPPED_RECT; 
                MapFlags: UINT): HRESULT {.stdcall.} # [annotation][out] 
                                                     # [in] 
    Unmap*: proc (This: ptr IDXGISurface1): HRESULT {.stdcall.}
    GetDC*: proc (This: ptr IDXGISurface1; `Discard`: BOOL; phdc: ptr HDC): HRESULT {.
        stdcall.}             # [in] 
                              # [annotation][out] 
    ReleaseDC*: proc (This: ptr IDXGISurface1; pDirtyRect: ptr RECT): HRESULT {.
        stdcall.}             # [annotation][in] 
  
  IDXGISurface1* = object 
    lpVtbl*: ptr IDXGISurface1Vtbl


 
  IDXGIAdapterVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIAdapter; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIAdapter): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIAdapter): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIAdapter; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIAdapter; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIAdapter; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIAdapter; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumOutputs*: proc (This: ptr IDXGIAdapter; Output: UINT; 
                        ppOutput: ptr ptr IDXGIOutput): HRESULT {.stdcall.} # [in] 
                                                                            # 
                                                                            # [annotation][out][in] 
    GetDesc*: proc (This: ptr IDXGIAdapter; pDesc: ptr DXGI_ADAPTER_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    CheckInterfaceSupport*: proc (This: ptr IDXGIAdapter; 
                                  InterfaceName: ptr GUID; 
                                  pUMDVersion: ptr LARGE_INTEGER): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
  
  IDXGIAdapter* = object 
    lpVtbl*: ptr IDXGIAdapterVtbl

 
  IDXGIOutputVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIOutput; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIOutput): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIOutput): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIOutput; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIOutput; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIOutput; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIOutput; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDesc*: proc (This: ptr IDXGIOutput; pDesc: ptr DXGI_OUTPUT_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList*: proc (This: ptr IDXGIOutput; EnumFormat: DXGI_FORMAT; 
                               Flags: UINT; pNumModes: ptr UINT; 
                               pDesc: ptr DXGI_MODE_DESC): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out][in] 
                                                                               # 
                                                                               # [annotation][out] 
    FindClosestMatchingMode*: proc (This: ptr IDXGIOutput; 
                                    pModeToMatch: ptr DXGI_MODE_DESC; 
                                    pClosestMatch: ptr DXGI_MODE_DESC; 
                                    pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    WaitForVBlank*: proc (This: ptr IDXGIOutput): HRESULT {.stdcall.}
    TakeOwnership*: proc (This: ptr IDXGIOutput; pDevice: ptr IUnknown; 
                          Exclusive: BOOL): HRESULT {.stdcall.} # [annotation][in] 
    ReleaseOwnership*: proc (This: ptr IDXGIOutput) {.stdcall.}
    GetGammaControlCapabilities*: proc (This: ptr IDXGIOutput; pGammaCaps: ptr DXGI_GAMMA_CONTROL_CAPABILITIES): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetGammaControl*: proc (This: ptr IDXGIOutput; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
    GetGammaControl*: proc (This: ptr IDXGIOutput; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][out] 
    SetDisplaySurface*: proc (This: ptr IDXGIOutput; 
                              pScanoutSurface: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetDisplaySurfaceData*: proc (This: ptr IDXGIOutput; 
                                  pDestination: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetFrameStatistics*: proc (This: ptr IDXGIOutput; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
  
  IDXGIOutput* = object 
    lpVtbl*: ptr IDXGIOutputVtbl

 
  IDXGISwapChainVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISwapChain; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGISwapChain): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISwapChain): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISwapChain; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGISwapChain; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGISwapChain; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGISwapChain; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGISwapChain; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    Present*: proc (This: ptr IDXGISwapChain; SyncInterval: UINT; Flags: UINT): HRESULT {.
        stdcall.}             # [in] 
                              # [in] 
    GetBuffer*: proc (This: ptr IDXGISwapChain; Buffer: UINT; riid: ptr IID; 
                      ppSurface: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                   # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out][in] 
    SetFullscreenState*: proc (This: ptr IDXGISwapChain; Fullscreen: BOOL; 
                               pTarget: ptr IDXGIOutput): HRESULT {.stdcall.} # 
                                                                              # [in] 
                                                                              # 
                                                                              # [annotation][in] 
    GetFullscreenState*: proc (This: ptr IDXGISwapChain; pFullscreen: ptr BOOL; 
                               ppTarget: ptr ptr IDXGIOutput): HRESULT {.stdcall.} # 
                                                                                   # [annotation][out] 
                                                                                   # 
                                                                                   # [annotation][out] 
    GetDesc*: proc (This: ptr IDXGISwapChain; pDesc: ptr DXGI_SWAP_CHAIN_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    ResizeBuffers*: proc (This: ptr IDXGISwapChain; BufferCount: UINT; 
                          Width: UINT; Height: UINT; NewFormat: DXGI_FORMAT; 
                          SwapChainFlags: UINT): HRESULT {.stdcall.} # [in] 
                                                                     # [in] 
                                                                     # [in] 
                                                                     # [in] 
                                                                     # [in] 
    ResizeTarget*: proc (This: ptr IDXGISwapChain; 
                         pNewTargetParameters: ptr DXGI_MODE_DESC): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetContainingOutput*: proc (This: ptr IDXGISwapChain; 
                                ppOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetFrameStatistics*: proc (This: ptr IDXGISwapChain; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetLastPresentCount*: proc (This: ptr IDXGISwapChain; 
                                pLastPresentCount: ptr UINT): HRESULT {.stdcall.} # 
                                                                                  # [annotation][out] 
  
  IDXGISwapChain* = object 
    lpVtbl*: ptr IDXGISwapChainVtbl

 
  IDXGIFactoryVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIFactory; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIFactory): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIFactory): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIFactory; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIFactory; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIFactory; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIFactory; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumAdapters*: proc (This: ptr IDXGIFactory; Adapter: UINT; 
                         ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out] 
    MakeWindowAssociation*: proc (This: ptr IDXGIFactory; WindowHandle: HWND; 
                                  Flags: UINT): HRESULT {.stdcall.}
    GetWindowAssociation*: proc (This: ptr IDXGIFactory; pWindowHandle: ptr HWND): HRESULT {.
        stdcall.}             # [annotation][out] 
    CreateSwapChain*: proc (This: ptr IDXGIFactory; pDevice: ptr IUnknown; 
                            pDesc: ptr DXGI_SWAP_CHAIN_DESC; 
                            ppSwapChain: ptr ptr IDXGISwapChain): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    CreateSoftwareAdapter*: proc (This: ptr IDXGIFactory; Module: HMODULE; 
                                  ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [in] 
                              # [annotation][out] 
  
  IDXGIFactory* = object 
    lpVtbl*: ptr IDXGIFactoryVtbl


 
  IDXGIDeviceVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDevice; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIDevice): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDevice): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIDevice; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIDevice; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIDevice; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIDevice; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetAdapter*: proc (This: ptr IDXGIDevice; pAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [annotation][out] 
    CreateSurface*: proc (This: ptr IDXGIDevice; pDesc: ptr DXGI_SURFACE_DESC; 
                          NumSurfaces: UINT; Usage: DXGI_USAGE; 
                          pSharedResource: ptr DXGI_SHARED_RESOURCE; 
                          ppSurface: ptr ptr IDXGISurface): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [annotation][out] 
    QueryResourceResidency*: proc (This: ptr IDXGIDevice; 
                                   ppResources: ptr ptr IUnknown; 
                                   pResidencyStatus: ptr DXGI_RESIDENCY; 
                                   NumResources: UINT): HRESULT {.stdcall.} # 
                                                                            # [annotation][size_is][in] 
                                                                            # 
                                                                            # [annotation][size_is][out] 
                                                                            # [in] 
    SetGPUThreadPriority*: proc (This: ptr IDXGIDevice; Priority: INT): HRESULT {.
        stdcall.}             # [in] 
    GetGPUThreadPriority*: proc (This: ptr IDXGIDevice; pPriority: ptr INT): HRESULT {.
        stdcall.}             # [annotation][retval][out] 
  
  IDXGIDevice* = object 
    lpVtbl*: ptr IDXGIDeviceVtbl


 
  IDXGIFactory1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIFactory1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIFactory1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIFactory1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIFactory1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIFactory1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIFactory1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIFactory1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumAdapters*: proc (This: ptr IDXGIFactory1; Adapter: UINT; 
                         ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out] 
    MakeWindowAssociation*: proc (This: ptr IDXGIFactory1; WindowHandle: HWND; 
                                  Flags: UINT): HRESULT {.stdcall.}
    GetWindowAssociation*: proc (This: ptr IDXGIFactory1; 
                                 pWindowHandle: ptr HWND): HRESULT {.stdcall.} # 
                                                                               # [annotation][out] 
    CreateSwapChain*: proc (This: ptr IDXGIFactory1; pDevice: ptr IUnknown; 
                            pDesc: ptr DXGI_SWAP_CHAIN_DESC; 
                            ppSwapChain: ptr ptr IDXGISwapChain): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    CreateSoftwareAdapter*: proc (This: ptr IDXGIFactory1; Module: HMODULE; 
                                  ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [in] 
                              # [annotation][out] 
    EnumAdapters1*: proc (This: ptr IDXGIFactory1; Adapter: UINT; 
                          ppAdapter: ptr ptr IDXGIAdapter1): HRESULT {.stdcall.} # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    IsCurrent*: proc (This: ptr IDXGIFactory1): BOOL {.stdcall.}

  IDXGIFactory1* = object 
    lpVtbl*: ptr IDXGIFactory1Vtbl

 
  IDXGIAdapter1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIAdapter1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIAdapter1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIAdapter1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIAdapter1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIAdapter1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIAdapter1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIAdapter1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumOutputs*: proc (This: ptr IDXGIAdapter1; Output: UINT; 
                        ppOutput: ptr ptr IDXGIOutput): HRESULT {.stdcall.} # [in] 
                                                                            # 
                                                                            # [annotation][out][in] 
    GetDesc*: proc (This: ptr IDXGIAdapter1; pDesc: ptr DXGI_ADAPTER_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    CheckInterfaceSupport*: proc (This: ptr IDXGIAdapter1; 
                                  InterfaceName: ptr GUID; 
                                  pUMDVersion: ptr LARGE_INTEGER): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    GetDesc1*: proc (This: ptr IDXGIAdapter1; pDesc: ptr DXGI_ADAPTER_DESC1): HRESULT {.
        stdcall.}             # [annotation][out] 
  
  IDXGIAdapter1* = object 
    lpVtbl*: ptr IDXGIAdapter1Vtbl

 
  IDXGIDevice1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDevice1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIDevice1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDevice1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIDevice1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIDevice1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIDevice1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIDevice1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetAdapter*: proc (This: ptr IDXGIDevice1; pAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [annotation][out] 
    CreateSurface*: proc (This: ptr IDXGIDevice1; pDesc: ptr DXGI_SURFACE_DESC; 
                          NumSurfaces: UINT; Usage: DXGI_USAGE; 
                          pSharedResource: ptr DXGI_SHARED_RESOURCE; 
                          ppSurface: ptr ptr IDXGISurface): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [annotation][out] 
    QueryResourceResidency*: proc (This: ptr IDXGIDevice1; 
                                   ppResources: ptr ptr IUnknown; 
                                   pResidencyStatus: ptr DXGI_RESIDENCY; 
                                   NumResources: UINT): HRESULT {.stdcall.} # 
                                                                            # [annotation][size_is][in] 
                                                                            # 
                                                                            # [annotation][size_is][out] 
                                                                            # [in] 
    SetGPUThreadPriority*: proc (This: ptr IDXGIDevice1; Priority: INT): HRESULT {.
        stdcall.}             # [in] 
    GetGPUThreadPriority*: proc (This: ptr IDXGIDevice1; pPriority: ptr INT): HRESULT {.
        stdcall.}             # [annotation][retval][out] 
    SetMaximumFrameLatency*: proc (This: ptr IDXGIDevice1; MaxLatency: UINT): HRESULT {.
        stdcall.}             # [in] 
    GetMaximumFrameLatency*: proc (This: ptr IDXGIDevice1; pMaxLatency: ptr UINT): HRESULT {.
        stdcall.}             # [annotation][out] 
  
  IDXGIDevice1* = object 
    lpVtbl*: ptr IDXGIDevice1Vtbl


# interface __MIDL_itf_dxgi_0000_0014 
# [local] 
#var __MIDL_itf_dxgi_0000_0014_v0_0_c_ifspec* {.importc.}: RPC_IF_HANDLE
#var __MIDL_itf_dxgi_0000_0014_v0_0_s_ifspec* {.importc.}: RPC_IF_HANDLE
# Additional Prototypes for ALL interfaces
# end of Additional Prototypes 

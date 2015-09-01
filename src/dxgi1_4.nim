#directX wrappers by Charles Barto
#this file was generated from the version of dxgi1_4.h shipped with windows 10
{.link: "dxguid.lib"}
{.link: "dxgi.lib"}
import windows, dxgi, dxgi1_2, dxgi1_3, Unknwn
type IID = TIID
type GUID = TGUID
type UINT = uint32
type INT = int32
type FLOAT = float32
type BYTE = TBYTE
type BOOL = WINBOOL
type UINT8 = uint8
type UINT64 = uint64

# Forward Declarations 


# interface __MIDL_itf_dxgi1_4_0000_0000 
# [local] 

type 
  DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG* {.size: sizeof(cint).} = enum 
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 0x00000001, 
    DXGI_SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG_OVERLAY_PRESENT = 0x00000002


# interface IDXGISwapChain3 
# [unique][local][uuid][object] 

type 
  IDXGISwapChain3Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISwapChain3; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGISwapChain3): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISwapChain3): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISwapChain3; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGISwapChain3; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGISwapChain3; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGISwapChain3; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGISwapChain3; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    Present*: proc (This: ptr IDXGISwapChain3; SyncInterval: UINT; Flags: UINT): HRESULT {.
        stdcall.}             # [in] 
                              # [in] 
    GetBuffer*: proc (This: ptr IDXGISwapChain3; Buffer: UINT; riid: ptr IID; 
                      ppSurface: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                   # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out][in] 
    SetFullscreenState*: proc (This: ptr IDXGISwapChain3; Fullscreen: BOOL; 
                               pTarget: ptr IDXGIOutput): HRESULT {.stdcall.} # 
                                                                              # [in] 
                                                                              # 
                                                                              # [annotation][in] 
    GetFullscreenState*: proc (This: ptr IDXGISwapChain3; pFullscreen: ptr BOOL; 
                               ppTarget: ptr ptr IDXGIOutput): HRESULT {.stdcall.} # 
                                                                                   # [annotation][out] 
                                                                                   # 
                                                                                   # [annotation][out] 
    GetDesc*: proc (This: ptr IDXGISwapChain3; pDesc: ptr DXGI_SWAP_CHAIN_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    ResizeBuffers*: proc (This: ptr IDXGISwapChain3; BufferCount: UINT; 
                          Width: UINT; Height: UINT; NewFormat: DXGI_FORMAT; 
                          SwapChainFlags: UINT): HRESULT {.stdcall.} # [in] 
                                                                     # [in] 
                                                                     # [in] 
                                                                     # [in] 
                                                                     # [in] 
    ResizeTarget*: proc (This: ptr IDXGISwapChain3; 
                         pNewTargetParameters: ptr DXGI_MODE_DESC): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetContainingOutput*: proc (This: ptr IDXGISwapChain3; 
                                ppOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetFrameStatistics*: proc (This: ptr IDXGISwapChain3; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetLastPresentCount*: proc (This: ptr IDXGISwapChain3; 
                                pLastPresentCount: ptr UINT): HRESULT {.stdcall.} # 
                                                                                  # [annotation][out] 
    GetDesc1*: proc (This: ptr IDXGISwapChain3; pDesc: ptr DXGI_SWAP_CHAIN_DESC1): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetFullscreenDesc*: proc (This: ptr IDXGISwapChain3; 
                              pDesc: ptr DXGI_SWAP_CHAIN_FULLSCREEN_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetHwnd*: proc (This: ptr IDXGISwapChain3; pHwnd: ptr HWND): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetCoreWindow*: proc (This: ptr IDXGISwapChain3; refiid: ptr IID; 
                          ppUnk: ptr pointer): HRESULT {.stdcall.} # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out] 
    Present1*: proc (This: ptr IDXGISwapChain3; SyncInterval: UINT; 
                     PresentFlags: UINT; 
                     pPresentParameters: ptr DXGI_PRESENT_PARAMETERS): HRESULT {.
        stdcall.}             # [in] 
                              # [in] 
                              # [annotation][in] 
    IsTemporaryMonoSupported*: proc (This: ptr IDXGISwapChain3): BOOL {.stdcall.}
    GetRestrictToOutput*: proc (This: ptr IDXGISwapChain3; 
                                ppRestrictToOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetBackgroundColor*: proc (This: ptr IDXGISwapChain3; pColor: ptr DXGI_RGBA): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetBackgroundColor*: proc (This: ptr IDXGISwapChain3; pColor: ptr DXGI_RGBA): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetRotation*: proc (This: ptr IDXGISwapChain3; Rotation: DXGI_MODE_ROTATION): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetRotation*: proc (This: ptr IDXGISwapChain3; 
                        pRotation: ptr DXGI_MODE_ROTATION): HRESULT {.stdcall.} # 
                                                                                # [annotation][out] 
    SetSourceSize*: proc (This: ptr IDXGISwapChain3; Width: UINT; Height: UINT): HRESULT {.
        stdcall.}
    GetSourceSize*: proc (This: ptr IDXGISwapChain3; pWidth: ptr UINT; 
                          pHeight: ptr UINT): HRESULT {.stdcall.} # 
                                                                  # [annotation][out] 
                                                                  # 
                                                                  # [annotation][out] 
    SetMaximumFrameLatency*: proc (This: ptr IDXGISwapChain3; MaxLatency: UINT): HRESULT {.
        stdcall.}
    GetMaximumFrameLatency*: proc (This: ptr IDXGISwapChain3; 
                                   pMaxLatency: ptr UINT): HRESULT {.stdcall.} # 
                                                                               # [annotation][out] 
    GetFrameLatencyWaitableObject*: proc (This: ptr IDXGISwapChain3): HANDLE {.
        stdcall.}
    SetMatrixTransform*: proc (This: ptr IDXGISwapChain3; 
                               pMatrix: ptr DXGI_MATRIX_3X2_F): HRESULT {.
        stdcall.}
    GetMatrixTransform*: proc (This: ptr IDXGISwapChain3; 
                               pMatrix: ptr DXGI_MATRIX_3X2_F): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetCurrentBackBufferIndex*: proc (This: ptr IDXGISwapChain3): UINT {.stdcall.}
    CheckColorSpaceSupport*: proc (This: ptr IDXGISwapChain3; 
                                   ColorSpace: DXGI_COLOR_SPACE_TYPE; 
                                   pColorSpaceSupport: ptr UINT): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    SetColorSpace1*: proc (This: ptr IDXGISwapChain3; 
                           ColorSpace: DXGI_COLOR_SPACE_TYPE): HRESULT {.stdcall.} # 
                                                                                   # [annotation][in] 
    ResizeBuffers1*: proc (This: ptr IDXGISwapChain3; BufferCount: UINT; 
                           Width: UINT; Height: UINT; Format: DXGI_FORMAT; 
                           SwapChainFlags: UINT; pCreationNodeMask: ptr UINT; 
                           ppPresentQueue: ptr ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
  
  IDXGISwapChain3* = object 
    lpVtbl*: ptr IDXGISwapChain3Vtbl


# interface __MIDL_itf_dxgi1_4_0000_0001 
# [local] 

type 
  DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG* {.size: sizeof(cint).} = enum 
    DXGI_OVERLAY_COLOR_SPACE_SUPPORT_FLAG_PRESENT = 0x00000001


# interface IDXGIOutput4 
# [unique][local][uuid][object] 

type 
  IDXGIOutput4Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIOutput4; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIOutput4): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIOutput4): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIOutput4; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIOutput4; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIOutput4; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIOutput4; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDesc*: proc (This: ptr IDXGIOutput4; pDesc: ptr DXGI_OUTPUT_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList*: proc (This: ptr IDXGIOutput4; EnumFormat: DXGI_FORMAT; 
                               Flags: UINT; pNumModes: ptr UINT; 
                               pDesc: ptr DXGI_MODE_DESC): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out][in] 
                                                                               # 
                                                                               # [annotation][out] 
    FindClosestMatchingMode*: proc (This: ptr IDXGIOutput4; 
                                    pModeToMatch: ptr DXGI_MODE_DESC; 
                                    pClosestMatch: ptr DXGI_MODE_DESC; 
                                    pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    WaitForVBlank*: proc (This: ptr IDXGIOutput4): HRESULT {.stdcall.}
    TakeOwnership*: proc (This: ptr IDXGIOutput4; pDevice: ptr IUnknown; 
                          Exclusive: BOOL): HRESULT {.stdcall.} # [annotation][in] 
    ReleaseOwnership*: proc (This: ptr IDXGIOutput4) {.stdcall.}
    GetGammaControlCapabilities*: proc (This: ptr IDXGIOutput4; pGammaCaps: ptr DXGI_GAMMA_CONTROL_CAPABILITIES): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetGammaControl*: proc (This: ptr IDXGIOutput4; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
    GetGammaControl*: proc (This: ptr IDXGIOutput4; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][out] 
    SetDisplaySurface*: proc (This: ptr IDXGIOutput4; 
                              pScanoutSurface: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetDisplaySurfaceData*: proc (This: ptr IDXGIOutput4; 
                                  pDestination: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetFrameStatistics*: proc (This: ptr IDXGIOutput4; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList1*: proc (This: ptr IDXGIOutput4; EnumFormat: DXGI_FORMAT; 
                                Flags: UINT; pNumModes: ptr UINT; 
                                pDesc: ptr DXGI_MODE_DESC1): HRESULT {.stdcall.} # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [annotation][out][in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    FindClosestMatchingMode1*: proc (This: ptr IDXGIOutput4; 
                                     pModeToMatch: ptr DXGI_MODE_DESC1; 
                                     pClosestMatch: ptr DXGI_MODE_DESC1; 
                                     pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    GetDisplaySurfaceData1*: proc (This: ptr IDXGIOutput4; 
                                   pDestination: ptr IDXGIResource): HRESULT {.
        stdcall.}             # [annotation][in] 
    DuplicateOutput*: proc (This: ptr IDXGIOutput4; pDevice: ptr IUnknown; 
                            ppOutputDuplication: ptr ptr IDXGIOutputDuplication): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    SupportsOverlays*: proc (This: ptr IDXGIOutput4): BOOL {.stdcall.}
    CheckOverlaySupport*: proc (This: ptr IDXGIOutput4; EnumFormat: DXGI_FORMAT; 
                                pConcernedDevice: ptr IUnknown; pFlags: ptr UINT): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][out] 
    CheckOverlayColorSpaceSupport*: proc (This: ptr IDXGIOutput4; 
        Format: DXGI_FORMAT; ColorSpace: DXGI_COLOR_SPACE_TYPE; 
        pConcernedDevice: ptr IUnknown; pFlags: ptr UINT): HRESULT {.stdcall.} # 
                                                                               # [annotation][in] 
                                                                               # 
                                                                               # [annotation][in] 
                                                                               # 
                                                                               # [annotation][in] 
                                                                               # 
                                                                               # [annotation][out] 
  
  IDXGIOutput4* = object 
    lpVtbl*: ptr IDXGIOutput4Vtbl


# interface IDXGIFactory4 
# [unique][local][uuid][object] 

type 
  IDXGIFactory4Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIFactory4; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIFactory4): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIFactory4): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIFactory4; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIFactory4; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIFactory4; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIFactory4; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumAdapters*: proc (This: ptr IDXGIFactory4; Adapter: UINT; 
                         ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out] 
    MakeWindowAssociation*: proc (This: ptr IDXGIFactory4; WindowHandle: HWND; 
                                  Flags: UINT): HRESULT {.stdcall.}
    GetWindowAssociation*: proc (This: ptr IDXGIFactory4; 
                                 pWindowHandle: ptr HWND): HRESULT {.stdcall.} # 
                                                                               # [annotation][out] 
    CreateSwapChain*: proc (This: ptr IDXGIFactory4; pDevice: ptr IUnknown; 
                            pDesc: ptr DXGI_SWAP_CHAIN_DESC; 
                            ppSwapChain: ptr ptr IDXGISwapChain): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    CreateSoftwareAdapter*: proc (This: ptr IDXGIFactory4; Module: HMODULE; 
                                  ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [in] 
                              # [annotation][out] 
    EnumAdapters1*: proc (This: ptr IDXGIFactory4; Adapter: UINT; 
                          ppAdapter: ptr ptr IDXGIAdapter1): HRESULT {.stdcall.} # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    IsCurrent*: proc (This: ptr IDXGIFactory4): BOOL {.stdcall.}
    IsWindowedStereoEnabled*: proc (This: ptr IDXGIFactory4): BOOL {.stdcall.}
    CreateSwapChainForHwnd*: proc (This: ptr IDXGIFactory4; 
                                   pDevice: ptr IUnknown; hWnd: HWND; 
                                   pDesc: ptr DXGI_SWAP_CHAIN_DESC1; 
        pFullscreenDesc: ptr DXGI_SWAP_CHAIN_FULLSCREEN_DESC; 
                                   pRestrictToOutput: ptr IDXGIOutput; 
                                   ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    CreateSwapChainForCoreWindow*: proc (This: ptr IDXGIFactory4; 
        pDevice: ptr IUnknown; pWindow: ptr IUnknown; 
        pDesc: ptr DXGI_SWAP_CHAIN_DESC1; pRestrictToOutput: ptr IDXGIOutput; 
        ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.stdcall.} # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out] 
    GetSharedResourceAdapterLuid*: proc (This: ptr IDXGIFactory4; 
        hResource: HANDLE; pLuid: ptr LUID): HRESULT {.stdcall.} # [annotation] 
                                                                 # [annotation] 
    RegisterStereoStatusWindow*: proc (This: ptr IDXGIFactory4; 
                                       WindowHandle: HWND; wMsg: UINT; 
                                       pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][out] 
    RegisterStereoStatusEvent*: proc (This: ptr IDXGIFactory4; hEvent: HANDLE; 
                                      pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    UnregisterStereoStatus*: proc (This: ptr IDXGIFactory4; dwCookie: DWORD) {.
        stdcall.}             # [annotation][in] 
    RegisterOcclusionStatusWindow*: proc (This: ptr IDXGIFactory4; 
        WindowHandle: HWND; wMsg: UINT; pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                                   # [annotation][in] 
                                                                                   # 
                                                                                   # [annotation][in] 
                                                                                   # 
                                                                                   # [annotation][out] 
    RegisterOcclusionStatusEvent*: proc (This: ptr IDXGIFactory4; 
        hEvent: HANDLE; pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out] 
    UnregisterOcclusionStatus*: proc (This: ptr IDXGIFactory4; dwCookie: DWORD) {.
        stdcall.}             # [annotation][in] 
    CreateSwapChainForComposition*: proc (This: ptr IDXGIFactory4; 
        pDevice: ptr IUnknown; pDesc: ptr DXGI_SWAP_CHAIN_DESC1; 
        pRestrictToOutput: ptr IDXGIOutput; ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    GetCreationFlags*: proc (This: ptr IDXGIFactory4): UINT {.stdcall.}
    EnumAdapterByLuid*: proc (This: ptr IDXGIFactory4; AdapterLuid: LUID; 
                              riid: ptr IID; ppvAdapter: ptr pointer): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    EnumWarpAdapter*: proc (This: ptr IDXGIFactory4; riid: ptr IID; 
                            ppvAdapter: ptr pointer): HRESULT {.stdcall.} # 
                                                                          # [annotation] 
                                                                          # 
                                                                          # [annotation] 
  
  IDXGIFactory4* = object 
    lpVtbl*: ptr IDXGIFactory4Vtbl


# interface __MIDL_itf_dxgi1_4_0000_0003 
# [local] 

type 
  DXGI_MEMORY_SEGMENT_GROUP* {.size: sizeof(cint).} = enum 
    DXGI_MEMORY_SEGMENT_GROUP_LOCAL = 0, DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL = 1
  DXGI_QUERY_VIDEO_MEMORY_INFO* = object 
    Budget*: UINT64
    CurrentUsage*: UINT64
    AvailableForReservation*: UINT64
    CurrentReservation*: UINT64




# interface IDXGIAdapter3 
# [unique][local][uuid][object] 

type 
  IDXGIAdapter3Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIAdapter3; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIAdapter3): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIAdapter3): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIAdapter3; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIAdapter3; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIAdapter3; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIAdapter3; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumOutputs*: proc (This: ptr IDXGIAdapter3; Output: UINT; 
                        ppOutput: ptr ptr IDXGIOutput): HRESULT {.stdcall.} # [in] 
                                                                            # 
                                                                            # [annotation][out][in] 
    GetDesc*: proc (This: ptr IDXGIAdapter3; pDesc: ptr DXGI_ADAPTER_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    CheckInterfaceSupport*: proc (This: ptr IDXGIAdapter3; 
                                  InterfaceName: ptr GUID; 
                                  pUMDVersion: ptr LARGE_INTEGER): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    GetDesc1*: proc (This: ptr IDXGIAdapter3; pDesc: ptr DXGI_ADAPTER_DESC1): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDesc2*: proc (This: ptr IDXGIAdapter3; pDesc: ptr DXGI_ADAPTER_DESC2): HRESULT {.
        stdcall.}             # [annotation][out] 
    RegisterHardwareContentProtectionTeardownStatusEvent*: proc (
        This: ptr IDXGIAdapter3; hEvent: HANDLE; pdwCookie: ptr DWORD): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    UnregisterHardwareContentProtectionTeardownStatus*: proc (
        This: ptr IDXGIAdapter3; dwCookie: DWORD) {.stdcall.} # [annotation][in] 
    QueryVideoMemoryInfo*: proc (This: ptr IDXGIAdapter3; NodeIndex: UINT; 
                                 MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP; 
        pVideoMemoryInfo: ptr DXGI_QUERY_VIDEO_MEMORY_INFO): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    SetVideoMemoryReservation*: proc (This: ptr IDXGIAdapter3; NodeIndex: UINT; 
        MemorySegmentGroup: DXGI_MEMORY_SEGMENT_GROUP; Reservation: UINT64): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][in] 
    RegisterVideoMemoryBudgetChangeNotificationEvent*: proc (
        This: ptr IDXGIAdapter3; hEvent: HANDLE; pdwCookie: ptr DWORD): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    UnregisterVideoMemoryBudgetChangeNotification*: proc (
        This: ptr IDXGIAdapter3; dwCookie: DWORD) {.stdcall.} # [annotation][in] 
  
  IDXGIAdapter3* = object 
    lpVtbl*: ptr IDXGIAdapter3Vtbl


# interface __MIDL_itf_dxgi1_4_0000_0004 
# [local] 

var IID_IDXGISwapChain3* {.importc.}: GUID
var IID_IDXGIOutput4* {.importc.}: GUID
var IID_IDXGIFactory4* {.importc.}: GUID
var IID_IDXGIAdapter3* {.importc.}: GUID

# Additional Prototypes for ALL interfaces 
# end of Additional Prototypes 

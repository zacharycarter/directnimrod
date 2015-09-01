# directX bindings by Charlie Barto
#this file was generated using the version of dxgi1_3.h that ships with windows 10
{.link: "dxguid.lib".}
{.link: "dxgi.lib".}
import windows, dxgi, dxgi1_2, Unknwn
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


# interface __MIDL_itf_dxgi1_3_0000_0000 
# [local] 

proc CreateDXGIFactory2*(Flags: UINT; riid: ptr IID; ppFactory: ptr pointer): HRESULT {.
    stdcall, importc.}
proc DXGIGetDebugInterface1*(Flags: UINT; riid: ptr IID; pDebug: ptr pointer): HRESULT {.
    stdcall, importc.}

# interface IDXGIDevice3 
# [unique][local][uuid][object] 


type 
  IDXGIDevice3Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDevice3; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIDevice3): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDevice3): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIDevice3; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIDevice3; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIDevice3; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIDevice3; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetAdapter*: proc (This: ptr IDXGIDevice3; pAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [annotation][out] 
    CreateSurface*: proc (This: ptr IDXGIDevice3; pDesc: ptr DXGI_SURFACE_DESC; 
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
    QueryResourceResidency*: proc (This: ptr IDXGIDevice3; 
                                   ppResources: ptr ptr IUnknown; 
                                   pResidencyStatus: ptr DXGI_RESIDENCY; 
                                   NumResources: UINT): HRESULT {.stdcall.} # 
                                                                            # [annotation][size_is][in] 
                                                                            # 
                                                                            # [annotation][size_is][out] 
                                                                            # [in] 
    SetGPUThreadPriority*: proc (This: ptr IDXGIDevice3; Priority: INT): HRESULT {.
        stdcall.}             # [in] 
    GetGPUThreadPriority*: proc (This: ptr IDXGIDevice3; pPriority: ptr INT): HRESULT {.
        stdcall.}             # [annotation][retval][out] 
    SetMaximumFrameLatency*: proc (This: ptr IDXGIDevice3; MaxLatency: UINT): HRESULT {.
        stdcall.}             # [in] 
    GetMaximumFrameLatency*: proc (This: ptr IDXGIDevice3; pMaxLatency: ptr UINT): HRESULT {.
        stdcall.}             # [annotation][out] 
    OfferResources*: proc (This: ptr IDXGIDevice3; NumResources: UINT; 
                           ppResources: ptr ptr IDXGIResource; 
                           Priority: DXGI_OFFER_RESOURCE_PRIORITY): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][size_is][in] 
                              # [annotation][in] 
    ReclaimResources*: proc (This: ptr IDXGIDevice3; NumResources: UINT; 
                             ppResources: ptr ptr IDXGIResource; 
                             pDiscarded: ptr BOOL): HRESULT {.stdcall.} # 
                                                                        # [annotation][in] 
                                                                        # 
                                                                        # [annotation][size_is][in] 
                                                                        # 
                                                                        # [annotation][size_is][out] 
    EnqueueSetEvent*: proc (This: ptr IDXGIDevice3; hEvent: HANDLE): HRESULT {.
        stdcall.}             # [annotation][in] 
    Trim*: proc (This: ptr IDXGIDevice3) {.stdcall.}

  IDXGIDevice3* = object 
    lpVtbl*: ptr IDXGIDevice3Vtbl


# interface __MIDL_itf_dxgi1_3_0000_0001 
# [local] 

type 
  DXGI_MATRIX_3X2_F* = object 
    u11*: FLOAT
    u12*: FLOAT
    u21*: FLOAT
    u22*: FLOAT
    u31*: FLOAT
    u32*: FLOAT


# interface IDXGISwapChain2 
# [unique][local][uuid][object] 

type 
  IDXGISwapChain2Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISwapChain2; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGISwapChain2): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISwapChain2): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISwapChain2; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGISwapChain2; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGISwapChain2; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGISwapChain2; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDevice*: proc (This: ptr IDXGISwapChain2; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    Present*: proc (This: ptr IDXGISwapChain2; SyncInterval: UINT; Flags: UINT): HRESULT {.
        stdcall.}             # [in] 
                              # [in] 
    GetBuffer*: proc (This: ptr IDXGISwapChain2; Buffer: UINT; riid: ptr IID; 
                      ppSurface: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                   # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out][in] 
    SetFullscreenState*: proc (This: ptr IDXGISwapChain2; Fullscreen: BOOL; 
                               pTarget: ptr IDXGIOutput): HRESULT {.stdcall.} # 
                                                                              # [in] 
                                                                              # 
                                                                              # [annotation][in] 
    GetFullscreenState*: proc (This: ptr IDXGISwapChain2; pFullscreen: ptr BOOL; 
                               ppTarget: ptr ptr IDXGIOutput): HRESULT {.stdcall.} # 
                                                                                   # [annotation][out] 
                                                                                   # 
                                                                                   # [annotation][out] 
    GetDesc*: proc (This: ptr IDXGISwapChain2; pDesc: ptr DXGI_SWAP_CHAIN_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    ResizeBuffers*: proc (This: ptr IDXGISwapChain2; BufferCount: UINT; 
                          Width: UINT; Height: UINT; NewFormat: DXGI_FORMAT; 
                          SwapChainFlags: UINT): HRESULT {.stdcall.} # [in] 
                                                                     # [in] 
                                                                     # [in] 
                                                                     # [in] 
                                                                     # [in] 
    ResizeTarget*: proc (This: ptr IDXGISwapChain2; 
                         pNewTargetParameters: ptr DXGI_MODE_DESC): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetContainingOutput*: proc (This: ptr IDXGISwapChain2; 
                                ppOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetFrameStatistics*: proc (This: ptr IDXGISwapChain2; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetLastPresentCount*: proc (This: ptr IDXGISwapChain2; 
                                pLastPresentCount: ptr UINT): HRESULT {.stdcall.} # 
                                                                                  # [annotation][out] 
    GetDesc1*: proc (This: ptr IDXGISwapChain2; pDesc: ptr DXGI_SWAP_CHAIN_DESC1): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetFullscreenDesc*: proc (This: ptr IDXGISwapChain2; 
                              pDesc: ptr DXGI_SWAP_CHAIN_FULLSCREEN_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetHwnd*: proc (This: ptr IDXGISwapChain2; pHwnd: ptr HWND): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetCoreWindow*: proc (This: ptr IDXGISwapChain2; refiid: ptr IID; 
                          ppUnk: ptr pointer): HRESULT {.stdcall.} # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out] 
    Present1*: proc (This: ptr IDXGISwapChain2; SyncInterval: UINT; 
                     PresentFlags: UINT; 
                     pPresentParameters: ptr DXGI_PRESENT_PARAMETERS): HRESULT {.
        stdcall.}             # [in] 
                              # [in] 
                              # [annotation][in] 
    IsTemporaryMonoSupported*: proc (This: ptr IDXGISwapChain2): BOOL {.stdcall.}
    GetRestrictToOutput*: proc (This: ptr IDXGISwapChain2; 
                                ppRestrictToOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetBackgroundColor*: proc (This: ptr IDXGISwapChain2; pColor: ptr DXGI_RGBA): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetBackgroundColor*: proc (This: ptr IDXGISwapChain2; pColor: ptr DXGI_RGBA): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetRotation*: proc (This: ptr IDXGISwapChain2; Rotation: DXGI_MODE_ROTATION): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetRotation*: proc (This: ptr IDXGISwapChain2; 
                        pRotation: ptr DXGI_MODE_ROTATION): HRESULT {.stdcall.} # 
                                                                                # [annotation][out] 
    SetSourceSize*: proc (This: ptr IDXGISwapChain2; Width: UINT; Height: UINT): HRESULT {.
        stdcall.}
    GetSourceSize*: proc (This: ptr IDXGISwapChain2; pWidth: ptr UINT; 
                          pHeight: ptr UINT): HRESULT {.stdcall.} # 
                                                                  # [annotation][out] 
                                                                  # 
                                                                  # [annotation][out] 
    SetMaximumFrameLatency*: proc (This: ptr IDXGISwapChain2; MaxLatency: UINT): HRESULT {.
        stdcall.}
    GetMaximumFrameLatency*: proc (This: ptr IDXGISwapChain2; 
                                   pMaxLatency: ptr UINT): HRESULT {.stdcall.} # 
                                                                               # [annotation][out] 
    GetFrameLatencyWaitableObject*: proc (This: ptr IDXGISwapChain2): HANDLE {.
        stdcall.}
    SetMatrixTransform*: proc (This: ptr IDXGISwapChain2; 
                               pMatrix: ptr DXGI_MATRIX_3X2_F): HRESULT {.
        stdcall.}
    GetMatrixTransform*: proc (This: ptr IDXGISwapChain2; 
                               pMatrix: ptr DXGI_MATRIX_3X2_F): HRESULT {.
        stdcall.}             # [annotation][out] 
  
  IDXGISwapChain2* = object 
    lpVtbl*: ptr IDXGISwapChain2Vtbl


# interface IDXGIOutput2 
# [unique][local][uuid][object] 

type 
  IDXGIOutput2Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIOutput2; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIOutput2): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIOutput2): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIOutput2; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIOutput2; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIOutput2; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIOutput2; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDesc*: proc (This: ptr IDXGIOutput2; pDesc: ptr DXGI_OUTPUT_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList*: proc (This: ptr IDXGIOutput2; EnumFormat: DXGI_FORMAT; 
                               Flags: UINT; pNumModes: ptr UINT; 
                               pDesc: ptr DXGI_MODE_DESC): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out][in] 
                                                                               # 
                                                                               # [annotation][out] 
    FindClosestMatchingMode*: proc (This: ptr IDXGIOutput2; 
                                    pModeToMatch: ptr DXGI_MODE_DESC; 
                                    pClosestMatch: ptr DXGI_MODE_DESC; 
                                    pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    WaitForVBlank*: proc (This: ptr IDXGIOutput2): HRESULT {.stdcall.}
    TakeOwnership*: proc (This: ptr IDXGIOutput2; pDevice: ptr IUnknown; 
                          Exclusive: BOOL): HRESULT {.stdcall.} # [annotation][in] 
    ReleaseOwnership*: proc (This: ptr IDXGIOutput2) {.stdcall.}
    GetGammaControlCapabilities*: proc (This: ptr IDXGIOutput2; pGammaCaps: ptr DXGI_GAMMA_CONTROL_CAPABILITIES): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetGammaControl*: proc (This: ptr IDXGIOutput2; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
    GetGammaControl*: proc (This: ptr IDXGIOutput2; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][out] 
    SetDisplaySurface*: proc (This: ptr IDXGIOutput2; 
                              pScanoutSurface: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetDisplaySurfaceData*: proc (This: ptr IDXGIOutput2; 
                                  pDestination: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetFrameStatistics*: proc (This: ptr IDXGIOutput2; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList1*: proc (This: ptr IDXGIOutput2; EnumFormat: DXGI_FORMAT; 
                                Flags: UINT; pNumModes: ptr UINT; 
                                pDesc: ptr DXGI_MODE_DESC1): HRESULT {.stdcall.} # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [annotation][out][in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    FindClosestMatchingMode1*: proc (This: ptr IDXGIOutput2; 
                                     pModeToMatch: ptr DXGI_MODE_DESC1; 
                                     pClosestMatch: ptr DXGI_MODE_DESC1; 
                                     pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    GetDisplaySurfaceData1*: proc (This: ptr IDXGIOutput2; 
                                   pDestination: ptr IDXGIResource): HRESULT {.
        stdcall.}             # [annotation][in] 
    DuplicateOutput*: proc (This: ptr IDXGIOutput2; pDevice: ptr IUnknown; 
                            ppOutputDuplication: ptr ptr IDXGIOutputDuplication): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    SupportsOverlays*: proc (This: ptr IDXGIOutput2): BOOL {.stdcall.}

  IDXGIOutput2* = object 
    lpVtbl*: ptr IDXGIOutput2Vtbl


# interface IDXGIFactory3 
# [unique][local][uuid][object] 

type 
  IDXGIFactory3Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIFactory3; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIFactory3): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIFactory3): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIFactory3; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIFactory3; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIFactory3; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIFactory3; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    EnumAdapters*: proc (This: ptr IDXGIFactory3; Adapter: UINT; 
                         ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out] 
    MakeWindowAssociation*: proc (This: ptr IDXGIFactory3; WindowHandle: HWND; 
                                  Flags: UINT): HRESULT {.stdcall.}
    GetWindowAssociation*: proc (This: ptr IDXGIFactory3; 
                                 pWindowHandle: ptr HWND): HRESULT {.stdcall.} # 
                                                                               # [annotation][out] 
    CreateSwapChain*: proc (This: ptr IDXGIFactory3; pDevice: ptr IUnknown; 
                            pDesc: ptr DXGI_SWAP_CHAIN_DESC; 
                            ppSwapChain: ptr ptr IDXGISwapChain): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    CreateSoftwareAdapter*: proc (This: ptr IDXGIFactory3; Module: HMODULE; 
                                  ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}             # [in] 
                              # [annotation][out] 
    EnumAdapters1*: proc (This: ptr IDXGIFactory3; Adapter: UINT; 
                          ppAdapter: ptr ptr IDXGIAdapter1): HRESULT {.stdcall.} # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    IsCurrent*: proc (This: ptr IDXGIFactory3): BOOL {.stdcall.}
    IsWindowedStereoEnabled*: proc (This: ptr IDXGIFactory3): BOOL {.stdcall.}
    CreateSwapChainForHwnd*: proc (This: ptr IDXGIFactory3; 
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
    CreateSwapChainForCoreWindow*: proc (This: ptr IDXGIFactory3; 
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
    GetSharedResourceAdapterLuid*: proc (This: ptr IDXGIFactory3; 
        hResource: HANDLE; pLuid: ptr LUID): HRESULT {.stdcall.} # [annotation] 
                                                                 # [annotation] 
    RegisterStereoStatusWindow*: proc (This: ptr IDXGIFactory3; 
                                       WindowHandle: HWND; wMsg: UINT; 
                                       pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][in] 
                                                                                  # 
                                                                                  # [annotation][out] 
    RegisterStereoStatusEvent*: proc (This: ptr IDXGIFactory3; hEvent: HANDLE; 
                                      pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    UnregisterStereoStatus*: proc (This: ptr IDXGIFactory3; dwCookie: DWORD) {.
        stdcall.}             # [annotation][in] 
    RegisterOcclusionStatusWindow*: proc (This: ptr IDXGIFactory3; 
        WindowHandle: HWND; wMsg: UINT; pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                                   # [annotation][in] 
                                                                                   # 
                                                                                   # [annotation][in] 
                                                                                   # 
                                                                                   # [annotation][out] 
    RegisterOcclusionStatusEvent*: proc (This: ptr IDXGIFactory3; 
        hEvent: HANDLE; pdwCookie: ptr DWORD): HRESULT {.stdcall.} # 
                                                                   # [annotation][in] 
                                                                   # 
                                                                   # [annotation][out] 
    UnregisterOcclusionStatus*: proc (This: ptr IDXGIFactory3; dwCookie: DWORD) {.
        stdcall.}             # [annotation][in] 
    CreateSwapChainForComposition*: proc (This: ptr IDXGIFactory3; 
        pDevice: ptr IUnknown; pDesc: ptr DXGI_SWAP_CHAIN_DESC1; 
        pRestrictToOutput: ptr IDXGIOutput; ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][in] 
                              # [annotation][out] 
    GetCreationFlags*: proc (This: ptr IDXGIFactory3): UINT {.stdcall.}

  IDXGIFactory3* = object 
    lpVtbl*: ptr IDXGIFactory3Vtbl


# interface __MIDL_itf_dxgi1_3_0000_0004 
# [local] 

type 
  DXGI_DECODE_SWAP_CHAIN_DESC* = object 
    Flags*: UINT

  DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS* = enum 
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE = 0x00000001, 
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709 = 0x00000002, 
    DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC = 0x00000004

# interface IDXGIDecodeSwapChain 
# [unique][local][uuid][object] 


type 
  IDXGIDecodeSwapChainVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDecodeSwapChain; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIDecodeSwapChain): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDecodeSwapChain): ULONG {.stdcall.}
    PresentBuffer*: proc (This: ptr IDXGIDecodeSwapChain; BufferToPresent: UINT; 
                          SyncInterval: UINT; Flags: UINT): HRESULT {.stdcall.}
    SetSourceRect*: proc (This: ptr IDXGIDecodeSwapChain; pRect: ptr RECT): HRESULT {.
        stdcall.}
    SetTargetRect*: proc (This: ptr IDXGIDecodeSwapChain; pRect: ptr RECT): HRESULT {.
        stdcall.}
    SetDestSize*: proc (This: ptr IDXGIDecodeSwapChain; Width: UINT; 
                        Height: UINT): HRESULT {.stdcall.}
    GetSourceRect*: proc (This: ptr IDXGIDecodeSwapChain; pRect: ptr RECT): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetTargetRect*: proc (This: ptr IDXGIDecodeSwapChain; pRect: ptr RECT): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDestSize*: proc (This: ptr IDXGIDecodeSwapChain; pWidth: ptr UINT; 
                        pHeight: ptr UINT): HRESULT {.stdcall.} # 
                                                                # [annotation][out] 
                                                                # 
                                                                # [annotation][out] 
    SetColorSpace*: proc (This: ptr IDXGIDecodeSwapChain; 
                          ColorSpace: DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS): HRESULT {.
        stdcall.}
    GetColorSpace*: proc (This: ptr IDXGIDecodeSwapChain): DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS {.
        stdcall.}

  IDXGIDecodeSwapChain* = object 
    lpVtbl*: ptr IDXGIDecodeSwapChainVtbl


# interface IDXGIFactoryMedia 
# [unique][local][uuid][object] 

type 
  IDXGIFactoryMediaVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIFactoryMedia; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIFactoryMedia): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIFactoryMedia): ULONG {.stdcall.}
    CreateSwapChainForCompositionSurfaceHandle*: proc (
        This: ptr IDXGIFactoryMedia; pDevice: ptr IUnknown; hSurface: HANDLE; 
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
    CreateDecodeSwapChainForCompositionSurfaceHandle*: proc (
        This: ptr IDXGIFactoryMedia; pDevice: ptr IUnknown; hSurface: HANDLE; 
        pDesc: ptr DXGI_DECODE_SWAP_CHAIN_DESC; 
        pYuvDecodeBuffers: ptr IDXGIResource; 
        pRestrictToOutput: ptr IDXGIOutput; 
        ppSwapChain: ptr ptr IDXGIDecodeSwapChain): HRESULT {.stdcall.} # 
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
                                                                        # [annotation][out] 
  
  IDXGIFactoryMedia* = object 
    lpVtbl*: ptr IDXGIFactoryMediaVtbl


# interface __MIDL_itf_dxgi1_3_0000_0006 
# [local] 

type 
  DXGI_FRAME_PRESENTATION_MODE* = enum 
    DXGI_FRAME_PRESENTATION_MODE_COMPOSED = 0, 
    DXGI_FRAME_PRESENTATION_MODE_OVERLAY = 1, 
    DXGI_FRAME_PRESENTATION_MODE_NONE = 2, 
    DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE = 3
  DXGI_FRAME_STATISTICS_MEDIA* = object 
    PresentCount*: UINT
    PresentRefreshCount*: UINT
    SyncRefreshCount*: UINT
    SyncQPCTime*: LARGE_INTEGER
    SyncGPUTime*: LARGE_INTEGER
    CompositionMode*: DXGI_FRAME_PRESENTATION_MODE
    ApprovedPresentDuration*: UINT


# interface IDXGISwapChainMedia 
# [unique][local][uuid][object] 

type 
  IDXGISwapChainMediaVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISwapChainMedia; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGISwapChainMedia): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISwapChainMedia): ULONG {.stdcall.}
    GetFrameStatisticsMedia*: proc (This: ptr IDXGISwapChainMedia; 
                                    pStats: ptr DXGI_FRAME_STATISTICS_MEDIA): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetPresentDuration*: proc (This: ptr IDXGISwapChainMedia; Duration: UINT): HRESULT {.
        stdcall.}
    CheckPresentDurationSupport*: proc (This: ptr IDXGISwapChainMedia; 
                                        DesiredPresentDuration: UINT; 
        pClosestSmallerPresentDuration: ptr UINT; 
                                        pClosestLargerPresentDuration: ptr UINT): HRESULT {.
        stdcall.}             # [annotation][out] 
                              # [annotation][out] 
  
  IDXGISwapChainMedia* = object 
    lpVtbl*: ptr IDXGISwapChainMediaVtbl


# interface __MIDL_itf_dxgi1_3_0000_0007 
# [local] 

type 
  DXGI_OVERLAY_SUPPORT_FLAG* = enum 
    DXGI_OVERLAY_SUPPORT_FLAG_DIRECT = 0x00000001, 
    DXGI_OVERLAY_SUPPORT_FLAG_SCALING = 0x00000002

# interface IDXGIOutput3 
# [unique][local][uuid][object] 

type 
  IDXGIOutput3Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIOutput3; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IDXGIOutput3): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIOutput3): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIOutput3; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation][in] 
                                                                                # 
                                                                                # [in] 
                                                                                # 
                                                                                # [annotation][in] 
    SetPrivateDataInterface*: proc (This: ptr IDXGIOutput3; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
                                                                                 # 
                                                                                 # [annotation][in] 
    GetPrivateData*: proc (This: ptr IDXGIOutput3; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out][in] 
                              # [annotation][out] 
    GetParent*: proc (This: ptr IDXGIOutput3; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.} # 
                                                                  # [annotation][in] 
                                                                  # 
                                                                  # [annotation][retval][out] 
    GetDesc*: proc (This: ptr IDXGIOutput3; pDesc: ptr DXGI_OUTPUT_DESC): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList*: proc (This: ptr IDXGIOutput3; EnumFormat: DXGI_FORMAT; 
                               Flags: UINT; pNumModes: ptr UINT; 
                               pDesc: ptr DXGI_MODE_DESC): HRESULT {.stdcall.} # 
                                                                               # [in] 
                                                                               # 
                                                                               # [in] 
                                                                               # 
                                                                               # [annotation][out][in] 
                                                                               # 
                                                                               # [annotation][out] 
    FindClosestMatchingMode*: proc (This: ptr IDXGIOutput3; 
                                    pModeToMatch: ptr DXGI_MODE_DESC; 
                                    pClosestMatch: ptr DXGI_MODE_DESC; 
                                    pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    WaitForVBlank*: proc (This: ptr IDXGIOutput3): HRESULT {.stdcall.}
    TakeOwnership*: proc (This: ptr IDXGIOutput3; pDevice: ptr IUnknown; 
                          Exclusive: BOOL): HRESULT {.stdcall.} # [annotation][in] 
    ReleaseOwnership*: proc (This: ptr IDXGIOutput3) {.stdcall.}
    GetGammaControlCapabilities*: proc (This: ptr IDXGIOutput3; pGammaCaps: ptr DXGI_GAMMA_CONTROL_CAPABILITIES): HRESULT {.
        stdcall.}             # [annotation][out] 
    SetGammaControl*: proc (This: ptr IDXGIOutput3; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][in] 
    GetGammaControl*: proc (This: ptr IDXGIOutput3; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.} # 
                                                                                 # [annotation][out] 
    SetDisplaySurface*: proc (This: ptr IDXGIOutput3; 
                              pScanoutSurface: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetDisplaySurfaceData*: proc (This: ptr IDXGIOutput3; 
                                  pDestination: ptr IDXGISurface): HRESULT {.
        stdcall.}             # [annotation][in] 
    GetFrameStatistics*: proc (This: ptr IDXGIOutput3; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}             # [annotation][out] 
    GetDisplayModeList1*: proc (This: ptr IDXGIOutput3; EnumFormat: DXGI_FORMAT; 
                                Flags: UINT; pNumModes: ptr UINT; 
                                pDesc: ptr DXGI_MODE_DESC1): HRESULT {.stdcall.} # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [in] 
                                                                                 # 
                                                                                 # [annotation][out][in] 
                                                                                 # 
                                                                                 # [annotation][out] 
    FindClosestMatchingMode1*: proc (This: ptr IDXGIOutput3; 
                                     pModeToMatch: ptr DXGI_MODE_DESC1; 
                                     pClosestMatch: ptr DXGI_MODE_DESC1; 
                                     pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][in] 
    GetDisplaySurfaceData1*: proc (This: ptr IDXGIOutput3; 
                                   pDestination: ptr IDXGIResource): HRESULT {.
        stdcall.}             # [annotation][in] 
    DuplicateOutput*: proc (This: ptr IDXGIOutput3; pDevice: ptr IUnknown; 
                            ppOutputDuplication: ptr ptr IDXGIOutputDuplication): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
    SupportsOverlays*: proc (This: ptr IDXGIOutput3): BOOL {.stdcall.}
    CheckOverlaySupport*: proc (This: ptr IDXGIOutput3; EnumFormat: DXGI_FORMAT; 
                                pConcernedDevice: ptr IUnknown; pFlags: ptr UINT): HRESULT {.
        stdcall.}             # [annotation][in] 
                              # [annotation][out] 
                              # [annotation][out] 
  
  IDXGIOutput3* = object 
    lpVtbl*: ptr IDXGIOutput3Vtbl


# interface __MIDL_itf_dxgi1_3_0000_0008 
# [local] 

var IID_IDXGIDevice3* {.importc.}: GUID
var IID_IDXGISwapChain2* {.importc.}: GUID
var IID_IDXGIOutput2* {.importc.}: GUID
var IID_IDXGIFactory3* {.importc.}: GUID
var IID_IDXGIDecodeSwapChain* {.importc.}: GUID
var IID_IDXGIFactoryMedia* {.importc.}: GUID
var IID_IDXGISwapChainMedia* {.importc.}: GUID
var IID_IDXGIOutput3* {.importc.}: GUID

# Additional Prototypes for ALL interfaces 
# end of Additional Prototypes 

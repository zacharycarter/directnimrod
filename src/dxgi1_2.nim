## DirectX Bindings by Charlie Barto
import windows, dxgi
type IID = TIID
type GUID = TGUID
type INT = int32
type UINT = int32
type FLOAT = float32
type IUnknown = object
type 
  IDXGIDisplayControlVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDisplayControl; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIDisplayControl): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDisplayControl): ULONG {.stdcall.}
    IsStereoEnabled*: proc (This: ptr IDXGIDisplayControl): BOOL {.stdcall.}
    SetStereoEnabled*: proc (This: ptr IDXGIDisplayControl; enabled: BOOL) {.
        stdcall.}

  IDXGIDisplayControl* = object 
    lpVtbl*: ptr IDXGIDisplayControlVtbl

  DXGI_OUTDUPL_MOVE_RECT* = object 
    SourcePoint*: POINT
    DestinationRect*: RECT

  DXGI_OUTDUPL_DESC* = object 
    ModeDesc*: DXGI_MODE_DESC
    Rotation*: DXGI_MODE_ROTATION
    DesktopImageInSystemMemory*: BOOL

  DXGI_OUTDUPL_POINTER_POSITION* = object 
    Position*: POINT
    Visible*: BOOL

  DXGI_OUTDUPL_POINTER_SHAPE_TYPE* {.size: sizeof(cint).} = enum 
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MONOCHROME = 0x00000001, 
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_COLOR = 0x00000002, 
    DXGI_OUTDUPL_POINTER_SHAPE_TYPE_MASKED_COLOR = 0x00000004
  DXGI_OUTDUPL_POINTER_SHAPE_INFO* = object 
    `Type`*: UINT
    Width*: UINT
    Height*: UINT
    Pitch*: UINT
    HotSpot*: POINT

  DXGI_OUTDUPL_FRAME_INFO* = object 
    LastPresentTime*: LARGE_INTEGER
    LastMouseUpdateTime*: LARGE_INTEGER
    AccumulatedFrames*: UINT
    RectsCoalesced*: BOOL
    ProtectedContentMaskedOut*: BOOL
    PointerPosition*: DXGI_OUTDUPL_POINTER_POSITION
    TotalMetadataBufferSize*: UINT
    PointerShapeBufferSize*: UINT

  IDXGIOutputDuplicationVtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIOutputDuplication; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIOutputDuplication): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIOutputDuplication): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIOutputDuplication; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGIOutputDuplication; 
                                    Name: ptr GUID; pUnknown: ptr IUnknown): HRESULT {.
        stdcall.}
    GetPrivateData*: proc (This: ptr IDXGIOutputDuplication; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGIOutputDuplication; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    GetDesc*: proc (This: ptr IDXGIOutputDuplication; 
                    pDesc: ptr DXGI_OUTDUPL_DESC) {.stdcall.}
    AcquireNextFrame*: proc (This: ptr IDXGIOutputDuplication; 
                             TimeoutInMilliseconds: UINT; 
                             pFrameInfo: ptr DXGI_OUTDUPL_FRAME_INFO; 
                             ppDesktopResource: ptr ptr IDXGIResource): HRESULT {.
        stdcall.}
    GetFrameDirtyRects*: proc (This: ptr IDXGIOutputDuplication; 
                               DirtyRectsBufferSize: UINT; 
                               pDirtyRectsBuffer: ptr RECT; 
                               pDirtyRectsBufferSizeRequired: ptr UINT): HRESULT {.
        stdcall.}
    GetFrameMoveRects*: proc (This: ptr IDXGIOutputDuplication; 
                              MoveRectsBufferSize: UINT; 
                              pMoveRectBuffer: ptr DXGI_OUTDUPL_MOVE_RECT; 
                              pMoveRectsBufferSizeRequired: ptr UINT): HRESULT {.
        stdcall.}
    GetFramePointerShape*: proc (This: ptr IDXGIOutputDuplication; 
                                 PointerShapeBufferSize: UINT; 
                                 pPointerShapeBuffer: pointer; 
                                 pPointerShapeBufferSizeRequired: ptr UINT; 
        pPointerShapeInfo: ptr DXGI_OUTDUPL_POINTER_SHAPE_INFO): HRESULT {.
        stdcall.}
    MapDesktopSurface*: proc (This: ptr IDXGIOutputDuplication; 
                              pLockedRect: ptr DXGI_MAPPED_RECT): HRESULT {.
        stdcall.}
    UnMapDesktopSurface*: proc (This: ptr IDXGIOutputDuplication): HRESULT {.
        stdcall.}
    ReleaseFrame*: proc (This: ptr IDXGIOutputDuplication): HRESULT {.stdcall.}

  IDXGIOutputDuplication* = object 
    lpVtbl*: ptr IDXGIOutputDuplicationVtbl

  DXGI_ALPHA_MODE* {.size: sizeof(cint).} = enum 
    DXGI_ALPHA_MODE_UNSPECIFIED = 0, DXGI_ALPHA_MODE_PREMULTIPLIED = 1, 
    DXGI_ALPHA_MODE_STRAIGHT = 2, DXGI_ALPHA_MODE_IGNORE = 3, 
    DXGI_ALPHA_MODE_FORCE_DWORD = 0xFFFFFFFF
  IDXGISurface2Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISurface2; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGISurface2): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISurface2): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISurface2; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGISurface2; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGISurface2; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGISurface2; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    GetDevice*: proc (This: ptr IDXGISurface2; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.}
    GetDesc*: proc (This: ptr IDXGISurface2; pDesc: ptr DXGI_SURFACE_DESC): HRESULT {.
        stdcall.}
    Map*: proc (This: ptr IDXGISurface2; pLockedRect: ptr DXGI_MAPPED_RECT; 
                MapFlags: UINT): HRESULT {.stdcall.}
    Unmap*: proc (This: ptr IDXGISurface2): HRESULT {.stdcall.}
    GetDC*: proc (This: ptr IDXGISurface2; `Discard`: BOOL; phdc: ptr HDC): HRESULT {.
        stdcall.}
    ReleaseDC*: proc (This: ptr IDXGISurface2; pDirtyRect: ptr RECT): HRESULT {.
        stdcall.}
    GetResource*: proc (This: ptr IDXGISurface2; riid: ptr IID; 
                        ppParentResource: ptr pointer; 
                        pSubresourceIndex: ptr UINT): HRESULT {.stdcall.}

  IDXGISurface2* = object 
    lpVtbl*: ptr IDXGISurface2Vtbl

  IDXGIResource1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIResource1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIResource1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIResource1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIResource1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGIResource1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGIResource1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGIResource1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    GetDevice*: proc (This: ptr IDXGIResource1; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.}
    GetSharedHandle*: proc (This: ptr IDXGIResource1; pSharedHandle: ptr HANDLE): HRESULT {.
        stdcall.}
    GetUsage*: proc (This: ptr IDXGIResource1; pUsage: ptr DXGI_USAGE): HRESULT {.
        stdcall.}
    SetEvictionPriority*: proc (This: ptr IDXGIResource1; EvictionPriority: UINT): HRESULT {.
        stdcall.}
    GetEvictionPriority*: proc (This: ptr IDXGIResource1; 
                                pEvictionPriority: ptr UINT): HRESULT {.stdcall.}
    CreateSubresourceSurface*: proc (This: ptr IDXGIResource1; index: UINT; 
                                     ppSurface: ptr ptr IDXGISurface2): HRESULT {.
        stdcall.}
    CreateSharedHandle*: proc (This: ptr IDXGIResource1; 
                               pAttributes: ptr SECURITY_ATTRIBUTES; 
                               dwAccess: DWORD; lpName: LPCWSTR; 
                               pHandle: ptr HANDLE): HRESULT {.stdcall.}

  IDXGIResource1* = object 
    lpVtbl*: ptr IDXGIResource1Vtbl

  DXGI_OFFER_RESOURCE_PRIORITY* {.size: sizeof(cint).} = enum 
    DXGI_OFFER_RESOURCE_PRIORITY_LOW = 1,
    DXGI_OFFER_RESOURCE_PRIORITY_NORMAL = 2,
    DXGI_OFFER_RESOURCE_PRIORITY_HIGH = 3
  IDXGIDevice2Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIDevice2; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIDevice2): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIDevice2): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIDevice2; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGIDevice2; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGIDevice2; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGIDevice2; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    GetAdapter*: proc (This: ptr IDXGIDevice2; pAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}
    CreateSurface*: proc (This: ptr IDXGIDevice2; pDesc: ptr DXGI_SURFACE_DESC; 
                          NumSurfaces: UINT; Usage: DXGI_USAGE; 
                          pSharedResource: ptr DXGI_SHARED_RESOURCE; 
                          ppSurface: ptr ptr IDXGISurface): HRESULT {.stdcall.}
    QueryResourceResidency*: proc (This: ptr IDXGIDevice2; 
                                   ppResources: ptr ptr IUnknown; 
                                   pResidencyStatus: ptr DXGI_RESIDENCY; 
                                   NumResources: UINT): HRESULT {.stdcall.}
    SetGPUThreadPriority*: proc (This: ptr IDXGIDevice2; Priority: INT): HRESULT {.
        stdcall.}
    GetGPUThreadPriority*: proc (This: ptr IDXGIDevice2; pPriority: ptr INT): HRESULT {.
        stdcall.}
    SetMaximumFrameLatency*: proc (This: ptr IDXGIDevice2; MaxLatency: UINT): HRESULT {.
        stdcall.}
    GetMaximumFrameLatency*: proc (This: ptr IDXGIDevice2; pMaxLatency: ptr UINT): HRESULT {.
        stdcall.}
    OfferResources*: proc (This: ptr IDXGIDevice2; NumResources: UINT; 
                           ppResources: ptr ptr IDXGIResource; 
                           Priority: DXGI_OFFER_RESOURCE_PRIORITY): HRESULT {.
        stdcall.}
    ReclaimResources*: proc (This: ptr IDXGIDevice2; NumResources: UINT; 
                             ppResources: ptr ptr IDXGIResource; 
                             pDiscarded: ptr BOOL): HRESULT {.stdcall.}
    EnqueueSetEvent*: proc (This: ptr IDXGIDevice2; hEvent: HANDLE): HRESULT {.
        stdcall.}

  IDXGIDevice2* = object 
    lpVtbl*: ptr IDXGIDevice2Vtbl

  

  DXGI_MODE_DESC1* = object 
    Width*: UINT
    Height*: UINT
    RefreshRate*: DXGI_RATIONAL
    Format*: DXGI_FORMAT
    ScanlineOrdering*: DXGI_MODE_SCANLINE_ORDER
    Scaling*: DXGI_MODE_SCALING
    Stereo*: BOOL

  DXGI_SCALING* {.size: sizeof(cint).} = enum 
    DXGI_SCALING_STRETCH = 0, DXGI_SCALING_NONE = 1, 
    DXGI_SCALING_ASPECT_RATIO_STRETCH = 2
  DXGI_SWAP_CHAIN_DESC1* = object 
    Width*: UINT
    Height*: UINT
    Format*: DXGI_FORMAT
    Stereo*: BOOL
    SampleDesc*: DXGI_SAMPLE_DESC
    BufferUsage*: DXGI_USAGE
    BufferCount*: UINT
    Scaling*: DXGI_SCALING
    SwapEffect*: DXGI_SWAP_EFFECT
    AlphaMode*: DXGI_ALPHA_MODE
    Flags*: UINT

  DXGI_SWAP_CHAIN_FULLSCREEN_DESC* = object 
    RefreshRate*: DXGI_RATIONAL
    ScanlineOrdering*: DXGI_MODE_SCANLINE_ORDER
    Scaling*: DXGI_MODE_SCALING
    Windowed*: BOOL

  DXGI_PRESENT_PARAMETERS* = object 
    DirtyRectsCount*: UINT
    pDirtyRects*: ptr RECT
    pScrollRect*: ptr RECT
    pScrollOffset*: ptr POINT

  IDXGISwapChain1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGISwapChain1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGISwapChain1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGISwapChain1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGISwapChain1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGISwapChain1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGISwapChain1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGISwapChain1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    GetDevice*: proc (This: ptr IDXGISwapChain1; riid: ptr IID; 
                      ppDevice: ptr pointer): HRESULT {.stdcall.}
    Present*: proc (This: ptr IDXGISwapChain1; SyncInterval: UINT; Flags: UINT): HRESULT {.
        stdcall.}
    GetBuffer*: proc (This: ptr IDXGISwapChain1; Buffer: UINT; riid: ptr IID; 
                      ppSurface: ptr pointer): HRESULT {.stdcall.}
    SetFullscreenState*: proc (This: ptr IDXGISwapChain1; Fullscreen: BOOL; 
                               pTarget: ptr IDXGIOutput): HRESULT {.stdcall.}
    GetFullscreenState*: proc (This: ptr IDXGISwapChain1; pFullscreen: ptr BOOL; 
                               ppTarget: ptr ptr IDXGIOutput): HRESULT {.stdcall.}
    GetDesc*: proc (This: ptr IDXGISwapChain1; pDesc: ptr DXGI_SWAP_CHAIN_DESC): HRESULT {.
        stdcall.}
    ResizeBuffers*: proc (This: ptr IDXGISwapChain1; BufferCount: UINT; 
                          Width: UINT; Height: UINT; NewFormat: DXGI_FORMAT; 
                          SwapChainFlags: UINT): HRESULT {.stdcall.}
    ResizeTarget*: proc (This: ptr IDXGISwapChain1; 
                         pNewTargetParameters: ptr DXGI_MODE_DESC): HRESULT {.
        stdcall.}
    GetContainingOutput*: proc (This: ptr IDXGISwapChain1; 
                                ppOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}
    GetFrameStatistics*: proc (This: ptr IDXGISwapChain1; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}
    GetLastPresentCount*: proc (This: ptr IDXGISwapChain1; 
                                pLastPresentCount: ptr UINT): HRESULT {.stdcall.}
    GetDesc1*: proc (This: ptr IDXGISwapChain1; pDesc: ptr DXGI_SWAP_CHAIN_DESC1): HRESULT {.
        stdcall.}
    GetFullscreenDesc*: proc (This: ptr IDXGISwapChain1; 
                              pDesc: ptr DXGI_SWAP_CHAIN_FULLSCREEN_DESC): HRESULT {.
        stdcall.}
    GetHwnd*: proc (This: ptr IDXGISwapChain1; pHwnd: ptr HWND): HRESULT {.
        stdcall.}
    GetCoreWindow*: proc (This: ptr IDXGISwapChain1; refiid: ptr IID; 
                          ppUnk: ptr pointer): HRESULT {.stdcall.}
    Present1*: proc (This: ptr IDXGISwapChain1; SyncInterval: UINT; 
                     PresentFlags: UINT; 
                     pPresentParameters: ptr DXGI_PRESENT_PARAMETERS): HRESULT {.
        stdcall.}
    IsTemporaryMonoSupported*: proc (This: ptr IDXGISwapChain1): BOOL {.stdcall.}
    GetRestrictToOutput*: proc (This: ptr IDXGISwapChain1; 
                                ppRestrictToOutput: ptr ptr IDXGIOutput): HRESULT {.
        stdcall.}
    SetBackgroundColor*: proc (This: ptr IDXGISwapChain1; pColor: ptr DXGI_RGBA): HRESULT {.
        stdcall.}
    GetBackgroundColor*: proc (This: ptr IDXGISwapChain1; pColor: ptr DXGI_RGBA): HRESULT {.
        stdcall.}
    SetRotation*: proc (This: ptr IDXGISwapChain1; Rotation: DXGI_MODE_ROTATION): HRESULT {.
        stdcall.}
    GetRotation*: proc (This: ptr IDXGISwapChain1; 
                        pRotation: ptr DXGI_MODE_ROTATION): HRESULT {.stdcall.}

  IDXGISwapChain1* = object 
    lpVtbl*: ptr IDXGISwapChain1Vtbl

  IDXGIFactory2Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIFactory2; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIFactory2): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIFactory2): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIFactory2; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGIFactory2; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGIFactory2; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGIFactory2; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    EnumAdapters*: proc (This: ptr IDXGIFactory2; Adapter: UINT; 
                         ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.stdcall.}
    MakeWindowAssociation*: proc (This: ptr IDXGIFactory2; WindowHandle: HWND; 
                                  Flags: UINT): HRESULT {.stdcall.}
    GetWindowAssociation*: proc (This: ptr IDXGIFactory2; 
                                 pWindowHandle: ptr HWND): HRESULT {.stdcall.}
    CreateSwapChain*: proc (This: ptr IDXGIFactory2; pDevice: ptr IUnknown; 
                            pDesc: ptr DXGI_SWAP_CHAIN_DESC; 
                            ppSwapChain: ptr ptr IDXGISwapChain): HRESULT {.
        stdcall.}
    CreateSoftwareAdapter*: proc (This: ptr IDXGIFactory2; Module: HMODULE; 
                                  ppAdapter: ptr ptr IDXGIAdapter): HRESULT {.
        stdcall.}
    EnumAdapters1*: proc (This: ptr IDXGIFactory2; Adapter: UINT; 
                          ppAdapter: ptr ptr IDXGIAdapter1): HRESULT {.stdcall.}
    IsCurrent*: proc (This: ptr IDXGIFactory2): BOOL {.stdcall.}
    IsWindowedStereoEnabled*: proc (This: ptr IDXGIFactory2): BOOL {.stdcall.}
    CreateSwapChainForHwnd*: proc (This: ptr IDXGIFactory2; 
                                   pDevice: ptr IUnknown; hWnd: HWND; 
                                   pDesc: ptr DXGI_SWAP_CHAIN_DESC1; 
        pFullscreenDesc: ptr DXGI_SWAP_CHAIN_FULLSCREEN_DESC; 
                                   pRestrictToOutput: ptr IDXGIOutput; 
                                   ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.
        stdcall.}
    CreateSwapChainForCoreWindow*: proc (This: ptr IDXGIFactory2; 
        pDevice: ptr IUnknown; pWindow: ptr IUnknown; 
        pDesc: ptr DXGI_SWAP_CHAIN_DESC1; pRestrictToOutput: ptr IDXGIOutput; 
        ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.stdcall.}
    GetSharedResourceAdapterLuid*: proc (This: ptr IDXGIFactory2; 
        hResource: HANDLE; pLuid: ptr LUID): HRESULT {.stdcall.}
    RegisterStereoStatusWindow*: proc (This: ptr IDXGIFactory2; 
                                       WindowHandle: HWND; wMsg: UINT; 
                                       pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    RegisterStereoStatusEvent*: proc (This: ptr IDXGIFactory2; hEvent: HANDLE; 
                                      pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    UnregisterStereoStatus*: proc (This: ptr IDXGIFactory2; dwCookie: DWORD) {.
        stdcall.}
    RegisterOcclusionStatusWindow*: proc (This: ptr IDXGIFactory2; 
        WindowHandle: HWND; wMsg: UINT; pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    RegisterOcclusionStatusEvent*: proc (This: ptr IDXGIFactory2; 
        hEvent: HANDLE; pdwCookie: ptr DWORD): HRESULT {.stdcall.}
    UnregisterOcclusionStatus*: proc (This: ptr IDXGIFactory2; dwCookie: DWORD) {.
        stdcall.}
    CreateSwapChainForComposition*: proc (This: ptr IDXGIFactory2; 
        pDevice: ptr IUnknown; pDesc: ptr DXGI_SWAP_CHAIN_DESC1; 
        pRestrictToOutput: ptr IDXGIOutput; ppSwapChain: ptr ptr IDXGISwapChain1): HRESULT {.
        stdcall.}

  IDXGIFactory2* = object 
    lpVtbl*: ptr IDXGIFactory2Vtbl

  DXGI_GRAPHICS_PREEMPTION_GRANULARITY* {.size: sizeof(cint).} = enum 
    DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY = 0, 
    DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY = 1, 
    DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY = 2, 
    DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY = 3, 
    DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY = 4
  DXGI_COMPUTE_PREEMPTION_GRANULARITY* {.size: sizeof(cint).} = enum 
    DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY = 0, 
    DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY = 1, 
    DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY = 2, 
    DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY = 3, 
    DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY = 4
  DXGI_ADAPTER_DESC2* = object 
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
    GraphicsPreemptionGranularity*: DXGI_GRAPHICS_PREEMPTION_GRANULARITY
    ComputePreemptionGranularity*: DXGI_COMPUTE_PREEMPTION_GRANULARITY

  IDXGIAdapter2Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIAdapter2; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIAdapter2): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIAdapter2): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIAdapter2; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGIAdapter2; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGIAdapter2; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGIAdapter2; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    EnumOutputs*: proc (This: ptr IDXGIAdapter2; Output: UINT; 
                        ppOutput: ptr ptr IDXGIOutput): HRESULT {.stdcall.}
    GetDesc*: proc (This: ptr IDXGIAdapter2; pDesc: ptr DXGI_ADAPTER_DESC): HRESULT {.
        stdcall.}
    CheckInterfaceSupport*: proc (This: ptr IDXGIAdapter2; 
                                  InterfaceName: ptr GUID; 
                                  pUMDVersion: ptr LARGE_INTEGER): HRESULT {.
        stdcall.}
    GetDesc1*: proc (This: ptr IDXGIAdapter2; pDesc: ptr DXGI_ADAPTER_DESC1): HRESULT {.
        stdcall.}
    GetDesc2*: proc (This: ptr IDXGIAdapter2; pDesc: ptr DXGI_ADAPTER_DESC2): HRESULT {.
        stdcall.}

  IDXGIAdapter2* = object 
    lpVtbl*: ptr IDXGIAdapter2Vtbl

  IDXGIOutput1Vtbl* = object 
    QueryInterface*: proc (This: ptr IDXGIOutput1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr IDXGIOutput1): ULONG {.stdcall.}
    Release*: proc (This: ptr IDXGIOutput1): ULONG {.stdcall.}
    SetPrivateData*: proc (This: ptr IDXGIOutput1; Name: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr IDXGIOutput1; Name: ptr GUID; 
                                    pUnknown: ptr IUnknown): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr IDXGIOutput1; Name: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    GetParent*: proc (This: ptr IDXGIOutput1; riid: ptr IID; 
                      ppParent: ptr pointer): HRESULT {.stdcall.}
    GetDesc*: proc (This: ptr IDXGIOutput1; pDesc: ptr DXGI_OUTPUT_DESC): HRESULT {.
        stdcall.}
    GetDisplayModeList*: proc (This: ptr IDXGIOutput1; EnumFormat: DXGI_FORMAT; 
                               Flags: UINT; pNumModes: ptr UINT; 
                               pDesc: ptr DXGI_MODE_DESC): HRESULT {.stdcall.}
    FindClosestMatchingMode*: proc (This: ptr IDXGIOutput1; 
                                    pModeToMatch: ptr DXGI_MODE_DESC; 
                                    pClosestMatch: ptr DXGI_MODE_DESC; 
                                    pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}
    WaitForVBlank*: proc (This: ptr IDXGIOutput1): HRESULT {.stdcall.}
    TakeOwnership*: proc (This: ptr IDXGIOutput1; pDevice: ptr IUnknown; 
                          Exclusive: BOOL): HRESULT {.stdcall.}
    ReleaseOwnership*: proc (This: ptr IDXGIOutput1) {.stdcall.}
    GetGammaControlCapabilities*: proc (This: ptr IDXGIOutput1; pGammaCaps: ptr DXGI_GAMMA_CONTROL_CAPABILITIES): HRESULT {.
        stdcall.}
    SetGammaControl*: proc (This: ptr IDXGIOutput1; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.}
    GetGammaControl*: proc (This: ptr IDXGIOutput1; 
                            pArray: ptr DXGI_GAMMA_CONTROL): HRESULT {.stdcall.}
    SetDisplaySurface*: proc (This: ptr IDXGIOutput1; 
                              pScanoutSurface: ptr IDXGISurface): HRESULT {.
        stdcall.}
    GetDisplaySurfaceData*: proc (This: ptr IDXGIOutput1; 
                                  pDestination: ptr IDXGISurface): HRESULT {.
        stdcall.}
    GetFrameStatistics*: proc (This: ptr IDXGIOutput1; 
                               pStats: ptr DXGI_FRAME_STATISTICS): HRESULT {.
        stdcall.}
    GetDisplayModeList1*: proc (This: ptr IDXGIOutput1; EnumFormat: DXGI_FORMAT; 
                                Flags: UINT; pNumModes: ptr UINT; 
                                pDesc: ptr DXGI_MODE_DESC1): HRESULT {.stdcall.}
    FindClosestMatchingMode1*: proc (This: ptr IDXGIOutput1; 
                                     pModeToMatch: ptr DXGI_MODE_DESC1; 
                                     pClosestMatch: ptr DXGI_MODE_DESC1; 
                                     pConcernedDevice: ptr IUnknown): HRESULT {.
        stdcall.}
    GetDisplaySurfaceData1*: proc (This: ptr IDXGIOutput1; 
                                   pDestination: ptr IDXGIResource): HRESULT {.
        stdcall.}
    DuplicateOutput*: proc (This: ptr IDXGIOutput1; pDevice: ptr IUnknown; 
                            ppOutputDuplication: ptr ptr IDXGIOutputDuplication): HRESULT {.
        stdcall.}

  IDXGIOutput1* = object 
    lpVtbl*: ptr IDXGIOutput1Vtbl

const DXGI_ENUM_MODES_STEREO*: culong = 4
const DXGI_ENUM_MODES_DISABLED_STEREO*: culong = 8
const DXGI_SHARED_RESOURCE_READ*: culong = 0x80000000
const DXGI_SHARED_RESOURCE_WRITE*: culong = 1

var IID_IDXGIDisplayControl* {.importc.} : GUID

var IID_IDXGIOutputDuplication* {.importc.} : GUID

var IID_IDXGISurface2* {.importc.} : GUID

var IID_IDXGIResource1* {.importc.} : GUID

var IID_IDXGIDevice2* {.importc.} : GUID

var IID_IDXGISwapChain1* {.importc.} : GUID

var IID_IDXGIFactory2* {.importc.} : GUID

var IID_IDXGIAdapter2* {.importc.} : GUID

var IID_IDXGIOutput1* {.importc.} : GUID

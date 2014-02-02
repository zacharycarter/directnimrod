import windows
import DXGI
type D3D_DRIVER_TYPE = enum
  D3D_DRIVER_TYPE_UNKNOWN    = 0,
  D3D_DRIVER_TYPE_HARDWARE   = 1,
  D3D_DRIVER_TYPE_REFERENCE  = 2,
  D3D_DRIVER_TYPE_NULL       = 3,
  D3D_DRIVER_TYPE_SOFTWARE   = 4,
  D3D_DRIVER_TYPE_WARP       = 5

type D3D_FEATURE_LEVEL = enum
  D3D_FEATURE_LEVEL_9_1   = 0x9100,
  D3D_FEATURE_LEVEL_9_2   = 0x9200,
  D3D_FEATURE_LEVEL_9_3   = 0x9300,
  D3D_FEATURE_LEVEL_10_0  = 0xa000,
  D3D_FEATURE_LEVEL_10_1  = 0xa100,
  D3D_FEATURE_LEVEL_11_0  = 0xb000,
  D3D_FEATURE_LEVEL_11_1  = 0xb100
  
discard """
type IDXGIAdapterVtbl = object
  QueryInterface: ptr proc (This: ptr IDXGIAdapter, riid: PIID, ppvObject: ptr pointer): HRESULT {.stdcall.}
  AddRef: ptr proc(This: ptr IDXGIObject): culong {.stdcall.}
  Release: ptr proc(This: ptr IDXGIObject): culong {.stdcall.}
  
"""
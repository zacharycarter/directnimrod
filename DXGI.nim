import windows
import Unknwnbase
type IDXGIOutput = object
type IDXGIObjectVtbl[T] = object
  baseVtbl: IUnknownVtbl[T]
  SetPrivateData: ptr proc(This: ptr T, Name: PGUID, DataSize: cuint, pData: pointer): HRESULT {.stdcall.}
  SetPrivateDataInterface: ptr proc(This: ptr T, Name: PGUID, pUnknown: ptr IUnknown): HRESULT {.stdcall.}
  GetPrivateData: ptr proc(This: ptr T, Name: PGUID, pDataSize: ptr cuint, pData: pointer): HRESULT {.stdcall.}
  GetParent: ptr proc(This: ptr T, riid: PIID, ppParent: ptr pointer): HRESULT {.stdcall.}
type IDXGIObject = object
  baseVtbl: IUnknownVtbl[IDXGIObject]


type IDXGIAdapterVtbl[T] = object
  baseVtbl: IDXGIObject[T]
  EnumOutputs: ptr proc(This: ptr IDXGIAdapter, output: UINT, ppOutput: ptr ptr IDXGIOutput): HRESULT {.stdcall.}

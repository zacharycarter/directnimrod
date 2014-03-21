import windows

type
  
  IUnknownVtbl*[T] = object
    QueryInterface: ptr proc (This: ptr T, riid: PIID, ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef: ptr proc (This: ptr T): ULONG {.stdcall.}
    Release: ptr proc (This: ptr T): ULONG {.stdcall.}
  IUnknown* = object
    lpVtbl: ptr IUnknownVtbl[pointer]

type Vtbl*[T] = object
  thisproc: ptr proc(this: ptr T, data: ptr pointer) {.stdcall.}
type Impl* = object
  lpVtbl: Vtbl[Impl]
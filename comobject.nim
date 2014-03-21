type notGeneric = object
  thing: int
type Vtbl*[T] = object
  thisproc: ptr proc(this: ptr T, data: ptr pointer) {.stdcall.}
type Impl* = object
  lpVtbl: string[Impl]
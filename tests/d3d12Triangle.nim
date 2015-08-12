import windows
import dxgi
import d3d12

const winClass = "directNimrod"

#direct3D globals
var debugLayer: ptr ID3D12Debug

proc InitializePipeline() =
  var result: HRESULT
  result = D3D12GetDebugInterface(IID_ID3D12Debug, addr debugLayer)

# windows API related things
proc WndProc(wnd: HWND, message: int32, wp: WPARAM, lp: LPARAM): LRESULT {.stdcall.} =
  var
    wmId: cint
    wmEvent: cint
    ps: PAINTSTRUCT
    hdcr: HDC
  case message:
    of WM_DESTROY:
      PostQuitMessage(0)
    else:
      return windows.DefWindowProc(wnd, message, wp, lp)
  return 0.LRESULT

proc main() =
  var wcex: WNDCLASSEX
  wcex.cbSize = sizeof(WNDCLASSEX).int32
  wcex.lpfnWndProc = WndProc
  wcex.style = CS_HREDRAW or CS_VREDRAW
  wcex.cbClsExtra = 0
  wcex.cbWndExtra = 0
  wcex.hinstance = GetModuleHandle(nil)
  wcex.hIcon = LoadIcon(0, IDI_APPLICATION)
  wcex.hCursor = LoadCursor(0, IDC_ARROW)
  wcex.hbrBackground = cast[HBRUSH](COLOR_WINDOW+1)
  wcex.lpszMenuName = nil
  wcex.lpszClassName = winClass
  wcex.hIconSm = 0
  echo(sizeof(WNDCLASSEX))
  var class = RegisterClassEx(addr wcex)
  if class == 0:
    quit("could not create win class " & $GetLastError())
  
  var wnd: HWND
  wnd = CreateWindow(winClass, winClass, WS_OVERLAPPEDWINDOW,
                      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, 0,
                      0, GetModuleHandle(nil), nil)
  if wnd == 0:
    quit("failed to make hwnd")

  InitializePipeline()
  discard ShowWindow(wnd, 10)
  discard UpdateWindow(wnd)
  var message: MSG
  while message.message != WM_QUIT:
    if PeekMessage(addr message, cast[HWND](nil), 0, 0, PM_REMOVE) > 0:
      discard TranslateMessage(addr message)
      discard DispatchMessage(addr message)

main()


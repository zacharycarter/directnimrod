import windows
import dxgi
import d3d12

const winClass = "directNimrod"

#direct3D globals
var debugLayer: ptr ID3D12Debug
var device: ptr ID3D12Device
var commandQueue: ptr ID3D12CommandQueue

proc InitializePipeline() =
  var result: HRESULT
  result = D3D12GetDebugInterface(addr IID_ID3D12Debug, cast[ptr pointer](addr debugLayer))
  if result != S_OK: quit("Could not get debug interface")
  result = D3D12CreateDevice(nil, D3D_FEATURE_LEVEL_12_1, addr IID_ID3D12Device, cast[ptr pointer](addr device))
  if result != S_OK: quit("could not create the device")

  #create the direct3D command queue
  D3D12_COMMAND_QUEUE_DESC queueDesc
  queueDesc.Flags = D3D12_COMMAND_QUEUE_FLAG_NONE
  queueDesc.Type = D3D12_COMMAND_LIST_TYPE_DIRECT

  result = device.lpVtbl.CreateCommandQueue(device, addr IID_ID3D12CommandQueue, cast[ptr pointer](addr commandQueue))
  if result != S_OK: quit("could not create the command queue")
  

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


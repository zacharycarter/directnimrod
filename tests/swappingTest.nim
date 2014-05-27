# this test program should display a solid red window
# just over 100 lines, not half bad :D

import windows
import dxgi
import d3d11
var winClass = "nimrodWindow"
var device: ptr ID3D11Device
var ctx: ptr ID3D11DeviceContext
var rtv: ptr ID3D11RenderTargetView
var swapChain: ptr IDXGISwapChain
proc Update()
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
  
proc Update() =
  var color: array[4, float32]
  color[0] = 1.0
  assert(ctx != nil)
  assert(rtv != nil)
  ctx.lpVtbl.ClearRenderTargetView(ctx, rtv, color)
  discard swapChain.lpVtbl.Present(swapChain, 1,0)


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
  
  #d3d stuff
  
  var swapChainDesc: DXGI_SWAP_CHAIN_DESC
  swapChainDesc.BufferDesc.width = 0
  swapChainDesc.BufferDesc.height = 0
  swapChainDesc.BufferDesc.RefreshRate.Numerator = 60
  swapChainDesc.BufferDesc.RefreshRate.Denominator = 1
  swapChainDesc.BufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM
  swapChainDesc.BufferDesc.ScanlineOrdering = DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED
  swapChainDesc.BufferDesc.Scaling = DXGI_MODE_SCALING_UNSPECIFIED
  swapChainDesc.SampleDesc.Count = 1
  swapChainDesc.SampleDesc.Quality = 0
  swapChainDesc.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT
  swapChainDesc.BufferCount = 1
  swapChainDesc.OutputWindow = wnd
  swapChainDesc.Windowed = true
  swapChainDesc.SwapEffect = DXGI_SWAP_EFFECT_DISCARD
  swapChainDesc.Flags = 0


  var flags: int32
  flags = D3D11_CREATE_DEVICE_DEBUG.int32
  var result = D3D11CreateDeviceAndSwapChain(nil, D3D_DRIVER_TYPE_HARDWARE,
                                0, flags, nil, 0, D3D11_SDK_VERSION,
                                addr swapChainDesc, addr swapChain,
                                addr device, nil, addr ctx)
  
  

  if result != S_OK:
    quit("create device failed " & $result)
  
  var pBackBuffer: ptr ID3D11Texture2D
  echo(repr(pBackBuffer))
  echo repr(IID_ID3D11Texture2D)
  result = swapChain.lpvtbl.GetBuffer(swapChain, 0, addr IID_ID3D11Texture2D, cast[ptr LPVOID](addr pBackBuffer))
  if result != S_OK:
    quit("could not get back buffer " & $result)
  var rtvdesc: D3D11_RENDER_TARGET_VIEW_DESC
  rtvdesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM
  rtvdesc.ViewDimension = D3D11_RTV_DIMENSION_TEXTURE2D
  rtvdesc.Union.Texture2D.MipSlice = 0
  result = device.lpvtbl.CreateRenderTargetView(device, cast[ptr ID3D11Resource](pBackBuffer), addr rtvdesc, addr rtv)
  if result != S_OK:
    quit("could not create the render target view " & $result)
  ctx.lpvtbl.OMSetRenderTargets(ctx, 1, addr rtv, nil)
  
  discard ShowWindow(wnd, 10)
  discard UpdateWindow(wnd)
  var message: MSG
  while(message.message != WM_QUIT):
    if PeekMessage(addr message, cast[HWND](nil), 0, 0, PM_REMOVE) > 0:
      discard TranslateMessage(addr message)
      discard DispatchMessage(addr message)
    else:
      Update()
  programResult = cast[int](message.wparam)
  
main()

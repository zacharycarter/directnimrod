# this test program should display a solid red window
# just over 100 lines, not half bad :D

import windows
import dxgi
import d3d11
import unsigned
var winClass = "nimrodWindow"
var device: ptr ID3D11Device
var ctx: ptr ID3D11DeviceContext
var rtv: ptr ID3D11RenderTargetView
var swapChain: ptr IDXGISwapChain
var VertexShader: ptr ID3D11VertexShader
var PixelShader: ptr ID3D11PixelShader
var vertexBuffer: ptr ID3D11Buffer
var indexBuffer: ptr ID3D11Buffer
var inputLayout: ptr ID3D11InputLayout
var verts: array[0..5, float32] = [-0.5'f32, -0.5, 0.0, 0.5, 0.5, -0.5]
var index: array[0..2, uint16] = [0.uint16, 1, 2]


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
  ctx.lpvtbl.OMSetRenderTargets(ctx, 1, addr rtv, nil)
  ctx.lpVtbl.ClearRenderTargetView(ctx, rtv, color)
  ctx.lpvtbl.IASetInputLayout(ctx, inputLayout)
  var stride: uint32 = sizeof(float32) * 2
  var offset: uint32 = 0
  ctx.lpvtbl.IASetVertexBuffers(ctx, 0.uint32, 1.uint32, addr vertexBuffer, addr stride, addr offset)
  ctx.lpvtbl.IASetIndexBuffer(ctx, indexBuffer, DXGI_FORMAT_R16_UINT, 0)
  ctx.lpvtbl.IASetPrimitiveTopology(ctx, D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST)
  ctx.lpvtbl.VSSetShader(ctx, vertexShader, nil, 0)
  ctx.lpvtbl.PSSetShader(ctx, pixelShader, nil, 0)
  ctx.lpvtbl.DrawIndexed(ctx, len(index).uint32, 0, 0)

  var result = swapChain.lpVtbl.Present(swapChain, 1,0)
  if result != S_OK:
    quit("could not swap buffers")

proc BindShaders() =
  var VSFile = open("SimpleVertexShader.cso")
  var PSFile = open("SimplePixelShader.cso")
  var VSData: seq[int8]
  var PSData: seq[int8]
  newSeq(VSData, getFileSize(VSFile).int)
  newSeq(PSData, getFileSize(PSFile).int)
  discard readBytes(VSFile, VSData, 0, len(VSData))
  discard readBytes(PSFile, PSData, 0, len(PSData))
  close(VSFile)
  close(PSFile)
  var result: HRESULT
  result = device.lpvtbl.CreateVertexShader(device, addr VSData[0], len(VSData), nil, addr VertexShader)
  if result != S_OK:
    quit("could not make the vertex shader")
  result = device.lpvtbl.CreatePixelShader(device, addr PSData[0], len(PSData), nil, addr PixelShader)
  if result != S_OK:
    quit("could not make the pixel shader")
  var inputLayoutDesc: array[0..0, D3D11_INPUT_ELEMENT_DESC]
  inputLayoutDesc[0].SemanticName = "POSITION"
  inputLayoutDesc[0].SemanticIndex = 0
  inputLayoutDesc[0].Format = DXGI_FORMAT_R32G32_FLOAT
  inputLayoutDesc[0].InputSlot = 0
  inputLayoutDesc[0].AlignedByteOffset = 0
  inputLayoutDesc[0].InputSlotClass = D3D11_INPUT_PER_VERTEX_DATA
  inputLayoutDesc[0].InstanceDataStepRate = 0

  result = device.lpvtbl.CreateInputLayout(device, addr inputLayoutDesc[0], len(inputLayoutDesc).uint32, addr VSData[0], len(VSData), addr inputLayout)
  if result != S_OK:
    quit("could not create the input layout")

  var bufferDesc: D3D11_BUFFER_DESC
  bufferDesc.ByteWidth = sizeof(float32) * len(verts)
  bufferDesc.Usage = D3D11_USAGE_DEFAULT
  bufferDesc.BindFlags = D3D11_BIND_VERTEX_BUFFER.uint32
  bufferDesc.CPUAccessFlags = 0
  bufferDesc.MiscFlags = 0
  bufferDesc.StructureByteStride = 0

  var vbdata: D3D11_SUBRESOURCE_DATA
  vbdata.pSysMem = addr verts[0]
  vbdata.SysMemPitch = 0
  vbdata.SysMemSlicePitch = 0

  result = device.lpvtbl.CreateBuffer(device, addr bufferDesc, addr vbdata, addr VertexBuffer)
  if result != S_OK:
    quit("could not create the vertex buffer")

  var indexBufferDesc: D3D11_BUFFER_DESC
  indexBufferDesc.ByteWidth = sizeof(uint16) * len(index)
  indexBufferDesc.Usage = D3D11_USAGE_DEFAULT
  indexBufferDesc.BindFlags = D3D11_BIND_INDEX_BUFFER.uint32
  indexBufferDesc.CPUAccessFlags = 0
  indexBufferDesc.MiscFlags = 0
  indexBufferDesc.StructureByteStride = 0

  var indexBufferData: D3D11_SUBRESOURCE_DATA
  indexBufferData.pSysMem = addr index[0]
  indexBufferData.SysMemPitch = 0
  indexBufferData.SysMemSlicePitch = 0

  result = device.lpvtbl.CreateBuffer(device, addr indexBufferDesc, addr indexBufferData, addr indexBuffer)
  if result != S_OK:
    quit("could not create the index buffer")

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


  var flags: uint32
  flags = D3D11_CREATE_DEVICE_DEBUG.uint32
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
  
  var backBufferDesc: D3D11_TEXTURE2D_DESC
  pBackBuffer.lpvtbl.GetDesc(pBackBuffer, addr backBufferDesc)

  var viewport: D3D11_VIEWPORT
  viewport.TopLeftX = 0.0'f32
  viewport.TopLeftY = 0.0'f32
  viewport.Width = backBufferDesc.Width.float32
  viewport.Height = backBufferDesc.Height.float32
  viewport.MinDepth = D3D11_MIN_DEPTH
  viewport.MaxDepth = D3D11_MAX_DEPTH
  ctx.lpvtbl.RSSetViewports(ctx, 1, addr viewport)
  
  ctx.lpvtbl.OMSetRenderTargets(ctx, 1, addr rtv, nil)


  BindShaders()
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

import windows
import dxgi, dxgi1_2, dxgi1_3, dxgi1_4
import d3d12
import d3dcompiler
import Unknwn
{.warning[ProveInit]: off.}
const winClass = "directNimrod"
#rendering constants
const width = 800
const height = 600

#direct3D globals
var debugLayer: ptr ID3D12Debug
var device: ptr ID3D12Device
var commandQueue: ptr ID3D12CommandQueue
var swapChain: ptr IDXGISwapChain3
var factory: ptr IDXGIFactory4
var rtvHeap: ptr ID3D12DescriptorHeap
var rtvDescriptorSize: uint32
var renderTargets: array[0..1, ptr ID3D12Resource]
var commandAllocator: ptr ID3D12CommandAllocator
var rootSignature: ptr ID3D12RootSignature
var pipelineState: ptr ID3D12PipelineState
var commandList: ptr ID3D12GraphicsCommandList
var vertexBuffer: ptr ID3D12Resource
var vertexBufferView: D3D12_VERTEX_BUFFER_VIEW
var fence: ptr ID3D12Fence
var fenceEvent: HANDLE
var fenceValue: uint64
var frameIndex: uint32
var viewport: D3D12_VIEWPORT
var scissorRect: D3D12_RECT

type Vertex = object
  position: array[3, float32]
  color: array[4, float32]
proc WaitForPreviousFrame() =
  var hr: HRESULT
  let fenceV = fenceValue
  hr = commandQueue.lpVtbl.Signal(commandQueue, fence, fenceV)
  if hr != S_OK: quit("signal failed")
  inc(fenceValue)

  if fence.lpVtbl.GetCompletedValue(fence) < fenceV:
    hr = fence.lpVtbl.SetEventOnCompletion(fence, fenceV, fenceEvent)
    #DWORD in nim is int32, this is wrong but w/e
    #they have the same size
    discard WaitForSingleObject(fenceEvent, cast[DWORD](high(uint32)))

  frameIndex = swapChain.lpVtbl.GetCurrentBackBufferIndex(swapChain)

proc InitializePipeline(hwnd: HWND) =
  viewport.Width = float32(width)
  viewport.Height = float32(height)
  viewport.MaxDepth = 1.0'f32

  scissorRect.right = int32(width)
  scissorRect.bottom = int32(height)

  var result: HRESULT
  result = D3D12GetDebugInterface(addr IID_ID3D12Debug, cast[ptr pointer](addr debugLayer))
  if result != S_OK: quit("Could not get debug interface")
  debugLayer.lpVtbl.EnableDebugLayer(debugLayer)
  result = CreateDXGIFactory1(addr IID_IDXGIFactory4, cast[ptr pointer](addr factory))
  if result != S_OK: quit("Could not create factory interface")

  # this code creates a "real device"
  result = D3D12CreateDevice(nil, D3D_FEATURE_LEVEL_11_0, addr IID_ID3D12Device, cast[ptr pointer](addr device))
  if result != S_OK: quit("could not create the device")

  #create a WARP device
  #var warpAdapter: ptr IDXGIAdapter
  #result = factory.lpVtbl.EnumWarpAdapter(factory, addr IID_IDXGIAdapter, cast[ptr pointer](addr warpAdapter))
  #if result != S_OK: quit("could not enum warp adapter")
  #result = D3D12CreateDevice(cast[ptr IUnknown](warpAdapter), D3D_FEATURE_LEVEL_11_0, addr IID_ID3D12Device, cast[ptr pointer](addr device))
  #if result != S_OK: quit("could not create WARP adapter")

  #create the direct3D command queue
  var queueDesc: D3D12_COMMAND_QUEUE_DESC
  queueDesc.Flags = D3D12_COMMAND_QUEUE_FLAG_NONE
  queueDesc.Type = D3D12_COMMAND_LIST_TYPE_DIRECT

  result = device.lpVtbl.CreateCommandQueue(device, addr queueDesc, addr IID_ID3D12CommandQueue, cast[ptr pointer](addr commandQueue))
  if result != S_OK: quit("could not create the command queue")
  var tmpSwapChain: ptr IDXGISwapChain
  var swapChainDesc: DXGI_SWAP_CHAIN_DESC
  swapChainDesc.BufferCount = 2
  swapChainDesc.BufferDesc.Width = width
  swapChainDesc.BufferDesc.Height = height
  swapChainDesc.BufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM
  swapChainDesc.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT
  swapChainDesc.SwapEffect = DXGI_SWAP_EFFECT_FLIP_DISCARD
  swapChainDesc.OutputWindow = hwnd
  swapChainDesc.SampleDesc.Count = 1
  swapChainDesc.Windowed = WINBOOL(true)
  result = factory.lpVtbl.CreateSwapChain(factory, cast[ptr IUnknown](commandQueue), addr swapChainDesc, addr tmpSwapChain)
  if result != S_OK: quit("could not create the swap chain")
  result = tmpSwapChain.lpVtbl.QueryInterface(tmpSwapChain, addr IID_IDXGISwapChain3, cast[ptr pointer](addr swapChain))
  if result != S_OK: quit("could not QI to SwapChain3")
  #discard tmpSwapChain.lpVtbl.Release(tmpSwapChain)
  #tmpSwapChain = nil

  frameIndex = swapChain.lpVtbl.GetCurrentBackBufferIndex(swapChain)

  #create descriptor heaps
  var rtvHeapDesc: D3D12_DESCRIPTOR_HEAP_DESC
  rtvHeapDesc.NumDescriptors = 2
  rtvHeapDesc.Type = D3D12_DESCRIPTOR_HEAP_TYPE_RTV
  rtvHeapDesc.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_NONE
  result = device.lpVtbl.CreateDescriptorHeap(device, addr rtvHeapDesc, addr IID_ID3D12DescriptorHeap, cast[ptr pointer](addr rtvHeap))
  if result != S_OK: quit("could not create descriptor heap")
  rtvDescriptorSize = device.lpVtbl.GetDescriptorHandleIncrementSize(device, D3D12_DESCRIPTOR_HEAP_TYPE_RTV)

  #create frame resources
  var rtvHandle: D3D12_CPU_DESCRIPTOR_HANDLE
  discard rtvHeap.lpVtbl.GetCPUDescriptorHandleForHeapStart(rtvHeap, addr rtvHandle)
  for n in 0..1:
    result = swapChain.lpVtbl.GetBuffer(swapChain, uint32(n), addr IID_ID3D12Resource, cast[ptr pointer](addr renderTargets[n]))
    if result != S_OK: quit("could not get render target")
    device.lpVtbl.CreateRenderTargetView(device, renderTargets[n], nil, rtvHandle)
    rtvHandle.`ptr` += SIZE_T(rtvDescriptorSize)

  result = device.lpVtbl.CreateCommandAllocator(device, D3D12_COMMAND_LIST_TYPE_DIRECT, addr IID_ID3D12CommandAllocator, cast[ptr pointer](addr commandAllocator))
  if result != S_OK: quit("could not create command commandAllocator")


#asset loading
proc LoadAssets() =
  var rootSignatureDesc: D3D12_ROOT_SIGNATURE_DESC
  rootSignatureDesc.NumParameters = 0
  rootSignatureDesc.pParameters = nil
  rootSignatureDesc.NumStaticSamplers = 0
  rootSignatureDesc.pStaticSamplers = nil
  rootSignatureDesc.Flags = D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT

  var signature: ptr ID3DBlob
  var error: ptr ID3DBlob
  var hr: HRESULT
  hr = D3D12SerializeRootSignature(addr rootSignatureDesc, D3D_ROOT_SIGNATURE_VERSION_1, addr signature, addr error)
  if hr != S_OK: quit("could not serialize the root signature")
  hr = device.lpVtbl.CreateRootSignature(device, 0,
    signature.lpVtbl.GetBufferPointer(signature),
    signature.lpVtbl.GetBufferSize(signature),
    addr IID_ID3D12RootSignature, cast[ptr pointer](addr rootSignature))
  if hr != S_OK: quit("could not create root signature")

  #create the pipeline state
  #var vertexShader: ptr ID3DBlob
  #var pixelShader: ptr ID3DBlob

  #var compilerFlags: uint32 = D3DCOMPILE_DEBUG or D3DCOMPILE_SKIP_OPTIMIZATION
  var VSFile = open("dx12VertexShader.cso")
  var PSFile = open("dx12PixelShader.cso")
  var VSData: seq[uint8]
  var PSData: seq[uint8]
  newSeq(VSData, getFileSize(VSFile).int)
  newSeq(PSData, getFileSize(PSFile).int)
  discard readBytes(VSFile, VSData, 0, len(VSData))
  discard readBytes(PSFile, PSData, 0, len(PSData))
  close(VSFile)
  close(PSFile)


  #hr = D3DCompileFromFile("dx12Shaders.hlsl", nil, nil, "VSMain", "vs_5_0", int32(compilerFlags), int32(0), addr vertexShader, nil)
  #if hr != S_OK: quit("could not compile vertex shader")
  #hr = D3DCompileFromFile("dx12Shaders.hlsl", nil, nil, "PSMain", "ps_5_0", compilerFlags, 0, addr pixelShader, nil)
  #if hr != S_OK: quit("could not compile pixel shader")

  # define the input layout
  var inputElementDesc: array[0..1, D3D12_INPUT_ELEMENT_DESC]
  inputElementDesc[0].SemanticName = "POSITION"
  inputElementDesc[0].SemanticIndex = 0
  inputElementDesc[0].Format = DXGI_FORMAT_R32G32B32_FLOAT
  inputElementDesc[0].InputSlot = 0
  inputElementDesc[0].AlignedByteOffset = 0
  inputElementDesc[0].InputSlotClass = D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA
  inputElementDesc[0].InstanceDataStepRate = 0

  inputElementDesc[1].SemanticName = "COLOR"
  inputElementDesc[1].SemanticIndex = 0
  inputElementDesc[1].Format = DXGI_FORMAT_R32G32B32A32_FLOAT
  inputElementDesc[1].InputSlot = 0
  inputElementDesc[1].AlignedByteOffset = 12
  inputElementDesc[1].InputSlotClass = D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA
  inputElementDesc[1].InstanceDataStepRate = 0

  #describe and create the PSO
  var defaultRTBlendDesc: D3D12_RENDER_TARGET_BLEND_DESC
  defaultRTBlendDesc.BlendEnable = false.WINBOOL
  defaultRTBlendDesc.LogicOpEnable = false.WINBOOL
  defaultRTBlendDesc.SrcBlend = D3D12_BLEND_ONE
  defaultRTBlendDesc.DestBlend = D3D12_BLEND_ZERO
  defaultRTBlendDesc.BlendOp = D3D12_BLEND_OP_ADD
  defaultRTBlendDesc.SrcBlendAlpha = D3D12_BLEND_ONE
  defaultRTBlendDesc.DestBlendAlpha = D3D12_BLEND_ZERO
  defaultRTBlendDesc.BlendOpAlpha = D3D12_BLEND_OP_ADD
  defaultRTBlendDesc.LogicOp = D3D12_LOGIC_OP_NOOP
  defaultRTBlendDesc.RenderTargetWriteMask = D3D12_COLOR_WRITE_ENABLE_ALL.ord.uint8

  var psoDesc: D3D12_GRAPHICS_PIPELINE_STATE_DESC
  psoDesc.InputLayout.pInputElementDescs = addr inputElementDesc[0]
  psoDesc.InputLayout.NumElements = len(inputElementDesc).uint32
  psoDesc.pRootSignature = rootSignature
  psoDesc.VS.pShaderBytecode = addr VSData[0]
  psoDesc.VS.BytecodeLength = len(VSData)
  psoDesc.PS.pShaderBytecode = addr PSData[0]
  psoDesc.PS.BytecodeLength = len(PSData)
  psoDesc.RasterizerState.FillMode = D3D12_FILL_MODE_SOLID
  psoDesc.RasterizerState.CullMode = D3D12_CULL_MODE_BACK
  psoDesc.RasterizerState.FrontCounterClockwise = false.WINBOOL
  psoDesc.RasterizerState.DepthBias = D3D12_DEFAULT_DEPTH_BIAS
  psoDesc.RasterizerState.SlopeScaledDepthBias = D3D12_DEFAULT_SLOPE_SCALED_DEPTH_BIAS
  psoDesc.RasterizerState.DepthClipEnable = true.WINBOOL
  psoDesc.RasterizerState.MultisampleEnable = false.WINBOOL
  psoDesc.RasterizerState.AntialiasedLineEnable = false.WINBOOL
  psoDesc.RasterizerState.ForcedSampleCount = 0
  psoDesc.RasterizerState.ConservativeRaster = D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF
  psoDesc.BlendState.AlphaToCoverageEnable = false.WINBOOL
  psoDesc.BlendState.IndependentBlendEnable = false.WINBOOL
  for i in 0..D3D12_SIMULTANEOUS_RENDER_TARGET_COUNT-1:
    psoDesc.BlendState.RenderTarget[i] = defaultRTBlendDesc
  psoDesc.DepthStencilState.DepthEnable = false.WINBOOL
  psoDesc.DepthStencilState.StencilEnable = false.WINBOOL
  psoDesc.SampleMask = high(uint32)
  psoDesc.PrimitiveTopologyType = D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE
  psoDesc.NumRenderTargets = 1
  psoDesc.RTVFormats[0] = DXGI_FORMAT_R8G8B8A8_UNORM
  psoDesc.SampleDesc.Count = 1
  hr = device.lpVtbl.CreateGraphicsPipelineState(device, addr psoDesc, addr IID_ID3D12PipelineState, cast[ptr pointer](addr pipelineState))
  if hr != S_OK: quit("could not create pipeline state")

  #create the command list
  hr = device.lpVtbl.CreateCommandList(device, 0.uint32, D3D12_COMMAND_LIST_TYPE_DIRECT, commandAllocator, pipelineState, addr IID_ID3D12GraphicsCommandList, cast[ptr pointer](addr commandList))
  if hr != S_OK: quit("could not create the command list")

  #command list was created in the open state but the main loop
  #expects it to be closed, so we close it now
  hr = commandList.lpVtbl.Close(commandList)
  if hr != S_OK: quit("could not close command list")

  #create the vertex buffer
  #define the geometry for the triangle
  var triangleVertices = [
    Vertex(position: [0.0'f32, 0.25, 0.0], color: [1.0'f32, 0.0, 0.0, 1.0]),
    Vertex(position: [0.25'f32, -0.25, 0.0], color: [0.0'f32, 1.0, 0.0, 1.0]),
    Vertex(position: [-0.25'f32, -0.25, 0.0], color: [0.0'f32, 0.0, 1.0, 1.0])
  ]
  var vertexBufferSize: uint32 = sizeof(triangleVertices).uint32

  #note: using upload heaps to transfer static data like vert buffers
  # is not recommended. Every time the GPU needs it the upload heap
  # will be marshalled over. Please read up on Default heap usage.
  # un upload heap is used here from simplicity and vecause there
  # are so few verts
  var defaultHeapProps: D3D12_HEAP_PROPERTIES
  defaultHeapProps.Type = D3D12_HEAP_TYPE_UPLOAD
  defaultHeapProps.CPUPageProperty = D3D12_CPU_PAGE_PROPERTY_UNKNOWN
  defaultHeapProps.MemoryPoolPreference = D3D12_MEMORY_POOL_UNKNOWN
  defaultHeapProps.CreationNodeMask = 1
  defaultHeapProps.VisibleNodeMask = 1
  var bufferProps: D3D12_RESOURCE_DESC
  bufferProps.Dimension = D3D12_RESOURCE_DIMENSION_BUFFER
  bufferProps.Alignment = 0
  bufferProps.Width = vertexBufferSize
  bufferProps.Height = 1
  bufferProps.DepthOrArraySize = 1
  bufferProps.MipLevels = 1
  bufferProps.Format = DXGI_FORMAT_UNKNOWN
  bufferProps.SampleDesc.Count = 1
  bufferProps.SampleDesc.Quality = 0
  bufferProps.Layout = D3D12_TEXTURE_LAYOUT_ROW_MAJOR
  bufferProps.Flags = D3D12_RESOURCE_FLAG_NONE
  hr = device.lpVtbl.CreateCommittedResource(device,
    addr defaultHeapProps,
    D3D12_HEAP_FLAG_NONE,
    addr bufferProps,
    D3D12_RESOURCE_STATE_GENERIC_READ,
    nil,
    addr IID_ID3D12Resource,
    cast[ptr pointer](addr vertexBuffer)
    )
  if hr != S_OK: quit("could not create vertex buffer")
  #copy the triangle data to the vertex buffer
  var dataBegin: pointer
  hr = vertexBuffer.lpVtbl.Map(vertexBuffer, 0, nil, cast[ptr pointer](addr dataBegin))
  if hr != S_OK: quit("could not map buffer")
  copyMem(dataBegin, addr triangleVertices[0], sizeof(triangleVertices))
  vertexBuffer.lpVtbl.Unmap(vertexBuffer, 0, nil)

  #initialize the vertex buffer view
  vertexBufferView.BufferLocation = vertexBuffer.lpVtbl.GetGPUVirtualAddress(vertexBuffer)
  vertexBufferView.StrideInBytes = sizeof(Vertex).uint32
  vertexBufferView.SizeInBytes = vertexBufferSize

  #create synchronization objects
  hr = device.lpVtbl.CreateFence(device, 0, D3D12_FENCE_FLAG_NONE, addr IID_ID3D12Fence, cast[ptr pointer](addr fence))
  if hr != S_OK: quit("could not create fence")
  fenceEvent = CreateEvent(nil, WINBOOL(false), WINBOOL(false), nil)
  if fenceEvent == 0:
    quit("could not create event error: " & $GetLastError())

  WaitForPreviousFrame()

proc PopulateCommandList() =
  var hr: HRESULT
  # Command list allocators can only be reset when the associated
  # command lists have finished execution on the GPU; apps should use
  # fences to determine GPU execution progress
  hr = commandAllocator.lpVtbl.Reset(commandAllocator)
  if hr != S_OK: quit("could not reset command allocator")

  #however when ExecuteCommandList() is called on a particular command list
  # that command list can then be reset at any time and must be before re-recording
  hr = commandList.lpVtbl.Reset(commandList, commandAllocator, pipelineState)

  #set the nessassary state
  commandList.lpVtbl.SetGraphicsRootSignature(commandList, rootSignature)
  commandList.lpVtbl.RSSetViewports(commandList, 1, addr viewport)
  commandList.lpVtbl.RSSetScissorRects(commandList, 1, addr scissorRect)

  #indicate the back buffer will be used as the render target
  var barrier: D3D12_RESOURCE_BARRIER
  barrier.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION
  barrier.Flags = D3D12_RESOURCE_BARRIER_FLAG_NONE
  barrier.Union.Transition.pResource = renderTargets[frameIndex]
  barrier.Union.Transition.StateBefore = D3D12_RESOURCE_STATE_PRESENT
  barrier.Union.Transition.StateAfter = D3D12_RESOURCE_STATE_RENDER_TARGET
  barrier.Union.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES.uint32
  commandList.lpVtbl.ResourceBarrier(commandList, 1, addr barrier)

  var descriptorHandle: D3D12_CPU_DESCRIPTOR_HANDLE
  discard rtvHeap.lpVtbl.GetCPUDescriptorHandleForHeapStart(rtvHeap, addr descriptorHandle)
  descriptorHandle.`ptr` += SIZE_T(frameIndex) * SIZE_T(rtvDescriptorSize)
  commandList.lpVtbl.OMSetRenderTargets(commandList, 1.uint32, addr descriptorHandle, false.WINBOOL, nil)

  #record commands
  var clearColor = [0.0'f32, 0.2'f32, 0.4'f32, 1.0'f32]
  commandList.lpVtbl.ClearRenderTargetView(commandList, descriptorHandle, clearColor, 0.uint32, nil)
  commandList.lpVtbl.IASetPrimitiveTopology(commandList, D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST)
  commandList.lpVtbl.IASetVertexBuffers(commandList, 0, 1, addr vertexBufferView)
  commandList.lpVtbl.DrawInstanced(commandList, 3, 1, 0, 0)
  var barrier2: D3D12_RESOURCE_BARRIER
  barrier2.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION
  barrier2.Flags = D3D12_RESOURCE_BARRIER_FLAG_NONE
  barrier2.Union.Transition.pResource = renderTargets[frameIndex]
  barrier2.Union.Transition.StateBefore = D3D12_RESOURCE_STATE_RENDER_TARGET
  barrier2.Union.Transition.StateAfter = D3D12_RESOURCE_STATE_PRESENT
  barrier2.Union.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES.uint32

  commandList.lpVtbl.ResourceBarrier(commandList, 1, addr barrier2)
  hr = commandList.lpVtbl.Close(commandList)
  if hr != S_OK: quit("could not close command list")


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
  var class = RegisterClassEx(addr wcex)
  if class == 0:
    quit("could not create win class " & $GetLastError())
  var winRect: RECTL
  winRect.left = 0
  winRect.top = 0
  winRect.right = width
  winRect.bottom = height
  discard AdjustWindowRect(cast[ptr TRECT](addr winRect), WS_OVERLAPPEDWINDOW, false.WINBOOL)
  var wnd: HWND
  wnd = CreateWindow(winClass, winClass, WS_OVERLAPPEDWINDOW,
                      CW_USEDEFAULT, 0, winRect.right - winRect.left, winRect.bottom - winRect.top, 0,
                      0, GetModuleHandle(nil), nil)
  if wnd == 0:
    quit("failed to make hwnd")
  var hr: HRESULT
  InitializePipeline(wnd)
  LoadAssets()
  discard ShowWindow(wnd, 10)
  discard UpdateWindow(wnd)

  var message: MSG
  while message.message != WM_QUIT:
    if PeekMessage(addr message, cast[HWND](nil), 0, 0, PM_REMOVE) > 0:
      discard TranslateMessage(addr message)
      discard DispatchMessage(addr message)
    PopulateCommandList()
    var ppCommandLists: array[1, ptr ID3D12CommandList] = [cast[ptr ID3D12CommandList](commandList)]
    commandQueue.lpVtbl.ExecuteCommandLists(commandQueue, 1, addr ppCommandLists[0])
    hr = swapChain.lpVtbl.Present(swapChain, 1, 0)
    if hr != S_OK: quit("could not present frame")
    WaitForPreviousFrame()

  #cleanup
  WaitForPreviousFrame()
  discard CloseHandle(fenceEvent)

main()

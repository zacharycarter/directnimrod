## DirectX bindings by Charlie Barto
## this mirrors the version of d3d11_1 distributed with windows 10
# Forward Declarations 
{.link: "dxguid.lib".}
{.link: "d3d11.lib".}
import windows
import dxgi
import dxgi1_2
import d3dcommon
import d3d11
type IID = TIID
type GUID = TGUID
type UINT = uint32
type INT = int32
type FLOAT = float32
type BOOL = int32
type UINT8 = uint8
type BYTE = cuchar
type UINT64 = uint64
type IUnknown = object

type 
  D3D11_COPY_FLAGS* = enum 
    D3D11_COPY_NO_OVERWRITE = 0x00000001, D3D11_COPY_DISCARD = 0x00000002
  D3D11_LOGIC_OP* = enum 
    D3D11_LOGIC_OP_CLEAR = 0, D3D11_LOGIC_OP_SET = (1), 
    D3D11_LOGIC_OP_COPY = (2), 
    D3D11_LOGIC_OP_COPY_INVERTED = (3), 
    D3D11_LOGIC_OP_NOOP = (4), 
    D3D11_LOGIC_OP_INVERT = (5), 
    D3D11_LOGIC_OP_AND = (6), 
    D3D11_LOGIC_OP_NAND = (7), 
    D3D11_LOGIC_OP_OR = (8), 
    D3D11_LOGIC_OP_NOR = (9), 
    D3D11_LOGIC_OP_XOR = (10), 
    D3D11_LOGIC_OP_EQUIV = (11), 
    D3D11_LOGIC_OP_AND_REVERSE = (12), 
    D3D11_LOGIC_OP_AND_INVERTED = (13), 
    D3D11_LOGIC_OP_OR_REVERSE = (14), 
    D3D11_LOGIC_OP_OR_INVERTED = (15)
  D3D11_RENDER_TARGET_BLEND_DESC1* = object 
    BlendEnable*: BOOL
    LogicOpEnable*: BOOL
    SrcBlend*: D3D11_BLEND
    DestBlend*: D3D11_BLEND
    BlendOp*: D3D11_BLEND_OP
    SrcBlendAlpha*: D3D11_BLEND
    DestBlendAlpha*: D3D11_BLEND
    BlendOpAlpha*: D3D11_BLEND_OP
    LogicOp*: D3D11_LOGIC_OP
    RenderTargetWriteMask*: UINT8

  D3D11_BLEND_DESC1* = object 
    AlphaToCoverageEnable*: BOOL
    IndependentBlendEnable*: BOOL
    RenderTarget*: array[8, D3D11_RENDER_TARGET_BLEND_DESC1]
type
  ID3D11BlendState1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11BlendState1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3D11BlendState1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11BlendState1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11BlendState1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3D11BlendState1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11BlendState1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11BlendState1; guid: ptr GUID; 
                                    pData: ptr IUnknown): HRESULT {.stdcall.}
    GetDesc*: proc (This: ptr ID3D11BlendState1; pDesc: ptr D3D11_BLEND_DESC) {.
        stdcall.}
    GetDesc1*: proc (This: ptr ID3D11BlendState1; pDesc: ptr D3D11_BLEND_DESC1) {.
        stdcall.}

  ID3D11BlendState1* = object 
    lpVtbl*: ptr ID3D11BlendState1Vtbl

  D3D11_RASTERIZER_DESC1* = object 
    FillMode*: D3D11_FILL_MODE
    CullMode*: D3D11_CULL_MODE
    FrontCounterClockwise*: BOOL
    DepthBias*: INT
    DepthBiasClamp*: FLOAT
    SlopeScaledDepthBias*: FLOAT
    DepthClipEnable*: BOOL
    ScissorEnable*: BOOL
    MultisampleEnable*: BOOL
    AntialiasedLineEnable*: BOOL
    ForcedSampleCount*: UINT

  ID3D11RasterizerState1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11RasterizerState1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3D11RasterizerState1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11RasterizerState1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11RasterizerState1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3D11RasterizerState1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11RasterizerState1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11RasterizerState1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}
    GetDesc*: proc (This: ptr ID3D11RasterizerState1; 
                    pDesc: ptr D3D11_RASTERIZER_DESC) {.stdcall.}
    GetDesc1*: proc (This: ptr ID3D11RasterizerState1; 
                     pDesc: ptr D3D11_RASTERIZER_DESC1) {.stdcall.}

  ID3D11RasterizerState1* = object 
    lpVtbl*: ptr ID3D11RasterizerState1Vtbl

  D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG* = enum 
    D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED = 0x00000001
  ID3DDeviceContextStateVtbl* = object 
    QueryInterface*: proc (This: ptr ID3DDeviceContextState; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3DDeviceContextState): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3DDeviceContextState): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3DDeviceContextState; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3DDeviceContextState; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3DDeviceContextState; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3DDeviceContextState; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}

  ID3DDeviceContextState* = object 
    lpVtbl*: ptr ID3DDeviceContextStateVtbl

type
  ID3D11DeviceContext1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11DeviceContext1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3D11DeviceContext1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11DeviceContext1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11DeviceContext1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3D11DeviceContext1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11DeviceContext1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11DeviceContext1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}
    VSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    PSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    PSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pPixelShader: ptr ID3D11PixelShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.}
    PSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    VSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pVertexShader: ptr ID3D11VertexShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.}
    DrawIndexed*: proc (This: ptr ID3D11DeviceContext1; IndexCount: UINT; 
                        StartIndexLocation: UINT; BaseVertexLocation: INT) {.
        stdcall.}
    Draw*: proc (This: ptr ID3D11DeviceContext1; VertexCount: UINT; 
                 StartVertexLocation: UINT) {.stdcall.}
    Map*: proc (This: ptr ID3D11DeviceContext1; pResource: ptr ID3D11Resource; 
                Subresource: UINT; MapType: D3D11_MAP; MapFlags: UINT; 
                pMappedResource: ptr D3D11_MAPPED_SUBRESOURCE): HRESULT {.
        stdcall.}
    Unmap*: proc (This: ptr ID3D11DeviceContext1; pResource: ptr ID3D11Resource; 
                  Subresource: UINT) {.stdcall.}
    PSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    IASetInputLayout*: proc (This: ptr ID3D11DeviceContext1; 
                             pInputLayout: ptr ID3D11InputLayout) {.stdcall.}
    IASetVertexBuffers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                               NumBuffers: UINT; 
                               ppVertexBuffers: ptr ptr ID3D11Buffer; 
                               pStrides: ptr UINT; pOffsets: ptr UINT) {.stdcall.}
    IASetIndexBuffer*: proc (This: ptr ID3D11DeviceContext1; 
                             pIndexBuffer: ptr ID3D11Buffer; 
                             Format: DXGI_FORMAT; Offset: UINT) {.stdcall.}
    DrawIndexedInstanced*: proc (This: ptr ID3D11DeviceContext1; 
                                 IndexCountPerInstance: UINT; 
                                 InstanceCount: UINT; StartIndexLocation: UINT; 
                                 BaseVertexLocation: INT; 
                                 StartInstanceLocation: UINT) {.stdcall.}
    DrawInstanced*: proc (This: ptr ID3D11DeviceContext1; 
                          VertexCountPerInstance: UINT; InstanceCount: UINT; 
                          StartVertexLocation: UINT; StartInstanceLocation: UINT) {.
        stdcall.}
    GSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    GSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pShader: ptr ID3D11GeometryShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.}
    IASetPrimitiveTopology*: proc (This: ptr ID3D11DeviceContext1; 
                                   Topology: D3D11_PRIMITIVE_TOPOLOGY) {.stdcall.}
    VSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    VSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    Begin*: proc (This: ptr ID3D11DeviceContext1; pAsync: ptr ID3D11Asynchronous) {.
        stdcall.}
    End*: proc (This: ptr ID3D11DeviceContext1; pAsync: ptr ID3D11Asynchronous) {.
        stdcall.}
    GetData*: proc (This: ptr ID3D11DeviceContext1; 
                    pAsync: ptr ID3D11Asynchronous; pData: pointer; 
                    DataSize: UINT; GetDataFlags: UINT): HRESULT {.stdcall.}
    SetPredication*: proc (This: ptr ID3D11DeviceContext1; 
                           pPredicate: ptr ID3D11Predicate; PredicateValue: BOOL) {.
        stdcall.}
    GSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    GSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    OMSetRenderTargets*: proc (This: ptr ID3D11DeviceContext1; NumViews: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; 
                               pDepthStencilView: ptr ID3D11DepthStencilView) {.
        stdcall.}
    OMSetRenderTargetsAndUnorderedAccessViews*: proc (
        This: ptr ID3D11DeviceContext1; NumRTVs: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; 
        pDepthStencilView: ptr ID3D11DepthStencilView; UAVStartSlot: UINT; 
        NumUAVs: UINT; 
        ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView; 
        pUAVInitialCounts: ptr UINT) {.stdcall.}
    OMSetBlendState*: proc (This: ptr ID3D11DeviceContext1; 
                            pBlendState: ptr ID3D11BlendState; 
                            BlendFactor: array[4, FLOAT]; SampleMask: UINT) {.
        stdcall.}
    OMSetDepthStencilState*: proc (This: ptr ID3D11DeviceContext1; 
        pDepthStencilState: ptr ID3D11DepthStencilState; StencilRef: UINT) {.
        stdcall.}
    SOSetTargets*: proc (This: ptr ID3D11DeviceContext1; NumBuffers: UINT; 
                         ppSOTargets: ptr ptr ID3D11Buffer; pOffsets: ptr UINT) {.
        stdcall.}
    DrawAuto*: proc (This: ptr ID3D11DeviceContext1) {.stdcall.}
    DrawIndexedInstancedIndirect*: proc (This: ptr ID3D11DeviceContext1; 
        pBufferForArgs: ptr ID3D11Buffer; AlignedByteOffsetForArgs: UINT) {.
        stdcall.}
    DrawInstancedIndirect*: proc (This: ptr ID3D11DeviceContext1; 
                                  pBufferForArgs: ptr ID3D11Buffer; 
                                  AlignedByteOffsetForArgs: UINT) {.stdcall.}
    Dispatch*: proc (This: ptr ID3D11DeviceContext1; ThreadGroupCountX: UINT; 
                     ThreadGroupCountY: UINT; ThreadGroupCountZ: UINT) {.stdcall.}
    DispatchIndirect*: proc (This: ptr ID3D11DeviceContext1; 
                             pBufferForArgs: ptr ID3D11Buffer; 
                             AlignedByteOffsetForArgs: UINT) {.stdcall.}
    RSSetState*: proc (This: ptr ID3D11DeviceContext1; 
                       pRasterizerState: ptr ID3D11RasterizerState) {.stdcall.}
    RSSetViewports*: proc (This: ptr ID3D11DeviceContext1; NumViewports: UINT; 
                           pViewports: ptr D3D11_VIEWPORT) {.stdcall.}
    RSSetScissorRects*: proc (This: ptr ID3D11DeviceContext1; NumRects: UINT; 
                              pRects: ptr D3D11_RECT) {.stdcall.}
    CopySubresourceRegion*: proc (This: ptr ID3D11DeviceContext1; 
                                  pDstResource: ptr ID3D11Resource; 
                                  DstSubresource: UINT; DstX: UINT; DstY: UINT; 
                                  DstZ: UINT; pSrcResource: ptr ID3D11Resource; 
                                  SrcSubresource: UINT; pSrcBox: ptr D3D11_BOX) {.
        stdcall.}
    CopyResource*: proc (This: ptr ID3D11DeviceContext1; 
                         pDstResource: ptr ID3D11Resource; 
                         pSrcResource: ptr ID3D11Resource) {.stdcall.}
    UpdateSubresource*: proc (This: ptr ID3D11DeviceContext1; 
                              pDstResource: ptr ID3D11Resource; 
                              DstSubresource: UINT; pDstBox: ptr D3D11_BOX; 
                              pSrcData: pointer; SrcRowPitch: UINT; 
                              SrcDepthPitch: UINT) {.stdcall.}
    CopyStructureCount*: proc (This: ptr ID3D11DeviceContext1; 
                               pDstBuffer: ptr ID3D11Buffer; 
                               DstAlignedByteOffset: UINT; 
                               pSrcView: ptr ID3D11UnorderedAccessView) {.
        stdcall.}
    ClearRenderTargetView*: proc (This: ptr ID3D11DeviceContext1; 
        pRenderTargetView: ptr ID3D11RenderTargetView; 
                                  ColorRGBA: array[4, FLOAT]) {.stdcall.}
    ClearUnorderedAccessViewUint*: proc (This: ptr ID3D11DeviceContext1; 
        pUnorderedAccessView: ptr ID3D11UnorderedAccessView; 
        Values: array[4, UINT]) {.stdcall.}
    ClearUnorderedAccessViewFloat*: proc (This: ptr ID3D11DeviceContext1; 
        pUnorderedAccessView: ptr ID3D11UnorderedAccessView; 
        Values: array[4, FLOAT]) {.stdcall.}
    ClearDepthStencilView*: proc (This: ptr ID3D11DeviceContext1; 
        pDepthStencilView: ptr ID3D11DepthStencilView; ClearFlags: UINT; 
                                  Depth: FLOAT; Stencil: UINT8) {.stdcall.}
    GenerateMips*: proc (This: ptr ID3D11DeviceContext1; 
                         pShaderResourceView: ptr ID3D11ShaderResourceView) {.
        stdcall.}
    SetResourceMinLOD*: proc (This: ptr ID3D11DeviceContext1; 
                              pResource: ptr ID3D11Resource; MinLOD: FLOAT) {.
        stdcall.}
    GetResourceMinLOD*: proc (This: ptr ID3D11DeviceContext1; 
                              pResource: ptr ID3D11Resource): FLOAT {.stdcall.}
    ResolveSubresource*: proc (This: ptr ID3D11DeviceContext1; 
                               pDstResource: ptr ID3D11Resource; 
                               DstSubresource: UINT; 
                               pSrcResource: ptr ID3D11Resource; 
                               SrcSubresource: UINT; Format: DXGI_FORMAT) {.
        stdcall.}
    ExecuteCommandList*: proc (This: ptr ID3D11DeviceContext1; 
                               pCommandList: ptr ID3D11CommandList; 
                               RestoreContextState: BOOL) {.stdcall.}
    HSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    HSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pHullShader: ptr ID3D11HullShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.}
    HSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    HSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    DSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    DSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pDomainShader: ptr ID3D11DomainShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.}
    DSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    DSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    CSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    CSSetUnorderedAccessViews*: proc (This: ptr ID3D11DeviceContext1; 
                                      StartSlot: UINT; NumUAVs: UINT; 
        ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView; 
                                      pUAVInitialCounts: ptr UINT) {.stdcall.}
    CSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pComputeShader: ptr ID3D11ComputeShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.}
    CSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    CSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    VSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    PSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    PSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppPixelShader: ptr ptr ID3D11PixelShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.}
    PSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    VSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppVertexShader: ptr ptr ID3D11VertexShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.}
    PSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    IAGetInputLayout*: proc (This: ptr ID3D11DeviceContext1; 
                             ppInputLayout: ptr ptr ID3D11InputLayout) {.stdcall.}
    IAGetVertexBuffers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                               NumBuffers: UINT; 
                               ppVertexBuffers: ptr ptr ID3D11Buffer; 
                               pStrides: ptr UINT; pOffsets: ptr UINT) {.stdcall.}
    IAGetIndexBuffer*: proc (This: ptr ID3D11DeviceContext1; 
                             pIndexBuffer: ptr ptr ID3D11Buffer; 
                             Format: ptr DXGI_FORMAT; Offset: ptr UINT) {.
        stdcall.}
    GSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    GSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppGeometryShader: ptr ptr ID3D11GeometryShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.}
    IAGetPrimitiveTopology*: proc (This: ptr ID3D11DeviceContext1; 
                                   pTopology: ptr D3D11_PRIMITIVE_TOPOLOGY) {.
        stdcall.}
    VSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    VSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    GetPredication*: proc (This: ptr ID3D11DeviceContext1; 
                           ppPredicate: ptr ptr ID3D11Predicate; 
                           pPredicateValue: ptr BOOL) {.stdcall.}
    GSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    GSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    OMGetRenderTargets*: proc (This: ptr ID3D11DeviceContext1; NumViews: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; ppDepthStencilView: ptr ptr ID3D11DepthStencilView) {.
        stdcall.}
    OMGetRenderTargetsAndUnorderedAccessViews*: proc (
        This: ptr ID3D11DeviceContext1; NumRTVs: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; 
        ppDepthStencilView: ptr ptr ID3D11DepthStencilView; UAVStartSlot: UINT; 
        NumUAVs: UINT; ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView) {.
        stdcall.}
    OMGetBlendState*: proc (This: ptr ID3D11DeviceContext1; 
                            ppBlendState: ptr ptr ID3D11BlendState; 
                            BlendFactor: array[4, FLOAT]; pSampleMask: ptr UINT) {.
        stdcall.}
    OMGetDepthStencilState*: proc (This: ptr ID3D11DeviceContext1; 
        ppDepthStencilState: ptr ptr ID3D11DepthStencilState; 
                                   pStencilRef: ptr UINT) {.stdcall.}
    SOGetTargets*: proc (This: ptr ID3D11DeviceContext1; NumBuffers: UINT; 
                         ppSOTargets: ptr ptr ID3D11Buffer) {.stdcall.}
    RSGetState*: proc (This: ptr ID3D11DeviceContext1; 
                       ppRasterizerState: ptr ptr ID3D11RasterizerState) {.
        stdcall.}
    RSGetViewports*: proc (This: ptr ID3D11DeviceContext1; 
                           pNumViewports: ptr UINT; 
                           pViewports: ptr D3D11_VIEWPORT) {.stdcall.}
    RSGetScissorRects*: proc (This: ptr ID3D11DeviceContext1; 
                              pNumRects: ptr UINT; pRects: ptr D3D11_RECT) {.
        stdcall.}
    HSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    HSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppHullShader: ptr ptr ID3D11HullShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.}
    HSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    HSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    DSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    DSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppDomainShader: ptr ptr ID3D11DomainShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.}
    DSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    DSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    CSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.}
    CSGetUnorderedAccessViews*: proc (This: ptr ID3D11DeviceContext1; 
                                      StartSlot: UINT; NumUAVs: UINT; 
        ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView) {.stdcall.}
    CSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppComputeShader: ptr ptr ID3D11ComputeShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.}
    CSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.}
    CSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}
    ClearState*: proc (This: ptr ID3D11DeviceContext1) {.stdcall.}
    Flush*: proc (This: ptr ID3D11DeviceContext1) {.stdcall.}
    GetType*: proc (This: ptr ID3D11DeviceContext1): D3D11_DEVICE_CONTEXT_TYPE {.
        stdcall.}
    GetContextFlags*: proc (This: ptr ID3D11DeviceContext1): UINT {.stdcall.}
    FinishCommandList*: proc (This: ptr ID3D11DeviceContext1; 
                              RestoreDeferredContextState: BOOL; 
                              ppCommandList: ptr ptr ID3D11CommandList): HRESULT {.
        stdcall.}
    CopySubresourceRegion1*: proc (This: ptr ID3D11DeviceContext1; 
                                   pDstResource: ptr ID3D11Resource; 
                                   DstSubresource: UINT; DstX: UINT; DstY: UINT; 
                                   DstZ: UINT; pSrcResource: ptr ID3D11Resource; 
                                   SrcSubresource: UINT; pSrcBox: ptr D3D11_BOX; 
                                   CopyFlags: UINT) {.stdcall.}
    UpdateSubresource1*: proc (This: ptr ID3D11DeviceContext1; 
                               pDstResource: ptr ID3D11Resource; 
                               DstSubresource: UINT; pDstBox: ptr D3D11_BOX; 
                               pSrcData: pointer; SrcRowPitch: UINT; 
                               SrcDepthPitch: UINT; CopyFlags: UINT) {.stdcall.}
    DiscardResource*: proc (This: ptr ID3D11DeviceContext1; 
                            pResource: ptr ID3D11Resource) {.stdcall.}
    DiscardView*: proc (This: ptr ID3D11DeviceContext1; 
                        pResourceView: ptr ID3D11View) {.stdcall.}
    VSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    HSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    DSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    GSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    PSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    CSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    VSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    HSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    DSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    GSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    PSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    CSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.}
    SwapDeviceContextState*: proc (This: ptr ID3D11DeviceContext1; 
                                   pState: ptr ID3DDeviceContextState; 
        ppPreviousState: ptr ptr ID3DDeviceContextState) {.stdcall.}
    ClearView*: proc (This: ptr ID3D11DeviceContext1; pView: ptr ID3D11View; 
                      Color: array[4, FLOAT]; pRect: ptr D3D11_RECT; 
                      NumRects: UINT) {.stdcall.}
    DiscardView1*: proc (This: ptr ID3D11DeviceContext1; 
                         pResourceView: ptr ID3D11View; pRects: ptr D3D11_RECT; 
                         NumRects: UINT) {.stdcall.}

  ID3D11DeviceContext1* = object 
    lpVtbl*: ptr ID3D11DeviceContext1Vtbl

  D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK* = object 
    ClearSize*: UINT
    EncryptedSize*: UINT

  D3D11_VIDEO_DECODER_BUFFER_DESC1* = object 
    BufferType*: D3D11_VIDEO_DECODER_BUFFER_TYPE
    DataOffset*: UINT
    DataSize*: UINT
    pIV*: pointer
    IVSize*: UINT
    pSubSampleMappingBlock*: ptr D3D11_VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK
    SubSampleMappingCount*: UINT

  D3D11_VIDEO_DECODER_BEGIN_FRAME_CRYPTO_SESSION* = object 
    pCryptoSession*: ptr ID3D11CryptoSession
    BlobSize*: UINT
    pBlob*: pointer
    pKeyInfoId*: ptr GUID
    PrivateDataSize*: UINT
    pPrivateData*: pointer

  D3D11_VIDEO_DECODER_CAPS* = enum 
    D3D11_VIDEO_DECODER_CAPS_DOWNSAMPLE = 0x00000001, 
    D3D11_VIDEO_DECODER_CAPS_NON_REAL_TIME = 0x00000002, 
    D3D11_VIDEO_DECODER_CAPS_DOWNSAMPLE_DYNAMIC = 0x00000004, 
    D3D11_VIDEO_DECODER_CAPS_DOWNSAMPLE_REQUIRED = 0x00000008, 
    D3D11_VIDEO_DECODER_CAPS_UNSUPPORTED = 0x00000010
  D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINTS* = enum 
    D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_MULTIPLANE_OVERLAY_ROTATION = 0x00000001, 
    D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_MULTIPLANE_OVERLAY_RESIZE = 0x00000002, D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_MULTIPLANE_OVERLAY_COLOR_SPACE_CONVERSION = 0x00000004, 
    D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINT_TRIPLE_BUFFER_OUTPUT = 0x00000008
  D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT* = object 
    Enable*: BOOL
    Width*: UINT
    Height*: UINT
    Format*: DXGI_FORMAT

  D3D11_CRYPTO_SESSION_STATUS* = enum 
    D3D11_CRYPTO_SESSION_STATUS_OK = 0, 
    D3D11_CRYPTO_SESSION_STATUS_KEY_LOST = 1, 
    D3D11_CRYPTO_SESSION_STATUS_KEY_AND_CONTENT_LOST = 2
  D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA* = object 
    PrivateDataSize*: UINT
    HWProtectionDataSize*: UINT
    pbInput*: array[4, BYTE]

  D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA* = object 
    PrivateDataSize*: UINT
    MaxHWProtectionDataSize*: UINT
    HWProtectionDataSize*: UINT
    TransportTime*: UINT64
    ExecutionTime*: UINT64
    pbOutput*: array[4, BYTE]

  D3D11_KEY_EXCHANGE_HW_PROTECTION_DATA* = object 
    HWProtectionFunctionID*: UINT
    pInputData*: ptr D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA
    pOutputData*: ptr D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA
    Status*: HRESULT

  D3D11_VIDEO_SAMPLE_DESC* = object 
    Width*: UINT
    Height*: UINT
    Format*: DXGI_FORMAT
    ColorSpace*: DXGI_COLOR_SPACE_TYPE

type
  ID3D11VideoContext1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11VideoContext1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3D11VideoContext1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11VideoContext1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11VideoContext1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3D11VideoContext1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11VideoContext1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11VideoContext1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}
    GetDecoderBuffer*: proc (This: ptr ID3D11VideoContext1; 
                             pDecoder: ptr ID3D11VideoDecoder; 
                             Type: D3D11_VIDEO_DECODER_BUFFER_TYPE; 
                             pBufferSize: ptr UINT; ppBuffer: ptr pointer): HRESULT {.
        stdcall.}
    ReleaseDecoderBuffer*: proc (This: ptr ID3D11VideoContext1; 
                                 pDecoder: ptr ID3D11VideoDecoder; 
                                 Type: D3D11_VIDEO_DECODER_BUFFER_TYPE): HRESULT {.
        stdcall.}
    DecoderBeginFrame*: proc (This: ptr ID3D11VideoContext1; 
                              pDecoder: ptr ID3D11VideoDecoder; 
                              pView: ptr ID3D11VideoDecoderOutputView; 
                              ContentKeySize: UINT; pContentKey: pointer): HRESULT {.
        stdcall.}
    DecoderEndFrame*: proc (This: ptr ID3D11VideoContext1; 
                            pDecoder: ptr ID3D11VideoDecoder): HRESULT {.stdcall.}
    SubmitDecoderBuffers*: proc (This: ptr ID3D11VideoContext1; 
                                 pDecoder: ptr ID3D11VideoDecoder; 
                                 NumBuffers: UINT; pBufferDesc: ptr D3D11_VIDEO_DECODER_BUFFER_DESC): HRESULT {.
        stdcall.}
    DecoderExtension*: proc (This: ptr ID3D11VideoContext1; 
                             pDecoder: ptr ID3D11VideoDecoder; 
                             pExtensionData: ptr D3D11_VIDEO_DECODER_EXTENSION): APP_DEPRECATED_HRESULT {.
        stdcall.}
    VideoProcessorSetOutputTargetRect*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; Enable: BOOL; pRect: ptr RECT) {.
        stdcall.}
    VideoProcessorSetOutputBackgroundColor*: proc (
        This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; YCbCr: BOOL; 
        pColor: ptr D3D11_VIDEO_COLOR) {.stdcall.}
    VideoProcessorSetOutputColorSpace*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; 
        pColorSpace: ptr D3D11_VIDEO_PROCESSOR_COLOR_SPACE) {.stdcall.}
    VideoProcessorSetOutputAlphaFillMode*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; 
        AlphaFillMode: D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE; StreamIndex: UINT) {.
        stdcall.}
    VideoProcessorSetOutputConstriction*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; Enable: BOOL; Size: SIZE) {.
        stdcall.}
    VideoProcessorSetOutputStereoMode*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; Enable: BOOL) {.stdcall.}
    VideoProcessorSetOutputExtension*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; pExtensionGuid: ptr GUID; 
        DataSize: UINT; pData: pointer): APP_DEPRECATED_HRESULT {.stdcall.}
    VideoProcessorGetOutputTargetRect*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; Enabled: ptr BOOL; 
        pRect: ptr RECT) {.stdcall.}
    VideoProcessorGetOutputBackgroundColor*: proc (
        This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; pYCbCr: ptr BOOL; 
        pColor: ptr D3D11_VIDEO_COLOR) {.stdcall.}
    VideoProcessorGetOutputColorSpace*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; 
        pColorSpace: ptr D3D11_VIDEO_PROCESSOR_COLOR_SPACE) {.stdcall.}
    VideoProcessorGetOutputAlphaFillMode*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; 
        pAlphaFillMode: ptr D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE; 
        pStreamIndex: ptr UINT) {.stdcall.}
    VideoProcessorGetOutputConstriction*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; pEnabled: ptr BOOL; 
        pSize: ptr SIZE) {.stdcall.}
    VideoProcessorGetOutputStereoMode*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; pEnabled: ptr BOOL) {.stdcall.}
    VideoProcessorGetOutputExtension*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; pExtensionGuid: ptr GUID; 
        DataSize: UINT; pData: pointer): APP_DEPRECATED_HRESULT {.stdcall.}
    VideoProcessorSetStreamFrameFormat*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        FrameFormat: D3D11_VIDEO_FRAME_FORMAT) {.stdcall.}
    VideoProcessorSetStreamColorSpace*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pColorSpace: ptr D3D11_VIDEO_PROCESSOR_COLOR_SPACE) {.stdcall.}
    VideoProcessorSetStreamOutputRate*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        OutputRate: D3D11_VIDEO_PROCESSOR_OUTPUT_RATE; RepeatFrame: BOOL; 
        pCustomRate: ptr DXGI_RATIONAL) {.stdcall.}
    VideoProcessorSetStreamSourceRect*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; pRect: ptr RECT) {.stdcall.}
    VideoProcessorSetStreamDestRect*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; pRect: ptr RECT) {.stdcall.}
    VideoProcessorSetStreamAlpha*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; Alpha: FLOAT) {.stdcall.}
    VideoProcessorSetStreamPalette*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Count: UINT; pEntries: ptr UINT) {.stdcall.}
    VideoProcessorSetStreamPixelAspectRatio*: proc (
        This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; pSourceAspectRatio: ptr DXGI_RATIONAL; 
        pDestinationAspectRatio: ptr DXGI_RATIONAL) {.stdcall.}
    VideoProcessorSetStreamLumaKey*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; Lower: FLOAT; Upper: FLOAT) {.stdcall.}
    VideoProcessorSetStreamStereoFormat*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; Format: D3D11_VIDEO_PROCESSOR_STEREO_FORMAT; 
        LeftViewFrame0: BOOL; BaseViewFrame0: BOOL; 
        FlipMode: D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE; MonoOffset: cint) {.
        stdcall.}
    VideoProcessorSetStreamAutoProcessingMode*: proc (
        This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL) {.stdcall.}
    VideoProcessorSetStreamFilter*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Filter: D3D11_VIDEO_PROCESSOR_FILTER; Enable: BOOL; Level: cint) {.
        stdcall.}
    VideoProcessorSetStreamExtension*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pExtensionGuid: ptr GUID; DataSize: UINT; pData: pointer): APP_DEPRECATED_HRESULT {.
        stdcall.}
    VideoProcessorGetStreamFrameFormat*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pFrameFormat: ptr D3D11_VIDEO_FRAME_FORMAT) {.stdcall.}
    VideoProcessorGetStreamColorSpace*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pColorSpace: ptr D3D11_VIDEO_PROCESSOR_COLOR_SPACE) {.stdcall.}
    VideoProcessorGetStreamOutputRate*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pOutputRate: ptr D3D11_VIDEO_PROCESSOR_OUTPUT_RATE; 
        pRepeatFrame: ptr BOOL; pCustomRate: ptr DXGI_RATIONAL) {.stdcall.}
    VideoProcessorGetStreamSourceRect*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnabled: ptr BOOL; pRect: ptr RECT) {.stdcall.}
    VideoProcessorGetStreamDestRect*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnabled: ptr BOOL; pRect: ptr RECT) {.stdcall.}
    VideoProcessorGetStreamAlpha*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnabled: ptr BOOL; pAlpha: ptr FLOAT) {.stdcall.}
    VideoProcessorGetStreamPalette*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Count: UINT; pEntries: ptr UINT) {.stdcall.}
    VideoProcessorGetStreamPixelAspectRatio*: proc (
        This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnabled: ptr BOOL; pSourceAspectRatio: ptr DXGI_RATIONAL; 
        pDestinationAspectRatio: ptr DXGI_RATIONAL) {.stdcall.}
    VideoProcessorGetStreamLumaKey*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnabled: ptr BOOL; pLower: ptr FLOAT; pUpper: ptr FLOAT) {.stdcall.}
    VideoProcessorGetStreamStereoFormat*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnable: ptr BOOL; pFormat: ptr D3D11_VIDEO_PROCESSOR_STEREO_FORMAT; 
        pLeftViewFrame0: ptr BOOL; pBaseViewFrame0: ptr BOOL; 
        pFlipMode: ptr D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE; 
        MonoOffset: ptr cint) {.stdcall.}
    VideoProcessorGetStreamAutoProcessingMode*: proc (
        This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnabled: ptr BOOL) {.stdcall.}
    VideoProcessorGetStreamFilter*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Filter: D3D11_VIDEO_PROCESSOR_FILTER; pEnabled: ptr BOOL; 
        pLevel: ptr cint) {.stdcall.}
    VideoProcessorGetStreamExtension*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pExtensionGuid: ptr GUID; DataSize: UINT; pData: pointer): APP_DEPRECATED_HRESULT {.
        stdcall.}
    VideoProcessorBlt*: proc (This: ptr ID3D11VideoContext1; 
                              pVideoProcessor: ptr ID3D11VideoProcessor; 
                              pView: ptr ID3D11VideoProcessorOutputView; 
                              OutputFrame: UINT; StreamCount: UINT; 
                              pStreams: ptr D3D11_VIDEO_PROCESSOR_STREAM): HRESULT {.
        stdcall.}
    NegotiateCryptoSessionKeyExchange*: proc (This: ptr ID3D11VideoContext1; 
        pCryptoSession: ptr ID3D11CryptoSession; DataSize: UINT; pData: pointer): HRESULT {.
        stdcall.}
    EncryptionBlt*: proc (This: ptr ID3D11VideoContext1; 
                          pCryptoSession: ptr ID3D11CryptoSession; 
                          pSrcSurface: ptr ID3D11Texture2D; 
                          pDstSurface: ptr ID3D11Texture2D; IVSize: UINT; 
                          pIV: pointer) {.stdcall.}
    DecryptionBlt*: proc (This: ptr ID3D11VideoContext1; 
                          pCryptoSession: ptr ID3D11CryptoSession; 
                          pSrcSurface: ptr ID3D11Texture2D; 
                          pDstSurface: ptr ID3D11Texture2D; 
                          pEncryptedBlockInfo: ptr D3D11_ENCRYPTED_BLOCK_INFO; 
                          ContentKeySize: UINT; pContentKey: pointer; 
                          IVSize: UINT; pIV: pointer) {.stdcall.}
    StartSessionKeyRefresh*: proc (This: ptr ID3D11VideoContext1; 
                                   pCryptoSession: ptr ID3D11CryptoSession; 
                                   RandomNumberSize: UINT; 
                                   pRandomNumber: pointer) {.stdcall.}
    FinishSessionKeyRefresh*: proc (This: ptr ID3D11VideoContext1; 
                                    pCryptoSession: ptr ID3D11CryptoSession) {.
        stdcall.}
    GetEncryptionBltKey*: proc (This: ptr ID3D11VideoContext1; 
                                pCryptoSession: ptr ID3D11CryptoSession; 
                                KeySize: UINT; pReadbackKey: pointer): HRESULT {.
        stdcall.}
    NegotiateAuthenticatedChannelKeyExchange*: proc (
        This: ptr ID3D11VideoContext1; pChannel: ptr ID3D11AuthenticatedChannel; 
        DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    QueryAuthenticatedChannel*: proc (This: ptr ID3D11VideoContext1; 
                                      pChannel: ptr ID3D11AuthenticatedChannel; 
                                      InputSize: UINT; pInput: pointer; 
                                      OutputSize: UINT; pOutput: pointer): HRESULT {.
        stdcall.}
    ConfigureAuthenticatedChannel*: proc (This: ptr ID3D11VideoContext1; 
        pChannel: ptr ID3D11AuthenticatedChannel; InputSize: UINT; 
        pInput: pointer; pOutput: ptr D3D11_AUTHENTICATED_CONFIGURE_OUTPUT): HRESULT {.
        stdcall.}
    VideoProcessorSetStreamRotation*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; Rotation: D3D11_VIDEO_PROCESSOR_ROTATION) {.stdcall.}
    VideoProcessorGetStreamRotation*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnable: ptr BOOL; pRotation: ptr D3D11_VIDEO_PROCESSOR_ROTATION) {.
        stdcall.}
    SubmitDecoderBuffers1*: proc (This: ptr ID3D11VideoContext1; 
                                  pDecoder: ptr ID3D11VideoDecoder; 
                                  NumBuffers: UINT; pBufferDesc: ptr D3D11_VIDEO_DECODER_BUFFER_DESC1): HRESULT {.
        stdcall.}
    GetDataForNewHardwareKey*: proc (This: ptr ID3D11VideoContext1; 
                                     pCryptoSession: ptr ID3D11CryptoSession; 
                                     PrivateInputSize: UINT; 
                                     pPrivatInputData: pointer; 
                                     pPrivateOutputData: ptr UINT64): HRESULT {.
        stdcall.}
    CheckCryptoSessionStatus*: proc (This: ptr ID3D11VideoContext1; 
                                     pCryptoSession: ptr ID3D11CryptoSession; 
                                     pStatus: ptr D3D11_CRYPTO_SESSION_STATUS): HRESULT {.
        stdcall.}
    DecoderEnableDownsampling*: proc (This: ptr ID3D11VideoContext1; 
                                      pDecoder: ptr ID3D11VideoDecoder; 
                                      InputColorSpace: DXGI_COLOR_SPACE_TYPE; 
                                      pOutputDesc: ptr D3D11_VIDEO_SAMPLE_DESC; 
                                      ReferenceFrameCount: UINT): HRESULT {.
        stdcall.}
    DecoderUpdateDownsampling*: proc (This: ptr ID3D11VideoContext1; 
                                      pDecoder: ptr ID3D11VideoDecoder; 
                                      pOutputDesc: ptr D3D11_VIDEO_SAMPLE_DESC): HRESULT {.
        stdcall.}
    VideoProcessorSetOutputColorSpace1*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; 
        ColorSpace: DXGI_COLOR_SPACE_TYPE) {.stdcall.}
    VideoProcessorSetOutputShaderUsage*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; ShaderUsage: BOOL) {.stdcall.}
    VideoProcessorGetOutputColorSpace1*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; 
        pColorSpace: ptr DXGI_COLOR_SPACE_TYPE) {.stdcall.}
    VideoProcessorGetOutputShaderUsage*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; pShaderUsage: ptr BOOL) {.
        stdcall.}
    VideoProcessorSetStreamColorSpace1*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        ColorSpace: DXGI_COLOR_SPACE_TYPE) {.stdcall.}
    VideoProcessorSetStreamMirror*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        Enable: BOOL; FlipHorizontal: BOOL; FlipVertical: BOOL) {.stdcall.}
    VideoProcessorGetStreamColorSpace1*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pColorSpace: ptr DXGI_COLOR_SPACE_TYPE) {.stdcall.}
    VideoProcessorGetStreamMirror*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; StreamIndex: UINT; 
        pEnable: ptr BOOL; pFlipHorizontal: ptr BOOL; pFlipVertical: ptr BOOL) {.
        stdcall.}
    VideoProcessorGetBehaviorHints*: proc (This: ptr ID3D11VideoContext1; 
        pVideoProcessor: ptr ID3D11VideoProcessor; OutputWidth: UINT; 
        OutputHeight: UINT; OutputFormat: DXGI_FORMAT; StreamCount: UINT; 
        pStreams: ptr D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT; 
        pBehaviorHints: ptr UINT): HRESULT {.stdcall.}
 
  ID3D11VideoContext1* = object 
    lpVtbl*: ptr ID3D11VideoContext1Vtbl

  ID3D11VideoDevice1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11VideoDevice1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3D11VideoDevice1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11VideoDevice1): ULONG {.stdcall.}
    CreateVideoDecoder*: proc (This: ptr ID3D11VideoDevice1; 
                               pVideoDesc: ptr D3D11_VIDEO_DECODER_DESC; 
                               pConfig: ptr D3D11_VIDEO_DECODER_CONFIG; 
                               ppDecoder: ptr ptr ID3D11VideoDecoder): HRESULT {.
        stdcall.}
    CreateVideoProcessor*: proc (This: ptr ID3D11VideoDevice1; 
                                 pEnum: ptr ID3D11VideoProcessorEnumerator; 
                                 RateConversionIndex: UINT; 
                                 ppVideoProcessor: ptr ptr ID3D11VideoProcessor): HRESULT {.
        stdcall.}
    CreateAuthenticatedChannel*: proc (This: ptr ID3D11VideoDevice1; ChannelType: D3D11_AUTHENTICATED_CHANNEL_TYPE; 
        ppAuthenticatedChannel: ptr ptr ID3D11AuthenticatedChannel): HRESULT {.
        stdcall.}
    CreateCryptoSession*: proc (This: ptr ID3D11VideoDevice1; 
                                pCryptoType: ptr GUID; 
                                pDecoderProfile: ptr GUID; 
                                pKeyExchangeType: ptr GUID; 
                                ppCryptoSession: ptr ptr ID3D11CryptoSession): HRESULT {.
        stdcall.}
    CreateVideoDecoderOutputView*: proc (This: ptr ID3D11VideoDevice1; 
        pResource: ptr ID3D11Resource; 
        pDesc: ptr D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC; 
        ppVDOVView: ptr ptr ID3D11VideoDecoderOutputView): HRESULT {.stdcall.}
    CreateVideoProcessorInputView*: proc (This: ptr ID3D11VideoDevice1; 
        pResource: ptr ID3D11Resource; 
        pEnum: ptr ID3D11VideoProcessorEnumerator; 
        pDesc: ptr D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC; 
        ppVPIView: ptr ptr ID3D11VideoProcessorInputView): HRESULT {.stdcall.}
    CreateVideoProcessorOutputView*: proc (This: ptr ID3D11VideoDevice1; 
        pResource: ptr ID3D11Resource; 
        pEnum: ptr ID3D11VideoProcessorEnumerator; 
        pDesc: ptr D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC; 
        ppVPOView: ptr ptr ID3D11VideoProcessorOutputView): HRESULT {.stdcall.}
    CreateVideoProcessorEnumerator*: proc (This: ptr ID3D11VideoDevice1; 
        pDesc: ptr D3D11_VIDEO_PROCESSOR_CONTENT_DESC; 
        ppEnum: ptr ptr ID3D11VideoProcessorEnumerator): HRESULT {.stdcall.}
    GetVideoDecoderProfileCount*: proc (This: ptr ID3D11VideoDevice1): UINT {.
        stdcall.}
    GetVideoDecoderProfile*: proc (This: ptr ID3D11VideoDevice1; Index: UINT; 
                                   pDecoderProfile: ptr GUID): HRESULT {.stdcall.}
    CheckVideoDecoderFormat*: proc (This: ptr ID3D11VideoDevice1; 
                                    pDecoderProfile: ptr GUID; 
                                    Format: DXGI_FORMAT; pSupported: ptr BOOL): HRESULT {.
        stdcall.}
    GetVideoDecoderConfigCount*: proc (This: ptr ID3D11VideoDevice1; 
                                       pDesc: ptr D3D11_VIDEO_DECODER_DESC; 
                                       pCount: ptr UINT): HRESULT {.stdcall.}
    GetVideoDecoderConfig*: proc (This: ptr ID3D11VideoDevice1; 
                                  pDesc: ptr D3D11_VIDEO_DECODER_DESC; 
                                  Index: UINT; 
                                  pConfig: ptr D3D11_VIDEO_DECODER_CONFIG): HRESULT {.
        stdcall.}
    GetContentProtectionCaps*: proc (This: ptr ID3D11VideoDevice1; 
                                     pCryptoType: ptr GUID; 
                                     pDecoderProfile: ptr GUID; pCaps: ptr D3D11_VIDEO_CONTENT_PROTECTION_CAPS): HRESULT {.
        stdcall.}
    CheckCryptoKeyExchange*: proc (This: ptr ID3D11VideoDevice1; 
                                   pCryptoType: ptr GUID; 
                                   pDecoderProfile: ptr GUID; Index: UINT; 
                                   pKeyExchangeType: ptr GUID): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11VideoDevice1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11VideoDevice1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}
    GetCryptoSessionPrivateDataSize*: proc (This: ptr ID3D11VideoDevice1; 
        pCryptoType: ptr GUID; pDecoderProfile: ptr GUID; 
        pKeyExchangeType: ptr GUID; pPrivateInputSize: ptr UINT; 
        pPrivateOutputSize: ptr UINT): HRESULT {.stdcall.}
    GetVideoDecoderCaps*: proc (This: ptr ID3D11VideoDevice1; 
                                pDecoderProfile: ptr GUID; SampleWidth: UINT; 
                                SampleHeight: UINT; 
                                pFrameRate: ptr DXGI_RATIONAL; BitRate: UINT; 
                                pCryptoType: ptr GUID; pDecoderCaps: ptr UINT): HRESULT {.
        stdcall.}
    CheckVideoDecoderDownsampling*: proc (This: ptr ID3D11VideoDevice1; 
        pInputDesc: ptr D3D11_VIDEO_DECODER_DESC; 
        InputColorSpace: DXGI_COLOR_SPACE_TYPE; 
        pInputConfig: ptr D3D11_VIDEO_DECODER_CONFIG; 
        pFrameRate: ptr DXGI_RATIONAL; pOutputDesc: ptr D3D11_VIDEO_SAMPLE_DESC; 
        pSupported: ptr BOOL; pRealTimeHint: ptr BOOL): HRESULT {.stdcall.}
    RecommendVideoDecoderDownsampleParameters*: proc (
        This: ptr ID3D11VideoDevice1; pInputDesc: ptr D3D11_VIDEO_DECODER_DESC; 
        InputColorSpace: DXGI_COLOR_SPACE_TYPE; 
        pInputConfig: ptr D3D11_VIDEO_DECODER_CONFIG; 
        pFrameRate: ptr DXGI_RATIONAL; 
        pRecommendedOutputDesc: ptr D3D11_VIDEO_SAMPLE_DESC): HRESULT {.stdcall.}

  ID3D11VideoDevice1* = object 
    lpVtbl*: ptr ID3D11VideoDevice1Vtbl

  ID3D11VideoProcessorEnumerator1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                           riid: ptr IID; ppvObject: ptr pointer): HRESULT {.
        stdcall.}
    AddRef*: proc (This: ptr ID3D11VideoProcessorEnumerator1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11VideoProcessorEnumerator1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                           guid: ptr GUID; pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                           guid: ptr GUID; DataSize: UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}
    GetVideoProcessorContentDesc*: proc (
        This: ptr ID3D11VideoProcessorEnumerator1; 
        pContentDesc: ptr D3D11_VIDEO_PROCESSOR_CONTENT_DESC): HRESULT {.stdcall.}
    CheckVideoProcessorFormat*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                                      Format: DXGI_FORMAT; pFlags: ptr UINT): HRESULT {.
        stdcall.}
    GetVideoProcessorCaps*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                                  pCaps: ptr D3D11_VIDEO_PROCESSOR_CAPS): HRESULT {.
        stdcall.}
    GetVideoProcessorRateConversionCaps*: proc (
        This: ptr ID3D11VideoProcessorEnumerator1; TypeIndex: UINT; 
        pCaps: ptr D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS): HRESULT {.
        stdcall.}
    GetVideoProcessorCustomRate*: proc (This: ptr ID3D11VideoProcessorEnumerator1; 
                                        TypeIndex: UINT; CustomRateIndex: UINT; 
        pRate: ptr D3D11_VIDEO_PROCESSOR_CUSTOM_RATE): HRESULT {.stdcall.}
    GetVideoProcessorFilterRange*: proc (
        This: ptr ID3D11VideoProcessorEnumerator1; 
        Filter: D3D11_VIDEO_PROCESSOR_FILTER; 
        pRange: ptr D3D11_VIDEO_PROCESSOR_FILTER_RANGE): HRESULT {.stdcall.}
    CheckVideoProcessorFormatConversion*: proc (
        This: ptr ID3D11VideoProcessorEnumerator1; InputFormat: DXGI_FORMAT; 
        InputColorSpace: DXGI_COLOR_SPACE_TYPE; OutputFormat: DXGI_FORMAT; 
        OutputColorSpace: DXGI_COLOR_SPACE_TYPE; pSupported: ptr BOOL): HRESULT {.
        stdcall.}

  ID3D11VideoProcessorEnumerator1* = object 
    lpVtbl*: ptr ID3D11VideoProcessorEnumerator1Vtbl

  ID3D11Device1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11Device1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3D11Device1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11Device1): ULONG {.stdcall.}
    CreateBuffer*: proc (This: ptr ID3D11Device1; pDesc: ptr D3D11_BUFFER_DESC; 
                         pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                         ppBuffer: ptr ptr ID3D11Buffer): HRESULT {.stdcall.}
    CreateTexture1D*: proc (This: ptr ID3D11Device1; 
                            pDesc: ptr D3D11_TEXTURE1D_DESC; 
                            pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                            ppTexture1D: ptr ptr ID3D11Texture1D): HRESULT {.
        stdcall.}
    CreateTexture2D*: proc (This: ptr ID3D11Device1; 
                            pDesc: ptr D3D11_TEXTURE2D_DESC; 
                            pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                            ppTexture2D: ptr ptr ID3D11Texture2D): HRESULT {.
        stdcall.}
    CreateTexture3D*: proc (This: ptr ID3D11Device1; 
                            pDesc: ptr D3D11_TEXTURE3D_DESC; 
                            pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                            ppTexture3D: ptr ptr ID3D11Texture3D): HRESULT {.
        stdcall.}
    CreateShaderResourceView*: proc (This: ptr ID3D11Device1; 
                                     pResource: ptr ID3D11Resource; pDesc: ptr D3D11_SHADER_RESOURCE_VIEW_DESC; 
                                     ppSRView: ptr ptr ID3D11ShaderResourceView): HRESULT {.
        stdcall.}
    CreateUnorderedAccessView*: proc (This: ptr ID3D11Device1; 
                                      pResource: ptr ID3D11Resource; pDesc: ptr D3D11_UNORDERED_ACCESS_VIEW_DESC; 
        ppUAView: ptr ptr ID3D11UnorderedAccessView): HRESULT {.stdcall.}
    CreateRenderTargetView*: proc (This: ptr ID3D11Device1; 
                                   pResource: ptr ID3D11Resource; 
                                   pDesc: ptr D3D11_RENDER_TARGET_VIEW_DESC; 
                                   ppRTView: ptr ptr ID3D11RenderTargetView): HRESULT {.
        stdcall.}
    CreateDepthStencilView*: proc (This: ptr ID3D11Device1; 
                                   pResource: ptr ID3D11Resource; 
                                   pDesc: ptr D3D11_DEPTH_STENCIL_VIEW_DESC; 
        ppDepthStencilView: ptr ptr ID3D11DepthStencilView): HRESULT {.stdcall.}
    CreateInputLayout*: proc (This: ptr ID3D11Device1; 
                              pInputElementDescs: ptr D3D11_INPUT_ELEMENT_DESC; 
                              NumElements: UINT; 
                              pShaderBytecodeWithInputSignature: pointer; 
                              BytecodeLength: SIZE_T; 
                              ppInputLayout: ptr ptr ID3D11InputLayout): HRESULT {.
        stdcall.}
    CreateVertexShader*: proc (This: ptr ID3D11Device1; 
                               pShaderBytecode: pointer; BytecodeLength: SIZE_T; 
                               pClassLinkage: ptr ID3D11ClassLinkage; 
                               ppVertexShader: ptr ptr ID3D11VertexShader): HRESULT {.
        stdcall.}
    CreateGeometryShader*: proc (This: ptr ID3D11Device1; 
                                 pShaderBytecode: pointer; 
                                 BytecodeLength: SIZE_T; 
                                 pClassLinkage: ptr ID3D11ClassLinkage; 
                                 ppGeometryShader: ptr ptr ID3D11GeometryShader): HRESULT {.
        stdcall.}
    CreateGeometryShaderWithStreamOutput*: proc (This: ptr ID3D11Device1; 
        pShaderBytecode: pointer; BytecodeLength: SIZE_T; 
        pSODeclaration: ptr D3D11_SO_DECLARATION_ENTRY; NumEntries: UINT; 
        pBufferStrides: ptr UINT; NumStrides: UINT; RasterizedStream: UINT; 
        pClassLinkage: ptr ID3D11ClassLinkage; 
        ppGeometryShader: ptr ptr ID3D11GeometryShader): HRESULT {.stdcall.}
    CreatePixelShader*: proc (This: ptr ID3D11Device1; pShaderBytecode: pointer; 
                              BytecodeLength: SIZE_T; 
                              pClassLinkage: ptr ID3D11ClassLinkage; 
                              ppPixelShader: ptr ptr ID3D11PixelShader): HRESULT {.
        stdcall.}
    CreateHullShader*: proc (This: ptr ID3D11Device1; pShaderBytecode: pointer; 
                             BytecodeLength: SIZE_T; 
                             pClassLinkage: ptr ID3D11ClassLinkage; 
                             ppHullShader: ptr ptr ID3D11HullShader): HRESULT {.
        stdcall.}
    CreateDomainShader*: proc (This: ptr ID3D11Device1; 
                               pShaderBytecode: pointer; BytecodeLength: SIZE_T; 
                               pClassLinkage: ptr ID3D11ClassLinkage; 
                               ppDomainShader: ptr ptr ID3D11DomainShader): HRESULT {.
        stdcall.}
    CreateComputeShader*: proc (This: ptr ID3D11Device1; 
                                pShaderBytecode: pointer; 
                                BytecodeLength: SIZE_T; 
                                pClassLinkage: ptr ID3D11ClassLinkage; 
                                ppComputeShader: ptr ptr ID3D11ComputeShader): HRESULT {.
        stdcall.}
    CreateClassLinkage*: proc (This: ptr ID3D11Device1; 
                               ppLinkage: ptr ptr ID3D11ClassLinkage): HRESULT {.
        stdcall.}
    CreateBlendState*: proc (This: ptr ID3D11Device1; 
                             pBlendStateDesc: ptr D3D11_BLEND_DESC; 
                             ppBlendState: ptr ptr ID3D11BlendState): HRESULT {.
        stdcall.}
    CreateDepthStencilState*: proc (This: ptr ID3D11Device1; pDepthStencilDesc: ptr D3D11_DEPTH_STENCIL_DESC; 
        ppDepthStencilState: ptr ptr ID3D11DepthStencilState): HRESULT {.stdcall.}
    CreateRasterizerState*: proc (This: ptr ID3D11Device1; 
                                  pRasterizerDesc: ptr D3D11_RASTERIZER_DESC; 
        ppRasterizerState: ptr ptr ID3D11RasterizerState): HRESULT {.stdcall.}
    CreateSamplerState*: proc (This: ptr ID3D11Device1; 
                               pSamplerDesc: ptr D3D11_SAMPLER_DESC; 
                               ppSamplerState: ptr ptr ID3D11SamplerState): HRESULT {.
        stdcall.}
    CreateQuery*: proc (This: ptr ID3D11Device1; 
                        pQueryDesc: ptr D3D11_QUERY_DESC; 
                        ppQuery: ptr ptr ID3D11Query): HRESULT {.stdcall.}
    CreatePredicate*: proc (This: ptr ID3D11Device1; 
                            pPredicateDesc: ptr D3D11_QUERY_DESC; 
                            ppPredicate: ptr ptr ID3D11Predicate): HRESULT {.
        stdcall.}
    CreateCounter*: proc (This: ptr ID3D11Device1; 
                          pCounterDesc: ptr D3D11_COUNTER_DESC; 
                          ppCounter: ptr ptr ID3D11Counter): HRESULT {.stdcall.}
    CreateDeferredContext*: proc (This: ptr ID3D11Device1; ContextFlags: UINT; 
        ppDeferredContext: ptr ptr ID3D11DeviceContext): HRESULT {.stdcall.}
    OpenSharedResource*: proc (This: ptr ID3D11Device1; hResource: HANDLE; 
                               ReturnedInterface: ptr IID; 
                               ppResource: ptr pointer): HRESULT {.stdcall.}
    CheckFormatSupport*: proc (This: ptr ID3D11Device1; Format: DXGI_FORMAT; 
                               pFormatSupport: ptr UINT): HRESULT {.stdcall.}
    CheckMultisampleQualityLevels*: proc (This: ptr ID3D11Device1; 
        Format: DXGI_FORMAT; SampleCount: UINT; pNumQualityLevels: ptr UINT): HRESULT {.
        stdcall.}
    CheckCounterInfo*: proc (This: ptr ID3D11Device1; 
                             pCounterInfo: ptr D3D11_COUNTER_INFO) {.stdcall.}
    CheckCounter*: proc (This: ptr ID3D11Device1; pDesc: ptr D3D11_COUNTER_DESC; 
                         pType: ptr D3D11_COUNTER_TYPE; 
                         pActiveCounters: ptr UINT; szName: LPSTR; 
                         pNameLength: ptr UINT; szUnits: LPSTR; 
                         pUnitsLength: ptr UINT; szDescription: LPSTR; 
                         pDescriptionLength: ptr UINT): HRESULT {.stdcall.}
    CheckFeatureSupport*: proc (This: ptr ID3D11Device1; Feature: D3D11_FEATURE; 
                                pFeatureSupportData: pointer; 
                                FeatureSupportDataSize: UINT): HRESULT {.stdcall.}
    GetPrivateData*: proc (This: ptr ID3D11Device1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}
    SetPrivateData*: proc (This: ptr ID3D11Device1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.}
    SetPrivateDataInterface*: proc (This: ptr ID3D11Device1; guid: ptr GUID; 
                                    pData: ptr IUnknown): HRESULT {.stdcall.}
    GetFeatureLevel*: proc (This: ptr ID3D11Device1): D3D_FEATURE_LEVEL {.
        stdcall.}
    GetCreationFlags*: proc (This: ptr ID3D11Device1): UINT {.stdcall.}
    GetDeviceRemovedReason*: proc (This: ptr ID3D11Device1): HRESULT {.stdcall.}
    GetImmediateContext*: proc (This: ptr ID3D11Device1; 
                                ppImmediateContext: ptr ptr ID3D11DeviceContext) {.
        stdcall.}
    SetExceptionMode*: proc (This: ptr ID3D11Device1; RaiseFlags: UINT): HRESULT {.
        stdcall.}
    GetExceptionMode*: proc (This: ptr ID3D11Device1): UINT {.stdcall.}
    GetImmediateContext1*: proc (This: ptr ID3D11Device1; ppImmediateContext: ptr ptr ID3D11DeviceContext1) {.
        stdcall.}
    CreateDeferredContext1*: proc (This: ptr ID3D11Device1; ContextFlags: UINT; 
        ppDeferredContext: ptr ptr ID3D11DeviceContext1): HRESULT {.stdcall.}
    CreateBlendState1*: proc (This: ptr ID3D11Device1; 
                              pBlendStateDesc: ptr D3D11_BLEND_DESC1; 
                              ppBlendState: ptr ptr ID3D11BlendState1): HRESULT {.
        stdcall.}
    CreateRasterizerState1*: proc (This: ptr ID3D11Device1; 
                                   pRasterizerDesc: ptr D3D11_RASTERIZER_DESC1; 
        ppRasterizerState: ptr ptr ID3D11RasterizerState1): HRESULT {.stdcall.}
    CreateDeviceContextState*: proc (This: ptr ID3D11Device1; Flags: UINT; 
                                     pFeatureLevels: ptr D3D_FEATURE_LEVEL; 
                                     FeatureLevels: UINT; SDKVersion: UINT; 
                                     EmulatedInterface: ptr IID; 
        pChosenFeatureLevel: ptr D3D_FEATURE_LEVEL; ppContextState: ptr ptr ID3DDeviceContextState): HRESULT {.
        stdcall.}
    OpenSharedResource1*: proc (This: ptr ID3D11Device1; hResource: HANDLE; 
                                returnedInterface: ptr IID; 
                                ppResource: ptr pointer): HRESULT {.stdcall.}
    OpenSharedResourceByName*: proc (This: ptr ID3D11Device1; lpName: LPCWSTR; 
                                     dwDesiredAccess: DWORD; 
                                     returnedInterface: ptr IID; 
                                     ppResource: ptr pointer): HRESULT {.stdcall.}

  ID3D11Device1* = object 
    lpVtbl*: ptr ID3D11Device1Vtbl

  ID3DUserDefinedAnnotationVtbl* = object 
    QueryInterface*: proc (This: ptr ID3DUserDefinedAnnotation; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc (This: ptr ID3DUserDefinedAnnotation): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3DUserDefinedAnnotation): ULONG {.stdcall.}
    BeginEvent*: proc (This: ptr ID3DUserDefinedAnnotation; Name: LPCWSTR): INT {.
        stdcall.}
    EndEvent*: proc (This: ptr ID3DUserDefinedAnnotation): INT {.stdcall.}
    SetMarker*: proc (This: ptr ID3DUserDefinedAnnotation; Name: LPCWSTR) {.
        stdcall.}
    GetStatus*: proc (This: ptr ID3DUserDefinedAnnotation): BOOL {.stdcall.}

  ID3DUserDefinedAnnotation* = object 
    lpVtbl*: ptr ID3DUserDefinedAnnotationVtbl


var IID_ID3D11BlendState1* {.importc.}: GUID

var IID_ID3D11RasterizerState1* {.importc.}: GUID

var IID_ID3DDeviceContextState* {.importc.}: GUID

var IID_ID3D11DeviceContext1* {.importc.}: GUID

var IID_ID3D11VideoContext1* {.importc.}: GUID

var IID_ID3D11VideoDevice1* {.importc.}: GUID

var IID_ID3D11VideoProcessorEnumerator1* {.importc.}: GUID

var IID_ID3D11Device1* {.importc.}: GUID

var IID_ID3DUserDefinedAnnotation* {.importc.}: GUID

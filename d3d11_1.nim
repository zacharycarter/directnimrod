# Forward Declarations 
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
type IUnknown = object
type 
  D3D11_COPY_FLAGS* {.size: sizeof(cint).} = enum 
    D3D11_COPY_NO_OVERWRITE = 0x00000001, D3D11_COPY_DISCARD = 0x00000002
  D3D11_LOGIC_OP* {.size: sizeof(cint).} = enum 
    D3D11_LOGIC_OP_CLEAR = 0, D3D11_LOGIC_OP_SET = (D3D11_LOGIC_OP_CLEAR.int + 1), 
    D3D11_LOGIC_OP_COPY = (D3D11_LOGIC_OP_SET.int + 1), 
    D3D11_LOGIC_OP_COPY_INVERTED = (D3D11_LOGIC_OP_COPY.int + 1), 
    D3D11_LOGIC_OP_NOOP = (D3D11_LOGIC_OP_COPY_INVERTED.int + 1), 
    D3D11_LOGIC_OP_INVERT = (D3D11_LOGIC_OP_NOOP.int + 1), 
    D3D11_LOGIC_OP_AND = (D3D11_LOGIC_OP_INVERT.int + 1), 
    D3D11_LOGIC_OP_NAND = (D3D11_LOGIC_OP_AND.int + 1), 
    D3D11_LOGIC_OP_OR = (D3D11_LOGIC_OP_NAND.int + 1), 
    D3D11_LOGIC_OP_NOR = (D3D11_LOGIC_OP_OR.int + 1), 
    D3D11_LOGIC_OP_XOR = (D3D11_LOGIC_OP_NOR.int + 1), 
    D3D11_LOGIC_OP_EQUIV = (D3D11_LOGIC_OP_XOR.int + 1), 
    D3D11_LOGIC_OP_AND_REVERSE = (D3D11_LOGIC_OP_EQUIV.int + 1), 
    D3D11_LOGIC_OP_AND_INVERTED = (D3D11_LOGIC_OP_AND_REVERSE.int + 1), 
    D3D11_LOGIC_OP_OR_REVERSE = (D3D11_LOGIC_OP_AND_INVERTED.int + 1), 
    D3D11_LOGIC_OP_OR_INVERTED = (D3D11_LOGIC_OP_OR_REVERSE.int + 1)
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




# Note, the array size for RenderTarget[] above is D3D11_SIMULTANEOUS_RENDERTARGET_COUNT. 
#   IDL processing/generation of this header replaces the define; this comment is merely explaining what happened. 



# interface ID3D11BlendState1 
# [unique][local][object][uuid] 


type 
  ID3D11BlendState1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11BlendState1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr ID3D11BlendState1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11BlendState1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11BlendState1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.} # [annotation] 
    GetPrivateData*: proc (This: ptr ID3D11BlendState1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    SetPrivateData*: proc (This: ptr ID3D11BlendState1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
    SetPrivateDataInterface*: proc (This: ptr ID3D11BlendState1; guid: ptr GUID; 
                                    pData: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
    GetDesc*: proc (This: ptr ID3D11BlendState1; pDesc: ptr D3D11_BLEND_DESC) {.
        stdcall.}             # [annotation] 
    GetDesc1*: proc (This: ptr ID3D11BlendState1; pDesc: ptr D3D11_BLEND_DESC1) {.
        stdcall.}             # [annotation] 
  
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


type

  ID3D11RasterizerState1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11RasterizerState1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr ID3D11RasterizerState1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11RasterizerState1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11RasterizerState1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.} # [annotation] 
    GetPrivateData*: proc (This: ptr ID3D11RasterizerState1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    SetPrivateData*: proc (This: ptr ID3D11RasterizerState1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
    SetPrivateDataInterface*: proc (This: ptr ID3D11RasterizerState1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    GetDesc*: proc (This: ptr ID3D11RasterizerState1; 
                    pDesc: ptr D3D11_RASTERIZER_DESC) {.stdcall.} # [annotation] 
    GetDesc1*: proc (This: ptr ID3D11RasterizerState1; 
                     pDesc: ptr D3D11_RASTERIZER_DESC1) {.stdcall.} # [annotation] 
  
  ID3D11RasterizerState1* = object 
    lpVtbl*: ptr ID3D11RasterizerState1Vtbl


  D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG* {.size: sizeof(cint).} = enum 
    D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED = 0x00000001




  ID3DDeviceContextStateVtbl* = object 
    QueryInterface*: proc (This: ptr ID3DDeviceContextState; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 

    AddRef*: proc (This: ptr ID3DDeviceContextState): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3DDeviceContextState): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3DDeviceContextState; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.} # [annotation] 
    GetPrivateData*: proc (This: ptr ID3DDeviceContextState; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation] 

    SetPrivateData*: proc (This: ptr ID3DDeviceContextState; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 

    SetPrivateDataInterface*: proc (This: ptr ID3DDeviceContextState; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
  
  ID3DDeviceContextState* = object 
    lpVtbl*: ptr ID3DDeviceContextStateVtbl

type

  
  ID3D11DeviceContext1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11DeviceContext1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr ID3D11DeviceContext1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11DeviceContext1): ULONG {.stdcall.}
    GetDevice*: proc (This: ptr ID3D11DeviceContext1; 
                      ppDevice: ptr ptr ID3D11Device) {.stdcall.} # [annotation] 
    GetPrivateData*: proc (This: ptr ID3D11DeviceContext1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    SetPrivateData*: proc (This: ptr ID3D11DeviceContext1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 

    SetPrivateDataInterface*: proc (This: ptr ID3D11DeviceContext1; 
                                    guid: ptr GUID; pData: ptr IUnknown): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    VSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    PSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    PSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pPixelShader: ptr ID3D11PixelShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.} # [annotation] 
                                                             # [annotation] 
    PSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    VSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pVertexShader: ptr ID3D11VertexShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.} # [annotation] 
                                                             # [annotation] 
    DrawIndexed*: proc (This: ptr ID3D11DeviceContext1; IndexCount: UINT; 
                        StartIndexLocation: UINT; BaseVertexLocation: INT) {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    Draw*: proc (This: ptr ID3D11DeviceContext1; VertexCount: UINT; 
                 StartVertexLocation: UINT) {.stdcall.} # [annotation] 
                                                        # [annotation] 
    Map*: proc (This: ptr ID3D11DeviceContext1; pResource: ptr ID3D11Resource; 
                Subresource: UINT; MapType: D3D11_MAP; MapFlags: UINT; 
                pMappedResource: ptr D3D11_MAPPED_SUBRESOURCE): HRESULT {.
        stdcall.}             # [annotation] 

    Unmap*: proc (This: ptr ID3D11DeviceContext1; pResource: ptr ID3D11Resource; 
                  Subresource: UINT) {.stdcall.} # [annotation] 
                                                 # [annotation] 
    PSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    IASetInputLayout*: proc (This: ptr ID3D11DeviceContext1; 
                             pInputLayout: ptr ID3D11InputLayout) {.stdcall.} # 
                                                                              # [annotation] 
    IASetVertexBuffers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                               NumBuffers: UINT; 
                               ppVertexBuffers: ptr ptr ID3D11Buffer; 
                               pStrides: ptr UINT; pOffsets: ptr UINT) {.stdcall.} # 

    IASetIndexBuffer*: proc (This: ptr ID3D11DeviceContext1; 
                             pIndexBuffer: ptr ID3D11Buffer; 
                             Format: DXGI_FORMAT; Offset: UINT) {.stdcall.} # 

    DrawIndexedInstanced*: proc (This: ptr ID3D11DeviceContext1; 
                                 IndexCountPerInstance: UINT; 
                                 InstanceCount: UINT; StartIndexLocation: UINT; 
                                 BaseVertexLocation: INT; 
                                 StartInstanceLocation: UINT) {.stdcall.} # 

    DrawInstanced*: proc (This: ptr ID3D11DeviceContext1; 
                          VertexCountPerInstance: UINT; InstanceCount: UINT; 
                          StartVertexLocation: UINT; StartInstanceLocation: UINT) {.
        stdcall.}             # [annotation] 

    GSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    GSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pShader: ptr ID3D11GeometryShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.} # [annotation] 
                                                             # [annotation] 
    IASetPrimitiveTopology*: proc (This: ptr ID3D11DeviceContext1; 
                                   Topology: D3D11_PRIMITIVE_TOPOLOGY) {.stdcall.} # 
    
    VSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
                                 ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    VSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 
 
    Begin*: proc (This: ptr ID3D11DeviceContext1; pAsync: ptr ID3D11Asynchronous) {.
        stdcall.}             # [annotation] 
    `End`*: proc (This: ptr ID3D11DeviceContext1; pAsync: ptr ID3D11Asynchronous) {.
        stdcall.}             # [annotation] 
    GetData*: proc (This: ptr ID3D11DeviceContext1; 
                    pAsync: ptr ID3D11Asynchronous; pData: pointer; 
                    DataSize: UINT; GetDataFlags: UINT): HRESULT {.stdcall.} # 

    SetPredication*: proc (This: ptr ID3D11DeviceContext1; 
                           pPredicate: ptr ID3D11Predicate; PredicateValue: BOOL) {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    GSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    GSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    OMSetRenderTargets*: proc (This: ptr ID3D11DeviceContext1; NumViews: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; 
                               pDepthStencilView: ptr ID3D11DepthStencilView) {.
        stdcall.}             # [annotation] 

    OMSetRenderTargetsAndUnorderedAccessViews*: proc (
        This: ptr ID3D11DeviceContext1; NumRTVs: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; 
        pDepthStencilView: ptr ID3D11DepthStencilView; UAVStartSlot: UINT; 
        NumUAVs: UINT; 
        ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView; 
        pUAVInitialCounts: ptr UINT) {.stdcall.} # [annotation] 

    OMSetBlendState*: proc (This: ptr ID3D11DeviceContext1; 
                            pBlendState: ptr ID3D11BlendState; 
                            BlendFactor: array[4, FLOAT]; SampleMask: UINT) {.
        stdcall.}             # [annotation] 

    OMSetDepthStencilState*: proc (This: ptr ID3D11DeviceContext1; 
        pDepthStencilState: ptr ID3D11DepthStencilState; StencilRef: UINT) {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    SOSetTargets*: proc (This: ptr ID3D11DeviceContext1; NumBuffers: UINT; 
                         ppSOTargets: ptr ptr ID3D11Buffer; pOffsets: ptr UINT) {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    DrawAuto*: proc (This: ptr ID3D11DeviceContext1) {.stdcall.}
    DrawIndexedInstancedIndirect*: proc (This: ptr ID3D11DeviceContext1; 
        pBufferForArgs: ptr ID3D11Buffer; AlignedByteOffsetForArgs: UINT) {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    DrawInstancedIndirect*: proc (This: ptr ID3D11DeviceContext1; 
                                  pBufferForArgs: ptr ID3D11Buffer; 
                                  AlignedByteOffsetForArgs: UINT) {.stdcall.} # 

    Dispatch*: proc (This: ptr ID3D11DeviceContext1; ThreadGroupCountX: UINT; 
                     ThreadGroupCountY: UINT; ThreadGroupCountZ: UINT) {.stdcall.} # 

    DispatchIndirect*: proc (This: ptr ID3D11DeviceContext1; 
                             pBufferForArgs: ptr ID3D11Buffer; 
                             AlignedByteOffsetForArgs: UINT) {.stdcall.} # 

    RSSetState*: proc (This: ptr ID3D11DeviceContext1; 
                       pRasterizerState: ptr ID3D11RasterizerState) {.stdcall.} # 
                                                                                # [annotation] 
    RSSetViewports*: proc (This: ptr ID3D11DeviceContext1; NumViewports: UINT; 
                           pViewports: ptr D3D11_VIEWPORT) {.stdcall.} # 

    RSSetScissorRects*: proc (This: ptr ID3D11DeviceContext1; NumRects: UINT; 
                              pRects: ptr D3D11_RECT) {.stdcall.} # [annotation] 
                                                                  # [annotation] 
    CopySubresourceRegion*: proc (This: ptr ID3D11DeviceContext1; 
                                  pDstResource: ptr ID3D11Resource; 
                                  DstSubresource: UINT; DstX: UINT; DstY: UINT; 
                                  DstZ: UINT; pSrcResource: ptr ID3D11Resource; 
                                  SrcSubresource: UINT; pSrcBox: ptr D3D11_BOX) {.
        stdcall.}             # [annotation] 

    CopyResource*: proc (This: ptr ID3D11DeviceContext1; 
                         pDstResource: ptr ID3D11Resource; 
                         pSrcResource: ptr ID3D11Resource) {.stdcall.} # 
                                                                       # [annotation] 
                                                                       # 
                                                                       # [annotation] 
    UpdateSubresource*: proc (This: ptr ID3D11DeviceContext1; 
                              pDstResource: ptr ID3D11Resource; 
                              DstSubresource: UINT; pDstBox: ptr D3D11_BOX; 
                              pSrcData: pointer; SrcRowPitch: UINT; 
                              SrcDepthPitch: UINT) {.stdcall.} # [annotation] 

    CopyStructureCount*: proc (This: ptr ID3D11DeviceContext1; 
                               pDstBuffer: ptr ID3D11Buffer; 
                               DstAlignedByteOffset: UINT; 
                               pSrcView: ptr ID3D11UnorderedAccessView) {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    ClearRenderTargetView*: proc (This: ptr ID3D11DeviceContext1; 
        pRenderTargetView: ptr ID3D11RenderTargetView; 
                                  ColorRGBA: array[4, FLOAT]) {.stdcall.} # 
                                                                          # [annotation] 
                                                                          # 
                                                                          # [annotation] 
    ClearUnorderedAccessViewUint*: proc (This: ptr ID3D11DeviceContext1; 
        pUnorderedAccessView: ptr ID3D11UnorderedAccessView; 
        Values: array[4, UINT]) {.stdcall.} # [annotation] 
                                            # [annotation] 
    ClearUnorderedAccessViewFloat*: proc (This: ptr ID3D11DeviceContext1; 
        pUnorderedAccessView: ptr ID3D11UnorderedAccessView; 
        Values: array[4, FLOAT]) {.stdcall.} # [annotation] 
                                             # [annotation] 
    ClearDepthStencilView*: proc (This: ptr ID3D11DeviceContext1; 
        pDepthStencilView: ptr ID3D11DepthStencilView; ClearFlags: UINT; 
                                  Depth: FLOAT; Stencil: UINT8) {.stdcall.} # 

    GenerateMips*: proc (This: ptr ID3D11DeviceContext1; 
                         pShaderResourceView: ptr ID3D11ShaderResourceView) {.
        stdcall.}             # [annotation] 
    SetResourceMinLOD*: proc (This: ptr ID3D11DeviceContext1; 
                              pResource: ptr ID3D11Resource; MinLOD: FLOAT) {.
        stdcall.}             # [annotation] 
    GetResourceMinLOD*: proc (This: ptr ID3D11DeviceContext1; 
                              pResource: ptr ID3D11Resource): FLOAT {.stdcall.} # 
                                                                                # [annotation] 
    ResolveSubresource*: proc (This: ptr ID3D11DeviceContext1; 
                               pDstResource: ptr ID3D11Resource; 
                               DstSubresource: UINT; 
                               pSrcResource: ptr ID3D11Resource; 
                               SrcSubresource: UINT; Format: DXGI_FORMAT) {.
        stdcall.}             # [annotation] 

    ExecuteCommandList*: proc (This: ptr ID3D11DeviceContext1; 
                               pCommandList: ptr ID3D11CommandList; 
                               RestoreContextState: BOOL) {.stdcall.} # 
                                                                      # [annotation] 
    HSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    HSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pHullShader: ptr ID3D11HullShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.} # [annotation] 
                                                             # [annotation] 
    HSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    HSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    DSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    DSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pDomainShader: ptr ID3D11DomainShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.} # [annotation] 
                                                             # [annotation] 
    DSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    DSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    CSSetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    CSSetUnorderedAccessViews*: proc (This: ptr ID3D11DeviceContext1; 
                                      StartSlot: UINT; NumUAVs: UINT; 
        ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView; 
                                      pUAVInitialCounts: ptr UINT) {.stdcall.} # 

    CSSetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        pComputeShader: ptr ID3D11ComputeShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        NumClassInstances: UINT) {.stdcall.} # [annotation] 
                                                             # [annotation] 
    CSSetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    CSSetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    VSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    PSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    PSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppPixelShader: ptr ptr ID3D11PixelShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.} # [annotation] 

    PSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    VSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppVertexShader: ptr ptr ID3D11VertexShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.} # [annotation] 

    PSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    IAGetInputLayout*: proc (This: ptr ID3D11DeviceContext1; 
                             ppInputLayout: ptr ptr ID3D11InputLayout) {.stdcall.} # 
                                                                                   # [annotation] 
    IAGetVertexBuffers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                               NumBuffers: UINT; 
                               ppVertexBuffers: ptr ptr ID3D11Buffer; 
                               pStrides: ptr UINT; pOffsets: ptr UINT) {.stdcall.} # 

    IAGetIndexBuffer*: proc (This: ptr ID3D11DeviceContext1; 
                             pIndexBuffer: ptr ptr ID3D11Buffer; 
                             Format: ptr DXGI_FORMAT; Offset: ptr UINT) {.
        stdcall.}             # [annotation] 

    GSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    GSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppGeometryShader: ptr ptr ID3D11GeometryShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.} # [annotation] 

    IAGetPrimitiveTopology*: proc (This: ptr ID3D11DeviceContext1; 
                                   pTopology: ptr D3D11_PRIMITIVE_TOPOLOGY) {.
        stdcall.}             # [annotation] 
    VSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    VSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    GetPredication*: proc (This: ptr ID3D11DeviceContext1; 
                           ppPredicate: ptr ptr ID3D11Predicate; 
                           pPredicateValue: ptr BOOL) {.stdcall.} # [annotation] 
                                                                  # [annotation] 
    GSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    GSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    OMGetRenderTargets*: proc (This: ptr ID3D11DeviceContext1; NumViews: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; ppDepthStencilView: ptr ptr ID3D11DepthStencilView) {.
        stdcall.}             # [annotation] 

    OMGetRenderTargetsAndUnorderedAccessViews*: proc (
        This: ptr ID3D11DeviceContext1; NumRTVs: UINT; 
        ppRenderTargetViews: ptr ptr ID3D11RenderTargetView; 
        ppDepthStencilView: ptr ptr ID3D11DepthStencilView; UAVStartSlot: UINT; 
        NumUAVs: UINT; ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView) {.
        stdcall.}             # [annotation] 

    OMGetBlendState*: proc (This: ptr ID3D11DeviceContext1; 
                            ppBlendState: ptr ptr ID3D11BlendState; 
                            BlendFactor: array[4, FLOAT]; pSampleMask: ptr UINT) {.
        stdcall.}             # [annotation] 

    OMGetDepthStencilState*: proc (This: ptr ID3D11DeviceContext1; 
        ppDepthStencilState: ptr ptr ID3D11DepthStencilState; 
                                   pStencilRef: ptr UINT) {.stdcall.} # 

    SOGetTargets*: proc (This: ptr ID3D11DeviceContext1; NumBuffers: UINT; 
                         ppSOTargets: ptr ptr ID3D11Buffer) {.stdcall.} # 

    RSGetState*: proc (This: ptr ID3D11DeviceContext1; 
                       ppRasterizerState: ptr ptr ID3D11RasterizerState) {.
        stdcall.}             # [annotation] 
    RSGetViewports*: proc (This: ptr ID3D11DeviceContext1; 
                           pNumViewports: ptr UINT; 
                           pViewports: ptr D3D11_VIEWPORT) {.stdcall.} # 

    RSGetScissorRects*: proc (This: ptr ID3D11DeviceContext1; 
                              pNumRects: ptr UINT; pRects: ptr D3D11_RECT) {.
        stdcall.} # [annotation] 
                  #_range(0, D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE )
                  # [annotation] 
    HSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    HSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppHullShader: ptr ptr ID3D11HullShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.} # [annotation] 

    HSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    HSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    DSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    DSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppDomainShader: ptr ptr ID3D11DomainShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.} # [annotation] 

    DSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    DSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    CSGetShaderResources*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumViews: UINT; 
        ppShaderResourceViews: ptr ptr ID3D11ShaderResourceView) {.stdcall.} # 

    CSGetUnorderedAccessViews*: proc (This: ptr ID3D11DeviceContext1; 
                                      StartSlot: UINT; NumUAVs: UINT; 
        ppUnorderedAccessViews: ptr ptr ID3D11UnorderedAccessView) {.stdcall.} # 

    CSGetShader*: proc (This: ptr ID3D11DeviceContext1; 
                        ppComputeShader: ptr ptr ID3D11ComputeShader; 
                        ppClassInstances: ptr ptr ID3D11ClassInstance; 
                        pNumClassInstances: ptr UINT) {.stdcall.} # [annotation] 

    CSGetSamplers*: proc (This: ptr ID3D11DeviceContext1; StartSlot: UINT; 
                          NumSamplers: UINT; 
                          ppSamplers: ptr ptr ID3D11SamplerState) {.stdcall.} # 

    CSGetConstantBuffers*: proc (This: ptr ID3D11DeviceContext1; 
                                 StartSlot: UINT; NumBuffers: UINT; 
                                 ppConstantBuffers: ptr ptr ID3D11Buffer) {.
        stdcall.}             # [annotation] 

    ClearState*: proc (This: ptr ID3D11DeviceContext1) {.stdcall.}
    Flush*: proc (This: ptr ID3D11DeviceContext1) {.stdcall.}
    GetType*: proc (This: ptr ID3D11DeviceContext1): D3D11_DEVICE_CONTEXT_TYPE {.
        stdcall.}
    GetContextFlags*: proc (This: ptr ID3D11DeviceContext1): UINT {.stdcall.}
    FinishCommandList*: proc (This: ptr ID3D11DeviceContext1; 
                              RestoreDeferredContextState: BOOL; 
                              ppCommandList: ptr ptr ID3D11CommandList): HRESULT {.
        stdcall.}             # [annotation] 
    CopySubresourceRegion1*: proc (This: ptr ID3D11DeviceContext1; 
                                   pDstResource: ptr ID3D11Resource; 
                                   DstSubresource: UINT; DstX: UINT; DstY: UINT; 
                                   DstZ: UINT; pSrcResource: ptr ID3D11Resource; 
                                   SrcSubresource: UINT; pSrcBox: ptr D3D11_BOX; 
                                   CopyFlags: UINT) {.stdcall.} # [annotation] 

    UpdateSubresource1*: proc (This: ptr ID3D11DeviceContext1; 
                               pDstResource: ptr ID3D11Resource; 
                               DstSubresource: UINT; pDstBox: ptr D3D11_BOX; 
                               pSrcData: pointer; SrcRowPitch: UINT; 
                               SrcDepthPitch: UINT; CopyFlags: UINT) {.stdcall.} # 

    DiscardResource*: proc (This: ptr ID3D11DeviceContext1; 
                            pResource: ptr ID3D11Resource) {.stdcall.} # 
                                                                       # [annotation] 
    DiscardView*: proc (This: ptr ID3D11DeviceContext1; 
                        pResourceView: ptr ID3D11View) {.stdcall.} # [annotation] 
    VSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    HSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 
  
    DSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    GSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    PSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    CSSetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    VSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    HSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    DSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    GSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    PSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 

    CSGetConstantBuffers1*: proc (This: ptr ID3D11DeviceContext1; 
                                  StartSlot: UINT; NumBuffers: UINT; 
                                  ppConstantBuffers: ptr ptr ID3D11Buffer; 
                                  pFirstConstant: ptr UINT; 
                                  pNumConstants: ptr UINT) {.stdcall.} # 
  
    SwapDeviceContextState*: proc (This: ptr ID3D11DeviceContext1; 
                                   pState: ptr ID3DDeviceContextState; 
        ppPreviousState: ptr ptr ID3DDeviceContextState) {.stdcall.} # 
                                                                     # [annotation] 
                                                                     # 
                                                                     # [annotation] 
    ClearView*: proc (This: ptr ID3D11DeviceContext1; pView: ptr ID3D11View; 
                      Color: array[4, FLOAT]; pRect: ptr D3D11_RECT; 
                      NumRects: UINT) {.stdcall.} # [annotation] 
                                                  # [annotation] 
                                                  # [annotation] 
    DiscardView1*: proc (This: ptr ID3D11DeviceContext1; 
                         pResourceView: ptr ID3D11View; pRects: ptr D3D11_RECT; 
                         NumRects: UINT) {.stdcall.} # [annotation] 
                                                     # [annotation] 
  
  ID3D11DeviceContext1* = object 
    lpVtbl*: ptr ID3D11DeviceContext1Vtbl

type
  ID3D11Device1Vtbl* = object 
    QueryInterface*: proc (This: ptr ID3D11Device1; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr ID3D11Device1): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3D11Device1): ULONG {.stdcall.}
    CreateBuffer*: proc (This: ptr ID3D11Device1; pDesc: ptr D3D11_BUFFER_DESC; 
                         pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                         ppBuffer: ptr ptr ID3D11Buffer): HRESULT {.stdcall.} # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
    CreateTexture1D*: proc (This: ptr ID3D11Device1; 
                            pDesc: ptr D3D11_TEXTURE1D_DESC; 
                            pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                            ppTexture1D: ptr ptr ID3D11Texture1D): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateTexture2D*: proc (This: ptr ID3D11Device1; 
                            pDesc: ptr D3D11_TEXTURE2D_DESC; 
                            pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                            ppTexture2D: ptr ptr ID3D11Texture2D): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateTexture3D*: proc (This: ptr ID3D11Device1; 
                            pDesc: ptr D3D11_TEXTURE3D_DESC; 
                            pInitialData: ptr D3D11_SUBRESOURCE_DATA; 
                            ppTexture3D: ptr ptr ID3D11Texture3D): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateShaderResourceView*: proc (This: ptr ID3D11Device1; 
                                     pResource: ptr ID3D11Resource; pDesc: ptr D3D11_SHADER_RESOURCE_VIEW_DESC; 
                                     ppSRView: ptr ptr ID3D11ShaderResourceView): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateUnorderedAccessView*: proc (This: ptr ID3D11Device1; 
                                      pResource: ptr ID3D11Resource; pDesc: ptr D3D11_UNORDERED_ACCESS_VIEW_DESC; 
        ppUAView: ptr ptr ID3D11UnorderedAccessView): HRESULT {.stdcall.} # 
                                                                          # [annotation] 
                                                                          # 
                                                                          # [annotation] 
                                                                          # 
                                                                          # [annotation] 
    CreateRenderTargetView*: proc (This: ptr ID3D11Device1; 
                                   pResource: ptr ID3D11Resource; 
                                   pDesc: ptr D3D11_RENDER_TARGET_VIEW_DESC; 
                                   ppRTView: ptr ptr ID3D11RenderTargetView): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateDepthStencilView*: proc (This: ptr ID3D11Device1; 
                                   pResource: ptr ID3D11Resource; 
                                   pDesc: ptr D3D11_DEPTH_STENCIL_VIEW_DESC; 
        ppDepthStencilView: ptr ptr ID3D11DepthStencilView): HRESULT {.stdcall.} # 
                                                                                 # [annotation] 
                                                                                 # 
                                                                                 # [annotation] 
                                                                                 # 
                                                                                 # [annotation] 
    CreateInputLayout*: proc (This: ptr ID3D11Device1; 
                              pInputElementDescs: ptr D3D11_INPUT_ELEMENT_DESC; 
                              NumElements: UINT; 
                              pShaderBytecodeWithInputSignature: pointer; 
                              BytecodeLength: SIZE_T; 
                              ppInputLayout: ptr ptr ID3D11InputLayout): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateVertexShader*: proc (This: ptr ID3D11Device1; 
                               pShaderBytecode: pointer; BytecodeLength: SIZE_T; 
                               pClassLinkage: ptr ID3D11ClassLinkage; 
                               ppVertexShader: ptr ptr ID3D11VertexShader): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateGeometryShader*: proc (This: ptr ID3D11Device1; 
                                 pShaderBytecode: pointer; 
                                 BytecodeLength: SIZE_T; 
                                 pClassLinkage: ptr ID3D11ClassLinkage; 
                                 ppGeometryShader: ptr ptr ID3D11GeometryShader): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateGeometryShaderWithStreamOutput*: proc (This: ptr ID3D11Device1; 
        pShaderBytecode: pointer; BytecodeLength: SIZE_T; 
        pSODeclaration: ptr D3D11_SO_DECLARATION_ENTRY; NumEntries: UINT; 
        pBufferStrides: ptr UINT; NumStrides: UINT; RasterizedStream: UINT; 
        pClassLinkage: ptr ID3D11ClassLinkage; 
        ppGeometryShader: ptr ptr ID3D11GeometryShader): HRESULT {.stdcall.} # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
    CreatePixelShader*: proc (This: ptr ID3D11Device1; pShaderBytecode: pointer; 
                              BytecodeLength: SIZE_T; 
                              pClassLinkage: ptr ID3D11ClassLinkage; 
                              ppPixelShader: ptr ptr ID3D11PixelShader): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateHullShader*: proc (This: ptr ID3D11Device1; pShaderBytecode: pointer; 
                             BytecodeLength: SIZE_T; 
                             pClassLinkage: ptr ID3D11ClassLinkage; 
                             ppHullShader: ptr ptr ID3D11HullShader): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateDomainShader*: proc (This: ptr ID3D11Device1; 
                               pShaderBytecode: pointer; BytecodeLength: SIZE_T; 
                               pClassLinkage: ptr ID3D11ClassLinkage; 
                               ppDomainShader: ptr ptr ID3D11DomainShader): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateComputeShader*: proc (This: ptr ID3D11Device1; 
                                pShaderBytecode: pointer; 
                                BytecodeLength: SIZE_T; 
                                pClassLinkage: ptr ID3D11ClassLinkage; 
                                ppComputeShader: ptr ptr ID3D11ComputeShader): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CreateClassLinkage*: proc (This: ptr ID3D11Device1; 
                               ppLinkage: ptr ptr ID3D11ClassLinkage): HRESULT {.
        stdcall.}             # [annotation] 
    CreateBlendState*: proc (This: ptr ID3D11Device1; 
                             pBlendStateDesc: ptr D3D11_BLEND_DESC; 
                             ppBlendState: ptr ptr ID3D11BlendState): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    CreateDepthStencilState*: proc (This: ptr ID3D11Device1; pDepthStencilDesc: ptr D3D11_DEPTH_STENCIL_DESC; 
        ppDepthStencilState: ptr ptr ID3D11DepthStencilState): HRESULT {.stdcall.} # 
                                                                                   # [annotation] 
                                                                                   # 
                                                                                   # [annotation] 
    CreateRasterizerState*: proc (This: ptr ID3D11Device1; 
                                  pRasterizerDesc: ptr D3D11_RASTERIZER_DESC; 
        ppRasterizerState: ptr ptr ID3D11RasterizerState): HRESULT {.stdcall.} # 
                                                                               # [annotation] 
                                                                               # 
                                                                               # [annotation] 
    CreateSamplerState*: proc (This: ptr ID3D11Device1; 
                               pSamplerDesc: ptr D3D11_SAMPLER_DESC; 
                               ppSamplerState: ptr ptr ID3D11SamplerState): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    CreateQuery*: proc (This: ptr ID3D11Device1; 
                        pQueryDesc: ptr D3D11_QUERY_DESC; 
                        ppQuery: ptr ptr ID3D11Query): HRESULT {.stdcall.} # 
                                                                           # [annotation] 
                                                                           # 
                                                                           # [annotation] 
    CreatePredicate*: proc (This: ptr ID3D11Device1; 
                            pPredicateDesc: ptr D3D11_QUERY_DESC; 
                            ppPredicate: ptr ptr ID3D11Predicate): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    CreateCounter*: proc (This: ptr ID3D11Device1; 
                          pCounterDesc: ptr D3D11_COUNTER_DESC; 
                          ppCounter: ptr ptr ID3D11Counter): HRESULT {.stdcall.} # 
                                                                                 # [annotation] 
                                                                                 # 
                                                                                 # [annotation] 
    CreateDeferredContext*: proc (This: ptr ID3D11Device1; ContextFlags: UINT; 
        ppDeferredContext: ptr ptr ID3D11DeviceContext): HRESULT {.stdcall.} # 
                                                                             # [annotation] 
    OpenSharedResource*: proc (This: ptr ID3D11Device1; hResource: HANDLE; 
                               ReturnedInterface: ptr IID; 
                               ppResource: ptr pointer): HRESULT {.stdcall.} # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
                                                                             # 
                                                                             # [annotation] 
    CheckFormatSupport*: proc (This: ptr ID3D11Device1; Format: DXGI_FORMAT; 
                               pFormatSupport: ptr UINT): HRESULT {.stdcall.} # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
    CheckMultisampleQualityLevels*: proc (This: ptr ID3D11Device1; 
        Format: DXGI_FORMAT; SampleCount: UINT; pNumQualityLevels: ptr UINT): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    CheckCounterInfo*: proc (This: ptr ID3D11Device1; 
                             pCounterInfo: ptr D3D11_COUNTER_INFO) {.stdcall.} # 
                                                                               # [annotation] 
    CheckCounter*: proc (This: ptr ID3D11Device1; pDesc: ptr D3D11_COUNTER_DESC; 
                         pType: ptr D3D11_COUNTER_TYPE; 
                         pActiveCounters: ptr UINT; szName: LPSTR; 
                         pNameLength: ptr UINT; szUnits: LPSTR; 
                         pUnitsLength: ptr UINT; szDescription: LPSTR; 
                         pDescriptionLength: ptr UINT): HRESULT {.stdcall.} # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
                                                                            # 
                                                                            # [annotation] 
    CheckFeatureSupport*: proc (This: ptr ID3D11Device1; Feature: D3D11_FEATURE; 
                                pFeatureSupportData: pointer; 
                                FeatureSupportDataSize: UINT): HRESULT {.stdcall.} # 
                                                                                   # [annotation] 
    GetPrivateData*: proc (This: ptr ID3D11Device1; guid: ptr GUID; 
                           pDataSize: ptr UINT; pData: pointer): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    SetPrivateData*: proc (This: ptr ID3D11Device1; guid: ptr GUID; 
                           DataSize: UINT; pData: pointer): HRESULT {.stdcall.} # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
    SetPrivateDataInterface*: proc (This: ptr ID3D11Device1; guid: ptr GUID; 
                                    pData: ptr IUnknown): HRESULT {.stdcall.} # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
    GetFeatureLevel*: proc (This: ptr ID3D11Device1): D3D_FEATURE_LEVEL {.
        stdcall.}
    GetCreationFlags*: proc (This: ptr ID3D11Device1): UINT {.stdcall.}
    GetDeviceRemovedReason*: proc (This: ptr ID3D11Device1): HRESULT {.stdcall.}
    GetImmediateContext*: proc (This: ptr ID3D11Device1; 
                                ppImmediateContext: ptr ptr ID3D11DeviceContext) {.
        stdcall.}             # [annotation] 
    SetExceptionMode*: proc (This: ptr ID3D11Device1; RaiseFlags: UINT): HRESULT {.
        stdcall.}
    GetExceptionMode*: proc (This: ptr ID3D11Device1): UINT {.stdcall.}
    GetImmediateContext1*: proc (This: ptr ID3D11Device1; ppImmediateContext: ptr ptr ID3D11DeviceContext1) {.
        stdcall.}             # [annotation] 
    CreateDeferredContext1*: proc (This: ptr ID3D11Device1; ContextFlags: UINT; 
        ppDeferredContext: ptr ptr ID3D11DeviceContext1): HRESULT {.stdcall.} # 
                                                                              # [annotation] 
    CreateBlendState1*: proc (This: ptr ID3D11Device1; 
                              pBlendStateDesc: ptr D3D11_BLEND_DESC1; 
                              ppBlendState: ptr ptr ID3D11BlendState1): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
    CreateRasterizerState1*: proc (This: ptr ID3D11Device1; 
                                   pRasterizerDesc: ptr D3D11_RASTERIZER_DESC1; 
        ppRasterizerState: ptr ptr ID3D11RasterizerState1): HRESULT {.stdcall.} # 
                                                                                # [annotation] 
                                                                                # 
                                                                                # [annotation] 
    CreateDeviceContextState*: proc (This: ptr ID3D11Device1; Flags: UINT; 
                                     pFeatureLevels: ptr D3D_FEATURE_LEVEL; 
                                     FeatureLevels: UINT; SDKVersion: UINT; 
                                     EmulatedInterface: ptr IID; 
        pChosenFeatureLevel: ptr D3D_FEATURE_LEVEL; ppContextState: ptr ptr ID3DDeviceContextState): HRESULT {.
        stdcall.}             # [annotation] 
                              # [annotation] 
                              # [annotation] 
    OpenSharedResource1*: proc (This: ptr ID3D11Device1; hResource: HANDLE; 
                                returnedInterface: ptr IID; 
                                ppResource: ptr pointer): HRESULT {.stdcall.} # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
                                                                              # 
                                                                              # [annotation] 
    OpenSharedResourceByName*: proc (This: ptr ID3D11Device1; lpName: LPCWSTR; 
                                     dwDesiredAccess: DWORD; 
                                     returnedInterface: ptr IID; 
                                     ppResource: ptr pointer): HRESULT {.stdcall.} # 
                                                                                   # [annotation] 
                                                                                   # 
                                                                                   # [annotation] 
                                                                                   # 
                                                                                   # [annotation] 
                                                                                   # 
                                                                                   # [annotation] 
  
  ID3D11Device1* = object 
    lpVtbl*: ptr ID3D11Device1Vtbl

type
  ID3DUserDefinedAnnotationVtbl* = object 
    QueryInterface*: proc (This: ptr ID3DUserDefinedAnnotation; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr ID3DUserDefinedAnnotation): ULONG {.stdcall.}
    Release*: proc (This: ptr ID3DUserDefinedAnnotation): ULONG {.stdcall.}
    BeginEvent*: proc (This: ptr ID3DUserDefinedAnnotation; Name: LPCWSTR): INT {.
        stdcall.}             # [annotation] 
    EndEvent*: proc (This: ptr ID3DUserDefinedAnnotation): INT {.stdcall.}
    SetMarker*: proc (This: ptr ID3DUserDefinedAnnotation; Name: LPCWSTR) {.
        stdcall.}             # [annotation] 
    GetStatus*: proc (This: ptr ID3DUserDefinedAnnotation): BOOL {.stdcall.}

  ID3DUserDefinedAnnotation* = object 
    lpVtbl*: ptr ID3DUserDefinedAnnotationVtbl



var IID_ID3D11BlendState1* {.importc.}: GUID

var IID_ID3D11RasterizerState1* {.importc.}: GUID

var IID_ID3DDeviceContextState* {.importc.}: GUID

var IID_ID3D11DeviceContext1* {.importc.}: GUID

var IID_ID3D11Device1* {.importc.}: GUID

var IID_ID3DUserDefinedAnnotation* {.importc.}: GUID



# Additional Prototypes for ALL interfaces 
# end of Additional Prototypes 

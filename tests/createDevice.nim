import d3d11
import dxgi
import winim
proc main() =
  var device: ptr ID3D11Device
  var ctx: ptr ID3D11DeviceContext
  var res = D3D11CreateDevice(nil, D3D_DRIVER_TYPE_HARDWARE, cast[HMODULE](nil), 0, nil, 0.uint, D3D11_SDK_VERSION.uint, addr device, nil, addr ctx)
  if res == S_OK:
    echo("success!")
  else:
    echo("failed")
main()

## DirectX bindings by charlie barto

import dxgiformat
type UINT = uint32
type INT = int32
type BOOL = int32
const 
  FACDXGI = 0x0000087A

template MAKE_DXGI_HRESULT*(code: expr): expr = 
  MAKE_HRESULT(1, FACDXGI, code)

template MAKE_DXGI_STATUS*(code: expr): expr = 
  MAKE_HRESULT(0, FACDXGI, code)

# DXGI error messages have moved to winerror.h

const 
  DXGI_CPU_ACCESS_NONE* = (0)
  DXGI_CPU_ACCESS_DYNAMIC* = (1)
  DXGI_CPU_ACCESS_READ_WRITE* = (2)
  DXGI_CPU_ACCESS_SCRATCH* = (3)
  DXGI_CPU_ACCESS_FIELD* = 15
  DXGI_USAGE_SHADER_INPUT* = (1 shl (0 + 4))
  DXGI_USAGE_RENDER_TARGET_OUTPUT* = (1 shl (1 + 4))
  DXGI_USAGE_BACK_BUFFER* = (1 shl (2 + 4))
  DXGI_USAGE_SHARED* = (1 shl (3 + 4))
  DXGI_USAGE_READ_ONLY* = (1 shl (4 + 4))
  DXGI_USAGE_DISCARD_ON_PRESENT* = (1 shl (5 + 4))
  DXGI_USAGE_UNORDERED_ACCESS* = (1 shl (6 + 4))

type 
  DXGI_RGB* = object 
    Red*: cfloat
    Green*: cfloat
    Blue*: cfloat


when not(defined(D3DCOLORVALUE_DEFINED)): 
  type 
    D3DCOLORVALUE* = object 
      r*: cfloat
      g*: cfloat
      b*: cfloat
      a*: cfloat

  const 
    D3DCOLORVALUE_DEFINED* = true
type 
  DXGI_RGBA* = D3DCOLORVALUE
  DXGI_GAMMA_CONTROL* = object 
    Scale*: DXGI_RGB
    Offset*: DXGI_RGB
    GammaCurve*: array[1025, DXGI_RGB]

  DXGI_GAMMA_CONTROL_CAPABILITIES* = object 
    ScaleAndOffsetSupported*: BOOL
    MaxConvertedValue*: cfloat
    MinConvertedValue*: cfloat
    NumGammaControlPoints*: UINT
    ControlPointPositions*: array[1025, cfloat]

  DXGI_RATIONAL* = object 
    Numerator*: UINT
    Denominator*: UINT

  DXGI_MODE_SCANLINE_ORDER* {.size: sizeof(cint).} = enum 
    DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED = 0, 
    DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE = 1, 
    DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST = 2, 
    DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST = 3
  DXGI_MODE_SCALING* {.size: sizeof(cint).} = enum 
    DXGI_MODE_SCALING_UNSPECIFIED = 0, DXGI_MODE_SCALING_CENTERED = 1, 
    DXGI_MODE_SCALING_STRETCHED = 2
  DXGI_MODE_ROTATION* {.size: sizeof(cint).} = enum 
    DXGI_MODE_ROTATION_UNSPECIFIED = 0, DXGI_MODE_ROTATION_IDENTITY = 1, 
    DXGI_MODE_ROTATION_ROTATE90 = 2, DXGI_MODE_ROTATION_ROTATE180 = 3, 
    DXGI_MODE_ROTATION_ROTATE270 = 4
  DXGI_MODE_DESC* = object 
    Width*: UINT
    Height*: UINT
    RefreshRate*: DXGI_RATIONAL
    Format*: DXGI_FORMAT
    ScanlineOrdering*: DXGI_MODE_SCANLINE_ORDER
    Scaling*: DXGI_MODE_SCALING

  DXGI_SAMPLE_DESC* = object 
    Count*: UINT
    Quality*: UINT


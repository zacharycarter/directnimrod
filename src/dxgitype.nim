## DirectX bindings by charlie barto
## this file mirrors the version of dxgitype.h
## shipped with windows 10
import dxgiformat
type UINT = uint32
type INT = int32
type BOOL = int32
type BYTE = cuchar
const 
  FACDXGI = 0x0000087A

template MAKE_DXGI_HRESULT*(code: expr): expr = 
  MAKE_HRESULT(1, FACDXGI, code)

template MAKE_DXGI_STATUS*(code: expr): expr = 
  MAKE_HRESULT(0, FACDXGI, code)

# DXGI error messages have moved to winerror.h

# const 
#   DXGI_CPU_ACCESS_NONE* = (0)
#   DXGI_CPU_ACCESS_DYNAMIC* = (1)
#   DXGI_CPU_ACCESS_READ_WRITE* = (2)
#   DXGI_CPU_ACCESS_SCRATCH* = (3)
#   DXGI_CPU_ACCESS_FIELD* = 15
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

const DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN* = 0xffffffff
const DXGI_CENTER_MULTISAMPLE_QUALITY_PATTERN* = 0xfffffffe

type 
  DXGI_COLOR_SPACE_TYPE* = enum 
    DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709 = 0, 
    DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709 = 1, 
    DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709 = 2, 
    DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020 = 3, 
    DXGI_COLOR_SPACE_RESERVED = 4, 
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601 = 5, 
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601 = 6, 
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601 = 7, 
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709 = 8, 
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709 = 9, 
    DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020 = 10, 
    DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020 = 11, 
    DXGI_COLOR_SPACE_CUSTOM = 0xFFFFFFFF
  DXGI_JPEG_DC_HUFFMAN_TABLE* = object 
    CodeCounts*: array[12, BYTE]
    CodeValues*: array[12, BYTE]

  DXGI_JPEG_AC_HUFFMAN_TABLE* = object 
    CodeCounts*: array[16, BYTE]
    CodeValues*: array[162, BYTE]

  DXGI_JPEG_QUANTIZATION_TABLE* = object 
    Elements*: array[64, BYTE]


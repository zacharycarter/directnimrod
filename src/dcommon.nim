## DirectX bindings by Charlie Barto
#+--------------------------------------------------------------------------
#
#  Copyright (c) Microsoft Corporation.  All rights reserved.
#
#  Abstract:
#     Public API definitions for DWrite, D2D and DImage.
#
#----------------------------------------------------------------------------
import dxgiformat
#
# Forward declarations
#
type IDXGISurface = object
#+----------------------------------------------------------------------------
#
#  Enu:
#      DWRITE_MEASURING_MODE
#
#  Synopsis:
#      The measuring method used for text layout.
#
#-------------------------------------------------------------------------------

type #
     # Text is measured using glyph ideal metrics whose values are independent to the current display resolution.
     #
  DWRITE_MEASURING_MODE* {.size: sizeof(cint).} = enum 
    DWRITE_MEASURING_MODE_NATURAL, #
                                   # Text is measured using glyph display compatible metrics whose values tuned for the current display resolution.
                                   #
    DWRITE_MEASURING_MODE_GDI_CLASSIC, #
                                       # Text is measured using the same glyph display metrics as text measured by GDI using a font
                                       # created with CLEARTYPE_NATURAL_QUALITY.
                                       #
    DWRITE_MEASURING_MODE_GDI_NATURAL


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_ALPHA_MODE
#
#  Synopsis:
#      Qualifies how alpha is to be treated in a bitmap or render target containing
#      alpha.
#
#------------------------------------------------------------------------------

type #
     # Alpha mode should be determined implicitly. Some target surfaces do not supply
     # or imply this information in which case alpha must be specified.
     #
  D2D1_ALPHA_MODE* {.size: sizeof(cint).} = enum 
    D2D1_ALPHA_MODE_UNKNOWN = 0, #
                                 # Treat the alpha as premultipled.
                                 #
    D2D1_ALPHA_MODE_PREMULTIPLIED = 1, #
                                       # Opacity is in the 'A' component only.
                                       #
    D2D1_ALPHA_MODE_STRAIGHT = 2, #
                                  # Ignore any alpha channel information.
                                  #
    D2D1_ALPHA_MODE_IGNORE = 3, D2D1_ALPHA_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_PIXEL_FORMAT
#
#------------------------------------------------------------------------------

type 
  D2D1_PIXEL_FORMAT* = object 
    format*: DXGI_FORMAT
    alphaMode*: D2D1_ALPHA_MODE


## DirectX bindings by Charlie Barto
{.link: "dxguid.lib".}
{.link: "d2d1.lib".}
import winim
import d2dbasetypes
import d3dcommon
import dcommon
type IUnknown = object
type INT = int32
type UINT = uint32
type FLOAT = float32

type IDWriteTextFormat = object
type IDWriteTextLayout = object
type IDWriteRenderingParams = object
type IWICBitmap = object
type IWICBitmapSource = object
type DWRITE_GLYPH_RUN = object
type IDXGISurface = object
const D2D1_INVALID_TAG* = 0xFF_FF_FF_FF_FF_FF_FF_FF'u64 #this is ULONGLONG_MAX
const D2D1_DEFAULT_FLATTENING_TOLERANCE* = 0.25'f32

#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_INTERPOLATION_MODE_DEFINITION
#
#  Synopsis:
#      This defines the superset of interpolation mode supported by D2D APIs
#      and built-in effects
#
#------------------------------------------------------------------------------

const 
  D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR* = 0
  D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR* = 1
  D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC* = 2
  D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR* = 3
  D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC* = 4
  D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC* = 5
  D2D1_INTERPOLATION_MODE_DEFINITION_FANT* = 6
  D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR* = 7

#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_GAMMA
#
#  Synopsis:
#      This determines what gamma is used for interpolation/blending.
#
#------------------------------------------------------------------------------

type                          #
                              # Colors are manipulated in 2.2 gamma color space.
                              #
  D2D1_GAMMA* {.size: sizeof(cint).} = enum 
    D2D1_GAMMA_2_2 = 0,       #
                              # Colors are manipulated in 1.0 gamma color space.
                              #
    D2D1_GAMMA_1_0 = 1, D2D1_GAMMA_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_OPACITY_MASK_CONTENT
#
#  Synopsis:
#      Specifies what the contents are of an opacity mask.
#
#------------------------------------------------------------------------------

type                          #
                              # The mask contains geometries or bitmaps.
                              #
  D2D1_OPACITY_MASK_CONTENT* {.size: sizeof(cint).} = enum 
    D2D1_OPACITY_MASK_CONTENT_GRAPHICS = 0, #
                                            # The mask contains text rendered using one of the natural text modes.
                                            #
    D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL = 1, #
                                                # The mask contains text rendered using one of the GDI compatible text modes.
                                                #
    D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE = 2, 
    D2D1_OPACITY_MASK_CONTENT_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_EXTEND_MODE
#
#  Synopsis:
#      Enum which describes how to sample from a source outside its base tile.
#
#------------------------------------------------------------------------------

type #
     # Extend the edges of the source out by clamping sample points outside the source
     # to the edges.
     #
  D2D1_EXTEND_MODE* {.size: sizeof(cint).} = enum 
    D2D1_EXTEND_MODE_CLAMP = 0, #
                                # The base tile is drawn untransformed and the remainder are filled by repeating
                                # the base tile.
                                #
    D2D1_EXTEND_MODE_WRAP = 1, #
                               # The same as wrap, but alternate tiles are flipped  The base tile is drawn
                               # untransformed.
                               #
    D2D1_EXTEND_MODE_MIRROR = 2, D2D1_EXTEND_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_ANTIALIAS_MODE
#
#  Synopsis:
#      Enum which describes the manner in which we render edges of non-text primitives.
#
#------------------------------------------------------------------------------

type #
     # The edges of each primitive are antialiased sequentially.
     #
  D2D1_ANTIALIAS_MODE* {.size: sizeof(cint).} = enum 
    D2D1_ANTIALIAS_MODE_PER_PRIMITIVE = 0, #
                                           # Each pixel is rendered if its pixel center is contained by the geometry.
                                           #
    D2D1_ANTIALIAS_MODE_ALIASED = 1, 
    D2D1_ANTIALIAS_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_TEXT_ANTIALIAS_MODE
#
#------------------------------------------------------------------------------

type                          #
                              # Render text using the current system setting.
                              #
  D2D1_TEXT_ANTIALIAS_MODE* {.size: sizeof(cint).} = enum 
    D2D1_TEXT_ANTIALIAS_MODE_DEFAULT = 0, #
                                          # Render text using ClearType.
                                          #
    D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE = 1, #
                                            # Render text using gray-scale.
                                            #
    D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE = 2, #
                                            # Render text aliased.
                                            #
    D2D1_TEXT_ANTIALIAS_MODE_ALIASED = 3, 
    D2D1_TEXT_ANTIALIAS_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_BITMAP_INTERPOLATION_MODE
#
#------------------------------------------------------------------------------

type #
     # Nearest Neighbor filtering. Also known as nearest pixel or nearest point
     # sampling.
     #
  D2D1_BITMAP_INTERPOLATION_MODE* {.size: sizeof(cint).} = enum 
    D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR, #
                                                                                                           # Linear filtering.
                                                                                                           #
    D2D1_BITMAP_INTERPOLATION_MODE_LINEAR = D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR, 
    D2D1_BITMAP_INTERPOLATION_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_DRAW_TEXT_OPTIONS
#
#  Synopsis:
#      Modifications made to the draw text call that influence how the text is
#      rendered.
#
#------------------------------------------------------------------------------

type                          #
                              # Do not snap the baseline of the text vertically.
                              #
  D2D1_DRAW_TEXT_OPTIONS* {.size: sizeof(cint).} = enum 
    D2D1_DRAW_TEXT_OPTIONS_NONE = 0x00000000, D2D1_DRAW_TEXT_OPTIONS_NO_SNAP = 0x00000001, #
                                                                                           # Clip the text to the content bounds.
                                                                                           #
    D2D1_DRAW_TEXT_OPTIONS_CLIP = 0x00000002, #
                                              # Render color versions of glyphs if defined by the font.
                                              #
    D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT = 0x00000004, 
    D2D1_DRAW_TEXT_OPTIONS_FORCE_DWORD = 0xFFFFFFFF


nil
type 
  D2D1_POINT_2U* = D2D_POINT_2U
  D2D1_POINT_2F* = D2D_POINT_2F
  D2D1_RECT_F* = D2D_RECT_F
  D2D1_RECT_U* = D2D_RECT_U
  D2D1_SIZE_F* = D2D_SIZE_F
  D2D1_SIZE_U* = D2D_SIZE_U
  D2D1_COLOR_F* = D2D_COLOR_F
  D2D1_MATRIX_3X2_F* = D2D_MATRIX_3X2_F
  D2D1_TAG* = UINT64

#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_BITMAP_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_BITMAP_PROPERTIES* = object 
    pixelFormat*: D2D1_PIXEL_FORMAT
    dpiX*: FLOAT
    dpiY*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_GRADIENT_STOP
#
#------------------------------------------------------------------------------

type 
  D2D1_GRADIENT_STOP* = object 
    position*: FLOAT
    color*: D2D1_COLOR_F


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_BRUSH_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_BRUSH_PROPERTIES* = object 
    opacity*: FLOAT
    transform*: D2D1_MATRIX_3X2_F


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_BITMAP_BRUSH_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_BITMAP_BRUSH_PROPERTIES* = object 
    extendModeX*: D2D1_EXTEND_MODE
    extendModeY*: D2D1_EXTEND_MODE
    interpolationMode*: D2D1_BITMAP_INTERPOLATION_MODE


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES* = object 
    startPoint*: D2D1_POINT_2F
    endPoint*: D2D1_POINT_2F


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES* = object 
    center*: D2D1_POINT_2F
    gradientOriginOffset*: D2D1_POINT_2F
    radiusX*: FLOAT
    radiusY*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_ARC_SIZE
#
#  Synopsis:
#      Differentiates which of the two possible arcs could match the given arc
#      parameters.
#
#------------------------------------------------------------------------------

type 
  D2D1_ARC_SIZE* {.size: sizeof(cint).} = enum 
    D2D1_ARC_SIZE_SMALL = 0, D2D1_ARC_SIZE_LARGE = 1, 
    D2D1_ARC_SIZE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_CAP_STYLE
#
#  Synopsis:
#      Enum which describes the drawing of the ends of a line.
#
#------------------------------------------------------------------------------

type                          #
                              # Flat line cap.
                              #
  D2D1_CAP_STYLE* {.size: sizeof(cint).} = enum 
    D2D1_CAP_STYLE_FLAT = 0,  #
                              # Square line cap.
                              #
    D2D1_CAP_STYLE_SQUARE = 1, #
                               # Round line cap.
                               #
    D2D1_CAP_STYLE_ROUND = 2, #
                              # Triangle line cap.
                              #
    D2D1_CAP_STYLE_TRIANGLE = 3, D2D1_CAP_STYLE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_DASH_STYLE
#
#------------------------------------------------------------------------------

type 
  D2D1_DASH_STYLE* {.size: sizeof(cint).} = enum 
    D2D1_DASH_STYLE_SOLID = 0, D2D1_DASH_STYLE_DASH = 1, 
    D2D1_DASH_STYLE_DOT = 2, D2D1_DASH_STYLE_DASH_DOT = 3, 
    D2D1_DASH_STYLE_DASH_DOT_DOT = 4, D2D1_DASH_STYLE_CUSTOM = 5, 
    D2D1_DASH_STYLE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_LINE_JOIN
#
#  Synopsis:
#      Enum which describes the drawing of the corners on the line.
#
#------------------------------------------------------------------------------

type                          #
                              # Miter join.
                              #
  D2D1_LINE_JOIN* {.size: sizeof(cint).} = enum 
    D2D1_LINE_JOIN_MITER = 0, #
                              # Bevel join.
                              #
    D2D1_LINE_JOIN_BEVEL = 1, #
                              # Round join.
                              #
    D2D1_LINE_JOIN_ROUND = 2, #
                              # Miter/Bevel join.
                              #
    D2D1_LINE_JOIN_MITER_OR_BEVEL = 3, D2D1_LINE_JOIN_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_COMBINE_MODE
#
#  Synopsis:
#      This enumeration describes the type of combine operation to be performed.
#
#------------------------------------------------------------------------------

type #
     # Produce a geometry representing the set of points contained in either
     # the first or the second geometry.
     #
  D2D1_COMBINE_MODE* {.size: sizeof(cint).} = enum 
    D2D1_COMBINE_MODE_UNION = 0, #
                                 # Produce a geometry representing the set of points common to the first
                                 # and the second geometries.
                                 #
    D2D1_COMBINE_MODE_INTERSECT = 1, #
                                     # Produce a geometry representing the set of points contained in the
                                     # first geometry or the second geometry, but not both.
                                     #
    D2D1_COMBINE_MODE_XOR = 2, #
                               # Produce a geometry representing the set of points contained in the
                               # first geometry but not the second geometry.
                               #
    D2D1_COMBINE_MODE_EXCLUDE = 3, D2D1_COMBINE_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_GEOMETRY_RELATION
#
#------------------------------------------------------------------------------

type #
     # The relation between the geometries couldn't be determined. This value is never
     # returned by any D2D method.
     #
  D2D1_GEOMETRY_RELATION* {.size: sizeof(cint).} = enum 
    D2D1_GEOMETRY_RELATION_UNKNOWN = 0, #
                                        # The two geometries do not intersect at all.
                                        #
    D2D1_GEOMETRY_RELATION_DISJOINT = 1, #
                                         # The passed in geometry is entirely contained by the object.
                                         #
    D2D1_GEOMETRY_RELATION_IS_CONTAINED = 2, #
                                             # The object entirely contains the passed in geometry.
                                             #
    D2D1_GEOMETRY_RELATION_CONTAINS = 3, #
                                         # The two geometries overlap but neither completely contains the other.
                                         #
    D2D1_GEOMETRY_RELATION_OVERLAP = 4, 
    D2D1_GEOMETRY_RELATION_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_GEOMETRY_SIMPLIFICATION_OPTION
#
#  Synopsis:
#      Specifies how simple the output of a simplified geometry sink should be.
#
#------------------------------------------------------------------------------

type 
  D2D1_GEOMETRY_SIMPLIFICATION_OPTION* {.size: sizeof(cint).} = enum 
    D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES = 0, 
    D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES = 1, 
    D2D1_GEOMETRY_SIMPLIFICATION_OPTION_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_FIGURE_BEGIN
#
#  Synopsis:
#      Indicates whether the given figure is filled or hollow.
#
#------------------------------------------------------------------------------

type 
  D2D1_FIGURE_BEGIN* {.size: sizeof(cint).} = enum 
    D2D1_FIGURE_BEGIN_FILLED = 0, D2D1_FIGURE_BEGIN_HOLLOW = 1, 
    D2D1_FIGURE_BEGIN_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_FIGURE_END
#
#  Synopsis:
#      Indicates whether the figure is open or closed on its end point.
#
#------------------------------------------------------------------------------

type 
  D2D1_FIGURE_END* {.size: sizeof(cint).} = enum 
    D2D1_FIGURE_END_OPEN = 0, D2D1_FIGURE_END_CLOSED = 1, 
    D2D1_FIGURE_END_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_BEZIER_SEGMENT
#
#  Synopsis:
#      Describes a cubic bezier in a path.
#
#------------------------------------------------------------------------------

type 
  D2D1_BEZIER_SEGMENT* = object 
    point1*: D2D1_POINT_2F
    point2*: D2D1_POINT_2F
    point3*: D2D1_POINT_2F


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_TRIANGLE
#
#  Synopsis:
#      Describes a triangle.
#
#------------------------------------------------------------------------------

type 
  D2D1_TRIANGLE* = object 
    point1*: D2D1_POINT_2F
    point2*: D2D1_POINT_2F
    point3*: D2D1_POINT_2F


#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_PATH_SEGMENT
#
#  Synopsis:
#      Indicates whether the given segment should be stroked, or, if the join between
#      this segment and the previous one should be smooth.
#
#------------------------------------------------------------------------------

type 
  D2D1_PATH_SEGMENT* {.size: sizeof(cint).} = enum 
    D2D1_PATH_SEGMENT_NONE = 0x00000000, 
    D2D1_PATH_SEGMENT_FORCE_UNSTROKED = 0x00000001, 
    D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN = 0x00000002, 
    D2D1_PATH_SEGMENT_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_SWEEP_DIRECTION
#
#------------------------------------------------------------------------------

type 
  D2D1_SWEEP_DIRECTION* {.size: sizeof(cint).} = enum 
    D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE = 0, 
    D2D1_SWEEP_DIRECTION_CLOCKWISE = 1, 
    D2D1_SWEEP_DIRECTION_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_FILL_MODE
#
#------------------------------------------------------------------------------

type 
  D2D1_FILL_MODE* {.size: sizeof(cint).} = enum 
    D2D1_FILL_MODE_ALTERNATE = 0, D2D1_FILL_MODE_WINDING = 1, 
    D2D1_FILL_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_ARC_SEGMENT
#
#  Synopsis:
#      Describes an arc that is defined as part of a path.
#
#------------------------------------------------------------------------------

type 
  D2D1_ARC_SEGMENT* = object 
    point*: D2D1_POINT_2F
    size*: D2D1_SIZE_F
    rotationAngle*: FLOAT
    sweepDirection*: D2D1_SWEEP_DIRECTION
    arcSize*: D2D1_ARC_SIZE


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_QUADRATIC_BEZIER_SEGMENT
#
#------------------------------------------------------------------------------

type 
  D2D1_QUADRATIC_BEZIER_SEGMENT* = object 
    point1*: D2D1_POINT_2F
    point2*: D2D1_POINT_2F


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_ELLIPSE
#
#------------------------------------------------------------------------------

type 
  D2D1_ELLIPSE* = object 
    point*: D2D1_POINT_2F
    radiusX*: FLOAT
    radiusY*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_ROUNDED_RECT
#
#------------------------------------------------------------------------------

type 
  D2D1_ROUNDED_RECT* = object 
    rect*: D2D1_RECT_F
    radiusX*: FLOAT
    radiusY*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_STROKE_STYLE_PROPERTIES
#
#  Synopsis:
#      Properties, aside from the width, that allow geometric penning to be specified.
#
#------------------------------------------------------------------------------

type 
  D2D1_STROKE_STYLE_PROPERTIES* = object 
    startCap*: D2D1_CAP_STYLE
    endCap*: D2D1_CAP_STYLE
    dashCap*: D2D1_CAP_STYLE
    lineJoin*: D2D1_LINE_JOIN
    miterLimit*: FLOAT
    dashStyle*: D2D1_DASH_STYLE
    dashOffset*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_LAYER_OPTIONS
#
#  Synopsis:
#      Specified options that can be applied when a layer resource is applied to create
#      a layer.
#
#------------------------------------------------------------------------------

type 
  D2D1_LAYER_OPTIONS* {.size: sizeof(cint).} = enum 
    D2D1_LAYER_OPTIONS_NONE = 0x00000000, #
                                          # The layer will render correctly for ClearType text. If the render target was set
                                          # to ClearType previously, the layer will continue to render ClearType. If the
                                          # render target was set to ClearType and this option is not specified, the render
                                          # target will be set to render gray-scale until the layer is popped. The caller
                                          # can override this default by calling SetTextAntialiasMode while within the
                                          # layer. This flag is slightly slower than the default.
                                          #
    D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE = 0x00000001, 
    D2D1_LAYER_OPTIONS_FORCE_DWORD = 0xFFFFFFFF



#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_WINDOW_STATE
#
#------------------------------------------------------------------------------

type 
  D2D1_WINDOW_STATE* {.size: sizeof(cint).} = enum 
    D2D1_WINDOW_STATE_NONE = 0x00000000, 
    D2D1_WINDOW_STATE_OCCLUDED = 0x00000001, 
    D2D1_WINDOW_STATE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_RENDER_TARGET_TYPE
#
#------------------------------------------------------------------------------

type #
     # D2D is free to choose the render target type for the caller.
     #
  D2D1_RENDER_TARGET_TYPE* {.size: sizeof(cint).} = enum 
    D2D1_RENDER_TARGET_TYPE_DEFAULT = 0, #
                                         # The render target will render using the CPU.
                                         #
    D2D1_RENDER_TARGET_TYPE_SOFTWARE = 1, #
                                          # The render target will render using the GPU.
                                          #
    D2D1_RENDER_TARGET_TYPE_HARDWARE = 2, 
    D2D1_RENDER_TARGET_TYPE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_FEATURE_LEVEL
#
#------------------------------------------------------------------------------

type #
     # The caller does not require a particular underlying D3D device level.
     #
  D2D1_FEATURE_LEVEL* {.size: sizeof(cint).} = enum 
    D2D1_FEATURE_LEVEL_DEFAULT = 0, #
                                    # The D3D device level is DX9 compatible.
                                    #
    D2D1_FEATURE_LEVEL_9 = D3D_FEATURE_LEVEL_9_1, #
                                                  # The D3D device level is DX10 compatible.
                                                  #
    D2D1_FEATURE_LEVEL_10 = D3D_FEATURE_LEVEL_10_0, 
    D2D1_FEATURE_LEVEL_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_RENDER_TARGET_USAGE
#
#------------------------------------------------------------------------------

type 
  D2D1_RENDER_TARGET_USAGE* {.size: sizeof(cint).} = enum 
    D2D1_RENDER_TARGET_USAGE_NONE = 0x00000000, #
                                                # Rendering will occur locally, if a terminal-services session is established, the
                                                # bitmap updates will be sent to the terminal services client.
                                                #
    D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING = 0x00000001, #
                                                                 # The render target will allow a call to GetDC on the ID2D1GdiInteropRenderTarget
                                                                 # interface. Rendering will also occur locally.
                                                                 #
    D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE = 0x00000002, 
    D2D1_RENDER_TARGET_USAGE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_PRESENT_OPTIONS
#
#  Synopsis:
#      Describes how present should behave.
#
#------------------------------------------------------------------------------

type 
  D2D1_PRESENT_OPTIONS* {.size: sizeof(cint).} = enum 
    D2D1_PRESENT_OPTIONS_NONE = 0x00000000, #
                                            # Keep the target contents intact through present.
                                            #
    D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS = 0x00000001, #
                                                       # Do not wait for display refresh to commit changes to display.
                                                       #
    D2D1_PRESENT_OPTIONS_IMMEDIATELY = 0x00000002, 
    D2D1_PRESENT_OPTIONS_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_RENDER_TARGET_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_RENDER_TARGET_PROPERTIES* = object 
    `type`*: D2D1_RENDER_TARGET_TYPE
    pixelFormat*: D2D1_PIXEL_FORMAT
    dpiX*: FLOAT
    dpiY*: FLOAT
    usage*: D2D1_RENDER_TARGET_USAGE
    minLevel*: D2D1_FEATURE_LEVEL


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_HWND_RENDER_TARGET_PROPERTIES
#
#------------------------------------------------------------------------------

type 
  D2D1_HWND_RENDER_TARGET_PROPERTIES* = object 
    hwnd*: HWND
    pixelSize*: D2D1_SIZE_U
    presentOptions*: D2D1_PRESENT_OPTIONS


#+-----------------------------------------------------------------------------
#
#  Flag:
#      D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS
#
#------------------------------------------------------------------------------

type 
  D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS* {.size: sizeof(cint).} = enum 
    D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE = 0x00000000, #
                                                             # The compatible render target will allow a call to GetDC on the
                                                             # ID2D1GdiInteropRenderTarget interface. This can be specified even if the parent
                                                             # render target is not GDI compatible.
                                                             #
    D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE = 0x00000001, 
    D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_DRAWING_STATE_DESCRIPTION
#
#  Synopsis:
#      Allows the drawing state to be atomically created. This also specifies the
#      drawing state that is saved into an IDrawingStateBlock object.
#
#------------------------------------------------------------------------------

type 
  D2D1_DRAWING_STATE_DESCRIPTION* = object 
    antialiasMode*: D2D1_ANTIALIAS_MODE
    textAntialiasMode*: D2D1_TEXT_ANTIALIAS_MODE
    tag1*: D2D1_TAG
    tag2*: D2D1_TAG
    transform*: D2D1_MATRIX_3X2_F


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_DC_INITIALIZE_MODE
#
#------------------------------------------------------------------------------

type #
     # The contents of the D2D render target will be copied to the DC.
     #
  D2D1_DC_INITIALIZE_MODE* {.size: sizeof(cint).} = enum 
    D2D1_DC_INITIALIZE_MODE_COPY = 0, #
                                      # The contents of the DC will be cleared.
                                      #
    D2D1_DC_INITIALIZE_MODE_CLEAR = 1, 
    D2D1_DC_INITIALIZE_MODE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_DEBUG_LEVEL
#
#  Synopsis:
#      Indicates the debug level to be output by the debug layer.
#
#------------------------------------------------------------------------------

type 
  D2D1_DEBUG_LEVEL* {.size: sizeof(cint).} = enum 
    D2D1_DEBUG_LEVEL_NONE = 0, D2D1_DEBUG_LEVEL_ERROR = 1, 
    D2D1_DEBUG_LEVEL_WARNING = 2, D2D1_DEBUG_LEVEL_INFORMATION = 3, 
    D2D1_DEBUG_LEVEL_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Enum:
#      D2D1_FACTORY_TYPE
#
#  Synopsis:
#      Specifies the threading model of the created factory and all of its derived
#      resources.
#
#------------------------------------------------------------------------------

type #
     # The resulting factory and derived resources may only be invoked serially.
     # Reference counts on resources are interlocked, however, resource and render
     # target state is not protected from multi-threaded access.
     #
  D2D1_FACTORY_TYPE* {.size: sizeof(cint).} = enum 
    D2D1_FACTORY_TYPE_SINGLE_THREADED = 0, #
                                           # The resulting factory may be invoked from multiple threads. Returned resources
                                           # use interlocked reference counting and their state is protected.
                                           #
    D2D1_FACTORY_TYPE_MULTI_THREADED = 1, 
    D2D1_FACTORY_TYPE_FORCE_DWORD = 0xFFFFFFFF


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D1_FACTORY_OPTIONS
#
#  Synopsis:
#      Allows additional parameters for factory creation.
#
#------------------------------------------------------------------------------

type 
  D2D1_FACTORY_OPTIONS* = object 
    debugLevel*: D2D1_DEBUG_LEVEL #
                                  # Requests a certain level of debugging information from the debug layer. This
                                  # parameter is ignored if the debug layer DLL is not present.
                                  #
  

var IID_ID2D1Resource* {.importc.}: IID

var IID_ID2D1Image* {.importc.}: IID

var IID_ID2D1Bitmap* {.importc.}: IID

var IID_ID2D1GradientStopCollection* {.importc.}: IID

var IID_ID2D1Brush* {.importc.}: IID

var IID_ID2D1BitmapBrush* {.importc.}: IID

var IID_ID2D1SolidColorBrush* {.importc.}: IID

var IID_ID2D1LinearGradientBrush* {.importc.}: IID

var IID_ID2D1RadialGradientBrush* {.importc.}: IID

var IID_ID2D1StrokeStyle* {.importc.}: IID

var IID_ID2D1Geometry* {.importc.}: IID

var IID_ID2D1RectangleGeometry* {.importc.}: IID

var IID_ID2D1RoundedRectangleGeometry* {.importc.}: IID

var IID_ID2D1EllipseGeometry* {.importc.}: IID

var IID_ID2D1GeometryGroup* {.importc.}: IID

var IID_ID2D1TransformedGeometry* {.importc.}: IID

var IID_ID2D1SimplifiedGeometrySink* {.importc.}: IID

var IID_ID2D1GeometrySink* {.importc.}: IID

var IID_ID2D1TessellationSink* {.importc.}: IID

var IID_ID2D1PathGeometry* {.importc.}: IID

var IID_ID2D1Mesh* {.importc.}: IID

var IID_ID2D1Layer* {.importc.}: IID

var IID_ID2D1DrawingStateBlock* {.importc.}: IID

var IID_ID2D1RenderTarget* {.importc.}: IID

var IID_ID2D1BitmapRenderTarget* {.importc.}: IID

var IID_ID2D1HwndRenderTarget* {.importc.}: IID

var IID_ID2D1DCRenderTarget* {.importc.}: IID

var IID_ID2D1Factory* {.importc.}: IID

var IID_ID2D1GdiInteropRenderTarget* {.importc.}: IID

type 
  ID2D1ResourceVtbl* = object 
    QueryInterface*: proc(This: ptr ID2D1Resource; riid: ptr IID; ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc(This: ptr ID2D1Resource): ULONG {.stdcall.}
    Release*: proc(This: ptr ID2D1Resource): ULONG {.stdcall.}
    GetFactory*: proc (This: ptr ID2D1Resource; factory: ptr ptr ID2D1Factory) {.
        stdcall.}

  ID2D1Resource* = object 
    lpVtbl*: ptr ID2D1ResourceVtbl

  ID2D1ImageVtbl* = object 
    Base*: ID2D1ResourceVtbl

  ID2D1Image* = object 
    lpVtbl*: ptr ID2D1ImageVtbl

  ID2D1BitmapVtbl* = object 
    Base*: ID2D1ImageVtbl
    GetSize*: proc (This: ptr ID2D1Bitmap): D2D1_SIZE_F {.stdcall.}
    GetPixelSize*: proc (This: ptr ID2D1Bitmap): D2D1_SIZE_U {.stdcall.}
    GetPixelFormat*: proc (This: ptr ID2D1Bitmap): D2D1_PIXEL_FORMAT {.stdcall.}
    GetDpi*: proc (This: ptr ID2D1Bitmap; dpiX: ptr FLOAT; dpiY: ptr FLOAT) {.
        stdcall.}
    CopyFromBitmap*: proc (This: ptr ID2D1Bitmap; destPoint: ptr D2D1_POINT_2U; 
                           bitmap: ptr ID2D1Bitmap; srcRect: ptr D2D1_RECT_U): HRESULT {.
        stdcall.}
    CopyFromRenderTarget*: proc (This: ptr ID2D1Bitmap; 
                                 destPoint: ptr D2D1_POINT_2U; 
                                 renderTarget: ptr ID2D1RenderTarget; 
                                 srcRect: ptr D2D1_RECT_U): HRESULT {.stdcall.}
    CopyFromMemory*: proc (This: ptr ID2D1Bitmap; dstRect: ptr D2D1_RECT_U; 
                           srcData: pointer; pitch: UINT32): HRESULT {.stdcall.}

  ID2D1Bitmap* = object 
    lpVtbl*: ptr ID2D1BitmapVtbl

  ID2D1GradientStopCollectionVtbl* = object 
    Base*: ID2D1ResourceVtbl
    GetGradientStopCount*: proc (This: ptr ID2D1GradientStopCollection): UINT32 {.
        stdcall.}
    GetGradientStops*: proc (This: ptr ID2D1GradientStopCollection; 
                             gradientStops: ptr D2D1_GRADIENT_STOP; 
                             gradientStopsCount: UINT32) {.stdcall.}
    GetColorInterpolationGamma*: proc (This: ptr ID2D1GradientStopCollection): D2D1_GAMMA {.
        stdcall.}
    GetExtendMode*: proc (This: ptr ID2D1GradientStopCollection): D2D1_EXTEND_MODE {.
        stdcall.}

  ID2D1GradientStopCollection* = object 
    lpVtbl*: ptr ID2D1GradientStopCollectionVtbl

  ID2D1BrushVtbl* = object 
    Base*: ID2D1ResourceVtbl
    SetOpacity*: proc (This: ptr ID2D1Brush; opacity: FLOAT) {.stdcall.}
    SetTransform*: proc (This: ptr ID2D1Brush; transform: ptr D2D1_MATRIX_3X2_F) {.
        stdcall.}
    GetOpacity*: proc (This: ptr ID2D1Brush): FLOAT {.stdcall.}
    GetTransform*: proc (This: ptr ID2D1Brush; transform: ptr D2D1_MATRIX_3X2_F) {.
        stdcall.}

  ID2D1Brush* = object 
    lpVtbl*: ptr ID2D1BrushVtbl

  ID2D1BitmapBrushVtbl* = object 
    Base*: ID2D1BrushVtbl
    SetExtendModeX*: proc (This: ptr ID2D1BitmapBrush; 
                           extendModeX: D2D1_EXTEND_MODE) {.stdcall.}
    SetExtendModeY*: proc (This: ptr ID2D1BitmapBrush; 
                           extendModeY: D2D1_EXTEND_MODE) {.stdcall.}
    SetInterpolationMode*: proc (This: ptr ID2D1BitmapBrush; interpolationMode: D2D1_BITMAP_INTERPOLATION_MODE) {.
        stdcall.}
    SetBitmap*: proc (This: ptr ID2D1BitmapBrush; bitmap: ptr ID2D1Bitmap) {.
        stdcall.}
    GetExtendModeX*: proc (This: ptr ID2D1BitmapBrush): D2D1_EXTEND_MODE {.
        stdcall.}
    GetExtendModeY*: proc (This: ptr ID2D1BitmapBrush): D2D1_EXTEND_MODE {.
        stdcall.}
    GetInterpolationMode*: proc (This: ptr ID2D1BitmapBrush): D2D1_BITMAP_INTERPOLATION_MODE {.
        stdcall.}
    GetBitmap*: proc (This: ptr ID2D1BitmapBrush; bitmap: ptr ptr ID2D1Bitmap) {.
        stdcall.}

  ID2D1BitmapBrush* = object 
    lpVtbl*: ptr ID2D1BitmapBrushVtbl

  ID2D1SolidColorBrushVtbl* = object 
    Base*: ID2D1BrushVtbl
    SetColor*: proc (This: ptr ID2D1SolidColorBrush; color: ptr D2D1_COLOR_F) {.
        stdcall.}
    GetColor*: proc (This: ptr ID2D1SolidColorBrush): D2D1_COLOR_F {.stdcall.}

  ID2D1SolidColorBrush* = object 
    lpVtbl*: ptr ID2D1SolidColorBrushVtbl

  ID2D1LinearGradientBrushVtbl* = object 
    Base*: ID2D1BrushVtbl
    SetStartPoint*: proc (This: ptr ID2D1LinearGradientBrush; 
                          startPoint: D2D1_POINT_2F) {.stdcall.}
    SetEndPoint*: proc (This: ptr ID2D1LinearGradientBrush; 
                        endPoint: D2D1_POINT_2F) {.stdcall.}
    GetStartPoint*: proc (This: ptr ID2D1LinearGradientBrush): D2D1_POINT_2F {.
        stdcall.}
    GetEndPoint*: proc (This: ptr ID2D1LinearGradientBrush): D2D1_POINT_2F {.
        stdcall.}
    GetGradientStopCollection*: proc (This: ptr ID2D1LinearGradientBrush; 
        gradientStopCollection: ptr ptr ID2D1GradientStopCollection) {.stdcall.}

  ID2D1LinearGradientBrush* = object 
    lpVtbl*: ptr ID2D1LinearGradientBrushVtbl

  ID2D1RadialGradientBrushVtbl* = object 
    Base*: ID2D1BrushVtbl
    SetCenter*: proc (This: ptr ID2D1RadialGradientBrush; center: D2D1_POINT_2F) {.
        stdcall.}
    SetGradientOriginOffset*: proc (This: ptr ID2D1RadialGradientBrush; 
                                    gradientOriginOffset: D2D1_POINT_2F) {.
        stdcall.}
    SetRadiusX*: proc (This: ptr ID2D1RadialGradientBrush; radiusX: FLOAT) {.
        stdcall.}
    SetRadiusY*: proc (This: ptr ID2D1RadialGradientBrush; radiusY: FLOAT) {.
        stdcall.}
    GetCenter*: proc (This: ptr ID2D1RadialGradientBrush): D2D1_POINT_2F {.
        stdcall.}
    GetGradientOriginOffset*: proc (This: ptr ID2D1RadialGradientBrush): D2D1_POINT_2F {.
        stdcall.}
    GetRadiusX*: proc (This: ptr ID2D1RadialGradientBrush): FLOAT {.stdcall.}
    GetRadiusY*: proc (This: ptr ID2D1RadialGradientBrush): FLOAT {.stdcall.}
    GetGradientStopCollection*: proc (This: ptr ID2D1RadialGradientBrush; 
        gradientStopCollection: ptr ptr ID2D1GradientStopCollection) {.stdcall.}

  ID2D1RadialGradientBrush* = object 
    lpVtbl*: ptr ID2D1RadialGradientBrushVtbl

  ID2D1StrokeStyleVtbl* = object 
    Base*: ID2D1ResourceVtbl
    GetStartCap*: proc (This: ptr ID2D1StrokeStyle): D2D1_CAP_STYLE {.stdcall.}
    GetEndCap*: proc (This: ptr ID2D1StrokeStyle): D2D1_CAP_STYLE {.stdcall.}
    GetDashCap*: proc (This: ptr ID2D1StrokeStyle): D2D1_CAP_STYLE {.stdcall.}
    GetMiterLimit*: proc (This: ptr ID2D1StrokeStyle): FLOAT {.stdcall.}
    GetLineJoin*: proc (This: ptr ID2D1StrokeStyle): D2D1_LINE_JOIN {.stdcall.}
    GetDashOffset*: proc (This: ptr ID2D1StrokeStyle): FLOAT {.stdcall.}
    GetDashStyle*: proc (This: ptr ID2D1StrokeStyle): D2D1_DASH_STYLE {.stdcall.}
    GetDashesCount*: proc (This: ptr ID2D1StrokeStyle): UINT32 {.stdcall.}
    GetDashes*: proc (This: ptr ID2D1StrokeStyle; dashes: ptr FLOAT; 
                      dashesCount: UINT32) {.stdcall.}

  ID2D1StrokeStyle* = object 
    lpVtbl*: ptr ID2D1StrokeStyleVtbl

  ID2D1GeometryVtbl* = object 
    Base*: ID2D1ResourceVtbl
    GetBounds*: proc (This: ptr ID2D1Geometry; 
                      worldTransform: ptr D2D1_MATRIX_3X2_F; 
                      bounds: ptr D2D1_RECT_F): HRESULT {.stdcall.}
    GetWidenedBounds*: proc (This: ptr ID2D1Geometry; strokeWidth: FLOAT; 
                             strokeStyle: ptr ID2D1StrokeStyle; 
                             worldTransform: ptr D2D1_MATRIX_3X2_F; 
                             flatteningTolerance: FLOAT; bounds: ptr D2D1_RECT_F): HRESULT {.
        stdcall.}
    StrokeContainsPoint*: proc (This: ptr ID2D1Geometry; point: D2D1_POINT_2F; 
                                strokeWidth: FLOAT; 
                                strokeStyle: ptr ID2D1StrokeStyle; 
                                worldTransform: ptr D2D1_MATRIX_3X2_F; 
                                flatteningTolerance: FLOAT; contains: ptr BOOL): HRESULT {.
        stdcall.}
    FillContainsPoint*: proc (This: ptr ID2D1Geometry; point: D2D1_POINT_2F; 
                              worldTransform: ptr D2D1_MATRIX_3X2_F; 
                              flatteningTolerance: FLOAT; contains: ptr BOOL): HRESULT {.
        stdcall.}
    CompareWithGeometry*: proc (This: ptr ID2D1Geometry; 
                                inputGeometry: ptr ID2D1Geometry; 
                                inputGeometryTransform: ptr D2D1_MATRIX_3X2_F; 
                                flatteningTolerance: FLOAT; 
                                relation: ptr D2D1_GEOMETRY_RELATION): HRESULT {.
        stdcall.}
    Simplify*: proc (This: ptr ID2D1Geometry; 
                     simplificationOption: D2D1_GEOMETRY_SIMPLIFICATION_OPTION; 
                     worldTransform: ptr D2D1_MATRIX_3X2_F; 
                     flatteningTolerance: FLOAT; 
                     geometrySink: ptr ID2D1SimplifiedGeometrySink): HRESULT {.
        stdcall.}
    Tessellate*: proc (This: ptr ID2D1Geometry; 
                       worldTransform: ptr D2D1_MATRIX_3X2_F; 
                       flatteningTolerance: FLOAT; 
                       tessellationSink: ptr ID2D1TessellationSink): HRESULT {.
        stdcall.}
    CombineWithGeometry*: proc (This: ptr ID2D1Geometry; 
                                inputGeometry: ptr ID2D1Geometry; 
                                combineMode: D2D1_COMBINE_MODE; 
                                inputGeometryTransform: ptr D2D1_MATRIX_3X2_F; 
                                flatteningTolerance: FLOAT; 
                                geometrySink: ptr ID2D1SimplifiedGeometrySink): HRESULT {.
        stdcall.}
    Outline*: proc (This: ptr ID2D1Geometry; 
                    worldTransform: ptr D2D1_MATRIX_3X2_F; 
                    flatteningTolerance: FLOAT; 
                    geometrySink: ptr ID2D1SimplifiedGeometrySink): HRESULT {.
        stdcall.}
    ComputeArea*: proc (This: ptr ID2D1Geometry; 
                        worldTransform: ptr D2D1_MATRIX_3X2_F; 
                        flatteningTolerance: FLOAT; area: ptr FLOAT): HRESULT {.
        stdcall.}
    ComputeLength*: proc (This: ptr ID2D1Geometry; 
                          worldTransform: ptr D2D1_MATRIX_3X2_F; 
                          flatteningTolerance: FLOAT; length: ptr FLOAT): HRESULT {.
        stdcall.}
    ComputePointAtLength*: proc (This: ptr ID2D1Geometry; length: FLOAT; 
                                 worldTransform: ptr D2D1_MATRIX_3X2_F; 
                                 flatteningTolerance: FLOAT; 
                                 point: ptr D2D1_POINT_2F; 
                                 unitTangentVector: ptr D2D1_POINT_2F): HRESULT {.
        stdcall.}
    Widen*: proc (This: ptr ID2D1Geometry; strokeWidth: FLOAT; 
                  strokeStyle: ptr ID2D1StrokeStyle; 
                  worldTransform: ptr D2D1_MATRIX_3X2_F; 
                  flatteningTolerance: FLOAT; 
                  geometrySink: ptr ID2D1SimplifiedGeometrySink): HRESULT {.
        stdcall.}

  ID2D1Geometry* = object 
    lpVtbl*: ptr ID2D1GeometryVtbl

  D2D1_LAYER_PARAMETERS* = object 
    contentBounds*: D2D1_RECT_F #
                                # The rectangular clip that will be applied to the layer. The clip is affected by
                                # the world transform. Content outside of the content bounds will not render.
                                #
                                #
                                # A general mask that can be optionally applied to the content. Content not inside
                                # the fill of the mask will not be rendered.
                                #
    geometricMask*: ptr ID2D1Geometry #
                                      # Specifies whether the mask should be aliased or antialiased.
                                      #
    maskAntialiasMode*: D2D1_ANTIALIAS_MODE #
                                            # An additional transform that may be applied to the mask in addition to the
                                            # current world transform.
                                            #
    maskTransform*: D2D1_MATRIX_3X2_F #
                                      # The opacity with which all of the content in the layer will be blended back to
                                      # the target when the layer is popped.
                                      #
    opacity*: FLOAT #
                    # An additional brush that can be applied to the layer. Only the opacity channel
                    # is sampled from this brush and multiplied both with the layer content and the
                    # over-all layer opacity.
                    #
    opacityBrush*: ptr ID2D1Brush #
                                  # Specifies if ClearType will be rendered into the layer.
                                  #
    layerOptions*: D2D1_LAYER_OPTIONS

  ID2D1RectangleGeometryVtbl* = object 
    Base*: ID2D1GeometryVtbl
    GetRect*: proc (This: ptr ID2D1RectangleGeometry; rect: ptr D2D1_RECT_F) {.
        stdcall.}

  ID2D1RectangleGeometry* = object 
    lpVtbl*: ptr ID2D1RectangleGeometryVtbl

  ID2D1RoundedRectangleGeometryVtbl* = object 
    Base*: ID2D1GeometryVtbl
    GetRoundedRect*: proc (This: ptr ID2D1RoundedRectangleGeometry; 
                           roundedRect: ptr D2D1_ROUNDED_RECT) {.stdcall.}

  ID2D1RoundedRectangleGeometry* = object 
    lpVtbl*: ptr ID2D1RoundedRectangleGeometryVtbl

  ID2D1EllipseGeometryVtbl* = object 
    Base*: ID2D1GeometryVtbl
    GetEllipse*: proc (This: ptr ID2D1EllipseGeometry; ellipse: ptr D2D1_ELLIPSE) {.
        stdcall.}

  ID2D1EllipseGeometry* = object 
    lpVtbl*: ptr ID2D1EllipseGeometryVtbl

  ID2D1GeometryGroupVtbl* = object 
    Base*: ID2D1GeometryVtbl
    GetFillMode*: proc (This: ptr ID2D1GeometryGroup): D2D1_FILL_MODE {.stdcall.}
    GetSourceGeometryCount*: proc (This: ptr ID2D1GeometryGroup): UINT32 {.
        stdcall.}
    GetSourceGeometries*: proc (This: ptr ID2D1GeometryGroup; 
                                geometries: ptr ptr ID2D1Geometry; 
                                geometriesCount: UINT32) {.stdcall.}

  ID2D1GeometryGroup* = object 
    lpVtbl*: ptr ID2D1GeometryGroupVtbl

  ID2D1TransformedGeometryVtbl* = object 
    Base*: ID2D1GeometryVtbl
    GetSourceGeometry*: proc (This: ptr ID2D1TransformedGeometry; 
                              sourceGeometry: ptr ptr ID2D1Geometry) {.stdcall.}
    GetTransform*: proc (This: ptr ID2D1TransformedGeometry; 
                         transform: ptr D2D1_MATRIX_3X2_F) {.stdcall.}

  ID2D1TransformedGeometry* = object 
    lpVtbl*: ptr ID2D1TransformedGeometryVtbl

  ID2D1SimplifiedGeometrySinkVtbl* = object 
    QueryInterface*: proc(This: ptr ID2D1SimplifiedGeometrySink; riid: ptr IID; ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc(This: ptr ID2D1SimplifiedGeometrySink): ULONG {.stdcall.}
    Release*: proc(This: ptr ID2D1SimplifiedGeometrySink): ULONG {.stdcall.}

    SetFillMode*: proc (This: ptr ID2D1SimplifiedGeometrySink; 
                        fillMode: D2D1_FILL_MODE) {.stdcall.}
    SetSegmentFlags*: proc (This: ptr ID2D1SimplifiedGeometrySink; 
                            vertexFlags: D2D1_PATH_SEGMENT) {.stdcall.}
    BeginFigure*: proc (This: ptr ID2D1SimplifiedGeometrySink; 
                        startPoint: D2D1_POINT_2F; 
                        figureBegin: D2D1_FIGURE_BEGIN) {.stdcall.}
    AddLines*: proc (This: ptr ID2D1SimplifiedGeometrySink; 
                     points: ptr D2D1_POINT_2F; pointsCount: UINT32) {.stdcall.}
    AddBeziers*: proc (This: ptr ID2D1SimplifiedGeometrySink; 
                       beziers: ptr D2D1_BEZIER_SEGMENT; beziersCount: UINT32) {.
        stdcall.}
    EndFigure*: proc (This: ptr ID2D1SimplifiedGeometrySink; 
                      figureEnd: D2D1_FIGURE_END) {.stdcall.}
    Close*: proc (This: ptr ID2D1SimplifiedGeometrySink): HRESULT {.stdcall.}

  ID2D1SimplifiedGeometrySink* = object 
    lpVtbl*: ptr ID2D1SimplifiedGeometrySinkVtbl

  ID2D1GeometrySinkVtbl* = object 
    Base*: ID2D1SimplifiedGeometrySinkVtbl
    AddLine*: proc (This: ptr ID2D1GeometrySink; point: D2D1_POINT_2F) {.stdcall.}
    AddBezier*: proc (This: ptr ID2D1GeometrySink; 
                      bezier: ptr D2D1_BEZIER_SEGMENT) {.stdcall.}
    AddQuadraticBezier*: proc (This: ptr ID2D1GeometrySink; 
                               bezier: ptr D2D1_QUADRATIC_BEZIER_SEGMENT) {.
        stdcall.}
    AddQuadraticBeziers*: proc (This: ptr ID2D1GeometrySink; 
                                beziers: ptr D2D1_QUADRATIC_BEZIER_SEGMENT; 
                                beziersCount: UINT32) {.stdcall.}
    AddArc*: proc (This: ptr ID2D1GeometrySink; arc: ptr D2D1_ARC_SEGMENT) {.
        stdcall.}

  ID2D1GeometrySink* = object 
    lpVtbl*: ptr ID2D1GeometrySinkVtbl

  ID2D1TessellationSinkVtbl* = object 
    QueryInterface*: proc(This: ptr ID2D1TessellationSinkVtbl; riid: ptr IID; ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc(This: ptr ID2D1TessellationSinkVtbl): ULONG {.stdcall.}
    Release*: proc(This: ptr ID2D1TessellationSinkVtbl): ULONG {.stdcall.}

    AddTriangles*: proc (This: ptr ID2D1TessellationSink; 
                         triangles: ptr D2D1_TRIANGLE; trianglesCount: UINT32) {.
        stdcall.}
    Close*: proc (This: ptr ID2D1TessellationSink): HRESULT {.stdcall.}

  ID2D1TessellationSink* = object 
    lpVtbl*: ptr ID2D1TessellationSinkVtbl

  ID2D1PathGeometryVtbl* = object 
    Base*: ID2D1GeometryVtbl
    Open*: proc (This: ptr ID2D1PathGeometry; 
                 geometrySink: ptr ptr ID2D1GeometrySink): HRESULT {.stdcall.}
    Stream*: proc (This: ptr ID2D1PathGeometry; 
                   geometrySink: ptr ID2D1GeometrySink): HRESULT {.stdcall.}
    GetSegmentCount*: proc (This: ptr ID2D1PathGeometry; count: ptr UINT32): HRESULT {.
        stdcall.}
    GetFigureCount*: proc (This: ptr ID2D1PathGeometry; count: ptr UINT32): HRESULT {.
        stdcall.}

  ID2D1PathGeometry* = object 
    lpVtbl*: ptr ID2D1PathGeometryVtbl

  ID2D1MeshVtbl* = object 
    Base*: ID2D1ResourceVtbl
    Open*: proc (This: ptr ID2D1Mesh; 
                 tessellationSink: ptr ptr ID2D1TessellationSink): HRESULT {.
        stdcall.}

  ID2D1Mesh* = object 
    lpVtbl*: ptr ID2D1MeshVtbl

  ID2D1LayerVtbl* = object 
    Base*: ID2D1ResourceVtbl
    GetSize*: proc (This: ptr ID2D1Layer): D2D1_SIZE_F {.stdcall.}

  ID2D1Layer* = object 
    lpVtbl*: ptr ID2D1LayerVtbl

  ID2D1DrawingStateBlockVtbl* = object 
    Base*: ID2D1ResourceVtbl
    GetDescription*: proc (This: ptr ID2D1DrawingStateBlock; 
                           stateDescription: ptr D2D1_DRAWING_STATE_DESCRIPTION) {.
        stdcall.}
    SetDescription*: proc (This: ptr ID2D1DrawingStateBlock; 
                           stateDescription: ptr D2D1_DRAWING_STATE_DESCRIPTION) {.
        stdcall.}
    SetTextRenderingParams*: proc (This: ptr ID2D1DrawingStateBlock; 
        textRenderingParams: ptr IDWriteRenderingParams) {.stdcall.}
    GetTextRenderingParams*: proc (This: ptr ID2D1DrawingStateBlock; 
        textRenderingParams: ptr ptr IDWriteRenderingParams) {.stdcall.}

  ID2D1DrawingStateBlock* = object 
    lpVtbl*: ptr ID2D1DrawingStateBlockVtbl

  ID2D1RenderTargetVtbl* = object 
    Base*: ID2D1ResourceVtbl
    CreateBitmap*: proc (This: ptr ID2D1RenderTarget; size: D2D1_SIZE_U; 
                         srcData: pointer; pitch: UINT32; 
                         bitmapProperties: ptr D2D1_BITMAP_PROPERTIES; 
                         bitmap: ptr ptr ID2D1Bitmap): HRESULT {.stdcall.}
    CreateBitmapFromWicBitmap*: proc (This: ptr ID2D1RenderTarget; 
                                      wicBitmapSource: ptr IWICBitmapSource; 
        bitmapProperties: ptr D2D1_BITMAP_PROPERTIES; 
                                      bitmap: ptr ptr ID2D1Bitmap): HRESULT {.
        stdcall.}
    CreateSharedBitmap*: proc (This: ptr ID2D1RenderTarget; riid: ptr IID; 
                               data: pointer; 
                               bitmapProperties: ptr D2D1_BITMAP_PROPERTIES; 
                               bitmap: ptr ptr ID2D1Bitmap): HRESULT {.stdcall.}
    CreateBitmapBrush*: proc (This: ptr ID2D1RenderTarget; 
                              bitmap: ptr ID2D1Bitmap; bitmapBrushProperties: ptr D2D1_BITMAP_BRUSH_PROPERTIES; 
                              brushProperties: ptr D2D1_BRUSH_PROPERTIES; 
                              bitmapBrush: ptr ptr ID2D1BitmapBrush): HRESULT {.
        stdcall.}
    CreateSolidColorBrush*: proc (This: ptr ID2D1RenderTarget; 
                                  color: ptr D2D1_COLOR_F; 
                                  brushProperties: ptr D2D1_BRUSH_PROPERTIES; 
                                  solidColorBrush: ptr ptr ID2D1SolidColorBrush): HRESULT {.
        stdcall.}
    CreateGradientStopCollection*: proc (This: ptr ID2D1RenderTarget; 
        gradientStops: ptr D2D1_GRADIENT_STOP; gradientStopsCount: UINT32; 
        colorInterpolationGamma: D2D1_GAMMA; extendMode: D2D1_EXTEND_MODE; 
        gradientStopCollection: ptr ptr ID2D1GradientStopCollection): HRESULT {.
        stdcall.}
    CreateLinearGradientBrush*: proc (This: ptr ID2D1RenderTarget; 
        linearGradientBrushProperties: ptr D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES; 
        brushProperties: ptr D2D1_BRUSH_PROPERTIES; gradientStopCollection: ptr ID2D1GradientStopCollection; 
        linearGradientBrush: ptr ptr ID2D1LinearGradientBrush): HRESULT {.
        stdcall.}
    CreateRadialGradientBrush*: proc (This: ptr ID2D1RenderTarget; 
        radialGradientBrushProperties: ptr D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES; 
        brushProperties: ptr D2D1_BRUSH_PROPERTIES; gradientStopCollection: ptr ID2D1GradientStopCollection; 
        radialGradientBrush: ptr ptr ID2D1RadialGradientBrush): HRESULT {.
        stdcall.}
    CreateCompatibleRenderTarget*: proc (This: ptr ID2D1RenderTarget; 
        desiredSize: ptr D2D1_SIZE_F; desiredPixelSize: ptr D2D1_SIZE_U; 
        desiredFormat: ptr D2D1_PIXEL_FORMAT; 
        options: D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS; 
        bitmapRenderTarget: ptr ptr ID2D1BitmapRenderTarget): HRESULT {.stdcall.}
    CreateLayer*: proc (This: ptr ID2D1RenderTarget; size: ptr D2D1_SIZE_F; 
                        layer: ptr ptr ID2D1Layer): HRESULT {.stdcall.}
    CreateMesh*: proc (This: ptr ID2D1RenderTarget; mesh: ptr ptr ID2D1Mesh): HRESULT {.
        stdcall.}
    DrawLine*: proc (This: ptr ID2D1RenderTarget; point0: D2D1_POINT_2F; 
                     point1: D2D1_POINT_2F; brush: ptr ID2D1Brush; 
                     strokeWidth: FLOAT; strokeStyle: ptr ID2D1StrokeStyle) {.
        stdcall.}
    DrawRectangle*: proc (This: ptr ID2D1RenderTarget; rect: ptr D2D1_RECT_F; 
                          brush: ptr ID2D1Brush; strokeWidth: FLOAT; 
                          strokeStyle: ptr ID2D1StrokeStyle) {.stdcall.}
    FillRectangle*: proc (This: ptr ID2D1RenderTarget; rect: ptr D2D1_RECT_F; 
                          brush: ptr ID2D1Brush) {.stdcall.}
    DrawRoundedRectangle*: proc (This: ptr ID2D1RenderTarget; 
                                 roundedRect: ptr D2D1_ROUNDED_RECT; 
                                 brush: ptr ID2D1Brush; strokeWidth: FLOAT; 
                                 strokeStyle: ptr ID2D1StrokeStyle) {.stdcall.}
    FillRoundedRectangle*: proc (This: ptr ID2D1RenderTarget; 
                                 roundedRect: ptr D2D1_ROUNDED_RECT; 
                                 brush: ptr ID2D1Brush) {.stdcall.}
    DrawEllipse*: proc (This: ptr ID2D1RenderTarget; ellipse: ptr D2D1_ELLIPSE; 
                        brush: ptr ID2D1Brush; strokeWidth: FLOAT; 
                        strokeStyle: ptr ID2D1StrokeStyle) {.stdcall.}
    FillEllipse*: proc (This: ptr ID2D1RenderTarget; ellipse: ptr D2D1_ELLIPSE; 
                        brush: ptr ID2D1Brush) {.stdcall.}
    DrawGeometry*: proc (This: ptr ID2D1RenderTarget; 
                         geometry: ptr ID2D1Geometry; brush: ptr ID2D1Brush; 
                         strokeWidth: FLOAT; strokeStyle: ptr ID2D1StrokeStyle) {.
        stdcall.}
    FillGeometry*: proc (This: ptr ID2D1RenderTarget; 
                         geometry: ptr ID2D1Geometry; brush: ptr ID2D1Brush; 
                         opacityBrush: ptr ID2D1Brush) {.stdcall.}
    FillMesh*: proc (This: ptr ID2D1RenderTarget; mesh: ptr ID2D1Mesh; 
                     brush: ptr ID2D1Brush) {.stdcall.}
    FillOpacityMask*: proc (This: ptr ID2D1RenderTarget; 
                            opacityMask: ptr ID2D1Bitmap; brush: ptr ID2D1Brush; 
                            content: D2D1_OPACITY_MASK_CONTENT; 
                            destinationRectangle: ptr D2D1_RECT_F; 
                            sourceRectangle: ptr D2D1_RECT_F) {.stdcall.}
    DrawBitmap*: proc (This: ptr ID2D1RenderTarget; bitmap: ptr ID2D1Bitmap; 
                       destinationRectangle: ptr D2D1_RECT_F; opacity: FLOAT; 
                       interpolationMode: D2D1_BITMAP_INTERPOLATION_MODE; 
                       sourceRectangle: ptr D2D1_RECT_F) {.stdcall.}
    DrawTextA*: proc (This: ptr ID2D1RenderTarget; string: ptr WCHAR; 
                      stringLength: UINT32; textFormat: ptr IDWriteTextFormat; 
                      layoutRect: ptr D2D1_RECT_F; 
                      defaultForegroundBrush: ptr ID2D1Brush; 
                      options: D2D1_DRAW_TEXT_OPTIONS; 
                      measuringMode: DWRITE_MEASURING_MODE) {.stdcall.}
    DrawTextLayout*: proc (This: ptr ID2D1RenderTarget; origin: D2D1_POINT_2F; 
                           textLayout: ptr IDWriteTextLayout; 
                           defaultForegroundBrush: ptr ID2D1Brush; 
                           options: D2D1_DRAW_TEXT_OPTIONS) {.stdcall.}
    DrawGlyphRun*: proc (This: ptr ID2D1RenderTarget; 
                         baselineOrigin: D2D1_POINT_2F; 
                         glyphRun: ptr DWRITE_GLYPH_RUN; 
                         foregroundBrush: ptr ID2D1Brush; 
                         measuringMode: DWRITE_MEASURING_MODE) {.stdcall.}
    SetTransform*: proc (This: ptr ID2D1RenderTarget; 
                         transform: ptr D2D1_MATRIX_3X2_F) {.stdcall.}
    GetTransform*: proc (This: ptr ID2D1RenderTarget; 
                         transform: ptr D2D1_MATRIX_3X2_F) {.stdcall.}
    SetAntialiasMode*: proc (This: ptr ID2D1RenderTarget; 
                             antialiasMode: D2D1_ANTIALIAS_MODE) {.stdcall.}
    GetAntialiasMode*: proc (This: ptr ID2D1RenderTarget): D2D1_ANTIALIAS_MODE {.
        stdcall.}
    SetTextAntialiasMode*: proc (This: ptr ID2D1RenderTarget; 
                                 textAntialiasMode: D2D1_TEXT_ANTIALIAS_MODE) {.
        stdcall.}
    GetTextAntialiasMode*: proc (This: ptr ID2D1RenderTarget): D2D1_TEXT_ANTIALIAS_MODE {.
        stdcall.}
    SetTextRenderingParams*: proc (This: ptr ID2D1RenderTarget; 
        textRenderingParams: ptr IDWriteRenderingParams) {.stdcall.}
    GetTextRenderingParams*: proc (This: ptr ID2D1RenderTarget; 
        textRenderingParams: ptr ptr IDWriteRenderingParams) {.stdcall.}
    SetTags*: proc (This: ptr ID2D1RenderTarget; tag1: D2D1_TAG; tag2: D2D1_TAG) {.
        stdcall.}
    GetTags*: proc (This: ptr ID2D1RenderTarget; tag1: ptr D2D1_TAG; 
                    tag2: ptr D2D1_TAG) {.stdcall.}
    PushLayer*: proc (This: ptr ID2D1RenderTarget; 
                      layerParameters: ptr D2D1_LAYER_PARAMETERS; 
                      layer: ptr ID2D1Layer) {.stdcall.}
    PopLayer*: proc (This: ptr ID2D1RenderTarget) {.stdcall.}
    Flush*: proc (This: ptr ID2D1RenderTarget; tag1: ptr D2D1_TAG; 
                  tag2: ptr D2D1_TAG): HRESULT {.stdcall.}
    SaveDrawingState*: proc (This: ptr ID2D1RenderTarget; 
                             drawingStateBlock: ptr ID2D1DrawingStateBlock) {.
        stdcall.}
    RestoreDrawingState*: proc (This: ptr ID2D1RenderTarget; 
                                drawingStateBlock: ptr ID2D1DrawingStateBlock) {.
        stdcall.}
    PushAxisAlignedClip*: proc (This: ptr ID2D1RenderTarget; 
                                clipRect: ptr D2D1_RECT_F; 
                                antialiasMode: D2D1_ANTIALIAS_MODE) {.stdcall.}
    PopAxisAlignedClip*: proc (This: ptr ID2D1RenderTarget) {.stdcall.}
    Clear*: proc (This: ptr ID2D1RenderTarget; clearColor: ptr D2D1_COLOR_F) {.
        stdcall.}
    BeginDraw*: proc (This: ptr ID2D1RenderTarget) {.stdcall.}
    EndDraw*: proc (This: ptr ID2D1RenderTarget; tag1: ptr D2D1_TAG; 
                    tag2: ptr D2D1_TAG): HRESULT {.stdcall.}
    GetPixelFormat*: proc (This: ptr ID2D1RenderTarget): D2D1_PIXEL_FORMAT {.
        stdcall.}
    SetDpi*: proc (This: ptr ID2D1RenderTarget; dpiX: FLOAT; dpiY: FLOAT) {.
        stdcall.}
    GetDpi*: proc (This: ptr ID2D1RenderTarget; dpiX: ptr FLOAT; dpiY: ptr FLOAT) {.
        stdcall.}
    GetSize*: proc (This: ptr ID2D1RenderTarget): D2D1_SIZE_F {.stdcall.}
    GetPixelSize*: proc (This: ptr ID2D1RenderTarget): D2D1_SIZE_U {.stdcall.}
    GetMaximumBitmapSize*: proc (This: ptr ID2D1RenderTarget): UINT32 {.stdcall.}
    IsSupported*: proc (This: ptr ID2D1RenderTarget; renderTargetProperties: ptr D2D1_RENDER_TARGET_PROPERTIES): BOOL {.
        stdcall.}

  ID2D1RenderTarget* = object 
    lpVtbl*: ptr ID2D1RenderTargetVtbl

  ID2D1BitmapRenderTargetVtbl* = object 
    Base*: ID2D1RenderTargetVtbl
    GetBitmap*: proc (This: ptr ID2D1BitmapRenderTarget; 
                      bitmap: ptr ptr ID2D1Bitmap): HRESULT {.stdcall.}

  ID2D1BitmapRenderTarget* = object 
    lpVtbl*: ptr ID2D1BitmapRenderTargetVtbl

  ID2D1HwndRenderTargetVtbl* = object 
    Base*: ID2D1RenderTargetVtbl
    CheckWindowState*: proc (This: ptr ID2D1HwndRenderTarget): D2D1_WINDOW_STATE {.
        stdcall.}
    Resize*: proc (This: ptr ID2D1HwndRenderTarget; pixelSize: ptr D2D1_SIZE_U): HRESULT {.
        stdcall.}
    GetHwnd*: proc (This: ptr ID2D1HwndRenderTarget): HWND {.stdcall.}

  ID2D1HwndRenderTarget* = object 
    lpVtbl*: ptr ID2D1HwndRenderTargetVtbl

  ID2D1GdiInteropRenderTargetVtbl* = object 
    QueryInterface*: proc(This: ptr ID2D1GdiInteropRenderTarget; riid: ptr IID; ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc(This: ptr ID2D1GdiInteropRenderTarget): ULONG {.stdcall.}
    Release*: proc(This: ptr ID2D1GdiInteropRenderTarget): ULONG {.stdcall.}

    GetDC*: proc (This: ptr ID2D1GdiInteropRenderTarget; 
                  mode: D2D1_DC_INITIALIZE_MODE; hdc: ptr HDC): HRESULT {.
        stdcall.}
    ReleaseDC*: proc (This: ptr ID2D1GdiInteropRenderTarget; update: ptr RECT): HRESULT {.
        stdcall.}

  ID2D1GdiInteropRenderTarget* = object 
    lpVtbl*: ptr ID2D1GdiInteropRenderTargetVtbl

  ID2D1DCRenderTargetVtbl* = object 
    Base*: ID2D1RenderTargetVtbl
    BindDC*: proc (This: ptr ID2D1DCRenderTarget; hDC: HDC; pSubRect: ptr RECT): HRESULT {.
        stdcall.}

  ID2D1DCRenderTarget* = object 
    lpVtbl*: ptr ID2D1DCRenderTargetVtbl

  ID2D1FactoryVtbl* = object 
    
    QueryInterface*: proc(This: ptr ID2D1Factory; riid: ptr IID; ppvObject: ptr pointer): HRESULT {.stdcall.}
    AddRef*: proc(This: ptr ID2D1Factory): ULONG {.stdcall.}
    Release*: proc(This: ptr ID2D1GdiInteropRenderTargetVtbl): ULONG {.stdcall.}

    ReloadSystemMetrics*: proc (This: ptr ID2D1Factory): HRESULT {.stdcall.}
    GetDesktopDpi*: proc (This: ptr ID2D1Factory; dpiX: ptr FLOAT; 
                          dpiY: ptr FLOAT) {.stdcall.}
    CreateRectangleGeometry*: proc (This: ptr ID2D1Factory; 
                                    rectangle: ptr D2D1_RECT_F; 
        rectangleGeometry: ptr ptr ID2D1RectangleGeometry): HRESULT {.stdcall.}
    CreateRoundedRectangleGeometry*: proc (This: ptr ID2D1Factory; 
        roundedRectangle: ptr D2D1_ROUNDED_RECT; 
        roundedRectangleGeometry: ptr ptr ID2D1RoundedRectangleGeometry): HRESULT {.
        stdcall.}
    CreateEllipseGeometry*: proc (This: ptr ID2D1Factory; 
                                  ellipse: ptr D2D1_ELLIPSE; 
                                  ellipseGeometry: ptr ptr ID2D1EllipseGeometry): HRESULT {.
        stdcall.}
    CreateGeometryGroup*: proc (This: ptr ID2D1Factory; 
                                fillMode: D2D1_FILL_MODE; 
                                geometries: ptr ptr ID2D1Geometry; 
                                geometriesCount: UINT32; 
                                geometryGroup: ptr ptr ID2D1GeometryGroup): HRESULT {.
        stdcall.}
    CreateTransformedGeometry*: proc (This: ptr ID2D1Factory; 
                                      sourceGeometry: ptr ID2D1Geometry; 
                                      transform: ptr D2D1_MATRIX_3X2_F; 
        transformedGeometry: ptr ptr ID2D1TransformedGeometry): HRESULT {.
        stdcall.}
    CreatePathGeometry*: proc (This: ptr ID2D1Factory; 
                               pathGeometry: ptr ptr ID2D1PathGeometry): HRESULT {.
        stdcall.}
    CreateStrokeStyle*: proc (This: ptr ID2D1Factory; strokeStyleProperties: ptr D2D1_STROKE_STYLE_PROPERTIES; 
                              dashes: ptr FLOAT; dashesCount: UINT32; 
                              strokeStyle: ptr ptr ID2D1StrokeStyle): HRESULT {.
        stdcall.}
    CreateDrawingStateBlock*: proc (This: ptr ID2D1Factory; 
        drawingStateDescription: ptr D2D1_DRAWING_STATE_DESCRIPTION; 
        textRenderingParams: ptr IDWriteRenderingParams; drawingStateBlock: ptr ptr ID2D1DrawingStateBlock): HRESULT {.
        stdcall.}
    CreateWicBitmapRenderTarget*: proc (This: ptr ID2D1Factory; 
                                        target: ptr IWICBitmap; 
        renderTargetProperties: ptr D2D1_RENDER_TARGET_PROPERTIES; 
                                        renderTarget: ptr ptr ID2D1RenderTarget): HRESULT {.
        stdcall.}
    CreateHwndRenderTarget*: proc (This: ptr ID2D1Factory; 
        renderTargetProperties: ptr D2D1_RENDER_TARGET_PROPERTIES; 
        hwndRenderTargetProperties: ptr D2D1_HWND_RENDER_TARGET_PROPERTIES; 
        hwndRenderTarget: ptr ptr ID2D1HwndRenderTarget): HRESULT {.stdcall.}
    CreateDxgiSurfaceRenderTarget*: proc (This: ptr ID2D1Factory; 
        dxgiSurface: ptr IDXGISurface; 
        renderTargetProperties: ptr D2D1_RENDER_TARGET_PROPERTIES; 
        renderTarget: ptr ptr ID2D1RenderTarget): HRESULT {.stdcall.}
    CreateDCRenderTarget*: proc (This: ptr ID2D1Factory; renderTargetProperties: ptr D2D1_RENDER_TARGET_PROPERTIES; 
                                 dcRenderTarget: ptr ptr ID2D1DCRenderTarget): HRESULT {.
        stdcall.}

  ID2D1Factory* = object 
    lpVtbl*: ptr ID2D1FactoryVtbl


#
# This export cannot be in a namespace because compiler name mangling isn't consistent
# also, this must be 'C' callable.
#

proc D2D1CreateFactory*(factoryType: D2D1_FACTORY_TYPE; riid: ptr IID; 
                        pFactoryOptions: ptr D2D1_FACTORY_OPTIONS; 
                        ppIFactory: ptr pointer): HRESULT {.stdcall, importc.}
proc D2D1MakeRotateMatrix*(angle: FLOAT; center: D2D1_POINT_2F; 
                           matrix: ptr D2D1_MATRIX_3X2_F) {.stdcall, importc.}
proc D2D1MakeSkewMatrix*(angleX: FLOAT; angleY: FLOAT; center: D2D1_POINT_2F; 
                         matrix: ptr D2D1_MATRIX_3X2_F) {.stdcall, importc.}
proc D2D1IsMatrixInvertible*(matrix: ptr D2D1_MATRIX_3X2_F): BOOL {.stdcall, importc.}
proc D2D1InvertMatrix*(matrix: ptr D2D1_MATRIX_3X2_F): BOOL {.stdcall, importc.}


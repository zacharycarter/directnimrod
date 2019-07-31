## directX bindings by Charlie Barto
import winim
import dxgitype
type UINT = uint32
type INT = int32
type FLOAT = float32

#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_POINT_2U
#
#------------------------------------------------------------------------------

type 
  D2D_POINT_2U* = object 
    x*: UINT32
    y*: UINT32


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_POINT_2F
#
#------------------------------------------------------------------------------

type 
  D2D_POINT_2F* = object 
    x*: FLOAT
    y*: FLOAT

  D2D_POINT_2L* = POINT

#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_VECTOR_2F
#
#------------------------------------------------------------------------------

type 
  D2D_VECTOR_2F* = object 
    x*: FLOAT
    y*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_VECTOR_3F
#
#------------------------------------------------------------------------------

type 
  D2D_VECTOR_3F* = object 
    x*: FLOAT
    y*: FLOAT
    z*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_VECTOR_4F
#
#------------------------------------------------------------------------------

type 
  D2D_VECTOR_4F* = object 
    x*: FLOAT
    y*: FLOAT
    z*: FLOAT
    w*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_RECT_F
#
#------------------------------------------------------------------------------

type 
  D2D_RECT_F* = object 
    left*: FLOAT
    top*: FLOAT
    right*: FLOAT
    bottom*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_RECT_U
#
#------------------------------------------------------------------------------

type 
  D2D_RECT_U* = object 
    left*: UINT32
    top*: UINT32
    right*: UINT32
    bottom*: UINT32

  D2D_RECT_L* = RECT

#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_SIZE_F
#
#------------------------------------------------------------------------------

type 
  D2D_SIZE_F* = object 
    width*: FLOAT
    height*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_SIZE_U
#
#------------------------------------------------------------------------------

type 
  D2D_SIZE_U* = object 
    width*: UINT32
    height*: UINT32

  D2D_COLOR_F* = D3DCOLORVALUE

#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_MATRIX_3X2_F
#
#------------------------------------------------------------------------------

type 
  D2D_MATRIX_3X2_F* = object 
    m_11*: FLOAT
    m_12*: FLOAT
    m_21*: FLOAT
    m_22*: FLOAT
    m_31*: FLOAT
    m_32*: FLOAT


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_MATRIX_4X3_F
#
#------------------------------------------------------------------------------

type 
  INNER_C_STRUCT_15141790095260642623* = object 
    m_11*: FLOAT
    m_12*: FLOAT
    m_13*: FLOAT
    m_21*: FLOAT
    m_22*: FLOAT
    m_23*: FLOAT
    m_31*: FLOAT
    m_32*: FLOAT
    m_33*: FLOAT
    m_41*: FLOAT
    m_42*: FLOAT
    m_43*: FLOAT

  INNER_C_UNION_15136283275013139697* = object  {.union.}
    ano_16362193970774195001*: INNER_C_STRUCT_15141790095260642623
    m*: array[3, array[4, FLOAT]]

  D2D_MATRIX_4X3_F* = object 
    ano_14402372993302121643*: INNER_C_UNION_15136283275013139697


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_MATRIX_4X4_F
#
#------------------------------------------------------------------------------

type 
  INNER_C_STRUCT_16088195970026245963* = object 
    m_11*: FLOAT
    m_12*: FLOAT
    m_13*: FLOAT
    m_14*: FLOAT
    m_21*: FLOAT
    m_22*: FLOAT
    m_23*: FLOAT
    m_24*: FLOAT
    m_31*: FLOAT
    m_32*: FLOAT
    m_33*: FLOAT
    m_34*: FLOAT
    m_41*: FLOAT
    m_42*: FLOAT
    m_43*: FLOAT
    m_44*: FLOAT

  INNER_C_UNION_16091372325674567764* = object  {.union.}
    ano_17678891680330273487*: INNER_C_STRUCT_16088195970026245963
    m*: array[4, array[4, FLOAT]]

  D2D_MATRIX_4X4_F* = object 
    ano_15211563756970484893*: INNER_C_UNION_16091372325674567764


#+-----------------------------------------------------------------------------
#
#  Struct:
#      D2D_MATRIX_5X4_F
#
#------------------------------------------------------------------------------

type 
  INNER_C_STRUCT_16385864509048470502* = object 
    m_11*: FLOAT
    m_12*: FLOAT
    m_13*: FLOAT
    m_14*: FLOAT
    m_21*: FLOAT
    m_22*: FLOAT
    m_23*: FLOAT
    m_24*: FLOAT
    m_31*: FLOAT
    m_32*: FLOAT
    m_33*: FLOAT
    m_34*: FLOAT
    m_41*: FLOAT
    m_42*: FLOAT
    m_43*: FLOAT
    m_44*: FLOAT
    m_51*: FLOAT
    m_52*: FLOAT
    m_53*: FLOAT
    m_54*: FLOAT

  INNER_C_UNION_18014871195445394380* = object  {.union.}
    ano_4528086865801391533*: INNER_C_STRUCT_16385864509048470502
    m*: array[4, array[5, FLOAT]]

  D2D_MATRIX_5X4_F* = object 
    ano_3744662536076341083*: INNER_C_UNION_18014871195445394380


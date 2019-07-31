{.link: "d3dCompiler.lib".}
# this file is generated from the version of d3dcompiler.h shipped with windows 10
import d3dcommon
import winim
type UINT = uint32
type INT = int32
type FLOAT = float32
type BYTE = TBYTE
type BOOL = WINBOOL
type ID3D11Linker = object
type ID3D11Module = object
type ID3D11FunctionLinkingGraph = object
type ID3D10Effect = object
const 
  D3D_COMPILER_DLL* = "d3dCompiler_47.dll"
  D3D_COMPILER_VERSION* = 47

#----------------------------------------------------------------------------
# D3DCOMPILE flags:
# -----------------
# D3DCOMPILE_DEBUG
#   Insert debug file/line/type/symbol information.
#
# D3DCOMPILE_SKIP_VALIDATION
#   Do not validate the generated code against known capabilities and
#   constraints.  This option is only recommended when compiling shaders
#   you KNOW will work.  (ie. have compiled before without this option.)
#   Shaders are always validated by D3D before they are set to the device.
#
# D3DCOMPILE_SKIP_OPTIMIZATION
#   Instructs the compiler to skip optimization steps during code generation.
#   Unless you are trying to isolate a problem in your code using this option
#   is not recommended.
#
# D3DCOMPILE_PACK_MATRIX_ROW_MAJOR
#   Unless explicitly specified, matrices will be packed in row-major order
#   on input and output from the shader.
#
# D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR
#   Unless explicitly specified, matrices will be packed in column-major
#   order on input and output from the shader.  This is generally more
#   efficient, since it allows vector-matrix multiplication to be performed
#   using a series of dot-products.
#
# D3DCOMPILE_PARTIAL_PRECISION
#   Force all computations in resulting shader to occur at partial precision.
#   This may result in faster evaluation of shaders on some hardware.
#
# D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT
#   Force compiler to compile against the next highest available software
#   target for vertex shaders.  This flag also turns optimizations off,
#   and debugging on.
#
# D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT
#   Force compiler to compile against the next highest available software
#   target for pixel shaders.  This flag also turns optimizations off,
#   and debugging on.
#
# D3DCOMPILE_NO_PRESHADER
#   Disables Preshaders. Using this flag will cause the compiler to not
#   pull out static expression for evaluation on the host cpu
#
# D3DCOMPILE_AVOID_FLOW_CONTROL
#   Hint compiler to avoid flow-control constructs where possible.
#
# D3DCOMPILE_PREFER_FLOW_CONTROL
#   Hint compiler to prefer flow-control constructs where possible.
#
# D3DCOMPILE_ENABLE_STRICTNESS
#   By default, the HLSL/Effect compilers are not strict on deprecated syntax.
#   Specifying this flag enables the strict mode. Deprecated syntax may be
#   removed in a future release, and enabling syntax is a good way to make
#   sure your shaders comply to the latest spec.
#
# D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY
#   This enables older shaders to compile to 4_0 targets.
#
#----------------------------------------------------------------------------

const 
  D3DCOMPILE_DEBUG* = (1 shl 0)
  D3DCOMPILE_SKIP_VALIDATION* = (1 shl 1)
  D3DCOMPILE_SKIP_OPTIMIZATION* = (1 shl 2)
  D3DCOMPILE_PACK_MATRIX_ROW_MAJOR* = (1 shl 3)
  D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR* = (1 shl 4)
  D3DCOMPILE_PARTIAL_PRECISION* = (1 shl 5)
  D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT* = (1 shl 6)
  D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT* = (1 shl 7)
  D3DCOMPILE_NO_PRESHADER* = (1 shl 8)
  D3DCOMPILE_AVOID_FLOW_CONTROL* = (1 shl 9)
  D3DCOMPILE_PREFER_FLOW_CONTROL* = (1 shl 10)
  D3DCOMPILE_ENABLE_STRICTNESS* = (1 shl 11)
  D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY* = (1 shl 12)
  D3DCOMPILE_IEEE_STRICTNESS* = (1 shl 13)
  D3DCOMPILE_OPTIMIZATION_LEVEL0* = (1 shl 14)
  D3DCOMPILE_OPTIMIZATION_LEVEL1* = 0
  D3DCOMPILE_OPTIMIZATION_LEVEL2* = ((1 shl 14) or (1 shl 15))
  D3DCOMPILE_OPTIMIZATION_LEVEL3* = (1 shl 15)
  D3DCOMPILE_RESERVED16* = (1 shl 16)
  D3DCOMPILE_RESERVED17* = (1 shl 17)
  D3DCOMPILE_WARNINGS_ARE_ERRORS* = (1 shl 18)
  D3DCOMPILE_RESOURCES_MAY_ALIAS* = (1 shl 19)
  D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES* = (1 shl 20)
  D3DCOMPILE_ALL_RESOURCES_BOUND* = (1 shl 21)

#----------------------------------------------------------------------------
# D3DCOMPILE_EFFECT flags:
# -------------------------------------
# These flags are passed in when creating an effect, and affect
# either compilation behavior or runtime effect behavior
#
# D3DCOMPILE_EFFECT_CHILD_EFFECT
#   Compile this .fx file to a child effect. Child effects have no
#   initializers for any shared values as these are initialied in the
#   master effect (pool).
#
# D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS
#   By default, performance mode is enabled.  Performance mode
#   disallows mutable state objects by preventing non-literal
#   expressions from appearing in state object definitions.
#   Specifying this flag will disable the mode and allow for mutable
#   state objects.
#
#----------------------------------------------------------------------------

const 
  D3DCOMPILE_EFFECT_CHILD_EFFECT* = (1 shl 0)
  D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS* = (1 shl 1)

#----------------------------------------------------------------------------
# D3DCompile:
# ----------
# Compile source text into bytecode appropriate for the given target.
#----------------------------------------------------------------------------
# D3D_COMPILE_STANDARD_FILE_INCLUDE can be passed for pInclude in any
# API and indicates that a simple default include handler should be
# used.  The include handler will include files relative to the
# current directory and files relative to the directory of the initial source
# file.  When used with APIs like D3DCompile pSourceName must be a
# file name and the initial relative directory will be derived from it.

const 
  D3D_COMPILE_STANDARD_FILE_INCLUDE* = cast[ptr ID3DInclude](1)

proc D3DReadFileToBlob*(pFileName: LPCWSTR; ppContents: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DWriteBlobToFile*(pBlob: ptr ID3DBlob; pFileName: LPCWSTR; 
                         bOverwrite: BOOL): HRESULT {.stdcall, importc.}
proc D3DCompile*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; pSourceName: LPCSTR; 
                 pDefines: ptr D3D_SHADER_MACRO; pInclude: ptr ID3DInclude; 
                 pEntrypoint: LPCSTR; pTarget: LPCSTR; Flags1: UINT; 
                 Flags2: UINT; ppCode: ptr ptr ID3DBlob; 
                 ppErrorMsgs: ptr ptr ID3DBlob): HRESULT {.stdcall, importc.}
type 
  pD3DCompile* = proc (pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                       pFileName: LPCSTR; pDefines: ptr D3D_SHADER_MACRO; 
                       pInclude: ptr ID3DInclude; pEntrypoint: LPCSTR; 
                       pTarget: LPCSTR; Flags1: UINT; Flags2: UINT; 
                       ppCode: ptr ptr ID3DBlob; ppErrorMsgs: ptr ptr ID3DBlob): HRESULT {.
      stdcall.}

const 
  D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS* = 0x00000001
  D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS* = 0x00000002
  D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH* = 0x00000004

proc D3DCompile2*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; pSourceName: LPCSTR; 
                  pDefines: ptr D3D_SHADER_MACRO; pInclude: ptr ID3DInclude; 
                  pEntrypoint: LPCSTR; pTarget: LPCSTR; Flags1: UINT; 
                  Flags2: UINT; SecondaryDataFlags: UINT; 
                  pSecondaryData: LPCVOID; SecondaryDataSize: SIZE_T; 
                  ppCode: ptr ptr ID3DBlob; ppErrorMsgs: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DCompileFromFile*(pFileName: LPCWSTR; pDefines: ptr D3D_SHADER_MACRO; 
                         pInclude: ptr ID3DInclude; pEntrypoint: LPCSTR; 
                         pTarget: LPCSTR; Flags1: UINT; Flags2: UINT; 
                         ppCode: ptr ptr ID3DBlob; ppErrorMsgs: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DPreprocess*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; pSourceName: LPCSTR; 
                    pDefines: ptr D3D_SHADER_MACRO; pInclude: ptr ID3DInclude; 
                    ppCodeText: ptr ptr ID3DBlob; ppErrorMsgs: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
type 
  pD3DPreprocess* = proc (pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                          pFileName: LPCSTR; pDefines: ptr D3D_SHADER_MACRO; 
                          pInclude: ptr ID3DInclude; 
                          ppCodeText: ptr ptr ID3DBlob; 
                          ppErrorMsgs: ptr ptr ID3DBlob): HRESULT {.stdcall.}

proc D3DGetDebugInfo*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                      ppDebugInfo: ptr ptr ID3DBlob): HRESULT {.stdcall, importc.}
proc D3DReflect*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; pInterface: ptr IID; 
                 ppReflector: ptr pointer): HRESULT {.stdcall, importc.}
proc D3DReflectLibrary*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; riid: ptr IID; 
                        ppReflector: ptr LPVOID): HRESULT {.stdcall, importc.}
#----------------------------------------------------------------------------
# D3DDisassemble:
# ----------------------
# Takes a binary shader and returns a buffer containing text assembly.
#----------------------------------------------------------------------------

const 
  D3D_DISASM_ENABLE_COLOR_CODE* = 0x00000001
  D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS* = 0x00000002
  D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING* = 0x00000004
  D3D_DISASM_ENABLE_INSTRUCTION_CYCLE* = 0x00000008
  D3D_DISASM_DISABLE_DEBUG_INFO* = 0x00000010
  D3D_DISASM_ENABLE_INSTRUCTION_OFFSET* = 0x00000020
  D3D_DISASM_INSTRUCTION_ONLY* = 0x00000040
  D3D_DISASM_PRINT_HEX_LITERALS* = 0x00000080

proc D3DDisassemble*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; Flags: UINT; 
                     szComments: LPCSTR; ppDisassembly: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
type 
  pD3DDisassemble* = proc (pSrcData: LPCVOID; SrcDataSize: SIZE_T; Flags: UINT; 
                           szComments: LPCSTR; ppDisassembly: ptr ptr ID3DBlob): HRESULT {.
      stdcall.}

proc D3DDisassembleRegion*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; Flags: UINT; 
                           szComments: LPCSTR; StartByteOffset: SIZE_T; 
                           NumInsts: SIZE_T; pFinishByteOffset: ptr SIZE_T; 
                           ppDisassembly: ptr ptr ID3DBlob): HRESULT {.stdcall, importc, 
    stdcall, importc.}
proc D3DCreateLinker*(ppLinker: ptr ptr ID3D11Linker): HRESULT {.stdcall, importc, 
    stdcall, importc.}
proc D3DLoadModule*(pSrcData: LPCVOID; cbSrcDataSize: SIZE_T; 
                    ppModule: ptr ptr ID3D11Module): HRESULT {.stdcall, importc.}
proc D3DCreateFunctionLinkingGraph*(uFlags: UINT; ppFunctionLinkingGraph: ptr ptr ID3D11FunctionLinkingGraph): HRESULT {.
    stdcall, importc.}
#----------------------------------------------------------------------------
# D3DGetTraceInstructionOffsets:
# -----------------------
# Determines byte offsets for instructions within a shader blob.
# This information is useful for going between trace instruction
# indices and byte offsets that are used in debug information.
#----------------------------------------------------------------------------

const 
  D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE* = 0x00000001

proc D3DGetTraceInstructionOffsets*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                                    Flags: UINT; StartInstIndex: SIZE_T; 
                                    NumInsts: SIZE_T; pOffsets: ptr SIZE_T; 
                                    pTotalInsts: ptr SIZE_T): HRESULT {.stdcall, importc, 
    stdcall, importc.}
proc D3DGetInputSignatureBlob*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                               ppSignatureBlob: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DGetOutputSignatureBlob*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                                ppSignatureBlob: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DGetInputAndOutputSignatureBlob*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                                        ppSignatureBlob: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
type 
  D3DCOMPILER_STRIP_FLAGS* = enum 
    D3DCOMPILER_STRIP_REFLECTION_DATA = 0x00000001, 
    D3DCOMPILER_STRIP_DEBUG_INFO = 0x00000002, 
    D3DCOMPILER_STRIP_TEST_BLOBS = 0x00000004, 
    D3DCOMPILER_STRIP_PRIVATE_DATA = 0x00000008, 
    D3DCOMPILER_STRIP_ROOT_SIGNATURE = 0x00000010, 
    D3DCOMPILER_STRIP_FORCE_DWORD = 0x7FFFFFFF


proc D3DStripShader*(pShaderBytecode: LPCVOID; BytecodeLength: SIZE_T; 
                     uStripFlags: UINT; ppStrippedBlob: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
type 
  D3D_BLOB_PART* = enum 
    D3D_BLOB_INPUT_SIGNATURE_BLOB, D3D_BLOB_OUTPUT_SIGNATURE_BLOB, 
    D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB, 
    D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB, D3D_BLOB_ALL_SIGNATURE_BLOB, 
    D3D_BLOB_DEBUG_INFO, D3D_BLOB_LEGACY_SHADER, D3D_BLOB_XNA_PREPASS_SHADER, 
    D3D_BLOB_XNA_SHADER, D3D_BLOB_PDB, D3D_BLOB_PRIVATE_DATA, 
    D3D_BLOB_ROOT_SIGNATURE, D3D_BLOB_TEST_ALTERNATE_SHADER = 0x00008000, 
    D3D_BLOB_TEST_COMPILE_DETAILS, D3D_BLOB_TEST_COMPILE_PERF, 
    D3D_BLOB_TEST_COMPILE_REPORT


proc D3DGetBlobPart*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                     Part: D3D_BLOB_PART; Flags: UINT; ppPart: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DSetBlobPart*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                     Part: D3D_BLOB_PART; Flags: UINT; pPart: LPCVOID; 
                     PartSize: SIZE_T; ppNewShader: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DCreateBlob*(Size: SIZE_T; ppBlob: ptr ptr ID3DBlob): HRESULT {.stdcall, importc, 
    stdcall, importc.}
type 
  D3D_SHADER_DATA* = object 
    pBytecode*: LPCVOID
    BytecodeLength*: SIZE_T


const 
  D3D_COMPRESS_SHADER_KEEP_ALL_PARTS* = 0x00000001

proc D3DCompressShaders*(uNumShaders: UINT; pShaderData: ptr D3D_SHADER_DATA; 
                         uFlags: UINT; ppCompressedData: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
proc D3DDecompressShaders*(pSrcData: LPCVOID; SrcDataSize: SIZE_T; 
                           uNumShaders: UINT; uStartIndex: UINT; 
                           pIndices: ptr UINT; uFlags: UINT; 
                           ppShaders: ptr ptr ID3DBlob; pTotalShaders: ptr UINT): HRESULT {.
    stdcall, importc.}
proc D3DDisassemble10Effect*(pEffect: ptr ID3D10Effect; Flags: UINT; 
                             ppDisassembly: ptr ptr ID3DBlob): HRESULT {.
    stdcall, importc.}
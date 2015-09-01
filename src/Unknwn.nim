#Direct3D wrappers by Charlie Barto
#This file is generated from the version of Unknwn.h that ships with Windows 10

{.link: "Uuid.lib"}
import windows
type IID = TIID
type BOOL = WINBOOL
# this ALWAYS GENERATED file contains the definitions for the interfaces 
# File created by MIDL compiler version 8.00.0613 
# @@MIDL_FILE_HEADING(  ) 
# verify that the <rpcndr.h> version is high enough to compile this file
# verify that the <rpcsal.h> version is high enough to compile this file

# Forward Declarations 


# header files for imported files 
# interface __MIDL_itf_unknwnbase_0000_0000 
# [local] 
#+-------------------------------------------------------------------------
#
#  Microsoft Windows
#  Copyright (c) Microsoft Corporation. All rights reserved.
#
#--------------------------------------------------------------------------



# interface IUnknown 
# [unique][uuid][object][local] 



#////////////////////////////////////////////////////////////////
# IID_IUnknown and all other system IIDs are provided in UUID.LIB
# Link that library in with your proxies, clients and servers
#////////////////////////////////////////////////////////////////

var IID_IUnknown* {.importc.}: IID

type 
  IUnknownVtbl* = object 
    QueryInterface*: proc (This: ptr IUnknown; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IUnknown): ULONG {.stdcall.}
    Release*: proc (This: ptr IUnknown): ULONG {.stdcall.}

  IUnknown* = object 
    lpVtbl*: ptr IUnknownVtbl

type                          # [unique] 
  LPUNKNOWN* = ptr IUnknown

discard """
proc IUnknown_QueryInterface_Proxy*(This: ptr IUnknown; riid: ptr IID; 
                                    ppvObject: ptr pointer): HRESULT {.stdcall, importc.}
  # [in] 
  # [annotation][iid_is][out] 
proc IUnknown_QueryInterface_Stub*(This: ptr IRpcStubBuffer; 
                                   pRpcChannelBuffer: ptr IRpcChannelBuffer; 
                                   pRpcMessage: PRPC_MESSAGE; 
                                   pdwStubPhase: ptr DWORD) {.stdcall, importc.}
proc IUnknown_AddRef_Proxy*(This: ptr IUnknown): ULONG {.stdcall, importc.}
proc IUnknown_AddRef_Stub*(This: ptr IRpcStubBuffer; 
                           pRpcChannelBuffer: ptr IRpcChannelBuffer; 
                           pRpcMessage: PRPC_MESSAGE; _pdwStubPhase: ptr DWORD) {.
    stdcall, importc.}
proc IUnknown_Release_Proxy*(This: ptr IUnknown): ULONG {.stdcall, importc.}
proc IUnknown_Release_Stub*(This: ptr IRpcStubBuffer; 
                            pRpcChannelBuffer: ptr IRpcChannelBuffer; 
                            pRpcMessage: PRPC_MESSAGE; pdwStubPhase: ptr DWORD) {.
    stdcall, importc.}

"""
# interface __MIDL_itf_unknwnbase_0000_0001 
# [local] 

# interface AsyncIUnknown 
# [unique][uuid][object][local] 

var IID_AsyncIUnknown* {.importc.}: IID

type 
  AsyncIUnknownVtbl* = object 
    QueryInterface*: proc (This: ptr AsyncIUnknown; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr AsyncIUnknown): ULONG {.stdcall.}
    Release*: proc (This: ptr AsyncIUnknown): ULONG {.stdcall.}
    Begin_QueryInterface*: proc (This: ptr AsyncIUnknown; riid: ptr IID): HRESULT {.
        stdcall.}             # [in] 
    Finish_QueryInterface*: proc (This: ptr AsyncIUnknown; 
                                  ppvObject: ptr pointer): HRESULT {.stdcall.} # 
                                                                               # [annotation][out] 
    Begin_AddRef*: proc (This: ptr AsyncIUnknown): HRESULT {.stdcall.}
    Finish_AddRef*: proc (This: ptr AsyncIUnknown): ULONG {.stdcall.}
    Begin_Release*: proc (This: ptr AsyncIUnknown): HRESULT {.stdcall.}
    Finish_Release*: proc (This: ptr AsyncIUnknown): ULONG {.stdcall.}

  AsyncIUnknown* = object 
    lpVtbl*: ptr AsyncIUnknownVtbl


# interface __MIDL_itf_unknwnbase_0000_0002 
# [local] 

# interface IClassFactory 
# [unique][uuid][object] 



var IID_IClassFactory* {.importc.}: IID

type 
  IClassFactoryVtbl* = object 
    QueryInterface*: proc (This: ptr IClassFactory; riid: ptr IID; 
                           ppvObject: ptr pointer): HRESULT {.stdcall.} # [in] 
                                                                        # 
                                                                        # [annotation][iid_is][out] 
    AddRef*: proc (This: ptr IClassFactory): ULONG {.stdcall.}
    Release*: proc (This: ptr IClassFactory): ULONG {.stdcall.} # [local] 
    CreateInstance*: proc (This: ptr IClassFactory; pUnkOuter: ptr IUnknown; 
                           riid: ptr IID; ppvObject: ptr pointer): HRESULT {.
        stdcall.}             # [local] 
    # [annotation][unique][in] 
    # [annotation][in] 
    # [annotation][iid_is][out] 
    LockServer*: proc (This: ptr IClassFactory; fLock: BOOL): HRESULT {.stdcall.} # 
                                                                                  # [in] 
  
  IClassFactory* = object 
    lpVtbl*: ptr IClassFactoryVtbl

type                          # [unique] 
  LPCLASSFACTORY* = ptr IClassFactory
# [call_as] 
discard """
proc IClassFactory_RemoteCreateInstance_Proxy*(This: ptr IClassFactory; 
    riid: ptr IID; ppvObject: ptr ptr IUnknown): HRESULT {.stdcall, importc.}
  # [in] 
  # [iid_is][out] 
proc IClassFactory_RemoteCreateInstance_Stub*(This: ptr IRpcStubBuffer; 
    pRpcChannelBuffer: ptr IRpcChannelBuffer; pRpcMessage: PRPC_MESSAGE; 
    pdwStubPhase: ptr DWORD) {.stdcall, importc.}
# [call_as] 

proc IClassFactory_RemoteLockServer_Proxy*(This: ptr IClassFactory; fLock: BOOL): HRESULT {.
    stdcall, importc.}
  # [in] 
proc IClassFactory_RemoteLockServer_Stub*(This: ptr IRpcStubBuffer; 
    pRpcChannelBuffer: ptr IRpcChannelBuffer; pRpcMessage: PRPC_MESSAGE; 
    pdwStubPhase: ptr DWORD) {.stdcall, importc.}
# interface __MIDL_itf_unknwnbase_0000_0003 
# [local] 

# Additional Prototypes for ALL interfaces 
# [local] 

proc IClassFactory_CreateInstance_Proxy*(This: ptr IClassFactory; 
    pUnkOuter: ptr IUnknown; riid: ptr IID; ppvObject: ptr pointer): HRESULT {.
    stdcall, importc.}
  # [annotation][unique][in] 
  # [annotation][in] 
  # [annotation][iid_is][out] 
# [call_as] 

proc IClassFactory_CreateInstance_Stub*(This: ptr IClassFactory; riid: ptr IID; 
                                        ppvObject: ptr ptr IUnknown): HRESULT {.
    stdcall, importc.}
  # [in] 
  # [iid_is][out] 
# [local] 

proc IClassFactory_LockServer_Proxy*(This: ptr IClassFactory; fLock: BOOL): HRESULT {.
    stdcall, importc.}
  # [in] 
# [call_as] 

proc IClassFactory_LockServer_Stub*(This: ptr IClassFactory; fLock: BOOL): HRESULT {.
    stdcall, importc.}
  # [in] 
# end of Additional Prototypes 
"""

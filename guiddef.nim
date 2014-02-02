
type GUID = object
  Data1: culong
  Data2: cushort
  Data3: cushort
  Data4: array[0..7, cuchar]

type LPGUID = ptr GUID

type IID = GUID
type LPIID = ptr IID

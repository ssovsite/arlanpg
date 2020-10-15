object DataModuleDB: TDataModuleDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 294
  Width = 295
  object FDConnectionPG: TFDConnection
    Params.Strings = (
      'Database=arlandbpg'
      'User_Name=postgres'
      'Password=qAJ2mMc6eShh'
      'Server=127.0.0.1'
      'DriverID=PG')
    LoginPrompt = False
    Transaction = FDTransactionPG
    Left = 40
    Top = 16
  end
  object FDQueryDef: TFDQuery
    Connection = FDConnectionPG
    Transaction = FDTransactionPG
    Left = 40
    Top = 72
  end
  object FDTransactionPG: TFDTransaction
    Connection = FDConnectionPG
    Left = 40
    Top = 128
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorHome = 'D:\Develop\GITRep\Delphi\ArlanPG\_ArlanPG\Win32\Debug\pglib'
    VendorLib = 'libpq.dll'
    Left = 152
    Top = 16
  end
end

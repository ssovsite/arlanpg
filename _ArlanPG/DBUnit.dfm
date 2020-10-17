object DataModuleDB: TDataModuleDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 294
  Width = 295
  object FDConnectionPG: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=PG')
    LoginPrompt = False
    Transaction = FDTransactionPG
    Left = 40
    Top = 16
  end
  object FDQueryDef: TFDQuery
    Connection = FDConnectionPG
    Transaction = FDTransactionPG
    SQL.Strings = (
      'select * from personlist where personid=:p1')
    Left = 40
    Top = 72
    ParamData = <
      item
        Name = 'P1'
        ParamType = ptInput
      end>
  end
  object FDTransactionPG: TFDTransaction
    Connection = FDConnectionPG
    Left = 40
    Top = 128
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorLib = 'libpq.dll'
    Left = 152
    Top = 16
  end
end

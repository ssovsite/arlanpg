object FormSettings: TFormSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 289
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
  end
  object Button2: TButton
    Left = 370
    Top = 256
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 437
    Height = 233
    DataSource = DataSourceSettings
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI Semibold'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Level1Caption'
        Title.Alignment = taCenter
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Value'
        Title.Alignment = taCenter
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Segoe UI Semibold'
        Title.Font.Style = [fsBold]
        Width = 253
        Visible = True
      end>
  end
  object MTSettings: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 312
    Top = 72
    object MTSettingsLevel0: TStringField
      FieldName = 'Level0'
      Size = 64
    end
    object MTSettingsLevelOCaption: TStringField
      FieldName = 'LevelOCaption'
      Size = 64
    end
    object MTSettingsLevel1: TStringField
      FieldName = 'Level1'
      Size = 64
    end
    object MTSettingsLevel1Caption: TStringField
      FieldName = 'Level1Caption'
      Size = 64
    end
    object MTSettingsValueType: TStringField
      FieldName = 'ValueType'
      Size = 16
    end
    object MTSettingsValue: TStringField
      FieldName = 'Value'
      Size = 1024
    end
  end
  object DataSourceSettings: TDataSource
    DataSet = MTSettings
    Left = 312
    Top = 128
  end
end

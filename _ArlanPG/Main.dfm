object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = '24-14-10-10'
  ClientHeight = 572
  ClientWidth = 1029
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  Menu = MainMenuBase
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 540
    Width = 1029
    Height = 32
    Align = alBottom
    Alignment = taLeftJustify
    Caption = ' '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100': '
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1029
    Height = 540
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 186
      Top = 1
      Width = 4
      Height = 538
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 538
      Align = alLeft
      BorderStyle = bsSingle
      Caption = 'Panel4'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 1
        Top = 23
        Width = 179
        Height = 510
        Align = alClient
        DataSource = DataSource1
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
        OnDblClick = DBGrid1DblClick
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 179
        Height = 22
        Align = alTop
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 190
      Top = 1
      Width = 838
      Height = 538
      Align = alClient
      BorderStyle = bsSingle
      Caption = 'Panel3'
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 1
        Top = 23
        Width = 832
        Height = 510
        Align = alClient
        DataSource = DataSource2
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI Semibold'
        TitleFont.Style = [fsBold]
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 832
        Height = 22
        Align = alTop
        Caption = 'Panel5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object MainMenuBase: TMainMenu
    Left = 184
    Top = 72
    object Arlan1: TMenuItem
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      object MainMenuKatalog: TMenuItem
        Caption = #1056#1072#1079#1076#1077#1083#1099
        OnClick = MainMenuKatalogClick
      end
      object MainMenuDocuments: TMenuItem
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
        object N1: TMenuItem
          Caption = #1057#1086#1079#1076#1072#1090#1100
          OnClick = N1Click
        end
        object N7: TMenuItem
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        end
        object N12: TMenuItem
          Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077
        end
      end
      object MainMenuAppLogin: TMenuItem
        Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
        OnClick = MainMenuAppLoginClick
      end
      object MainMenuAppSettings: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072'...'
        OnClick = MainMenuAppSettingsClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object MainMenuItemDir: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N8: TMenuItem
        Caption = #1050#1088#1077#1076#1080#1090#1085#1099#1077' '#1086#1088#1075'.'
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1050#1083#1080#1077#1085#1090#1099
      end
      object N10: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
      end
      object N11: TMenuItem
        Caption = #1057#1091#1076#1077#1073#1085#1099#1077' '#1091#1095#1072#1089#1090#1082#1080
      end
      object N13: TMenuItem
        Caption = #1064#1072#1073#1083#1086#1085#1099
        OnClick = N13Click
      end
    end
    object N4: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N5: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
      end
      object N6: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 88
    Top = 184
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable2
    Left = 472
    Top = 184
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 248
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 472
    Top = 248
  end
end

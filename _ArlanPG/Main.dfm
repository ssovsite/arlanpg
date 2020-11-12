object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Ar-lan '#1089#1080#1089#1090#1077#1084#1072' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
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
        Height = 305
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
        OnCellClick = DBGrid2CellClick
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
      object Panel7: TPanel
        Left = 1
        Top = 328
        Width = 832
        Height = 205
        Align = alBottom
        Caption = 'Panel7'
        TabOrder = 2
        Visible = False
        object DBGrid3: TDBGrid
          Left = 1
          Top = 1
          Width = 726
          Height = 203
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DataSource3
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI Semibold'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'paramcaption'
              Title.Alignment = taCenter
              Title.Caption = #1087#1072#1088#1072#1084#1077#1090#1088
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 206
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'paramvalue'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI Semibold'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 419
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 728
          Top = 1
          Width = 103
          Height = 203
          Align = alRight
          TabOrder = 1
          object Button1: TButton
            Left = 5
            Top = 120
            Width = 92
            Height = 25
            Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 5
            Top = 168
            Width = 92
            Height = 25
            Caption = #1086#1090#1084#1077#1085#1072
            TabOrder = 1
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 5
            Top = 5
            Width = 92
            Height = 25
            Caption = #1080#1079#1084#1077#1085#1080#1090#1100
            TabOrder = 2
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 5
            Top = 36
            Width = 92
            Height = 25
            Caption = #1086#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 3
            Visible = False
          end
        end
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
          OnClick = N7Click
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
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1057#1091#1076#1077#1073#1085#1099#1077' '#1091#1095#1072#1089#1090#1082#1080
      end
      object N13: TMenuItem
        Caption = #1064#1072#1073#1083#1086#1085#1099
        OnClick = N13Click
      end
    end
    object MainMenuItemReport: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100
      object N15: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      end
      object N16: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
      end
      object N17: TMenuItem
        Caption = #1054#1073#1097#1072#1103' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072
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
    OnDataChange = DataSource2DataChange
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
  object DataSource3: TDataSource
    DataSet = MTParams
    Left = 479
    Top = 377
  end
  object FDMemTable3: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 479
    Top = 433
  end
  object MTParams: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 575
    Top = 433
    object MTParamsparamid: TIntegerField
      FieldName = 'paramid'
    end
    object MTParamsparamcaption: TStringField
      FieldName = 'paramcaption'
      Size = 64
    end
    object MTParamsparamvalue: TStringField
      FieldName = 'paramvalue'
      Size = 1024
    end
    object MTParamsparamname: TStringField
      FieldName = 'paramname'
      Size = 64
    end
    object MTParamsparamtype: TStringField
      FieldName = 'paramtype'
      Size = 16
    end
  end
end

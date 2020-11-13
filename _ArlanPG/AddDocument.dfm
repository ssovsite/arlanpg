object FormAddDocument: TFormAddDocument
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 496
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 129
    Height = 20
    AutoSize = False
    Caption = #1074#1099#1073#1088#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 103
    Top = 468
    Width = 399
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 9
    Top = 71
    Width = 129
    Height = 20
    AutoSize = False
    Caption = #1082#1083#1080#1077#1085#1090' -> '#1080#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 9
    Top = 125
    Width = 129
    Height = 20
    AutoSize = False
    Caption = #1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 9
    Top = 99
    Width = 129
    Height = 20
    AutoSize = False
    Caption = #1082#1083#1080#1077#1085#1090' -> '#1048#1053#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 576
    Top = 11
    Width = 23
    Height = 22
    Caption = #10003
    Visible = False
  end
  object SpeedButton2: TSpeedButton
    Left = 577
    Top = 71
    Width = 23
    Height = 22
    Caption = #10003
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 577
    Top = 123
    Width = 23
    Height = 22
    Caption = #10003
    OnClick = SpeedButton3Click
  end
  object Label6: TLabel
    Left = 9
    Top = 42
    Width = 129
    Height = 20
    AutoSize = False
    Caption = #1082#1086#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 576
    Top = 42
    Width = 23
    Height = 22
    Caption = #10003
    OnClick = SpeedButton4Click
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 12
    Width = 447
    Height = 21
    TabOrder = 0
    Text = 'ComboBox1'
    OnSelect = ComboBox1Select
  end
  object Button1: TButton
    Left = 8
    Top = 463
    Width = 89
    Height = 25
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 508
    Top = 463
    Width = 91
    Height = 25
    Caption = #1086#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 160
    Width = 591
    Height = 289
    DataSource = DataSourceParamDoc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'paramcaption'
        Title.Alignment = taCenter
        Title.Caption = #1087#1072#1088#1072#1084#1077#1090#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'paramvalue'
        Title.Alignment = taCenter
        Title.Caption = #1079#1085#1072#1095#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 393
        Visible = True
      end>
  end
  object ComboBox2: TComboBox
    Left = 153
    Top = 71
    Width = 408
    Height = 21
    TabOrder = 4
    Text = 'ComboBox1'
  end
  object Edit1: TEdit
    Left = 153
    Top = 98
    Width = 163
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    OnChange = Edit1Change
  end
  object ComboBox3: TComboBox
    Left = 152
    Top = 125
    Width = 410
    Height = 21
    TabOrder = 6
    Text = 'ComboBox1'
  end
  object ComboBox4: TComboBox
    Left = 153
    Top = 42
    Width = 408
    Height = 21
    TabOrder = 7
    Text = 'ComboBox1'
  end
  object DataSourceParamDoc: TDataSource
    DataSet = MTParamsDoc
    Left = 160
    Top = 264
  end
  object MTParamsDoc: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 328
    object MTParamsDocparamname: TStringField
      FieldName = 'paramname'
      Size = 32
    end
    object MTParamsDocparancaption: TStringField
      FieldName = 'paramcaption'
      Size = 64
    end
    object MTParamsDocparamtype: TStringField
      FieldName = 'paramtype'
      Size = 16
    end
    object MTParamsDocparamvalue: TStringField
      FieldName = 'paramvalue'
      Size = 1024
    end
    object MTParamsDocparamcriticall: TIntegerField
      FieldName = 'paramcriticall'
    end
  end
end

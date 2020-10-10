object FormLogin: TFormLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1084#1103' '#1080' '#1074#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  ClientHeight = 164
  ClientWidth = 286
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 270
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1080#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label2: TLabel
    Left = 8
    Top = 69
    Width = 270
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1087#1072#1088#1086#1083#1100
  end
  object Button1: TButton
    Left = 8
    Top = 131
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 203
    Top = 131
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 27
    Width = 270
    Height = 21
    TabOrder = 2
    Text = 'ComboBox1'
  end
  object Edit1: TEdit
    Left = 8
    Top = 88
    Width = 270
    Height = 21
    Alignment = taCenter
    PasswordChar = '#'
    TabOrder = 3
    Text = 'Edit1'
  end
end

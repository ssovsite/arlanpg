object FormEditBlock: TFormEditBlock
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
  ClientHeight = 171
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    384
    171)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 368
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 368
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 54
    Width = 368
    Height = 21
    TabOrder = 1
    Text = 'ComboBox1'
    Visible = False
  end
  object Button1: TButton
    Left = 8
    Top = 138
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1074#1086#1076
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 301
    Top = 138
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 74
    Width = 368
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
    Visible = False
  end
  object Button3: TButton
    Left = 312
    Top = 27
    Width = 64
    Height = 21
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 5
    Visible = False
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 168
    Top = 88
  end
end

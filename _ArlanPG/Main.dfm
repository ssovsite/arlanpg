object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = '24-14-10-10'
  ClientHeight = 496
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI Semibold'
  Font.Style = []
  Menu = MainMenuBase
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenuBase: TMainMenu
    Left = 184
    Top = 72
    object Arlan1: TMenuItem
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
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
end

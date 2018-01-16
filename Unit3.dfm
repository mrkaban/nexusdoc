object Form_Redakt_keys: TForm_Redakt_keys
  Left = 478
  Top = 156
  Width = 850
  Height = 534
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1056#1082#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1083#1102#1095#1077#1081' '#1079#1072#1084#1077#1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 40
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 296
      Height = 21
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1083#1102#1095' '#1076#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Keys: TComboBox
      Left = 312
      Top = 11
      Width = 490
      Height = 29
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ItemHeight = 21
      ParentFont = False
      TabOrder = 0
      OnChange = KeysChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 40
    Width = 834
    Height = 40
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 11
      Width = 49
      Height = 21
      Caption = #1050#1083#1102#1095':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Key_Label: TLabel
      Left = 152
      Top = 11
      Width = 5
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 80
    Width = 834
    Height = 40
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 11
      Width = 120
      Height = 21
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Naim_Edit: TEdit
      Left = 152
      Top = 3
      Width = 660
      Height = 29
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 120
    Width = 834
    Height = 40
    Align = alTop
    TabOrder = 3
    object Label5: TLabel
      Left = 16
      Top = 11
      Width = 457
      Height = 21
      Caption = #1054#1090#1088#1077#1076#1072#1082#1090#1080#1088#1091#1081#1090#1077' '#1074#1072#1088#1080#1072#1085#1090#1099' ('#1082#1072#1078#1076#1099#1081' '#1074' '#1086#1090#1076#1077#1083#1100#1085#1086#1081' '#1089#1090#1088#1086#1082#1077'):'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 160
    Width = 834
    Height = 336
    Align = alClient
    TabOrder = 4
    object Primer: TMemo
      Left = 1
      Top = 1
      Width = 832
      Height = 293
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 1
      Top = 294
      Width = 832
      Height = 41
      Align = alBottom
      TabOrder = 1
      object Button1: TButton
        Left = 312
        Top = 8
        Width = 209
        Height = 25
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
end

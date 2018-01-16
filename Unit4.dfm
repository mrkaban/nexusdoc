object Form_New_Key: TForm_New_Key
  Left = 485
  Top = 50
  Width = 839
  Height = 434
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1082#1083#1102#1095#1072' '#1079#1072#1084#1077#1085
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
    Width = 823
    Height = 40
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 12
      Width = 333
      Height = 21
      Alignment = taCenter
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1073#1072#1074#1083#1103#1077#1084#1086#1075#1086' '#1082#1083#1102#1095#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 40
    Width = 823
    Height = 40
    Align = alTop
    TabOrder = 2
    object Key_Label: TLabel
      Left = 168
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
    object Label2: TLabel
      Left = 32
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 80
    Width = 823
    Height = 40
    Align = alTop
    TabOrder = 3
    object Label4: TLabel
      Left = 8
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
      Left = 144
      Top = 3
      Width = 657
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
    Width = 823
    Height = 25
    Align = alTop
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 3
      Width = 392
      Height = 21
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090#1099' ('#1082#1072#1078#1076#1099#1081' '#1074' '#1086#1090#1076#1077#1083#1100#1085#1086#1081' '#1089#1090#1088#1086#1082#1077'):'
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
    Top = 352
    Width = 823
    Height = 44
    Align = alBottom
    TabOrder = 5
    object Button1: TButton
      Left = 312
      Top = 13
      Width = 209
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
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
  object Primer: TMemo
    Left = 0
    Top = 145
    Width = 823
    Height = 207
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
end

object Form_Zamens: TForm_Zamens
  Left = 363
  Top = 276
  Width = 850
  Height = 400
  Caption = #1047#1072#1084#1077#1085#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 226
      Height = 21
      Alignment = taCenter
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1084#1077#1085
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
    Top = 322
    Width = 834
    Height = 40
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 352
      Top = 7
      Width = 209
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1084#1077#1085#1099
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
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 65
    Width = 834
    Height = 257
    Align = alClient
    TabOrder = 2
  end
end

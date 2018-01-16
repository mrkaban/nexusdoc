object Form_Table: TForm_Table
  Left = 188
  Top = 142
  Width = 1068
  Height = 549
  Caption = #1042#1089#1090#1072#1074#1082#1072' '#1090#1072#1073#1083#1080#1094#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1052
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 223
      Height = 21
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082' '#1090#1072#1073#1083#1080#1094#1099':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 252
      Height = 21
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074' '#1090#1072#1073#1083#1080#1094#1099':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Kol_strok: TEdit
      Left = 296
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '2'
      OnChange = Kol_strokChange
    end
    object UpDown1: TUpDown
      Left = 417
      Top = 12
      Width = 16
      Height = 21
      Associate = Kol_strok
      Min = 1
      Position = 2
      TabOrder = 1
    end
    object Kol_stolb: TEdit
      Left = 296
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '2'
      OnChange = Kol_stolbChange
    end
    object UpDown2: TUpDown
      Left = 417
      Top = 44
      Width = 16
      Height = 21
      Associate = Kol_stolb
      Min = 1
      Position = 2
      TabOrder = 3
    end
  end
  object StringGrid: TStringGrid
    Left = 0
    Top = 81
    Width = 1052
    Height = 120
    Align = alTop
    ColCount = 2
    DefaultColWidth = 500
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 1052
    Height = 40
    Align = alTop
    TabOrder = 2
    object Button1: TButton
      Left = 400
      Top = 7
      Width = 209
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
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
  object Panel3: TPanel
    Left = 0
    Top = 471
    Width = 1052
    Height = 40
    Align = alBottom
    TabOrder = 3
    object Button2: TButton
      Left = 400
      Top = 7
      Width = 209
      Height = 25
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object Table: TRichEdit
    Left = 0
    Top = 241
    Width = 1052
    Height = 230
    Align = alClient
    TabOrder = 4
  end
end

object Form_Save_Dir: TForm_Save_Dir
  Left = 311
  Top = 164
  Width = 605
  Height = 518
  Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1072#1083#1086#1075#1072' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 81
    Width = 589
    Height = 358
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 40
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 24
      Top = 11
      Width = 126
      Height = 21
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1080#1089#1082':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object DriveComboBox1: TDriveComboBox
      Left = 168
      Top = 5
      Width = 145
      Height = 27
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = DriveComboBox1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 40
    Width = 589
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 148
      Height = 21
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1072#1090#1072#1083#1086#1075':'
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
    Top = 439
    Width = 589
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Button2: TButton
      Left = 175
      Top = 8
      Width = 225
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
  end
end

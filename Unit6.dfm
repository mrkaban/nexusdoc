object Form_Add_Shablon: TForm_Add_Shablon
  Left = 397
  Top = 245
  Width = 800
  Height = 600
  BorderIcons = [biSystemMenu]
  Caption = #1042#1099#1073#1086#1088' '#1096#1072#1073#1083#1086#1085#1086#1074' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -19
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 21
  object Vibr_files: TListBox
    Left = 88
    Top = 361
    Width = 696
    Height = 161
    Align = alRight
    ItemHeight = 21
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 40
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 32
      Top = 12
      Width = 126
      Height = 21
      Hint = '\'
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
      Top = 6
      Width = 145
      Height = 27
      TabOrder = 0
      OnChange = DriveComboBox1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 40
    Width = 784
    Height = 40
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 48
      Top = 11
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
    object Label2: TLabel
      Left = 488
      Top = 11
      Width = 201
      Height = 21
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1096#1072#1073#1083#1086#1085#1072':'
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
    Width = 784
    Height = 209
    Align = alTop
    TabOrder = 3
    object DirectoryListBox1: TDirectoryListBox
      Left = 1
      Top = 1
      Width = 465
      Height = 207
      Align = alLeft
      FileList = FileListBox1
      ItemHeight = 21
      TabOrder = 0
      OnChange = DirectoryListBox1Change
    end
    object FileListBox1: TFileListBox
      Left = 466
      Top = 1
      Width = 317
      Height = 207
      Align = alClient
      ItemHeight = 21
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 289
    Width = 784
    Height = 72
    Align = alTop
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 3
      Width = 101
      Height = 21
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1052#1041':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 43
      Width = 27
      Height = 21
      Caption = #1052#1041
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 119
      Top = 39
      Width = 225
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 383
      Top = 39
      Width = 266
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1081' '#1096#1072#1073#1083#1086#1085
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object MBEdit: TEdit
      Left = 112
      Top = 0
      Width = 121
      Height = 29
      TabOrder = 2
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 522
    Width = 784
    Height = 40
    Align = alBottom
    TabOrder = 5
    object Button3: TButton
      Left = 287
      Top = 7
      Width = 225
      Height = 25
      Caption = #1053#1072#1095#1072#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object Vibr_MB: TListBox
    Left = 0
    Top = 361
    Width = 88
    Height = 161
    Align = alClient
    ItemHeight = 21
    TabOrder = 6
  end
end

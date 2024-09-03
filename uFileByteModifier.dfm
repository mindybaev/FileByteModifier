object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1092#1072#1081#1083#1072' '#1087#1088#1086#1096#1080#1074#1082#1080
  ClientHeight = 585
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object lblSelectedFile: TLabel
    Left = 8
    Top = 39
    Width = 98
    Height = 15
    Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1092#1072#1081#1083
  end
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 75
    Height = 15
    Caption = 'ID '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
  end
  object Label2: TLabel
    Left = 191
    Top = 492
    Width = 12
    Height = 15
    Caption = #1086#1090
  end
  object Label3: TLabel
    Left = 256
    Top = 492
    Width = 13
    Height = 15
    Caption = #1076#1086
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 89
    Width = 161
    Height = 345
    ActivePage = TabSheet1
    TabOrder = 26
    object TabSheet1: TTabSheet
      Caption = '                               '
    end
  end
  object btnSelectFile: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1081' '#1092#1072#1081#1083
    TabOrder = 0
    OnClick = btnSelectFileClick
  end
  object btnChangeByte: TButton
    Left = 8
    Top = 445
    Width = 145
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1092#1072#1081#1083' '
    TabOrder = 1
    OnClick = btnChangeByteClick
  end
  object edtNewByte: TEdit
    Left = 95
    Top = 60
    Width = 40
    Height = 23
    TabOrder = 2
    OnChange = edtNewByteChange
    OnKeyPress = edtNewByteKeyPress
  end
  object btnCreateFilesInRange: TButton
    Left = 8
    Top = 488
    Width = 177
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1092#1072#1081#1083#1099' '#1074' '#1076#1080#1072#1087#1072#1079#1086#1085#1077' ID'
    TabOrder = 3
    OnClick = btnCreateFilesInRangeClick
  end
  object edtStartID: TEdit
    Left = 209
    Top = 489
    Width = 41
    Height = 23
    TabOrder = 4
    Text = '0'
  end
  object edtEndID: TEdit
    Left = 275
    Top = 489
    Width = 38
    Height = 23
    TabOrder = 5
    Text = '0'
  end
  object SpinEdit1: TSpinEdit
    Left = 101
    Top = 120
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 6
    Value = 37
  end
  object SpinEdit2: TSpinEdit
    Left = 101
    Top = 150
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 7
    Value = 37
  end
  object SpinEdit3: TSpinEdit
    Left = 101
    Top = 180
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 8
    Value = 37
  end
  object SpinEdit4: TSpinEdit
    Left = 101
    Top = 210
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 9
    Value = 37
  end
  object SpinEdit5: TSpinEdit
    Left = 101
    Top = 240
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 10
    Value = 37
  end
  object SpinEdit6: TSpinEdit
    Left = 101
    Top = 270
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 11
    Value = 37
  end
  object SpinEdit7: TSpinEdit
    Left = 101
    Top = 300
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 12
    Value = 37
  end
  object SpinEdit8: TSpinEdit
    Left = 101
    Top = 330
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 13
    Value = 37
  end
  object SpinEdit9: TSpinEdit
    Left = 101
    Top = 360
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 14
    Value = 37
  end
  object CheckBox1: TCheckBox
    Left = 26
    Top = 123
    Width = 57
    Height = 17
    TabOrder = 15
  end
  object CheckBox2: TCheckBox
    Left = 26
    Top = 154
    Width = 57
    Height = 17
    TabOrder = 16
  end
  object CheckBox3: TCheckBox
    Left = 26
    Top = 183
    Width = 57
    Height = 17
    TabOrder = 17
  end
  object CheckBox4: TCheckBox
    Left = 26
    Top = 213
    Width = 57
    Height = 17
    TabOrder = 18
  end
  object CheckBox5: TCheckBox
    Left = 26
    Top = 243
    Width = 57
    Height = 17
    TabOrder = 19
  end
  object CheckBox6: TCheckBox
    Left = 26
    Top = 273
    Width = 57
    Height = 17
    TabOrder = 20
  end
  object CheckBox7: TCheckBox
    Left = 26
    Top = 303
    Width = 57
    Height = 17
    TabOrder = 21
  end
  object CheckBox8: TCheckBox
    Left = 26
    Top = 333
    Width = 57
    Height = 17
    TabOrder = 22
  end
  object CheckBox9: TCheckBox
    Left = 26
    Top = 363
    Width = 57
    Height = 17
    TabOrder = 23
  end
  object CheckBox10: TCheckBox
    Left = 26
    Top = 393
    Width = 57
    Height = 17
    TabOrder = 24
  end
  object SpinEdit10: TSpinEdit
    Left = 101
    Top = 390
    Width = 42
    Height = 24
    MaxValue = 48
    MinValue = 37
    TabOrder = 25
    Value = 37
  end
  object CheckBoxActive: TCheckBox
    Left = 17
    Top = 92
    Width = 89
    Height = 17
    TabOrder = 27
    OnClick = CheckBoxActiveClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 519
    Width = 684
    Height = 66
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 28
  end
  object OpenDialog: TOpenDialog
    Filter = '*.bin'
    Left = 176
    Top = 8
  end
end

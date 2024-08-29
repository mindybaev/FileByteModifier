object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' ID'
  ClientHeight = 516
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
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
    Left = 8
    Top = 104
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 6
    Value = 0
  end
  object SpinEdit2: TSpinEdit
    Left = 63
    Top = 104
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 0
  end
  object SpinEdit3: TSpinEdit
    Left = 8
    Top = 134
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 0
  end
  object SpinEdit4: TSpinEdit
    Left = 63
    Top = 134
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 9
    Value = 0
  end
  object SpinEdit5: TSpinEdit
    Left = 8
    Top = 164
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 10
    Value = 0
  end
  object SpinEdit6: TSpinEdit
    Left = 63
    Top = 164
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 11
    Value = 0
  end
  object SpinEdit7: TSpinEdit
    Left = 8
    Top = 194
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 12
    Value = 0
  end
  object SpinEdit8: TSpinEdit
    Left = 63
    Top = 194
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 13
    Value = 0
  end
  object SpinEdit9: TSpinEdit
    Left = 8
    Top = 224
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 14
    Value = 0
  end
  object SpinEdit10: TSpinEdit
    Left = 63
    Top = 224
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 15
    Value = 0
  end
  object SpinEdit11: TSpinEdit
    Left = 8
    Top = 254
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 16
    Value = 0
  end
  object SpinEdit12: TSpinEdit
    Left = 63
    Top = 254
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 17
    Value = 0
  end
  object SpinEdit13: TSpinEdit
    Left = 8
    Top = 284
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 18
    Value = 0
  end
  object SpinEdit14: TSpinEdit
    Left = 63
    Top = 284
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 19
    Value = 0
  end
  object SpinEdit15: TSpinEdit
    Left = 8
    Top = 314
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 20
    Value = 0
  end
  object SpinEdit16: TSpinEdit
    Left = 63
    Top = 314
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 21
    Value = 0
  end
  object SpinEdit17: TSpinEdit
    Left = 8
    Top = 344
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 22
    Value = 0
  end
  object SpinEdit18: TSpinEdit
    Left = 63
    Top = 344
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 23
    Value = 0
  end
  object SpinEdit19: TSpinEdit
    Left = 8
    Top = 374
    Width = 41
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 24
    Value = 0
  end
  object SpinEdit20: TSpinEdit
    Left = 63
    Top = 374
    Width = 42
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 25
    Value = 0
  end
  object OpenDialog: TOpenDialog
    Filter = '*.bin'
    Left = 176
    Top = 8
  end
end

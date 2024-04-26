object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 150
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 79
    Top = 66
    Width = 281
    Height = 17
    Align = alCustom
    Caption = 'Servidor iTechGamer Online na porta : '
  end
  object ToggleSwitch1: TToggleSwitch
    Left = 79
    Top = 104
    Width = 73
    Height = 20
    TabOrder = 0
    OnClick = ToggleSwitch1Click
  end
end

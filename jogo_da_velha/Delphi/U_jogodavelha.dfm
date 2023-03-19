object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 23
  object lb_linha: TLabel
    Left = 38
    Top = 35
    Width = 57
    Height = 23
    Caption = 'Linha:'
  end
  object lb_coluna: TLabel
    Left = 38
    Top = 80
    Width = 72
    Height = 23
    Caption = 'Coluna:'
  end
  object lb_player: TLabel
    Left = 280
    Top = 19
    Width = 85
    Height = 23
    Caption = 'Jogador1'
  end
  object txt_linha: TEdit
    Left = 108
    Top = 32
    Width = 65
    Height = 31
    TabOrder = 0
  end
  object txt_coluna: TEdit
    Left = 124
    Top = 77
    Width = 65
    Height = 31
    TabOrder = 1
  end
  object bt_enviar: TButton
    Left = 80
    Top = 136
    Width = 85
    Height = 33
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = bt_enviarClick
  end
  object ListBox1: TListBox
    Left = 256
    Top = 48
    Width = 137
    Height = 121
    Columns = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 3
  end
end

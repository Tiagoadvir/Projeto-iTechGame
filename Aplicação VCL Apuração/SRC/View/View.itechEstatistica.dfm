object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'iTechGamer Estat'#237'stica'
  ClientHeight = 524
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pBase: TPanel
    Left = 0
    Top = 0
    Width = 1013
    Height = 524
    Align = alClient
    TabOrder = 0
    ExplicitTop = 24
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label2: TLabel
      Left = 144
      Top = 6
      Width = 145
      Height = 23
      Caption = 'Filtrar categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pGrid: TPanel
      Left = 0
      Top = 88
      Width = 1013
      Height = 436
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 1017
      ExplicitHeight = 445
      object Grid: TDBGrid
        Left = 1
        Top = 1
        Width = 1011
        Height = 434
        Align = alClient
        DataSource = Ds
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object Button1: TButton
      Left = 16
      Top = 30
      Width = 97
      Height = 31
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Panel1: TPanel
      Left = 328
      Top = 0
      Width = 692
      Height = 89
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      object lbDesc: TLabel
        Left = 1
        Top = 1
        Width = 690
        Height = 24
        Align = alTop
        Caption = 'Estatisticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 733
      end
      object Label1: TLabel
        Left = 16
        Top = 31
        Width = 116
        Height = 23
        Caption = 'Total Respostas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblTitulos: TLabel
        Left = 312
        Top = 31
        Width = 91
        Height = 23
        Caption = 'Total Titulos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 167
        Top = 31
        Width = 115
        Height = 23
        Caption = 'Total Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbltotCategoria: TLabel
        Left = 216
        Top = 59
        Width = 9
        Height = 23
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbltotResposta: TLabel
        Left = 56
        Top = 59
        Width = 9
        Height = 23
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblTotTitulos: TLabel
        Left = 352
        Top = 59
        Width = 9
        Height = 23
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object FiltroCategoria: TComboBox
      Left = 144
      Top = 35
      Width = 145
      Height = 23
      TabOrder = 3
      Text = 'FiltroCategoria'
      OnChange = FiltroCategoriaChange
      Items.Strings = (
        'Todos')
    end
  end
  object Ds: TDataSource
    Left = 840
    Top = 16
  end
end

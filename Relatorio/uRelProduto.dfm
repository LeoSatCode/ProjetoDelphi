object frmRelProduto: TfrmRelProduto
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 520
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = -8
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object rlbl1: TRLLabel
        Left = 5
        Top = 26
        Width = 229
        Height = 24
        Caption = 'Listagem de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldrw1: TRLDraw
        Left = 0
        Top = 50
        Width = 718
        Height = 9
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object rlbnds: TRLBand
      Left = 38
      Top = 150
      Width = 718
      Height = 37
      BandType = btFooter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object rldrw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 9
        Align = faCenterTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object rlsystmnf1: TRLSystemInfo
        Left = 5
        Top = 10
        Width = 65
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object rlsystmnf2: TRLSystemInfo
        Left = 656
        Top = 10
        Width = 16
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object rlsystmnf3: TRLSystemInfo
        Left = 688
        Top = 10
        Width = 112
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
      object rlbl2: TRLLabel
        Left = 676
        Top = 10
        Width = 8
        Height = 16
        Caption = '/'
      end
      object rlbl3: TRLLabel
        Left = 599
        Top = 10
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Detail: TRLBand
      Left = 38
      Top = 130
      Width = 718
      Height = 20
      object rldbtxtcategoriaId: TRLDBText
        Left = 5
        Top = 3
        Width = 57
        Height = 16
        DataField = 'produtoId'
        DataSource = dtsProdutos
        Text = ''
      end
      object rldbtxtcategoriaId1: TRLDBText
        Left = 85
        Top = 3
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsProdutos
        Text = ''
      end
      object rldbtxtvalor: TRLDBText
        Left = 344
        Top = 3
        Width = 67
        Height = 16
        DataField = 'quantidade'
        DataSource = dtsProdutos
        Text = ''
      end
      object rldbtxtnome: TRLDBText
        Left = 599
        Top = 3
        Width = 30
        Height = 16
        DataField = 'valor'
        DataSource = dtsProdutos
        Text = ''
      end
    end
    object rlbnd1: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 33
      BandType = btColumnHeader
      object rlpnl1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object rlbl4: TRLLabel
          Left = 5
          Top = 10
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl5: TRLLabel
          Left = 85
          Top = 10
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl6: TRLLabel
          Left = 599
          Top = 10
          Width = 92
          Height = 16
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl7: TRLLabel
          Left = 344
          Top = 10
          Width = 78
          Height = 16
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
  end
  object QryProdutos: TFDQuery
    Active = True
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT produtoId,'
      #9'   nome,'
      #9'   valor,'
      #9'   quantidade'
      '  FROM produtos'
      'ORDER BY produtos.nome')
    Left = 752
    object fdtncfldQryProdutosprodutoId: TFDAutoIncField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldQryProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object fmtbcdfldQryProdutosvalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldQryProdutosquantidade: TFMTBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 624
  end
  object rlpdfltr1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 688
    Top = 32
  end
end

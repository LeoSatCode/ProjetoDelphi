object frmRelProdutoComCategoria: TfrmRelProdutoComCategoria
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Listagem de Produtos por Categoria'
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
    DataSource = dtsProdutosComCategoria
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
        Width = 372
        Height = 24
        Caption = 'Listagem de Produtos por Categoria'
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
      Top = 217
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
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 97
      Width = 718
      Height = 120
      DataFields = 'categoriaId'
      object rlbnd2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 21
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object rlbl9: TRLLabel
          Left = 8
          Top = 3
          Width = 84
          Height = 16
          Caption = 'CATEGORIA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl10: TRLLabel
          Left = 135
          Top = 3
          Width = 8
          Height = 16
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbtxtprodutoId1: TRLDBText
          Left = 98
          Top = 3
          Width = 31
          Height = 16
          Alignment = taRightJustify
          DataField = 'categoriaId'
          DataSource = dtsProdutosComCategoria
          Text = ''
          Transparent = False
        end
        object rldbtxtdescricao1: TRLDBText
          Left = 149
          Top = 3
          Width = 60
          Height = 16
          DataField = 'descricao'
          DataSource = dtsProdutosComCategoria
          Text = ''
          Transparent = False
        end
      end
      object rlbnd1: TRLBand
        Left = 0
        Top = 21
        Width = 718
        Height = 25
        BandType = btColumnHeader
        object rlpnl1: TRLPanel
          Left = 3
          Top = 3
          Width = 718
          Height = 20
          Color = clInfoBk
          ParentColor = False
          Transparent = False
          object rlbl4: TRLLabel
            Left = 5
            Top = 3
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
            Left = 95
            Top = 3
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
            Left = 621
            Top = 3
            Width = 74
            Height = 16
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl7: TRLLabel
            Left = 373
            Top = 3
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
      object rlbnd3: TRLBand
        Left = 0
        Top = 46
        Width = 718
        Height = 24
        object rldbtxtprodutoId: TRLDBText
          Left = 8
          Top = 4
          Width = 57
          Height = 16
          DataField = 'produtoId'
          DataSource = dtsProdutosComCategoria
          Text = ''
        end
        object rldbtxtnome: TRLDBText
          Left = 98
          Top = 4
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsProdutosComCategoria
          Text = ''
        end
        object rldbtxtquantidade: TRLDBText
          Left = 376
          Top = 4
          Width = 67
          Height = 16
          DataField = 'quantidade'
          DataSource = dtsProdutosComCategoria
          Text = ''
        end
        object rldbtxtvalor: TRLDBText
          Left = 624
          Top = 4
          Width = 30
          Height = 16
          DataField = 'valor'
          DataSource = dtsProdutosComCategoria
          Text = ''
        end
      end
      object rlbnd4: TRLBand
        Left = 0
        Top = 70
        Width = 718
        Height = 53
        BandType = btSummary
        object rldbrsltvalor: TRLDBResult
          Left = 624
          Top = 6
          Width = 106
          Height = 16
          DataField = 'quantidade'
          DataSource = dtsProdutosComCategoria
          Info = riSum
          Text = ''
        end
        object rldrw3: TRLDraw
          Left = 376
          Top = 0
          Width = 355
          Height = 9
          DrawKind = dkLine
        end
        object rlbl8: TRLLabel
          Left = 376
          Top = 6
          Width = 247
          Height = 16
          Caption = 'Quantidade de Estoque por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl11: TRLLabel
          Left = 376
          Top = 31
          Width = 176
          Height = 16
          Caption = 'Valor M'#233'dio por Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbrsltquantidade: TRLDBResult
          Left = 624
          Top = 31
          Width = 92
          Height = 16
          DataField = 'Valor'
          DataSource = dtsProdutosComCategoria
          Info = riAverage
          Text = ''
        end
      end
    end
  end
  object QryProdutosComCategoria: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT  produtos.produtoId,'
      '        produtos.nome,'
      'cast(produtos.Valor as numeric(18,3)) as Valor ,'
      'cast(produtos.Quantidade as numeric(18,3)) as Quantidade ,'
      '              produtos.categoriaId,'
      '        categorias.descricao'
      '  FROM produtos'
      
        '      LEFT JOIN categorias ON categorias.categoriaId = produtos.' +
        'categoriaId'
      'ORDER BY produtos.categoriaId, produtos.produtoId')
    Left = 752
    object fdtncfldQryProdutosComCategoriaprodutoId: TFDAutoIncField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldQryProdutosComCategorianome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object strngfldQryProdutosComCategoriadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 30
    end
    object intgrfldQryProdutosComCategoriacategoriaId: TIntegerField
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
    end
    object QryProdutosComCategoriaValor: TBCDField
      FieldName = 'Valor'
      Origin = 'Valor'
      ReadOnly = True
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 3
    end
    object QryProdutosComCategoriaQuantidade: TBCDField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      ReadOnly = True
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 3
    end
  end
  object dtsProdutosComCategoria: TDataSource
    DataSet = QryProdutosComCategoria
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

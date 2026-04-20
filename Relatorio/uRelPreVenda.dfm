object frmRelPreVenda: TfrmRelPreVenda
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Produtos Venda'
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
    Left = 8
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dtsVendas
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
        Left = 3
        Top = 29
        Width = 196
        Height = 24
        Caption = 'Relat'#243'rio de Venda'
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
      Top = 241
      Width = 718
      Height = 32
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
        Left = 681
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
      DataFields = 'preVendaId'
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
          Left = 5
          Top = 3
          Width = 52
          Height = 16
          Caption = 'VENDA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbtxtprodutoId1: TRLDBText
          Left = 62
          Top = 3
          Width = 69
          Height = 16
          DataField = 'preVendaId'
          DataSource = dtsVendas
          Text = ''
          Transparent = False
        end
      end
      object rlbnd3: TRLBand
        Left = 0
        Top = 21
        Width = 718
        Height = 24
        object rldbtxtprodutoId: TRLDBText
          Left = 62
          Top = 4
          Width = 54
          Height = 16
          DataField = 'ClienteId'
          DataSource = dtsVendas
          Text = ''
        end
        object rldbtxtnome: TRLDBText
          Left = 120
          Top = 4
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVendas
          Text = ''
        end
        object rldbtxtvalor: TRLDBText
          Left = 646
          Top = 5
          Width = 80
          Height = 16
          DataField = 'dataEmissao'
          DataSource = dtsVendas
          Text = ''
        end
        object rlbl5: TRLLabel
          Left = 3
          Top = 4
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl6: TRLLabel
          Left = 531
          Top = 4
          Width = 102
          Height = 16
          Caption = 'Data da Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object rlsbdtl1: TRLSubDetail
        Left = 0
        Top = 45
        Width = 718
        Height = 52
        DataSource = dtsVendasItens
        object rlbnd1: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          BandType = btColumnHeader
          Color = 12615808
          ParentColor = False
          Transparent = False
          object rlbl10: TRLLabel
            Left = 3
            Top = 4
            Width = 64
            Height = 16
            Caption = 'Produtos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl4: TRLLabel
            Left = 411
            Top = 4
            Width = 82
            Height = 16
            Caption = 'Quantidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl8: TRLLabel
            Left = 646
            Top = 3
            Width = 63
            Height = 16
            Caption = 'Valor Un:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl11: TRLLabel
            Left = 531
            Top = 3
            Width = 66
            Height = 16
            Caption = 'Venda ID:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rldbtxtvendaId: TRLDBText
            Left = 603
            Top = 3
            Width = 48
            Height = 16
            DataField = 'vendaId'
            DataSource = dtsVendasItens
            Text = ''
          end
        end
        object rlbnd4: TRLBand
          Left = 0
          Top = 25
          Width = 718
          Height = 24
          object RLDBText1: TRLDBText
            Left = 5
            Top = 4
            Width = 57
            Height = 16
            DataField = 'produtoId'
            DataSource = dtsVendasItens
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 120
            Top = 4
            Width = 38
            Height = 16
            DataField = 'Nome'
            DataSource = dtsVendasItens
            Text = ''
          end
          object rldbtxtNome1: TRLDBText
            Left = 420
            Top = 4
            Width = 67
            Height = 16
            Alignment = taCenter
            DataField = 'quantidade'
            DataSource = dtsVendasItens
            Text = ''
          end
          object rldbtxtvalorUnitario: TRLDBText
            Left = 646
            Top = 4
            Width = 65
            Height = 16
            DataField = 'valorUnitario'
            DataSource = dtsVendasItens
            Text = ''
          end
        end
      end
    end
    object rlbnd5: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 24
      BandType = btSummary
      object rldbrsltTotalVenda: TRLDBResult
        Left = 646
        Top = 6
        Width = 105
        Height = 16
        DataField = 'totalVenda'
        DataSource = dtsVendas
        Info = riSum
        Text = ''
      end
      object rldrw4: TRLDraw
        Left = 531
        Top = -3
        Width = 201
        Height = 9
        DrawKind = dkLine
      end
      object rlbl7: TRLLabel
        Left = 531
        Top = 6
        Width = 105
        Height = 16
        Caption = 'Total da Venda:'
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
  object QryVendas: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'select preVenda.preVendaId,'
      'preVenda.ClienteId,'
      'clientes.nome,'
      'preVenda.dataEmissao,'
      'cast(preVenda.totalVenda as numeric(18,3)) as totalVenda'
      
        'from preVenda inner join clientes on clientes.clienteId = preVen' +
        'da.clienteId'
      'where preVenda.preVendaId =:preVendaId')
    Left = 752
    ParamData = <
      item
        Name = 'PREVENDAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryVendaspreVendaId: TFDAutoIncField
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryVendasClienteId: TIntegerField
      FieldName = 'ClienteId'
      Origin = 'ClienteId'
      Required = True
    end
    object QryVendasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryVendasdataEmissao: TSQLTimeStampField
      FieldName = 'dataEmissao'
      Origin = 'dataEmissao'
      Required = True
    end
    object QryVendastotalVenda: TBCDField
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      ReadOnly = True
      DisplayFormat = '##,##0.00'
      currency = True
      Precision = 18
      Size = 3
    end
  end
  object dtsVendas: TDataSource
    DataSet = QryVendas
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
  object dtsVendasItens: TDataSource
    DataSet = QryVendaItens
    Left = 616
    Top = 320
  end
  object QryVendaItens: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'select '
      '  preVendaItens.preVendaId,'
      '  preVendaItens.produtoId,'
      '  produtos.Nome,'
      '  preVendaItens.quantidade,'
      '  preVendaItens.valorUnitario,'
      '  preVendaItens.totalProduto'
      'from preVendaItens'
      'inner join produtos '
      '  on produtos.produtoId = preVendaItens.produtoId'
      'where preVendaItens.preVendaId = :preVendaId'
      'order by preVendaItens.produtoId')
    Left = 744
    Top = 320
    ParamData = <
      item
        Name = 'PREVENDAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryVendaItenspreVendaId: TIntegerField
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
      Required = True
    end
    object QryVendaItensprodutoId: TIntegerField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      Required = True
    end
    object QryVendaItensNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object QryVendaItensquantidade: TFMTBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      Precision = 18
      Size = 5
    end
    object QryVendaItensvalorUnitario: TFMTBCDField
      FieldName = 'valorUnitario'
      Origin = 'valorUnitario'
      Required = True
      DisplayFormat = '##,##0.00'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryVendaItenstotalProduto: TFMTBCDField
      FieldName = 'totalProduto'
      Origin = 'totalProduto'
      Required = True
      DisplayFormat = '##,##0.00'
      currency = True
      Precision = 18
      Size = 5
    end
  end
end

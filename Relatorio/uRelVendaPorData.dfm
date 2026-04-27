object frmRelVendaPorData: TfrmRelVendaPorData
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Venda por Data'
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
    Left = 0
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dtsVendaPorData
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
        Width = 303
        Height = 24
        Caption = 'Listagem de Vendas por Data'
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
      DataFields = 'dataVenda'
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
          Width = 43
          Height = 16
          Caption = 'DATA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbtxtprodutoId1: TRLDBText
          Left = 63
          Top = 3
          Width = 66
          Height = 16
          DataField = 'dataVenda'
          DataSource = dtsVendaPorData
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
            Width = 110
            Height = 16
            Caption = 'Nome do Cliente'
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
            Width = 83
            Height = 16
            Caption = 'Valor Venda'
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
          Width = 52
          Height = 16
          DataField = 'clienteId'
          DataSource = dtsVendaPorData
          Text = ''
        end
        object rldbtxtnome: TRLDBText
          Left = 98
          Top = 4
          Width = 36
          Height = 16
          DataField = 'nome'
          DataSource = dtsVendaPorData
          Text = ''
        end
        object rldbtxtvalor: TRLDBText
          Left = 624
          Top = 4
          Width = 69
          Height = 16
          DataField = 'TotalVenda'
          DataSource = dtsVendaPorData
          Text = ''
        end
      end
      object rlbnd4: TRLBand
        Left = 0
        Top = 70
        Width = 718
        Height = 27
        BandType = btSummary
        object rldbrsltvalor: TRLDBResult
          Left = 624
          Top = 6
          Width = 108
          Height = 16
          DataField = 'TotalVenda'
          DataSource = dtsVendaPorData
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
          Left = 524
          Top = 6
          Width = 94
          Height = 16
          Caption = 'Total por Data'
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
    object rlbnd5: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 24
      BandType = btSummary
      object rldbrsltTotalVenda: TRLDBResult
        Left = 624
        Top = 6
        Width = 108
        Height = 16
        DataField = 'TotalVenda'
        DataSource = dtsVendaPorData
        Info = riSum
        Text = ''
      end
      object rldrw4: TRLDraw
        Left = 377
        Top = -3
        Width = 355
        Height = 9
        DrawKind = dkLine
      end
      object rlbl7: TRLLabel
        Left = 524
        Top = 6
        Width = 75
        Height = 16
        Caption = 'Total Geral'
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
  object QryVendaPorData: TFDQuery
    Active = True
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT  vendas.vendaId,'
      '        vendas.clienteId,'
      '        clientes.nome,'
      '        vendas.dataVenda,'
      '        cast(vendas.totalVenda as numeric(18,3)) as TotalVenda'
      '  FROM vendas'
      
        '      LEFT JOIN clientes ON clientes.clienteId = vendas.clienteI' +
        'd'
      'WHERE vendas.dataVenda BETWEEN :dataInicio AND :dataFim'
      'ORDER BY vendas.dataVenda, vendas.clienteId')
    Left = 752
    ParamData = <
      item
        Name = 'DataInicio'
        DataType = ftDate
        ParamType = ptInput
        Value = 46082d
      end
      item
        Name = 'DataFim'
        DataType = ftDate
        ParamType = ptInput
        Value = 46112d
      end>
    object QryVendaPorDatavendaId: TFDAutoIncField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryVendaPorDataclienteId: TIntegerField
      FieldName = 'clienteId'
      Origin = 'clienteId'
      Required = True
    end
    object QryVendaPorDatanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryVendaPorDatadataVenda: TSQLTimeStampField
      FieldName = 'dataVenda'
      Origin = 'dataVenda'
    end
    object QryVendaPorDataTotalVenda: TBCDField
      FieldName = 'TotalVenda'
      Origin = 'TotalVenda'
      ReadOnly = True
      DisplayFormat = 'R$ ##,##0.00'
      Precision = 18
      Size = 3
    end
  end
  object dtsVendaPorData: TDataSource
    DataSet = QryVendaPorData
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

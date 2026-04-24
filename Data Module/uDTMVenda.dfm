object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 244
  Width = 341
  object QryCliente: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT clienteId,'
      '  nome,'
      '  situacaoId,'
      '  observacao'
      'from clientes'
      ''
      '')
    Left = 48
    Top = 48
    object fdtncfldQryClienteclienteId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object strngfldQryClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryClientesituacaoId: TIntegerField
      FieldName = 'situacaoId'
      Origin = 'situacaoId'
    end
    object QryClienteobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 200
    end
  end
  object QryProdutos: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT produtoId,'
      '     nome,'
      '     valor,'
      '     quantidade'
      '   FROM produtos')
    Left = 136
    Top = 48
    object fdtncfldQryProdutosprodutoId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldQryProdutosnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object fmtbcdfldQryProdutosvalor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = 'R$##,##0.00'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldQryProdutosquantidade: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 48
    object cdsItensVendaprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
    end
    object cdsItensVendaNomeProduto: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensVendaquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cdsItensVendavalorUnitario: TFloatField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'valorUnitario'
      DisplayFormat = 'R$ ##,##0.00'
    end
    object cdsItensVendavalorTotalProduto: TFloatField
      DisplayLabel = 'Total do Produto'
      FieldName = 'valorTotalProduto'
      DisplayFormat = 'R$ ##,##0.00'
    end
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 240
    Top = 104
  end
  object dtsCliente: TDataSource
    DataSet = QryCliente
    Left = 40
    Top = 104
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 136
    Top = 104
  end
  object QryClienteUpdate: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'UPDATE clientes'
      'SET situacaoId = :situacaoId'
      'WHERE clienteId = :id')
    Left = 40
    Top = 176
    ParamData = <
      item
        Name = 'SITUACAOID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end

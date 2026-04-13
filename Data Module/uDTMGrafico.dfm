object dtmGrafico: TdtmGrafico
  OldCreateOrder = False
  Height = 230
  Width = 409
  object QryProdutoEstoque: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      
        'select convert(varchar, produtoId)+'#39' - '#39'+nome as Label, Quantida' +
        'de as Value From produtos')
    Left = 72
    Top = 48
    object strngfldQryProdutoEstoqueLabel: TStringField
      FieldName = 'Label'
      Origin = 'Label'
      ReadOnly = True
      Size = 93
    end
    object fmtbcdfldQryProdutoEstoqueValue: TFMTBCDField
      FieldName = 'Value'
      Origin = 'Value'
      Precision = 18
      Size = 5
    end
  end
  object dsProdutoEstoque: TDataSource
    DataSet = QryProdutoEstoque
    Left = 192
    Top = 48
  end
  object QryVendaValorPorCliente: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      
        'SELECT CONVERT(VARCHAR, vendas.clienteId)+'#39'_'#39'+clientes.nome AS L' +
        'abel, SUM(vendas.totalVenda) AS Value'
      #9'FROM Vendas'
      #9#9'INNER JOIN clientes ON clientes.clienteId = vendas.clienteId'
      
        ' WHERE vendas.dataVenda BETWEEN CONVERT(DATE, GETDATE()-7) and C' +
        'ONVERT(DATE, GETDATE())'
      ' GROUP BY Vendas.clienteId, clientes.nome')
    Left = 72
    Top = 128
    object strngfldQryVendaValorPorClienteLabel: TStringField
      FieldName = 'Label'
      Origin = 'Label'
      ReadOnly = True
      Size = 91
    end
    object fmtbcdfldQryVendaValorPorClienteValue: TFMTBCDField
      FieldName = 'Value'
      Origin = 'Value'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
  object QryProdutosMaisVendidos: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      
        'SELECT TOP 10 CONVERT(VARCHAR, vi.produtoId) + '#39'_'#39'+p.nome AS lab' +
        'el, SUM(vi.totalProduto) AS Value'
      '   FROM vendasItens as vi'
      '        INNER JOIN produtos AS P ON p.produtoId = vi.produtoId'
      '   GROUP BY vi.produtoId, p.nome'
      '   ORDER BY Label DESC')
    Left = 192
    Top = 128
    object strngfldQryProdutosMaisVendidoslabel: TStringField
      FieldName = 'label'
      Origin = 'label'
      ReadOnly = True
      Size = 91
    end
    object fmtbcdfldQryProdutosMaisVendidosValue: TFMTBCDField
      FieldName = 'Value'
      Origin = 'Value'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
  object QryVendasDaUltimaSemana: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      
        ' SELECT  vendas.dataVenda AS Label, SUM(vendas.totalVenda) AS va' +
        'lue'
      #9'FROM Vendas'
      
        '   WHERE vendas.dataVenda BETWEEN CONVERT(DATE, GETDATE()-7) and' +
        ' CONVERT(DATE,GETDATE())'
      '   GROUP BY Vendas.dataVenda')
    Left = 320
    Top = 128
    object sqltmstmpfldQryVendasDaUltimaSemanaLabel: TSQLTimeStampField
      FieldName = 'Label'
      Origin = 'Label'
    end
    object fmtbcdfldQryVendasDaUltimaSemanavalue: TFMTBCDField
      FieldName = 'value'
      Origin = 'value'
      ReadOnly = True
      Precision = 38
      Size = 5
    end
  end
end

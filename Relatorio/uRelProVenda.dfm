inherited frmRelProVenda: TfrmRelProVenda
  Caption = 'Relat'#243'rio de Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Relatorio: TRLReport
    inherited cabecalho: TRLBand
      inherited rlbl1: TRLLabel
        Width = 244
        Caption = 'Comprovante de Venda'
        ExplicitWidth = 244
      end
    end
    inherited BandaDoGrupo: TRLGroup
      inherited rlbnd2: TRLBand
        inherited rldbtxtprodutoId1: TRLDBText
          Width = 47
          DataField = 'vendaId'
          ExplicitWidth = 47
        end
      end
      inherited rlbnd3: TRLBand
        inherited rldbtxtprodutoId: TRLDBText
          Width = 54
          DataField = 'ClienteId'
          ExplicitWidth = 54
        end
        inherited rldbtxtnome: TRLDBText
          Width = 36
          DataField = 'nome'
          ExplicitWidth = 36
        end
        inherited rldbtxtvalor: TRLDBText
          DataField = 'dataVenda'
        end
      end
      inherited rlsbdtl1: TRLSubDetail
        inherited rlbnd4: TRLBand
          inherited RLDBText1: TRLDBText
            Width = 57
            DataField = 'produtoId'
            ExplicitWidth = 57
          end
          inherited RLDBText2: TRLDBText
            Width = 38
            DataField = 'Nome'
            ExplicitWidth = 38
          end
          inherited rldbtxtNome1: TRLDBText
            Left = 420
            Width = 68
            DataField = 'quantidade'
            ExplicitLeft = 420
            ExplicitWidth = 68
          end
          inherited rldbtxtvalorUnitario: TRLDBText
            Width = 74
            DataField = 'valorUnitario'
            ExplicitWidth = 74
          end
        end
      end
    end
    inherited rlbnd5: TRLBand
      inherited rldbrsltTotalVenda: TRLDBResult
        Width = 105
        DataField = 'totalVenda'
        ExplicitWidth = 105
      end
    end
  end
  inherited QryMaster: TFDQuery
    SQL.Strings = (
      'select vendas.vendaId,'
      'vendas.ClienteId,'
      'clientes.nome,'
      'vendas.dataVenda,'
      'cast(vendas.totalVenda as numeric(18,3)) as totalVenda'
      
        'from vendas inner join clientes on clientes.clienteId = vendas.c' +
        'lienteId'
      'where vendas.vendaId =:id')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryMastervendaId: TFDAutoIncField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryMasterClienteId: TIntegerField
      FieldName = 'ClienteId'
      Origin = 'ClienteId'
      Required = True
    end
    object QryMasternome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryMasterdataVenda: TSQLTimeStampField
      FieldName = 'dataVenda'
      Origin = 'dataVenda'
    end
    object QryMastertotalVenda: TBCDField
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      ReadOnly = True
      DisplayFormat = '##,##0.00'
      currency = True
      Precision = 18
      Size = 3
    end
  end
  inherited QryDetalhes: TFDQuery
    SQL.Strings = (
      'select vendasItens.vendaId,'
      'vendasItens.produtoId,'
      'produtos.Nome,'
      'vendasItens.quantidade,'
      'vendasItens.valorUnitario,'
      'vendasItens.totalProduto from vendasItens'
      
        'inner join produtos on produtos.produtoId = vendasItens.produtoI' +
        'd'
      'where vendasItens.vendaId =:id'
      'order by vendasItens.produtoId')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryDetalhesvendaId: TIntegerField
      FieldName = 'vendaId'
      Origin = 'vendaId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryDetalhesprodutoId: TIntegerField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryDetalhesNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 60
    end
    object QryDetalhesquantidade: TFMTBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
    object QryDetalhesvalorUnitario: TFMTBCDField
      FieldName = 'valorUnitario'
      Origin = 'valorUnitario'
      DisplayFormat = '##,##0.00'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryDetalhestotalProduto: TFMTBCDField
      FieldName = 'totalProduto'
      Origin = 'totalProduto'
      DisplayFormat = '##,##0.00'
      currency = True
      Precision = 18
      Size = 5
    end
  end
end

inherited frmRelPreVenda: TfrmRelPreVenda
  Caption = 'Relat'#243'rio de Pr'#233' Venda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Relatorio: TRLReport
    inherited cabecalho: TRLBand
      inherited rlbl1: TRLLabel
        Top = 27
        Width = 396
        Caption = 'Demonstrativo de Inten'#231#227'o de Compra'
        ExplicitTop = 27
        ExplicitWidth = 396
      end
    end
    inherited BandaDoGrupo: TRLGroup
      DataFields = 'preVendaId'
      inherited rlbnd2: TRLBand
        inherited rldbtxtprodutoId1: TRLDBText
          Width = 69
          DataField = 'preVendaId'
          ExplicitWidth = 69
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
          Width = 80
          DataField = 'dataEmissao'
          ExplicitWidth = 80
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
      'select preVenda.preVendaId,'
      'preVenda.ClienteId,'
      'clientes.nome,'
      'preVenda.dataEmissao,'
      'cast(preVenda.totalVenda as numeric(18,3)) as totalVenda'
      
        'from preVenda inner join clientes on clientes.clienteId = preVen' +
        'da.clienteId'
      'where preVenda.preVendaId =:id')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryMasterpreVendaId: TFDAutoIncField
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
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
    object QryMasterdataEmissao: TSQLTimeStampField
      FieldName = 'dataEmissao'
      Origin = 'dataEmissao'
      Required = True
    end
    object QryMastertotalVenda: TBCDField
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      ReadOnly = True
      DisplayFormat = 'R$ ##,##0.00'
      Precision = 18
      Size = 3
    end
  end
  inherited QryDetalhes: TFDQuery
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
      'where preVendaItens.preVendaId = :id'
      'order by preVendaItens.produtoId')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryDetalhespreVendaId: TIntegerField
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
      Required = True
    end
    object QryDetalhesprodutoId: TIntegerField
      FieldName = 'produtoId'
      Origin = 'produtoId'
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
      Required = True
      Precision = 18
      Size = 5
    end
    object QryDetalhesvalorUnitario: TFMTBCDField
      FieldName = 'valorUnitario'
      Origin = 'valorUnitario'
      Required = True
      DisplayFormat = 'R$ ##,##0.00'
      Precision = 18
      Size = 5
    end
    object QryDetalhestotalProduto: TFMTBCDField
      FieldName = 'totalProduto'
      Origin = 'totalProduto'
      Required = True
      DisplayFormat = 'R$ ##,##0.00'
      Precision = 18
      Size = 5
    end
  end
end

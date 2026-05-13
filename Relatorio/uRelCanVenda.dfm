inherited frmExtorno: TfrmExtorno
  Caption = 'Extorno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Relatorio: TRLReport
    inherited cabecalho: TRLBand
      inherited rlbl1: TRLLabel
        Width = 443
        Caption = 'Comprovante de Cancelamento de Compra'
        ExplicitWidth = 443
      end
    end
    inherited BandaDoGrupo: TRLGroup
      inherited rlbnd2: TRLBand
        inherited rldbtxtprodutoId1: TRLDBText
          Width = 69
          DataField = 'preVendaId'
          ExplicitWidth = 69
        end
      end
      inherited rlbnd3: TRLBand
        inherited rldbtxtprodutoId: TRLDBText
          Left = 63
          Width = 52
          DataField = 'clienteId'
          ExplicitLeft = 63
          ExplicitWidth = 52
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
            Width = 36
            DataField = 'nome'
            ExplicitWidth = 36
          end
          inherited rldbtxtNome1: TRLDBText
            Left = 387
            Width = 68
            DataField = 'quantidade'
            ExplicitLeft = 387
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
      'SELECT '
      '    pv.preVendaId,'
      '    pv.clienteId,'
      '    c.nome,'
      '    pv.dataEmissao,'
      '    CAST(pv.totalVenda AS NUMERIC(18,3)) AS totalVenda,'
      '    pv.status'
      'FROM preVenda pv '
      'INNER JOIN clientes c ON c.clienteId = pv.clienteId'
      'WHERE pv.preVendaId = :id')
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
    object QryMasterclienteId: TIntegerField
      FieldName = 'clienteId'
      Origin = 'clienteId'
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
    object QryMasterstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
  end
  inherited QryDetalhes: TFDQuery
    SQL.Strings = (
      'SELECT '
      '    pvi.preVendaId,'
      '    pvi.produtoId,'
      '    p.nome,'
      '    pvi.quantidade,'
      '    pvi.valorUnitario,'
      '    pvi.totalProduto '
      'FROM preVendaItens pvi'
      'INNER JOIN produtos p ON p.produtoId = pvi.produtoId'
      'WHERE pvi.preVendaId = :id'
      'ORDER BY pvi.produtoId')
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
    object QryDetalhesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
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

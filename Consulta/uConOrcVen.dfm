inherited frmConOrcVen: TfrmConOrcVen
  Caption = 'Or'#231'amentos Vencidos'
  ClientWidth = 950
  ExplicitWidth = 956
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 950
  end
  inherited pnl2: TPanel
    Width = 950
    inherited grdPesquisa: TDBGrid
      Width = 948
      Columns = <
        item
          Expanded = False
          FieldName = 'preVendaId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clienteId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'situacaoId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'documento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dataEmissao'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'totalVenda'
          Title.Caption = 'Total Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status'
          Width = 88
          Visible = True
        end>
    end
  end
  inherited pnl3: TPanel
    Width = 950
    inherited btnFechar: TPngBitBtn
      Left = 864
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECT '
      '    pv.preVendaId,'
      '    pv.clienteId,'
      '    c.nome,'
      '    c.situacaoId,'
      '    c.documento,'
      '    pv.dataEmissao,'
      '    pv.totalVenda,'
      '    pv.status'
      'FROM preVenda pv'
      'INNER JOIN clientes c ON c.clienteId = pv.clienteId'
      'WHERE pv.status = '#39'VENCIDA'#39
      '')
    object QryListagempreVendaId: TFDAutoIncField
      DisplayLabel = 'C'#243'd. Pr'#233' Venda'
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'clienteId'
      Origin = 'pv.clienteId'
      Required = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryListagemsituacaoId: TIntegerField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'situacaoId'
      Origin = 'situacaoId'
    end
    object QryListagemdocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Origin = 'documento'
      Size = 18
    end
    object QryListagemdataEmissao: TSQLTimeStampField
      DisplayLabel = 'Data Emissao'
      FieldName = 'dataEmissao'
      Origin = 'dataEmissao'
      Required = True
    end
    object QryListagemtotalVenda: TFMTBCDField
      DisplayLabel = 'Total lVenda'
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      Required = True
      DisplayFormat = 'R$ ##,##0.00'
      Precision = 18
      Size = 5
    end
    object QryListagemstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
  end
end

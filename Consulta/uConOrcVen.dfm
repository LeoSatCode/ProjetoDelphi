inherited frmConOrcVen: TfrmConOrcVen
  Caption = 'Or'#231'amentos Vencidos'
  ClientWidth = 950
  ExplicitWidth = 956
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 950
    ExplicitWidth = 950
    inherited btnPesquisar: TPngBitBtn
      Width = 98
      Caption = 'PESQUISAR'
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Segoe UI Variable Text Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C180000011B4944415478DA
        6364A01030E293949494E4025215401C05C4B240FC188897323333773C79F2E4
        3B5E03A09AF702F19BFFFFFF3701F1354646462D20AE038A09010D71011982CF
        80262065F8FCF9735F2C729B81069D79F6EC59233E03EE006D8D78F1E2C51974
        3909090953A001CB8086ABE233E0DBAF5FBFC4DFBE7DFB195D4E585898978D8D
        ED35D0000E7C065C02BA20098F0B96020D50C3698094945431D000073C61701A
        18064DF85CE00654B41368C816502CFCFDFBF73A30E43541B100C482ACACAC2E
        0F1F3EFC81D50069696907A0A695401C0B54AC0BA4E380C2AA40FC14C85F0CD4
        DC05D28C351D006DB6012A5A0BC4914F9F3EDDC740003052A219C5007234A318
        000CF54540CDF3809A0F10AB196B18900A283600001D378411B9615874000000
        0049454E44AE426082}
      ExplicitWidth = 98
    end
  end
  inherited pnl2: TPanel
    Width = 950
    ExplicitWidth = 950
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
    ExplicitWidth = 950
    inherited btnFechar: TPngBitBtn
      Left = 864
      ExplicitLeft = 864
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
    Left = 663
    Top = 8
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
  inherited dtsListagem: TDataSource
    Left = 711
    Top = 8
  end
  inherited ilimage: TImageList
    Top = 8
  end
end

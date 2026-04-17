object frmCaixa: TfrmCaixa
  Left = 0
  Top = 0
  Caption = 'Caixa'
  ClientHeight = 363
  ClientWidth = 816
  Color = 16774378
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 816
    Height = 363
    ActivePage = Pendentes
    Align = alClient
    TabOrder = 0
    object Pendentes: TTabSheet
      Caption = 'Pendentes'
      object pnl2: TPanel
        Left = 0
        Top = 294
        Width = 808
        Height = 41
        Align = alBottom
        Color = 16774378
        ParentBackground = False
        TabOrder = 0
        object btnReceber: TBitBtn
          Left = 368
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Receber'
          TabOrder = 0
          OnClick = btnReceberClick
        end
      end
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 57
        Align = alTop
        Color = 16774378
        ParentBackground = False
        TabOrder = 1
        object lblIndice: TLabel
          Left = 24
          Top = 0
          Width = 78
          Height = 13
          Caption = 'Campo Pesquisa'
        end
        object mskPesquisar: TMaskEdit
          Left = 24
          Top = 19
          Width = 265
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
          OnChange = mskPesquisarChange
        end
        object btnPesquisar: TBitBtn
          Tag = 99
          Left = 295
          Top = 15
          Width = 114
          Height = 25
          Cursor = crHandPoint
          Caption = '&PESQUISAR'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF7E7E7E7E7E7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF787878C4C4C47E7E7EFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF757575B0B1
            B17D7D7D898A8AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF757575999A9A868686878888FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7575758989898C8C8C8081
            81FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B77767B77767B
            77767575757A7B7B8F8F8F797A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF848484848484BAB8BACFCECEB7B5B6939092807F80707070FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF928C86C4C0BCFEFCF8FEFCFAFFFCFAFF
            FCFBFBFAF8B1ACADA49F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            928C86FEF3E7FEF7EFFEF7EFFEF7F0FEF8F0FEF8F2FAF4EEA49F9F747374FF00
            FFFF00FFFF00FFFF00FFFF00FF655F5CD4C4B2FCEFE0FCF2E5FCF2E6FCF3E6FC
            F3E7FEF3E7FEF3E9D3CAC5747374FF00FFFF00FFFF00FFFF00FFFF00FF655F5C
            E1CAB0FCEAD5FCEDDCFCEEDCFCEEDDFCEEDDFCEEDEFCEEDDDED1C6747374FF00
            FFFF00FFFF00FFFF00FFFF00FF655F5CCEB497FAE2C7FBE5CCFBE5CCFBE5CEFB
            E6CFFBE7D1FBEAD5D7C9BD747374FF00FFFF00FFFF00FFFF00FFFF00FF655F5C
            8C7B69FAE0C2FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3F8E6D17F7B7BFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF655F5CB49E87FBE9D3FBE9D3FBE9D3FB
            E9D3F8E6D1C6B8AB7F7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF6C686597897BCABAA6D9C9B4C9B8A67F7B7B7F7B7BFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B77767B77767B77767B
            7776FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object gdrPendentes: TDBGrid
        Left = 0
        Top = 57
        Width = 808
        Height = 237
        Align = alClient
        DataSource = dtsPendentes
        DrawingStyle = gdsClassic
        FixedColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = gdrPendentesDrawColumnCell
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = True
          end>
      end
    end
    object Faturados: TTabSheet
      Caption = 'Faturados'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 294
        Width = 808
        Height = 41
        Align = alBottom
        Color = 16774378
        ParentBackground = False
        TabOrder = 0
      end
      object pnlListagemTopo1: TPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 57
        Align = alTop
        Color = 16774378
        ParentBackground = False
        TabOrder = 1
        object lblIndice1: TLabel
          Left = 24
          Top = 0
          Width = 75
          Height = 13
          Caption = 'CampoPesquisa'
        end
        object medt1: TMaskEdit
          Left = 24
          Top = 19
          Width = 265
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua pesquisa'
        end
        object btnPesquisar1: TBitBtn
          Tag = 99
          Left = 295
          Top = 15
          Width = 114
          Height = 25
          Cursor = crHandPoint
          Caption = '&PESQUISAR'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF7E7E7E7E7E7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF787878C4C4C47E7E7EFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF757575B0B1
            B17D7D7D898A8AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF757575999A9A868686878888FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7575758989898C8C8C8081
            81FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B77767B77767B
            77767575757A7B7B8F8F8F797A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF848484848484BAB8BACFCECEB7B5B6939092807F80707070FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF928C86C4C0BCFEFCF8FEFCFAFFFCFAFF
            FCFBFBFAF8B1ACADA49F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            928C86FEF3E7FEF7EFFEF7EFFEF7F0FEF8F0FEF8F2FAF4EEA49F9F747374FF00
            FFFF00FFFF00FFFF00FFFF00FF655F5CD4C4B2FCEFE0FCF2E5FCF2E6FCF3E6FC
            F3E7FEF3E7FEF3E9D3CAC5747374FF00FFFF00FFFF00FFFF00FFFF00FF655F5C
            E1CAB0FCEAD5FCEDDCFCEEDCFCEEDDFCEEDDFCEEDEFCEEDDDED1C6747374FF00
            FFFF00FFFF00FFFF00FFFF00FF655F5CCEB497FAE2C7FBE5CCFBE5CCFBE5CEFB
            E6CFFBE7D1FBEAD5D7C9BD747374FF00FFFF00FFFF00FFFF00FFFF00FF655F5C
            8C7B69FAE0C2FBE9D3FBE9D3FBE9D3FBE9D3FBE9D3F8E6D17F7B7BFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF655F5CB49E87FBE9D3FBE9D3FBE9D3FB
            E9D3F8E6D1C6B8AB7F7B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF6C686597897BCABAA6D9C9B4C9B8A67F7B7B7F7B7BFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B77767B77767B77767B
            7776FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 1
        end
      end
      object gdrFaturados: TDBGrid
        Left = 0
        Top = 57
        Width = 808
        Height = 237
        Align = alClient
        DataSource = dtsFaturados
        DrawingStyle = gdsClassic
        FixedColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = gdrFaturadosDrawColumnCell
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'totalVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = True
          end>
      end
    end
  end
  object QryPendentes: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT '
      '    pv.preVendaId,'
      '    pv.clienteId,'
      '    c.nome,'
      '    c.documento,'
      '    pv.dataEmissao,'
      '    pv.totalVenda,'
      '    pv.status'
      'FROM preVenda pv'
      'INNER JOIN clientes c ON c.clienteId = pv.clienteId'
      'WHERE pv.status = '#39'PENDENTE'#39
      '')
    Left = 168
    Top = 184
    object QryPendentespreVendaId: TFDAutoIncField
      DisplayLabel = 'C'#243'd. Pr'#233' Venda'
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryPendentesclienteId: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'clienteId'
      Origin = 'clienteId'
      Required = True
    end
    object QryPendentesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryPendentesdataEmissao: TSQLTimeStampField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'dataEmissao'
      Origin = 'dataEmissao'
      Required = True
    end
    object QryPendentestotalVenda: TFMTBCDField
      DisplayLabel = 'Total Venda'
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      Required = True
      Precision = 18
      Size = 5
    end
    object QryPendentesstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object strngfldQryPendentesdocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Origin = 'documento'
      Size = 18
    end
  end
  object dtsPendentes: TDataSource
    DataSet = QryPendentes
    Left = 232
    Top = 184
  end
  object QryFaturados: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT '
      '    pv.preVendaId,'
      '    pv.clienteId,'
      '    c.nome,'
      '    c.documento,'
      '    pv.dataEmissao,'
      '    pv.totalVenda,'
      '    pv.status'
      'FROM preVenda pv'
      'INNER JOIN clientes c ON c.clienteId = pv.clienteId'
      'WHERE pv.status = '#39'PAGO'#39)
    Left = 168
    Top = 248
    object FDAutoIncField1: TFDAutoIncField
      DisplayLabel = 'C'#243'd. Pr'#233' Venda'
      FieldName = 'preVendaId'
      Origin = 'preVendaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'clienteId'
      Origin = 'clienteId'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'dataEmissao'
      Origin = 'dataEmissao'
      Required = True
    end
    object FMTBCDField1: TFMTBCDField
      DisplayLabel = 'Total Venda'
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      Required = True
      Precision = 18
      Size = 5
    end
    object StringField2: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object strngfldQryFaturadosdocumento: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'documento'
      Origin = 'documento'
      Size = 18
    end
  end
  object dtsFaturados: TDataSource
    DataSet = QryFaturados
    Left = 232
    Top = 248
  end
end

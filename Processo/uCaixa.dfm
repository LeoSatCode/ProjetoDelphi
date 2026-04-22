object frmCaixa: TfrmCaixa
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Caixa'
  ClientHeight = 460
  ClientWidth = 995
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
    Width = 995
    Height = 460
    ActivePage = Pendentes
    Align = alClient
    TabOrder = 0
    object Pendentes: TTabSheet
      Caption = 'Pendentes'
      object pnl2: TPanel
        Left = 0
        Top = 391
        Width = 987
        Height = 41
        Align = alBottom
        Color = 16774378
        ParentBackground = False
        TabOrder = 0
        object btnReceber: TBitBtn
          Left = 381
          Top = 8
          Width = 84
          Height = 25
          Caption = '&Receber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Variable Text Semibold'
          Font.Style = [fsBold]
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000130B0000130B000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FF000000FF000000FF000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
            00FF0000000000000000000000FF000000C30000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000C50000
            00FF0000000000000000000000FF000000000000000000000000000000000000
            003E000000DF000000DE0000003C000000000000000000000000000000000000
            00FF0000000000000000000000FF000000000000001C00000054000000000000
            00D6000000480000004A000000D500000000000000550000001C000000000000
            00FF0000000000000000000000FF0000000000000056000000CF000000000000
            00F10000000F00000011000000F100000000000000CF00000055000000000000
            00FF0000000000000000000000FF000000000000000000000000000000000000
            009C000000BB000000BC0000009A000000000000000000000000000000000000
            00FF0000000000000000000000FF000000490000000000000000000000000000
            00040000005F0000005E000000040000000000000000000000000000004A0000
            00FF0000000000000000000000FF000000F70000008800000088000000880000
            0088000000880000008800000088000000880000008800000088000000F80000
            00FF000000000000000000000077000000770000007700000077000000770000
            0077000000770000007700000077000000770000007700000077000000770000
            0077000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000}
          ParentFont = False
          TabOrder = 0
          OnClick = btnReceberClick
        end
        object btnCancelar: TBitBtn
          Left = 505
          Top = 8
          Width = 89
          Height = 25
          Caption = '&Cancelar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Variable Text Semibold'
          Font.Style = [fsBold]
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000130B0000130B000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000090000
            004C00000071000000710000004C000000090000000000000000000000000000
            0000000000000000000000000000000000000000000100000070000000EA0000
            00BB0000008E0000008E000000BC000000EA0000006E00000001000000000000
            000000000000000000000000000000000001000000A3000000C4000000260000
            000000000000000000000000000000000027000000C5000000A1000000010000
            000000000000000000000000000000000071000000C200000007000000000000
            00000000000000000000000000000000000000000007000000C50000006E0000
            000000000000000000000000000A000000EA0000002500000000000000200000
            003F00000000000000000000003F000000200000000000000027000000EA0000
            000900000000000000000000004D000000BA00000000000000000000003F0000
            00EB0000004200000042000000EB0000003F0000000000000000000000BC0000
            004B0000000000000000000000730000008C0000000000000000000000000000
            0042000000EB000000EB000000420000000000000000000000000000008D0000
            00720000000000000000000000730000008C0000000000000000000000000000
            0042000000EB000000EB000000420000000000000000000000000000008C0000
            007200000000000000000000004D000000BA00000000000000000000003F0000
            00EB0000004200000042000000EB0000003F0000000000000000000000BC0000
            004B00000000000000000000000A000000EA0000002300000000000000200000
            003F00000000000000000000003F000000200000000000000026000000EA0000
            000900000000000000000000000000000073000000C100000006000000000000
            00000000000000000000000000000000000000000007000000C4000000700000
            000000000000000000000000000000000001000000A4000000C1000000230000
            000000000000000000000000000000000025000000C2000000A3000000010000
            0000000000000000000000000000000000000000000100000073000000EA0000
            00BA0000008D0000008D000000BA000000EA0000007100000001000000000000
            00000000000000000000000000000000000000000000000000000000000A0000
            004E00000072000000710000004E0000000A0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000}
          ParentFont = False
          TabOrder = 1
          OnClick = btnCancelarClick
        end
        object btnSair: TBitBtn
          Left = 888
          Top = 8
          Width = 91
          Height = 25
          Caption = '&Sair'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Variable Text Semibold'
          Font.Style = [fsBold]
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000130B0000130B000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000009A000000FC000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FC000000990000
            0000000000000000000000000000000000FC0000008D00000055000000550000
            005500000055000000550000005500000055000000550000008D000000FC0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            0000000000000000000000000000000000050000000000000055000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            000000000000000000000000002F000000DD0000002F00000055000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            000000000000000000000000000A000000BB000000EE00000088000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            00AA000000AA000000AA000000AA000000B4000000FF000000FF000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            00AA000000AA000000AA000000AA000000B4000000FF000000FF000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            0000000000000000000000000009000000BB000000EE00000088000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            000000000000000000000000002F000000DD0000002F00000055000000FF0000
            0000000000000000000000000000000000FF0000005500000000000000000000
            0000000000000000000000000000000000050000000000000055000000FF0000
            0000000000000000000000000000000000FC0000008D00000055000000550000
            005500000055000000550000005500000055000000550000008D000000FC0000
            00000000000000000000000000000000009C000000FC000000FF000000FF0000
            00FF000000FF000000FF000000FF000000FF000000FF000000FC0000009A0000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000}
          ParentFont = False
          TabOrder = 2
          OnClick = btnSairClick
        end
      end
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 987
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
        Width = 987
        Height = 334
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
            Width = 362
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
        Top = 391
        Width = 987
        Height = 41
        Align = alBottom
        Color = 16774378
        ParentBackground = False
        TabOrder = 0
      end
      object pnlListagemTopo1: TPanel
        Left = 0
        Top = 0
        Width = 987
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
        Width = 987
        Height = 334
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
      DisplayFormat = '##,##0.00'
      currency = True
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
      'WHERE pv.status IN ('#39'PAGO'#39', '#39'CANCELADO'#39')')
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
      DisplayFormat = '##,##0.00'
      currency = True
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

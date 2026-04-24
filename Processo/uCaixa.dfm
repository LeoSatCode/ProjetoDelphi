object frmCaixa: TfrmCaixa
  Left = 0
  Top = 0
  Caption = 'Caixa'
  ClientHeight = 457
  ClientWidth = 999
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
    Width = 999
    Height = 457
    ActivePage = Pendentes
    Align = alClient
    TabOrder = 0
    object Pendentes: TTabSheet
      Caption = 'Pendentes'
      object pnl2: TPanel
        Left = 0
        Top = 388
        Width = 991
        Height = 41
        Align = alBottom
        Color = 16774378
        ParentBackground = False
        TabOrder = 0
        object btnReceber: TPngBitBtn
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
          ParentFont = False
          TabOrder = 0
          OnClick = btnReceberClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            61000000097048597300000B1300000B1301009A9C18000000E64944415478DA
            6364A0103052C5002929A9B6FFFFFF17333232B211A309A8F61790EA7EFEFC79
            0DD8004949C99F40CD279F3D7B66478C01400B0F030D31051AC00173C17FA066
            14EF484B4B7BFDFBF76F26D4C6B4172F5E6C473304AC07C500A04B8E025DF20F
            C8B605B21F03D9E140CD2035CB81B6C921CB633500E434908520AF800C00B223
            A0E1B40C6400B23C5603909D282121E109B40DD90B3B707A011A88A7404E2332
            108F000D35810722D0801620554A623476010DA8A54E424207401795035DD381
            26DC00F462235106603104AB66BC06400D6900D140BF3690E4058AC380140000
            62338F11BFFFBFBC0000000049454E44AE426082}
        end
        object btnCancelar: TPngBitBtn
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
          ParentFont = False
          TabOrder = 1
          OnClick = btnCancelarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            61000000097048597300000B1300000B1301009A9C18000001AD4944415478DA
            A593BB4BC35014C64D6B49402B7D589316B54B56A19B82956E0E3A5BF0B13889
            544444D13F41D041B050D0A13829D2C9A14E22BEF70AC5C14DD33486524433C4
            A6ADDF855C48A36D91060E27E7DC737EF7BB37274C57870F634F0483C109B804
            8CF87E980ABB85256559BE6F05E846F301C33093F57A7DC7E1705C0882A0148B
            45BE56AB4D21BF8D7C169035D41ABF00684EA1285CA954E2AAAA7ED9770A0402
            BD2E972B03C80B202B0D005376DA308C0869E679BE4751148D16D1D8EFF7BB59
            96CD01B2408F4301A77097481E9162A7D3F904D98B907F8D63C4709C74B55A1D
            2110C44B8863854261CE0A90901C9524E98DC466D3195E77619B80C509CCAC1D
            867BC066835680EEF57ADDF97CFE9BCA0E85421B1480DDF6685E144556D3B40F
            00B80605B8C03114BEB65380B5306AEF0018B2024EE0AE903C6C770750B68CDA
            28369BB702A2A01EEBBA1E29954A9FCDBE82CFE7EBE3382E87D42C008FF63948
            022202324320F639309B33787D46F36AB349DC07641AF2C924663D1E8F522E97
            0592C3FA16EC1CCDEB7F4EA245C9381A121816325C03B077C437E45FA0B25BFE
            4CFF7D3A06FC00BBBAE611379FF1D70000000049454E44AE426082}
        end
        object btnSair: TPngBitBtn
          Left = 888
          Top = 6
          Width = 91
          Height = 25
          Cancel = True
          Caption = '&Sair'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Variable Text Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnSairClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            61000000097048597300000B1300000B1301009A9C18000000584944415478DA
            636480022929A9FF0C448267CF9E31C2D88C543700599218405F03A06A3A816A
            2A28318001D910720D801B82D3002263A59352031A28F14203506D23B9068035
            931B8870CD241B800D50DF0062005573230069A461B4756035F1000000004945
            4E44AE426082}
        end
      end
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 991
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
        object btnPesquisar: TPngBitBtn
          Tag = 99
          Left = 295
          Top = 15
          Width = 114
          Height = 25
          Cursor = crHandPoint
          Caption = '&PESQUISAR'
          TabOrder = 1
          OnClick = btnPesquisarClick
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
        end
      end
      object gdrPendentes: TDBGrid
        Left = 0
        Top = 57
        Width = 991
        Height = 331
        Align = alClient
        DataSource = dtsPendentes
        DrawingStyle = gdsClassic
        FixedColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        Top = 388
        Width = 991
        Height = 41
        Align = alBottom
        Color = 16774378
        ParentBackground = False
        TabOrder = 0
        object PngBitBtn1: TPngBitBtn
          Left = 888
          Top = 6
          Width = 91
          Height = 25
          Cancel = True
          Caption = '&Sair'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI Variable Text Semibold'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnSairClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            61000000097048597300000B1300000B1301009A9C18000000584944415478DA
            636480022929A9FF0C448267CF9E31C2D88C543700599218405F03A06A3A816A
            2A28318001D910720D801B82D3002263A59352031A28F14203506D23B9068035
            931B8870CD241B800D50DF0062005573230069A461B4756035F1000000004945
            4E44AE426082}
        end
      end
      object pnlListagemTopo1: TPanel
        Left = 0
        Top = 0
        Width = 991
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
        object btnPesquisar1: TPngBitBtn
          Tag = 99
          Left = 295
          Top = 15
          Width = 114
          Height = 25
          Cursor = crHandPoint
          Caption = '&PESQUISAR'
          TabOrder = 1
        end
      end
      object gdrFaturados: TDBGrid
        Left = 0
        Top = 57
        Width = 991
        Height = 331
        Align = alClient
        DataSource = dtsFaturados
        DrawingStyle = gdsClassic
        FixedColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
      DisplayFormat = 'R$ ##,##0.00'
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
      DisplayFormat = 'R$ ##,##0.00'
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

inherited frmProVendas: TfrmProVendas
  Caption = 'Vendas'
  ClientWidth = 1003
  ExplicitTop = -142
  ExplicitWidth = 1009
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Width = 1003
    ExplicitWidth = 1003
    inherited btnFechar: TBitBtn
      Left = 912
      ExplicitLeft = 912
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 1003
    ExplicitWidth = 1003
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 995
      ExplicitHeight = 433
      inherited pnlListagemTopo: TPanel
        Width = 995
        ExplicitWidth = 995
      end
      inherited gdrListagem: TDBGrid
        Width = 995
        Columns = <
          item
            Expanded = False
            FieldName = 'preVendaId'
            Title.Caption = 'N'#250'mero Pr'#233' Venda'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clienteId'
            Title.Caption = 'C'#243'd Cliente'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataEmissao'
            Title.Caption = 'Data Emissao'
            Width = 107
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
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 995
      ExplicitHeight = 433
      object pnl1: TPanel
        Left = 0
        Top = 83
        Width = 995
        Height = 350
        Align = alBottom
        TabOrder = 0
        object pnl2: TPanel
          Left = 1
          Top = 1
          Width = 993
          Height = 65
          Align = alTop
          Color = 16774378
          ParentBackground = False
          TabOrder = 0
          object lblCliente1: TLabel
            Left = 11
            Top = 8
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
          object lblQuantidade: TLabel
            Left = 407
            Top = 8
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
          end
          object lblQuantidade2: TLabel
            Left = 534
            Top = 8
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object lblQuantidade3: TLabel
            Left = 661
            Top = 8
            Width = 80
            Height = 13
            Caption = 'Total do Produto'
          end
          object lkpProduto: TDBLookupComboBox
            Left = 1
            Top = 27
            Width = 388
            Height = 21
            KeyField = 'produtoId'
            ListField = 'nome'
            ListSource = dtmVenda.dtsProdutos
            TabOrder = 0
            OnExit = lkpProdutoExit
          end
          object edtValorUnitario: TCurrencyEdit
            Left = 407
            Top = 27
            Width = 121
            Height = 21
            DisplayFormat = ',0.00;- ,0.00'
            TabOrder = 1
          end
          object edtQuantidade: TCurrencyEdit
            Left = 534
            Top = 27
            Width = 121
            Height = 21
            DisplayFormat = ',0.00;- ,0.00'
            TabOrder = 2
            OnEnter = edtQuantidadeEnter
            OnExit = edtQuantidadeExit
          end
          object edtTotalProduto: TCurrencyEdit
            Left = 661
            Top = 27
            Width = 121
            Height = 21
            TabStop = False
            Color = clSilver
            DisplayFormat = ',0.00;- ,0.00'
            ReadOnly = True
            TabOrder = 3
          end
          object btnAdicionar: TBitBtn
            Left = 793
            Top = 25
            Width = 97
            Height = 25
            Caption = 'A&DICIONAR'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
              4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
              B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
              C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
              6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
              53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
              D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
              F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
              0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
              DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
              F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
              C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
              E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
              FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
              C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
              EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
              CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
              F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
              FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
              CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
              17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            TabOrder = 4
            OnClick = btnAdicionarClick
          end
          object btnRemover: TBitBtn
            Left = 896
            Top = 25
            Width = 85
            Height = 25
            Caption = 'R&EMOVER'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              4442BC3C3CAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0303
              7B02028CFF00FFFF00FFFF00FF514FC52222C83030C84848B7FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF1010870505A10101A204028DFF00FF5959CA2929D2
              1717D01616CE3838D15151BFFF00FFFF00FFFF00FFFF00FF2121940E0EA70101
              A60101A60101A204028D5555C34444DD1C1CDB1B1BD91A1AD53F3FD85757C4FF
              00FFFF00FF3434A41A1AB30202A80101A60101A602029F020278FF00FF6262CF
              4C4CE62121E31F1FDF1C1CDA4242DC5656C44848B72A2AC40A0AB60505AE0101
              A70505A003037BFF00FFFF00FFFF00FF6F6FD85656ED2424E82121E31D1DDD3F
              3FDA3838D31111C50D0DBC0808B40F0FA90D0D80FF00FFFF00FFFF00FFFF00FF
              FF00FF7777DD5959EF2626EA2121E41D1DDC1919D41414CB1010C21C1CB71D1D
              90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7676DB5757EC2626EA21
              21E31C1CDA1717D02828C52B2B9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF8888D97676EE3636ED2424E81E1EDE1919D52929C72B2B9EFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9191D98D8DED6E6EF26363F14F
              4FEE3636E52121D91616CD1F1FBD1D1D92FF00FFFF00FFFF00FFFF00FFFF00FF
              9797D79E9EEB8787F57D7DF47272F37777E66D6DE15555E34646D93434CE2B2B
              B822228FFF00FFFF00FFFF00FF9C9CD4ACACEA9C9CF79494F68A8AF58B8BE776
              76CA6868C26C6CDA5B5BDE5252D54848CC4141B82F2F91FF00FF9D9DD0B4B4E7
              AEAEF8A7A7F89F9FF79B9BE68181CBFF00FFFF00FF6262B86B6BD25D5DD75151
              CE4747C54141B4323293A9A9C7B8B8EFB5B5F9AFAFF8A8A8E58888CCFF00FFFF
              00FFFF00FFFF00FF5959B06565CB5555CE4B4BC54545BB4343A4FF00FFAAA9C6
              BABAEEB1B1E48F8FCAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5656AD5C5C
              C54F4FC14D4DAAFF00FFFF00FFFF00FFACABC69898CEFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FF5050A95858AFFF00FFFF00FF}
            TabOrder = 5
            TabStop = False
            OnClick = btnRemoverClick
          end
        end
        object pnl3: TPanel
          Left = 1
          Top = 66
          Width = 993
          Height = 242
          Align = alClient
          TabOrder = 1
          object dbgridItensVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 991
            Height = 240
            Align = alClient
            DataSource = dtmVenda.dtsItensVenda
            DrawingStyle = gdsClassic
            FixedColor = clGrayText
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgridItensVendaDrawColumnCell
            OnDblClick = dbgridItensVendaDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'produtoId'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorUnitario'
                Width = 147
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorTotalProduto'
                Width = 269
                Visible = True
              end>
          end
        end
        object pnl4: TPanel
          Left = 1
          Top = 308
          Width = 993
          Height = 41
          Align = alBottom
          TabOrder = 2
          object lblValor: TLabel
            Left = 771
            Top = 14
            Width = 84
            Height = 13
            Caption = 'Valor da Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorTotalProduto: TCurrencyEdit
            Left = 861
            Top = 6
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 0
          end
        end
      end
      object pnl5: TPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 83
        Align = alClient
        Color = 16774378
        ParentBackground = False
        TabOrder = 1
        object lblCliente: TLabel
          Left = 160
          Top = 37
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object lblData: TLabel
          Left = 638
          Top = 37
          Width = 56
          Height = 13
          Caption = 'Data Venda'
        end
        object btnCadCliente: TSpeedButton
          Left = 544
          Top = 55
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FF26B7FF26B7FF26B7FF26B7FF26B7FF26B7FF26B7FF029B100099000599
            10FF00FFFF00FFFF00FFFF00FFFF00FF26B7FF22B4FF34BDFF64D4FF77DCFF6E
            DCFF61DDFF67E1FF00990025B22800990026B7FFFF00FFFF00FFFF00FFFF00FF
            26B7FF4EC8FF64D4FF9EE8FFB8F0FFA5EEFF8CECFF90EEFF00990044C0460099
            0026B7FFFF00FFFF00FFFF00FFFF00FF26B7FF73D6FF61D3FF9AE6FFB5EFFF0A
            9E1000990000990000990061CE62009900009900009900009900FF00FFFF00FF
            26B7FF8CDEFF5ED3FF96E5FFB0EDFF009900AAECABADEEADA0ED9F80E57F61D0
            6037B63718A618009900FF00FFFF00FF26B7FFA5E5FF59D2FF91E4FFABEAFF09
            9E100099000099000099009EEB9F009900009900009900009900FF00FFFF00FF
            26B7FFBEECFF5ED4FF8CE3FFA6EAFF85E1FF59D7FF58D6FF009900A6EBA60099
            0026B7FFFF00FFFF00FFFF00FFFF00FF26B7FF96DBFFC2EDFFD2F4FFD5F5FFD4
            F5FFD2F4FFD2F4FF0099009CE79E00990026B7FFFF00FFFF00FFFF00FFFF00FF
            26B7FF22B2FF2FBDFF4ACBFF58D3FF56D5FF51D8FF57DCFF059D10009900039B
            1026B7FFFF00FFFF00FFFF00FFFF00FF26B7FF47C4FF62D3FF9DE8FFB9F0FFA6
            EEFF8EECFF92EFFF8FEDFF71E2FF33C3FF26B7FFFF00FFFF00FFFF00FFFF00FF
            26B7FF70D5FF60D3FF9AE6FFB6EFFFA0ECFF83E7FF85E9FF82E8FF68DEFF32C1
            FF26B7FFFF00FFFF00FFFF00FFFF00FF26B7FF88DCFF5DD2FF96E5FFB1EDFF99
            E9FF77E2FF76E3FF74E2FF5ED9FF2EBEFF26B7FFFF00FFFF00FFFF00FFFF00FF
            26B7FFA1E4FF59D2FF91E3FFACEBFF90E5FF69DDFF68DDFF67DDFF53D3FF29BA
            FF26B7FFFF00FFFF00FFFF00FFFF00FF26B7FFBAEBFF54D2FF8CE3FFA7E9FF88
            E2FF5CD7FF5AD7FF58D7FF48CEFF39C0FF26B7FFFF00FFFF00FFFF00FFFF00FF
            26B7FFAAE5FFC6F0FFC1F0FFCBF3FFC1F0FFB3ECFFB2ECFFB1ECFFBDEEFF9FE4
            FF26B7FFFF00FFFF00FFFF00FFFF00FFFF00FF26B7FF26B7FF26B7FF26B7FF26
            B7FF26B7FF26B7FF26B7FF26B7FF26B7FFFF00FFFF00FFFF00FF}
          OnClick = btnCadClienteClick
        end
        object bntConCliente: TSpeedButton
          Left = 575
          Top = 55
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FF14A4FF14A4FF14A4FF14A4FF14A4FF14A4FF14A4FF14A4FF14A4FF14A4
            FF6B7E879E9E9E7B7A7AFF00FFFF00FF14A4FF11A0FF1FABFF49C7FF5CD1FF53
            D1FF46D3FF4CD8FF49D5FF2CC1FF4194BEABACAC7B7D7D838383FF00FFFF00FF
            14A4FF35B8FF49C7FF87E1FFA5EBFF8FE9FF73E6FF77E9FF74E7FF5AC4E38E98
            9D818282868787FF00FFFF00FFFF00FF14A4FF58CAFF46C6FF82DEFFA1EAFF87
            E5FF66E0FF68E1FF67D8F679939A8989896D8E9EFF00FFFF00FFFF00FFFF00FF
            14A4FF73D4FF43C6FF7DD7F688A6B06970736A707377888C70929C8889896887
            9619A0F6FF00FFFF00FFFF00FFFF00FF14A4FF8FDDFF41C0F66E797D999897DC
            DAD9D0CFCEC4C1C1959395777B7F1AA3F614A4FFFF00FFFF00FFFF00FFFF00FF
            14A4FFACE6FF648F9E96908AEAE3DCDDD8D1CFCAC4CEC9C4CCC9C29996974EA7
            D314A4FFFF00FFFF00FFFF00FFFF00FF14A4FF7FD2FF727373FFF3E7FEF3E6FE
            F3E7FCF3E6FCF3E7FEF3E7E1D7D18C9CA314A4FFFF00FFFF00FFFF00FFFF00FF
            14A4FF129EFF6D7372DEC4A6D9CAB7DACBBADCCCBBE0D0C0DCCEBDCEC1B27A8C
            9514A4FFFF00FFFF00FFFF00FFFF00FF14A4FF2EB4FF6A7375FFE6CAFFEDD9FF
            EAD1FBE5CCFCE9D1F7E5D0D9CBBD778F9914A4FFFF00FFFF00FFFF00FFFF00FF
            14A4FF55C9FF648692CFBBA5FFEDD8FAE7D1F2E0CAF4E2CCF2E0CBABA4A04299
            C414A4FFFF00FFFF00FFFF00FFFF00FF14A4FF6ED1FF48BAED727778D3C7BAF4
            E3D0EAD9C6E9D9C6BDB6B0788F961AACFF14A4FFFF00FFFF00FFFF00FFFF00FF
            14A4FF8ADCFF3FC5FF77C6E3818F93868C8F939A9E8891936D9EAD3DC1F616A7
            FF14A4FFFF00FFFF00FFFF00FFFF00FF14A4FFA7E5FF3AC5FF73DAFF91E2FF6E
            D9FF41CBFF40CBFF3ECBFF2FC0FF23AFFF14A4FFFF00FFFF00FFFF00FFFF00FF
            14A4FF95DDFFB6EBFFB0EBFFBCEFFFB0EBFF9FE6FF9EE6FF9DE6FFABE9FF88DC
            FF14A4FFFF00FFFF00FFFF00FFFF00FFFF00FF14A4FF14A4FF14A4FF14A4FF14
            A4FF14A4FF14A4FF14A4FF14A4FF14A4FFFF00FFFF00FFFF00FF}
          OnClick = bntConClienteClick
        end
        object edtVendaId: TLabeledEdit
          Tag = 1
          Left = 2
          Top = 56
          Width = 121
          Height = 21
          EditLabel.Width = 70
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero Venda'
          MaxLength = 10
          NumbersOnly = True
          TabOrder = 0
        end
        object lkpCliente: TDBLookupComboBox
          Left = 160
          Top = 56
          Width = 378
          Height = 21
          KeyField = 'clienteId'
          ListField = 'nome'
          ListSource = dtmVenda.dtsCliente
          TabOrder = 1
          OnCloseUp = lkpClienteCloseUp
        end
        object edtDataVenda: TDateEdit
          Left = 638
          Top = 56
          Width = 121
          Height = 21
          ClickKey = 114
          DialogTitle = 'Selecione a Data'
          NumGlyphs = 2
          CalendarStyle = csDialog
          TabOrder = 2
        end
      end
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECT '
      '    pv.preVendaId,'
      '    pv.clienteId,'
      '    c.nome,'
      '    pv.dataEmissao,'
      '    pv.totalVenda,'
      '    pv.status'
      'FROM preVenda pv'
      'INNER JOIN clientes c ON c.clienteId = pv.clienteId')
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
      Origin = 'clienteId'
      Required = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object QryListagemdataEmissao: TSQLTimeStampField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'dataEmissao'
      Origin = 'dataEmissao'
      Required = True
    end
    object QryListagemtotalVenda: TFMTBCDField
      DisplayLabel = 'Total Venda'
      FieldName = 'totalVenda'
      Origin = 'totalVenda'
      Required = True
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
  inherited ilimage: TImageList
    Left = 796
  end
end

inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        Height = 55
        ExplicitHeight = 55
      end
      inherited gdrListagem: TDBGrid
        Top = 55
        Width = 748
        Height = 378
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 185
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 213
            Visible = True
          end>
      end
      object pnlImage1: TPanel
        Left = 748
        Top = 55
        Width = 185
        Height = 378
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object imgProduto: TImage
          Left = 1
          Top = 1
          Width = 183
          Height = 376
          Align = alClient
          ExplicitLeft = 0
          ExplicitTop = 29
          ExplicitHeight = 225
        end
      end
    end
    inherited tabManutencao: TTabSheet
      object lblDescricao: TLabel
        Left = 12
        Top = 149
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblValor: TLabel
        Left = 12
        Top = 309
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblQuantidade: TLabel
        Left = 194
        Top = 309
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lblDescricao1: TLabel
        Left = 535
        Top = 85
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object btnIncluirCategoria: TSpeedButton
        Left = 602
        Top = 104
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
        OnClick = btnIncluirCategoriaClick
      end
      object btnPesquisarCategoria: TSpeedButton
        Left = 631
        Top = 104
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
        OnClick = btnPesquisarCategoriaClick
      end
      object edtProdutoId: TLabeledEdit
        Tag = 1
        Left = 12
        Top = 56
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 104
        Width = 317
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtDescricao: TMemo
        Left = 12
        Top = 168
        Width = 642
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object edtValor: TCurrencyEdit
        Left = 12
        Top = 328
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtQuantidade: TCurrencyEdit
        Left = 194
        Top = 328
        Width = 121
        Height = 21
        DisplayFormat = ',0.00;- ,0.00'
        TabOrder = 5
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 335
        Top = 104
        Width = 261
        Height = 21
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
        TabOrder = 2
      end
      object pnlImage: TPanel
        Left = 719
        Top = 104
        Width = 161
        Height = 153
        BorderStyle = bsSingle
        TabOrder = 6
        object imgImage: TImage
          Left = 1
          Top = 1
          Width = 155
          Height = 147
          Align = alClient
          PopupMenu = ppmImage
          ExplicitTop = -2
        end
      end
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECT p.produtoId,'
      '          p.nome,'
      '          p.foto,'
      '          p.descricao,'
      '          p.valor,'
      '          p.quantidade,'
      '          p.categoriaId,'
      '          c.descricao As DescricaoCategoria'
      '     FROM produtos as p'
      
        '                LEFT JOIN categorias as c on c.categoriaId = p.c' +
        'ategoriaId')
    Left = 420
    Top = 120
    object fdtncfldQryListagemprodutoId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object strngfldQryListagemnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object strngfldQryListagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 255
    end
    object fmtbcdfldQryListagemvalor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = 'R$ ##,##0.00'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldQryListagemquantidade: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 5
    end
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'd. Categoia'
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
    end
    object strngfldQryListagemDescricaoCategoria: TStringField
      DisplayLabel = 'Descricao da Categoria'
      FieldName = 'DescricaoCategoria'
      Origin = 'DescricaoCategoria'
      Size = 30
    end
    object QryListagemfoto: TBlobField
      FieldName = 'foto'
      Origin = 'foto'
      Size = 2147483647
    end
  end
  inherited dtsListagem: TDataSource
    OnDataChange = dtsListagemDataChange
    Left = 580
  end
  inherited ilimage: TImageList
    Left = 500
  end
  object QryCategoria: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT categoriaId, descricao from categorias')
    Left = 420
    Top = 32
    object fdtncfldQryCategoriacategoriaId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldQryCategoriadescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 30
    end
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 500
    Top = 120
  end
  object ppmImage: TPopupMenu
    Left = 683
    Top = 32
    object CarregarImagem1: TMenuItem
      Caption = 'Carregar Imagem'
      OnClick = CarregarImagem1Click
    end
    object LimparImagem1: TMenuItem
      Caption = 'Limpar Imagem'
      OnClick = LimparImagem1Click
    end
  end
end

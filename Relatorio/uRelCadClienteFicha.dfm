object frmRelClienteFicha: TfrmRelClienteFicha
  Left = 0
  Top = 0
  Caption = 'Ficha de Clientes'
  ClientHeight = 520
  ClientWidth = 880
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Relatorio: TRLReport
    Left = -8
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dtsCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object rlbl1: TRLLabel
        Left = 5
        Top = 26
        Width = 179
        Height = 24
        Caption = 'Ficha de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rldrw1: TRLDraw
        Left = 0
        Top = 50
        Width = 718
        Height = 9
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 224
      Width = 718
      Height = 37
      BandType = btFooter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object rldrw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 9
        Align = faCenterTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object rlsystmnf1: TRLSystemInfo
        Left = 5
        Top = 10
        Width = 65
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object rlsystmnf2: TRLSystemInfo
        Left = 656
        Top = 10
        Width = 16
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object rlsystmnf3: TRLSystemInfo
        Left = 688
        Top = 10
        Width = 112
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Info = itLastPageNumber
        ParentFont = False
        Text = ''
      end
      object rlbl2: TRLLabel
        Left = 676
        Top = 10
        Width = 8
        Height = 16
        Caption = '/'
      end
      object rlbl3: TRLLabel
        Left = 599
        Top = 10
        Width = 53
        Height = 16
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Detail: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 119
      object rldbtxtcategoriaId: TRLDBText
        Left = 79
        Top = 3
        Width = 52
        Height = 16
        DataField = 'clienteId'
        DataSource = dtsCliente
        Text = ''
      end
      object rldbtxtcategoriaId1: TRLDBText
        Left = 368
        Top = 3
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsCliente
        Text = ''
      end
      object rldbtxtnome1: TRLDBText
        Left = 79
        Top = 25
        Width = 57
        Height = 16
        DataField = 'endereco'
        DataSource = dtsCliente
        Text = ''
      end
      object rlbl6: TRLLabel
        Left = 2
        Top = 91
        Width = 64
        Height = 16
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbl7: TRLLabel
        Left = 2
        Top = 25
        Width = 68
        Height = 16
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbl5: TRLLabel
        Left = 298
        Top = 3
        Width = 45
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbl4: TRLLabel
        Left = 2
        Top = 3
        Width = 53
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rlbl8: TRLLabel
        Left = 298
        Top = 25
        Width = 47
        Height = 16
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbtxtendereco: TRLDBText
        Left = 368
        Top = 25
        Width = 36
        Height = 16
        DataField = 'bairro'
        DataSource = dtsCliente
        Text = ''
      end
      object rlbl9: TRLLabel
        Left = 2
        Top = 47
        Width = 53
        Height = 16
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbtxtbairro: TRLDBText
        Left = 79
        Top = 47
        Width = 42
        Height = 16
        DataField = 'cidade'
        DataSource = dtsCliente
        Text = ''
      end
      object rlbl10: TRLLabel
        Left = 298
        Top = 47
        Width = 50
        Height = 16
        Caption = 'Estado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbtxtcidade: TRLDBText
        Left = 368
        Top = 47
        Width = 43
        Height = 16
        DataField = 'estado'
        DataSource = dtsCliente
        Text = ''
      end
      object rlbl11: TRLLabel
        Left = 2
        Top = 69
        Width = 34
        Height = 16
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbtxtestado: TRLDBText
        Left = 78
        Top = 69
        Width = 25
        Height = 16
        DataField = 'cep'
        DataSource = dtsCliente
        Text = ''
      end
      object rlbl12: TRLLabel
        Left = 298
        Top = 69
        Width = 44
        Height = 16
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbtxttelefone: TRLDBText
        Left = 369
        Top = 69
        Width = 35
        Height = 16
        DataField = 'email'
        DataSource = dtsCliente
        Text = ''
      end
      object rlbl13: TRLLabel
        Left = 298
        Top = 91
        Width = 64
        Height = 16
        Caption = 'Data Nas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object rldbtxttelefone1: TRLDBText
        Left = 368
        Top = 91
        Width = 96
        Height = 16
        DataField = 'datanascimento'
        DataSource = dtsCliente
        Text = ''
      end
      object rldbtxtnome: TRLDBText
        Left = 79
        Top = 91
        Width = 49
        Height = 16
        DataField = 'telefone'
        DataSource = dtsCliente
        Text = ''
      end
      object rldrw3: TRLDraw
        Left = 0
        Top = 115
        Width = 718
        Height = 4
        Align = faBottom
        DrawKind = dkLine
        Pen.Style = psDot
      end
    end
    object rlbnd1: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 8
      BandType = btColumnHeader
    end
  end
  object QryFichaCliente: TFDQuery
    Active = True
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT  clienteId,'
      '        nome,'
      '        endereco,'
      '        bairro,'
      '        cidade,'
      '        estado,'
      '        cep,'
      '        email,'
      '        telefone,'
      '        datanascimento'
      '  FROM clientes'
      'ORDER BY clientes.nome')
    Left = 752
    object fdtncfldQryClienteclienteId: TFDAutoIncField
      FieldName = 'clienteId'
      Origin = 'clienteId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldQryClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object strngfldQryClientetelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object strngfldQryClienteemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object strngfldQryClienteendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 60
    end
    object strngfldQryClientebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 40
    end
    object strngfldQryClientecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 50
    end
    object strngfldQryClienteestado: TStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 2
    end
    object strngfldQryClientecep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object sqltmstmpfldQryClientedatanascimento: TSQLTimeStampField
      FieldName = 'datanascimento'
      Origin = 'datanascimento'
    end
  end
  object dtsCliente: TDataSource
    DataSet = QryFichaCliente
    Left = 624
  end
  object rlpdfltr1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 688
    Top = 32
  end
end

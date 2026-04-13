object frmRelCliente: TfrmRelCliente
  Left = 0
  Top = 0
  Caption = 'Listagem de Clientes'
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
        Width = 217
        Height = 24
        Caption = 'Listagem de Clientes'
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
      Top = 175
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
      Top = 130
      Width = 718
      Height = 45
      object rldbtxtcategoriaId: TRLDBText
        Left = 5
        Top = 14
        Width = 52
        Height = 16
        DataField = 'clienteId'
        DataSource = dtsCliente
        Text = ''
      end
      object rldbtxtcategoriaId1: TRLDBText
        Left = 85
        Top = 14
        Width = 36
        Height = 16
        DataField = 'nome'
        DataSource = dtsCliente
        Text = ''
      end
      object rldbtxtnome: TRLDBText
        Left = 592
        Top = 14
        Width = 49
        Height = 16
        DataField = 'telefone'
        DataSource = dtsCliente
        Text = ''
      end
      object rldbtxtnome1: TRLDBText
        Left = 328
        Top = 14
        Width = 35
        Height = 16
        DataField = 'email'
        DataSource = dtsCliente
        Text = ''
      end
    end
    object rlbnd1: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 33
      BandType = btColumnHeader
      object rlpnl1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object rlbl4: TRLLabel
          Left = 5
          Top = 10
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl5: TRLLabel
          Left = 85
          Top = 10
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl6: TRLLabel
          Left = 592
          Top = 11
          Width = 60
          Height = 16
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl7: TRLLabel
          Left = 328
          Top = 10
          Width = 44
          Height = 16
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
    end
  end
  object QryCliente: TFDQuery
    Active = True
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT clientes.clienteId,'
      #9'   clientes.nome,'
      #9'   clientes.email,'
      #9'   clientes.telefone'
      '  FROM clientes'
      'ORDER BY clientes.nome   ')
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
  end
  object dtsCliente: TDataSource
    DataSet = QryCliente
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

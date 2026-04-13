object frmRelCategoria: TfrmRelCategoria
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Categorias'
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
    DataSource = dtsCategorias
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
        Width = 245
        Height = 24
        Caption = 'Listagem de Categorias'
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
        Width = 67
        Height = 16
        DataField = 'categoriaId'
        DataSource = dtsCategorias
        Text = ''
      end
      object rldbtxtcategoriaId1: TRLDBText
        Left = 85
        Top = 14
        Width = 60
        Height = 16
        DataField = 'descricao'
        DataSource = dtsCategorias
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
          Width = 66
          Height = 16
          Caption = 'Descri'#231#227'o'
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
  object QryCategorias: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT categoriaId, descricao FROM categorias')
    Left = 752
    object fdtncfldQryCategoriascategoriaId: TFDAutoIncField
      FieldName = 'categoriaId'
      Origin = 'categoriaId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldQryCategoriasdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 30
    end
  end
  object dtsCategorias: TDataSource
    DataSet = QryCategorias
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

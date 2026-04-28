object frmGenerico: TfrmGenerico
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Gen'#233'rico'
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
    Left = 8
    Top = -8
    Width = 794
    Height = 1123
    DataSource = dsMaster
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
        Left = 3
        Top = 29
        Width = 193
        Height = 24
        Caption = 'Relat'#243'rio Gen'#233'rico'
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
    object rlbnds: TRLBand
      Left = 38
      Top = 241
      Width = 718
      Height = 32
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
        Left = 681
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
    object BandaDoGrupo: TRLGroup
      Left = 38
      Top = 97
      Width = 718
      Height = 120
      object rlbnd2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 21
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object rlbl9: TRLLabel
          Left = 5
          Top = 3
          Width = 52
          Height = 16
          Caption = 'VENDA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rldbtxtprodutoId1: TRLDBText
          Left = 62
          Top = 3
          Width = 100
          Height = 16
          DataSource = dsMaster
          Text = ''
          Transparent = False
        end
      end
      object rlbnd3: TRLBand
        Left = 0
        Top = 21
        Width = 718
        Height = 24
        object rldbtxtprodutoId: TRLDBText
          Left = 62
          Top = 4
          Width = 93
          Height = 16
          DataSource = dsMaster
          Text = ''
        end
        object rldbtxtnome: TRLDBText
          Left = 120
          Top = 4
          Width = 72
          Height = 16
          DataSource = dsMaster
          Text = ''
        end
        object rldbtxtvalor: TRLDBText
          Left = 508
          Top = 4
          Width = 66
          Height = 16
          DataSource = dsMaster
          Text = ''
        end
        object rlbl5: TRLLabel
          Left = 3
          Top = 4
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object rlbl6: TRLLabel
          Left = 380
          Top = 4
          Width = 102
          Height = 16
          Caption = 'Data da Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object rlsbdtl1: TRLSubDetail
        Left = 0
        Top = 45
        Width = 718
        Height = 52
        DataSource = dsDetalhes
        object rlbnd1: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          BandType = btColumnHeader
          Color = 12615808
          ParentColor = False
          Transparent = False
          object rlbl10: TRLLabel
            Left = 3
            Top = 4
            Width = 64
            Height = 16
            Caption = 'Produtos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl4: TRLLabel
            Left = 380
            Top = 4
            Width = 82
            Height = 16
            Caption = 'Quantidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl8: TRLLabel
            Left = 632
            Top = 3
            Width = 63
            Height = 16
            Caption = 'Valor Un:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rlbl11: TRLLabel
            Left = 508
            Top = 3
            Width = 66
            Height = 16
            Caption = 'Venda ID:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object rldbtxtvendaId: TRLDBText
            Left = 580
            Top = 3
            Width = 48
            Height = 16
            DataField = 'vendaId'
            DataSource = dsDetalhes
            Text = ''
          end
        end
        object rlbnd4: TRLBand
          Left = 0
          Top = 25
          Width = 718
          Height = 24
          object RLDBText1: TRLDBText
            Left = 5
            Top = 4
            Width = 70
            Height = 16
            DataSource = dsDetalhes
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 120
            Top = 5
            Width = 70
            Height = 16
            DataSource = dsDetalhes
            Text = ''
          end
          object rldbtxtNome1: TRLDBText
            Left = 380
            Top = 4
            Width = 82
            Height = 16
            Alignment = taCenter
            DataSource = dsDetalhes
            Text = ''
          end
          object rldbtxtvalorUnitario: TRLDBText
            Left = 632
            Top = 4
            Width = 110
            Height = 16
            DataSource = dsDetalhes
            Text = ''
          end
        end
      end
    end
    object rlbnd5: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 24
      BandType = btSummary
      object rldbrsltTotalVenda: TRLDBResult
        Left = 632
        Top = 5
        Width = 43
        Height = 16
        DataSource = dsMaster
        Info = riSum
        Text = ''
      end
      object rldrw4: TRLDraw
        Left = 531
        Top = -3
        Width = 201
        Height = 9
        DrawKind = dkLine
      end
      object rlbl7: TRLLabel
        Left = 521
        Top = 6
        Width = 105
        Height = 16
        Caption = 'Total da Venda:'
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
  object QryMaster: TFDQuery
    Connection = dtmConexao.ConexaoDB
    Left = 752
  end
  object dsMaster: TDataSource
    DataSet = QryMaster
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
  object dsDetalhes: TDataSource
    DataSet = QryDetalhes
    Left = 616
    Top = 320
  end
  object QryDetalhes: TFDQuery
    Connection = dtmConexao.ConexaoDB
    Left = 744
    Top = 320
  end
end

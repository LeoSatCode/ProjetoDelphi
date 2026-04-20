object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 467
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stbPrincipal: TStatusBar
    Left = 0
    Top = 448
    Width = 921
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object grdpnl1: TGridPanel
    Left = 0
    Top = 32
    Width = 921
    Height = 416
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = pnl1
        Row = 0
      end
      item
        Column = 1
        Control = pnl2
        Row = 0
      end
      item
        Column = 0
        Control = pnl3
        Row = 1
      end
      item
        Column = 1
        Control = pnl4
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 1
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 459
      Height = 207
      Align = alClient
      TabOrder = 0
      object dbcht1: TDBChart
        Left = 1
        Top = 1
        Width = 457
        Height = 205
        Title.Text.Strings = (
          'Produto em Estoque')
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object ProdutoEstoque: TBarSeries
          Legend.Picture.FilterItems = <
            item
              ItemClass = 'TColorFilter'
              Red = 255
              Green = -255
              Blue = -255
            end>
          Cursor = crHandPoint
          DarkPen = 20
          Marks.Brush.Gradient.Colors = <
            item
              Color = clRed
            end
            item
              Color = 819443
              Offset = 0.067915690866510540
            end
            item
              Color = clYellow
              Offset = 1.000000000000000000
            end>
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = clYellow
          Marks.Brush.Gradient.MidColor = 819443
          Marks.Brush.Gradient.StartColor = clRed
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Visible = False
          DataSource = dtmGrafico.QryProdutoEstoque
          SeriesColor = 14862522
          XLabelsSource = 'Label'
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'Value'
        end
      end
    end
    object pnl2: TPanel
      Left = 460
      Top = 1
      Width = 460
      Height = 207
      Align = alClient
      TabOrder = 1
      object DBChart1: TDBChart
        Left = 1
        Top = 1
        Width = 458
        Height = 205
        Cursor = crHandPoint
        Title.Text.Strings = (
          'Valor de Venda por Cliente')
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsRightValue
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 3
        object PieSeries1: TPieSeries
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = 11195292
          Marks.Brush.Gradient.StartColor = 10351246
          Marks.Brush.Gradient.Visible = True
          Marks.ChildLayout = slLeftRight
          Marks.Font.Color = 159
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Font.Brush.Gradient.Balance = 40
          Marks.Font.Brush.Gradient.EndColor = clBlack
          Marks.Font.Brush.Gradient.MidColor = 6684723
          Marks.Font.Brush.Gradient.StartColor = 14590930
          Marks.Font.Brush.Gradient.Visible = True
          Marks.Frame.Color = 33023
          Marks.Frame.Fill.Gradient.EndColor = 12512906
          Marks.Frame.Fill.Gradient.StartColor = 12909467
          Marks.Frame.Fill.Gradient.Visible = True
          Marks.RoundSize = 14
          Marks.Style = smsPercentTotal
          Marks.BackColor = 4227327
          Marks.Callout.Length = 20
          Marks.Symbol.Brush.Color = clBlack
          Marks.TextAlign = taLeftJustify
          Marks.Color = 4227327
          DataSource = dtmGrafico.QryVendaValorPorCliente
          Title = 'ValorDeVendaPorCliente'
          XLabelsSource = 'Label'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'Value'
          CustomXRadius = 65
          CustomYRadius = 45
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          Shadow.Color = 8816262
          Shadow.HorizSize = 9
          Shadow.VertSize = 9
          Gradient.EndColor = 16764108
          Gradient.MidColor = clAqua
          Gradient.StartColor = 16764108
          OtherSlice.Legend.Alignment = laLeft
          OtherSlice.Legend.Visible = False
          RotationAngle = 73
        end
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 208
      Width = 459
      Height = 207
      Align = alClient
      TabOrder = 2
      object dbcht31: TDBChart
        Left = 1
        Top = 1
        Width = 457
        Height = 205
        Title.Text.Strings = (
          'Vendas da '#218'ltima Semana')
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsValue
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 7
        object fstlnsrsSeries21: TFastLineSeries
          Selected.Hover.Visible = True
          Marks.Brush.Gradient.Balance = 0
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = 16771515
          Marks.Brush.Gradient.StartColor = 16777158
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Visible = True
          Marks.Style = smsPercentTotal
          Marks.Callout.Length = 20
          DataSource = dtmGrafico.QryVendasDaUltimaSemana
          Title = 'VendasDaUltimaSemana'
          XLabelsSource = 'Label'
          LinePen.Color = 6724095
          TreatNulls = tnDontPaint
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'value'
        end
      end
    end
    object pnl4: TPanel
      Left = 460
      Top = 208
      Width = 460
      Height = 207
      Align = alClient
      TabOrder = 3
      object dbcht3: TDBChart
        Left = 1
        Top = 1
        Width = 458
        Height = 205
        Title.Text.Strings = (
          'Os 10 Produtos Mais Vendidos')
        Legend.Alignment = laBottom
        Legend.TextStyle = ltsRightValue
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 7
        object psrsSeries2: TPieSeries
          Marks.Brush.Gradient.Balance = 0
          Marks.Brush.Gradient.Direction = gdTopBottom
          Marks.Brush.Gradient.EndColor = 16771515
          Marks.Brush.Gradient.StartColor = 16777158
          Marks.Brush.Gradient.Visible = True
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = [fsBold, fsItalic]
          Marks.Frame.Color = 33023
          Marks.RoundSize = 14
          Marks.Style = smsPercentTotal
          Marks.Callout.Length = 20
          DataSource = dtmGrafico.QryProdutosMaisVendidos
          Title = 'Os10ProdutosMaisVendidos'
          XLabelsSource = 'label'
          XValues.Order = loAscending
          YValues.Name = 'Pie'
          YValues.Order = loNone
          YValues.ValueSource = 'Value'
          CustomXRadius = 65
          CustomYRadius = 45
          Frame.InnerBrush.BackColor = clRed
          Frame.InnerBrush.Gradient.EndColor = clGray
          Frame.InnerBrush.Gradient.MidColor = clWhite
          Frame.InnerBrush.Gradient.StartColor = 4210752
          Frame.InnerBrush.Gradient.Visible = True
          Frame.MiddleBrush.BackColor = clYellow
          Frame.MiddleBrush.Gradient.EndColor = 8553090
          Frame.MiddleBrush.Gradient.MidColor = clWhite
          Frame.MiddleBrush.Gradient.StartColor = clGray
          Frame.MiddleBrush.Gradient.Visible = True
          Frame.OuterBrush.BackColor = clGreen
          Frame.OuterBrush.Gradient.EndColor = 4210752
          Frame.OuterBrush.Gradient.MidColor = clWhite
          Frame.OuterBrush.Gradient.StartColor = clSilver
          Frame.OuterBrush.Gradient.Visible = True
          Frame.Width = 4
          Shadow.Color = 8816262
          Shadow.HorizSize = 9
          Shadow.VertSize = 9
          OtherSlice.Legend.Alignment = laLeft
          OtherSlice.Legend.Visible = False
          RotationAngle = 73
        end
      end
    end
  end
  object pnl5: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 32
    Align = alTop
    BevelWidth = 2
    BiDiMode = bdLeftToRight
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 16774378
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object lbl1: TLabel
      Left = 3
      Top = 3
      Width = 108
      Height = 22
      Align = alClient
      Alignment = taCenter
      Caption = 'DASHBOARD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = '@Microsoft YaHei'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object mainPrincipal: TMainMenu
    Left = 680
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      OnClick = CADASTRO1Click
      object CLIENTE1: TMenuItem
        Caption = 'CLIENTE'
        ShortCut = 16451
        OnClick = CLIENTE1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CATEGORIA1: TMenuItem
        Caption = 'CATEGORIA'
        ShortCut = 16449
        OnClick = CATEGORIA1Click
      end
      object PRODUTO1: TMenuItem
        Caption = 'PRODUTO'
        ShortCut = 16464
        OnClick = PRODUTO1Click
      end
      object mniN5: TMenuItem
        Caption = '-'
      end
      object mniUSURIO1: TMenuItem
        Caption = 'USU'#193'RIO'
        ShortCut = 16469
        OnClick = mniUSURIO1Click
      end
      object AOACESSO1: TMenuItem
        Caption = 'A'#199#195'O ACESSO'
        ShortCut = 24641
        OnClick = AOACESSO1Click
      end
      object mniUSURIOSVSAES1: TMenuItem
        Caption = 'USU'#193'RIOS VS A'#199#213'ES'
        ShortCut = 16470
        OnClick = mniUSURIOSVSAES1Click
      end
      object mniN6: TMenuItem
        Caption = '-'
      end
      object mniALTERARSENHA1: TMenuItem
        Caption = 'ALTERAR SENHA'
        ShortCut = 16467
        OnClick = mniALTERARSENHA1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mniROCARUSURIO1: TMenuItem
        Caption = 'TROCAR USU'#193'RIO'
        OnClick = mniROCARUSURIO1Click
      end
      object mnuFechar: TMenuItem
        Caption = 'FECHAR'
        ShortCut = 16454
        OnClick = mnuFecharClick
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#195'O'
      OnClick = MOVIMENTAO1Click
      object VENDAS1: TMenuItem
        Caption = 'VENDAS'
        ShortCut = 8278
        OnClick = VENDAS1Click
      end
      object mniCAIXA1: TMenuItem
        Caption = 'CAIXA'
        OnClick = mniCAIXA1Click
      end
    end
    object RELATRIO1: TMenuItem
      Caption = 'RELAT'#211'RIO'
      OnClick = RELATRIO1Click
      object mniCategoria2: TMenuItem
        Caption = 'CATEGORIA'
        ShortCut = 8259
        OnClick = mniCategoria2Click
      end
      object CLIENTE2: TMenuItem
        Caption = 'CLIENTE'
        ShortCut = 8260
        OnClick = CLIENTE2Click
      end
      object mniFichaCliente1: TMenuItem
        Caption = 'FICHA CLIENTE'
        ShortCut = 8262
        OnClick = mniFichaCliente1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PRODUTO2: TMenuItem
        Caption = 'PRODUTO'
        ShortCut = 8275
        OnClick = PRODUTO2Click
      end
      object mniPRODUTOSPORCATEGORIA1: TMenuItem
        Caption = 'PRODUTOS POR CATEGORIA'
        ShortCut = 8273
        OnClick = mniPRODUTOSPORCATEGORIA1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object VENDAPORDATA1: TMenuItem
        Caption = 'VENDA POR DATA'
        ShortCut = 8261
        OnClick = VENDAPORDATA1Click
      end
    end
  end
  object tmrAtualizacaoDashBoard: TTimer
    Interval = 10000
    OnTimer = tmrAtualizacaoDashBoardTimer
    Left = 648
  end
end

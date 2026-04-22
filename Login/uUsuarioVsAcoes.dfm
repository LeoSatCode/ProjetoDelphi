object frmUsuarioVsAcoes: TfrmUsuarioVsAcoes
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rio vs A'#231#245'es'
  ClientHeight = 444
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 265
    Top = 0
    Height = 403
    ExplicitLeft = 272
    ExplicitTop = 96
    ExplicitHeight = 100
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 403
    Align = alLeft
    TabOrder = 0
    object grdUsuarios: TDBGrid
      Left = 1
      Top = 1
      Width = 263
      Height = 401
      Align = alClient
      Color = clWhite
      DataSource = dtsUsuario
      DrawingStyle = gdsClassic
      FixedColor = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grdUsuariosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 181
          Visible = True
        end>
    end
  end
  object pnl2: TPanel
    Left = 268
    Top = 0
    Width = 417
    Height = 403
    Align = alClient
    TabOrder = 1
    object grdAcoes: TDBGrid
      Left = 1
      Top = 1
      Width = 415
      Height = 401
      Align = alClient
      DataSource = dtsAcoes
      DrawingStyle = gdsClassic
      FixedColor = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grdAcoesDrawColumnCell
      OnDblClick = grdAcoesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'acaoAcessoId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Visible = False
        end>
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 403
    Width = 685
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      685
      41)
    object btnFechar1: TBitBtn
      Left = 591
      Top = 8
      Width = 85
      Height = 24
      Anchors = [akTop, akRight]
      Caption = '&SAIR'
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
      TabOrder = 0
      OnClick = btnFechar1Click
    end
  end
  object QryUsuario: TFDQuery
    AfterScroll = QryUsuarioAfterScroll
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT usuarioId,'
      '       nome'
      '  FROM usuarios')
    Left = 136
    Top = 136
    object QryUsuariousuarioId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioId'
      Origin = 'usuarioId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryUsuarionome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
  end
  object QryAcoes: TFDQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'SELECT ua.usuarioId,'
      '       ua.acaoAcessoId,'
      '       a.descricao,'
      '       ua.ativo'
      '  FROM usuariosAcaoAcesso AS ua'
      
        '     INNER JOIN acaoAcesso AS a ON a.acaoAcessoId = ua.acaoAcess' +
        'oId'
      ' WHERE ua.usuarioId=:usuarioId')
    Left = 416
    Top = 136
    ParamData = <
      item
        Name = 'usuarioId'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryAcoesusuarioId: TIntegerField
      FieldName = 'usuarioId'
      Origin = 'usuarioId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryAcoesacaoAcessoId: TIntegerField
      FieldName = 'acaoAcessoId'
      Origin = 'acaoAcessoId'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryAcoesdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object QryAcoesativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
      Required = True
    end
  end
  object dtsUsuario: TDataSource
    DataSet = QryUsuario
    Left = 136
    Top = 208
  end
  object dtsAcoes: TDataSource
    DataSet = QryAcoes
    Left = 416
    Top = 208
  end
end

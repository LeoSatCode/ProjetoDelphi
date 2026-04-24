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
    object btnFechar1: TPngBitBtn
      Left = 591
      Top = 8
      Width = 85
      Height = 24
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&SAIR'
      TabOrder = 0
      OnClick = btnFechar1Click
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C18000000584944415478DA
        636480022929A9FF0C448267CF9E31C2D88C543700599218405F03A06A3A816A
        2A28318001D910720D801B82D3002263A59352031A28F14203506D23B9068035
        931B8870CD241B800D50DF0062005573230069A461B4756035F1000000004945
        4E44AE426082}
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

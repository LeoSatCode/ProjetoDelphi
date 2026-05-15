inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 453
  ClientWidth = 959
  ExplicitTop = -80
  ExplicitWidth = 965
  ExplicitHeight = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 399
    Width = 959
    ExplicitTop = 399
    ExplicitWidth = 959
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited pnlFechar: TPanel
      Left = 1097
      ExplicitLeft = 1097
    end
    object Panel1: TPanel
      Left = 828
      Top = 16
      Width = 109
      Height = 23
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = '&Sair'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Variable Text Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 7
      TabStop = True
      OnClick = pnlFecharClick
      OnEnter = OnTabEnter
      OnExit = OnTabExit
      OnMouseEnter = OnMouseEnter
      OnMouseLeave = OnMouseLeave
      DesignSize = (
        109
        23)
      object img1: TImage
        Left = 15
        Top = 2
        Width = 16
        Height = 19
        Anchors = [akLeft, akTop, akRight, akBottom]
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF61000000097048597300000B1300000B1301009A9C18
          000000584944415478DA636480022929A9FF0C448267CF9E31C2D88C54370059
          9218405F03A06A3A816A2A28318001D910720D801B82D3002263A59352031A28
          F14203506D23B9068035931B8870CD241B800D50DF0062005573230069A461B4
          756035F10000000049454E44AE426082}
      end
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 959
    Height = 399
    ExplicitWidth = 959
    ExplicitHeight = 399
    inherited tabListagem: TTabSheet
      ExplicitWidth = 951
      ExplicitHeight = 371
      inherited pnlListagemTopo: TPanel
        Width = 951
        ExplicitWidth = 951
        inherited pnlPesquisar: TPanel
          Left = 564
          ExplicitLeft = 564
        end
      end
      inherited gdrListagem: TDBGrid
        Width = 951
        Height = 314
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 951
      ExplicitHeight = 371
      object edtUsuarioId: TLabeledEdit
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
        Width = 517
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        MaxLength = 50
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 12
        Top = 152
        Width = 176
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        MaxLength = 40
        TabOrder = 2
      end
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECT usuarioId,'
      '       nome,'
      '       senha'
      '  FROM usuarios')
    Left = 508
    object QryListagemusuarioId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioId'
      Origin = 'usuarioId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemnome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object QryListagemsenha: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 40
    end
  end
  inherited dtsListagem: TDataSource
    Left = 580
  end
end

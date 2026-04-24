inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#227'o de Acesso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    inherited tabListagem: TTabSheet
      inherited gdrListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object edtAcaoAcessoId: TLabeledEdit
        Tag = 1
        Left = 20
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 20
        Top = 112
        Width = 837
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 20
        Top = 168
        Width = 605
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECT acaoAcessoId, '
      '       descricao, '
      '       chave '
      ' FROM acaoAcesso')
    Left = 796
    object QryListagemacaoAcessoId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoAcessoId'
      Origin = 'acaoAcessoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryListagemdescricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object QryListagemchave: TStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Origin = 'chave'
      Required = True
      Size = 60
    end
  end
end

inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 332
  ClientWidth = 690
  ExplicitWidth = 696
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 278
    Width = 690
    ExplicitTop = 278
    ExplicitWidth = 690
    inherited btnFechar: TBitBtn
      Left = 600
      ExplicitLeft = 600
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 690
    Height = 278
    ActivePage = tabManutencao
    ExplicitWidth = 690
    ExplicitHeight = 278
    inherited tabListagem: TTabSheet
      ExplicitWidth = 682
      ExplicitHeight = 250
      inherited pnlListagemTopo: TPanel
        Width = 682
        ExplicitWidth = 682
      end
      inherited gdrListagem: TDBGrid
        Width = 682
        Height = 193
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
      ExplicitWidth = 682
      ExplicitHeight = 250
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

inherited frmConCategoria: TfrmConCategoria
  Caption = 'Consulta de Categorias'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Color = 16774378
    ParentBackground = False
  end
  inherited pnl2: TPanel
    inherited grdPesquisa: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'categoriaId'
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 627
          Visible = True
        end>
    end
  end
  inherited QryListagem: TFDQuery
    SQL.Strings = (
      'SELECT categoriaId,'
      '          descricao'
      '  FROM categorias')
    Left = 663
    object QryListagemcategoriaId: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
  inherited dtsListagem: TDataSource
    Left = 719
  end
end

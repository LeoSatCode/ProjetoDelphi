unit uConCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHerancaConsulta, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmConCategoria = class(TfrmTelaHerancaConsulta)
    QryListagemcategoriaId: TFDAutoIncField;
    QryListagemdescricao: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConCategoria: TfrmConCategoria;

implementation

{$R *.dfm}

procedure TfrmConCategoria.FormCreate(Sender: TObject);
begin

  aCampoId    :='categoriaId';
  IndiceAtual :='descricao';

  inherited;

end;

end.

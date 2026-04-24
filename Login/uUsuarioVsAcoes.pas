unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, PngBitBtn,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmUsuarioVsAcoes = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    spl1: TSplitter;
    grdUsuarios: TDBGrid;
    grdAcoes: TDBGrid;
    QryUsuario: TFDQuery;
    QryAcoes: TFDQuery;
    dtsUsuario: TDataSource;
    dtsAcoes: TDataSource;
    QryAcoesusuarioId: TIntegerField;
    QryAcoesacaoAcessoId: TIntegerField;
    QryAcoesdescricao: TStringField;
    QryAcoesativo: TBooleanField;
    btnFechar1: TPngBitBtn;
    QryUsuariousuarioId: TFDAutoIncField;
    QryUsuarionome: TStringField;
    procedure btnFechar1Click(Sender: TObject);
    procedure QryUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grdAcoesDblClick(Sender: TObject);
    procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdUsuariosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionarAcoesAcessoPorUsuario;
  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

uses
  uDTMConexao;

{$R *.dfm}

procedure TfrmUsuarioVsAcoes.btnFechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDblClick(Sender: TObject);
var Qry:TFDQuery;
    bmRegistroAtual:TBookmark;
begin
  try
    bmRegistroAtual := QryAcoes.GetBookmark;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=dtmConexao.ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE usuariosAcaoAcesso '+
                '   SET ativo=:ativo '+
                ' WHERE usuarioId=:usuarioId '+
                '   AND acaoAcessoId=:acaoAcessoId ');
    Qry.ParamByName('usuarioId').AsInteger    :=QryAcoes.FieldByName('usuarioId').AsInteger;
    Qry.ParamByName('acaoAcessoId').AsInteger :=QryAcoes.FieldByName('acaoAcessoId').AsInteger;
    Qry.ParamByName('ativo').AsBoolean        :=not QryAcoes.FieldByName('ativo').AsBoolean;
    try
      dtmConexao.ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      dtmConexao.ConexaoDB.Commit;
    except
      dtmConexao.ConexaoDB.Rollback;
    end;
  finally
    SelecionarAcoesAcessoPorUsuario;
    QryAcoes.GotoBookMark(bmRegistroAtual);
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Linha: Integer;
  Grid: TDBGrid;
begin
  Grid := TDBGrid(Sender);

  if (gdFixed in State) then
  begin
    Grid.Canvas.Brush.Color := clGray;
    Grid.Canvas.FillRect(Rect);
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    Exit;
  end;

  Linha := Grid.DataSource.DataSet.RecNo;

  if not QryAcoes.FieldByName('ativo').AsBoolean then
  begin
    Grid.Canvas.Brush.Color := clRed;
    Grid.Canvas.Font.Color  := clWhite;
  end
  else
  begin
    // seleção
    if (gdSelected in State) then
    begin
      Grid.Canvas.Brush.Color := $00FFCC99;
      Grid.Canvas.Font.Color := clHighlightText;
    end
    else
    begin
      Grid.Canvas.Font.Color := clBlack;

      // zebra
      if (Linha mod 2) = 0 then
        Grid.Canvas.Brush.Color := clWebLightgrey
      else
        Grid.Canvas.Brush.Color := clWhite;
    end;
  end;

  Grid.Canvas.FillRect(Rect);
  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmUsuarioVsAcoes.grdUsuariosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Linha: Integer;
begin
  if (gdFixed in State) then
  begin
    grdUsuarios.Canvas.Brush.Color := clGray;
    grdUsuarios.Canvas.FillRect(Rect);
    grdUsuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    Exit;
  end;

  Linha := grdUsuarios.DataSource.DataSet.RecNo;

  if not (gdSelected in State) then
  begin
    grdUsuarios.Canvas.Font.Color := clBlack;

    if (Linha mod 2) = 0 then
      grdUsuarios.Canvas.Brush.Color := clWebLightgrey
    else
      grdUsuarios.Canvas.Brush.Color := clWhite;
  end
  else
  begin
    grdUsuarios.Canvas.Brush.Color := $00FFCC99;
    grdUsuarios.Canvas.Font.Color := clHighlightText;
  end;

  grdUsuarios.Canvas.FillRect(Rect);


  grdUsuarios.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmUsuarioVsAcoes.FormCreate(Sender: TObject);
var I: Integer;
begin
   // Centraliza os titulos do grdUsuarios
    for I := 0 to grdUsuarios.Columns.Count - 1 do
    grdUsuarios.Columns[I].Title.Alignment := taCenter;

  // Centraliza os titulos grdAcoes
    for I := 0 to grdAcoes.Columns.Count - 1 do
    grdAcoes.Columns[I].Title.Alignment := taCenter;
end;

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
  try
    QryUsuario.DisableControls;
    QryUsuario.Open;
    SelecionarAcoesAcessoPorUsuario;
  finally
    QryUsuario.EnableControls;
  end;
end;

procedure TfrmUsuarioVsAcoes.QryUsuarioAfterScroll(DataSet: TDataSet);
begin
  SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
begin
  QryAcoes.Close;
  QryAcoes.ParamByName('usuarioId').AsInteger := QryUsuario.FieldByName('usuarioId').AsInteger;
  QryAcoes.Open();
end;

end.

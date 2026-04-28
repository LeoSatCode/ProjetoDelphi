unit cGridUtils;

interface

uses System.Classes,Vcl.Controls,Vcl.ExtCtrls,
     Vcl.Dialogs,Vcl.Forms,Vcl.Buttons, Vcl.Grids,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf,System.IniFiles,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils, uDTMGrafico,
     cAcaoAcesso, cUsuarioLogado, RLReport, cProVendas,Winapi.Windows,

     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Vcl.Graphics,
     Vcl.ExtDlgs,
     Vcl.DBGrids;

type
  TGrid = class

  private

  public
  class function GetColumnByFieldName(Grid: TDBGrid; const AFieldName: string): TColumn; static;
  class procedure SalvarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario, NomeForm: string);static;
  class procedure CarregarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario, NomeForm: string); static;
  class procedure ZebrarGrid(Grid: TDBGrid; State:TGridDrawState; Column: TColumn; Qry:TFDQuery; Rect: TRect; ilimage:TImageList; DataCol: Integer);

  end;

implementation

uses uPrincipal;

{ TGrid }


class function TGrid.GetColumnByFieldName(Grid: TDBGrid; const AFieldName: string): TColumn;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    if SameText(Grid.Columns[I].FieldName, AFieldName) then
      Exit(Grid.Columns[I]);
  end;
end;

class procedure TGrid.SalvarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario, NomeForm: string);
var
  ArquivoINI: TIniFile;
  I: Integer;
  Secao: string;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + NomeINI);
  try
    Secao := NomeUsuario + '_' + NomeForm;

    for I := 0 to Grid.Columns.Count - 1 do
    begin
      ArquivoINI.WriteInteger(
        Secao,
        Grid.Columns[I].FieldName + '.Width',
        Grid.Columns[I].Width
      );

      ArquivoINI.WriteInteger(
        Secao,
        Grid.Columns[I].FieldName + '.Index',
        Grid.Columns[I].Index
      );
    end;

  finally
    ArquivoINI.Free;
  end;
end;

class procedure TGrid.CarregarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario, NomeForm: string);
var
  ArquivoINI: TIniFile;
  I, NewIndex: Integer;
  Col: TColumn;
  Secao: string;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + NomeINI);
  try
    Secao := NomeUsuario + '_' + NomeForm;

    Grid.Columns.BeginUpdate;
    try

      for I := 0 to Grid.Columns.Count - 1 do
      begin
        Col := Grid.Columns[I];

        NewIndex := ArquivoINI.ReadInteger(
          Secao,
          Col.FieldName + '.Index',
          Col.Index
        );

        Col.Index := NewIndex;
      end;


      for I := 0 to Grid.Columns.Count - 1 do
      begin
        Col := Grid.Columns[I];

        Col.Width := ArquivoINI.ReadInteger(
          Secao,
          Col.FieldName + '.Width',
          Col.Width
        );
      end;

    finally
      Grid.Columns.EndUpdate;
    end;

  finally
    ArquivoINI.Free;
  end;
end;

class procedure TGrid.ZebrarGrid(Grid: TDBGrid; State: TGridDrawState; Column: TColumn; Qry:TFDQuery; Rect: TRect; ilimage:TImageList; DataCol: Integer);
var Linha: Integer;
    id: Integer;
    imgIndex: Integer;
begin
  if (gdFixed in State) then
  begin
    Grid.Canvas.Brush.Color := clGray;
    Grid.Canvas.FillRect(Rect);

    Exit;
  end;

  Linha := Grid.DataSource.DataSet.RecNo;

  if not (gdSelected in State) then
  begin
    if (Linha mod 2) = 0 then
      Grid.Canvas.Brush.Color := clWebLightgrey
    else
      Grid.Canvas.Brush.Color := clWhite;
  end
  else
  begin
    Grid.Canvas.Brush.Color := $00FFCC99;
    Grid.Canvas.Font.Color := clHighlightText;
  end;

  Grid.Canvas.FillRect(Rect);
  //Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);
  if (Column.FieldName = 'status') and (Qry.FieldByName('status').AsString = 'PENDENTE') then
  begin
    Grid.Canvas.Brush.Color := RGB(255, 243, 176);
  end
  else if (Column.FieldName = 'status') and (Qry.FieldByName('status').AsString = 'PAGO') then
  begin
    Grid.Canvas.Brush.Color := RGB(183, 228, 199);
  end
  else if (Column.FieldName = 'status') and (Qry.FieldByName('status').AsString = 'CANCELADO') then
  begin
    Grid.Canvas.Brush.Color := RGB(245, 183, 177);
  end
  else if (Column.FieldName = 'status') and (Qry.FieldByName('status').AsString = 'RETORNADO') then
  begin
    Grid.Canvas.Brush.Color := RGB(169, 214, 229);
  end;

   // Desenhando a imagem

  if Column.FieldName = 'situacaoId' then
  begin
    id := Qry.FieldByName('situacaoId').AsInteger;

    case id of
      1: imgIndex := 1;
      2: imgIndex := 2;
      3: imgIndex := 0;
      4: imgIndex := 3;
      5: imgIndex := 4;
    else
      Exit; //Se não tiver ID válido, não desenha nada
    end;

    // Desenha a imagem centralizada na célula
    ilimage.Draw(
      Grid.Canvas,
      Rect.Left + (Rect.Width - ilimage.Width) div 2,
      Rect.Top + (Rect.Height - ilimage.Height) div 2,
      imgIndex
    );
  end
  else
  begin
    // Outras colunas continuam com comportamento padrão
    Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

end.

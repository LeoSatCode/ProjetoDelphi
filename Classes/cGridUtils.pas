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
  class procedure ZebrarGrid(Grid: TDBGrid; State:TGridDrawState; Column: TColumn; Rect: TRect);

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

class procedure TGrid.ZebrarGrid(Grid: TDBGrid; State: TGridDrawState; Column: TColumn; Rect: TRect);
var Linha: Integer;
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
  Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);

end;

end.

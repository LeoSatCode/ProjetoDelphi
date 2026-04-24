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
  class procedure SalvarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario: string);static;
  class procedure CarregarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario: string); static;
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

class procedure TGrid.SalvarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario: string);
var ArquivoINI:TIniFile; // Variável para criar o arquivo INI para salvar preferências de Grid por usuário.
    I: Integer; // Ponteiro para passar por todas as colunas (pastas)
begin
  ExtractFilePath(Application.ExeName); // Garante que o INI fique na mesma pasta do .exe
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + NomeINI); //Criamos o INI File na pasta do .exe

  try
    for I := 0 to Grid.Columns.Count - 1 do  // O laço percorre do 0 à ultima coluna desenhada no Grid
    begin
      ArquivoINI.WriteInteger(
      NomeUsuario, // Usamos o UsuarioLogado para separar de quem é a preferência.
      'Coluna_' + IntToStr(I), // Nomeamos a pasta com o Indice da coluna.
      Grid.Columns[I].Width); //A largura atual da coluna naquele exato segundo.
      ArquivoINI.WriteString(
      NomeUsuario,
      'Ordem_' + IntToStr(I),
      Grid.Columns[I].FieldName);
    end;
  finally
    ArquivoINI.Free;// Independentemente de dar erro ou não, sempre fechamos o caderninho para liberar a memória
  end;
end;

class procedure TGrid.CarregarGrid(Grid: TDBGrid; const NomeINI, NomeUsuario: string);
var ArquivoINI: TIniFile ; //Referenciamos novamente nosso Arquivo
    I:Integer; //Passamos o ponteiro
    NomeCampo: string;
    Coluna: TColumn;
begin

   ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ NomeINI);

  try
    Grid.Columns.BeginUpdate;
    try

      for I := 0 to Grid.Columns.Count - 1 do
      begin
        Grid.Columns[I].Width :=
          ArquivoINI.ReadInteger(NomeUsuario,
          'Coluna_' + IntToStr(I),
          Grid.Columns[I].Width);
      end;


      for I := 0 to Grid.Columns.Count - 1 do
      begin
        NomeCampo := ArquivoINI.ReadString(
          NomeUsuario,
          'Ordem_' + IntToStr(I),
          ''
        );

        if NomeCampo <> '' then
        begin
          Coluna := GetColumnByFieldName(Grid, NomeCampo);
          if Assigned(Coluna) then
            Coluna.Index := I;
        end;
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

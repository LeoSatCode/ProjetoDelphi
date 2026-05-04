unit cPesquisar;

interface

uses System.Classes,Vcl.Controls,Vcl.ExtCtrls,
     Vcl.Dialogs,Vcl.Forms,Vcl.Buttons, Vcl.Mask,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, cFuncao,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils, Vcl.ExtDlgs;

type
  TPesquisa = class

    private

    public

    class procedure PesquisaCampo(Sender:TObject;mskPesquisar:TMaskEdit; Qry: TFDQuery; const IndiceAtual:String);static;

  end;

implementation

uses uCaixa;

{ TPesquisa }

class procedure TPesquisa.PesquisaCampo(Sender: TObject;mskPesquisar: TMaskEdit; Qry: TFDQuery; const IndiceAtual:String);
var
  Date: TDateTime;
  N, Texto: string;
  PosCursor: Integer;
  OldOnChange: TNotifyEvent;
begin
  if Trim(TMaskEdit(Sender).Text) = '' then
    Exit;

  if (Qry.FieldByName(IndiceAtual).DataType in [ftDate, ftDateTime, ftTimeStamp]) then
  begin
    PosCursor := mskPesquisar.SelStart;
    mskPesquisar.OnChange := nil;
    try
      N := TFuncao.SomenteNumeros(mskPesquisar.Text);
      Texto := N;

      if Length(N) <= 8 then
      begin
        if Length(N) > 2 then
          Texto := Copy(N,1,2) + '/' + Copy(N,3,Length(N)-2);

        if Length(N) > 4 then
          Texto := Copy(N,1,2) + '/' + Copy(N,3,2) + '/' + Copy(N,5,Length(N)-4);
      end;

      mskPesquisar.MaxLength := 10;
      mskPesquisar.Text := Texto;
      mskPesquisar.SelStart := Length(Texto);
    finally
      mskPesquisar.OnChange := OldOnChange;
    end;

    // Depois de formatar, tenta localizar
    if TryStrToDate(mskPesquisar.Text, Date) then
      Qry.Locate(IndiceAtual, Date, []);

    Exit; // importante pra não cair nos outros casos
  end;

  if (Qry.FieldByName(IndiceAtual).DataType in [ftString, ftWideString]) then
  begin
    Qry.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
  end
                                 else if (Qry.FieldByName(IndiceAtual).DataType in [ftFloat, ftCurrency, ftFMTBcd]) then
  begin
    try
      Qry.Locate(IndiceAtual, TMaskEdit(Sender).Text, []);
    except

    end;
  end
  else
  begin
    Qry.Locate(IndiceAtual, TMaskEdit(Sender).Text, []);
  end;

  if IndiceAtual = 'situacaoId' then begin
    if mskPesquisar.Text <> '' then begin
      mskPesquisar.Clear;
      ShowMessage('Não é possivel realizar pesquisas nesse campo');
    end;
  end;
end;
end.

unit cConsultaCEP;

interface

uses System.Classes,Vcl.Controls,Vcl.ExtCtrls, Vcl.Mask,
     Vcl.Dialogs,Vcl.Forms,Vcl.Buttons, REST.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, System.JSON,
     FireDAC.Stan.Error, FireDAC.UI.Intf,System.IniFiles,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils,
     Winapi.Windows,
     Vcl.ExtDlgs;

type
  TConsultaCEP = class

  private
    F_Logradouro: String;
    F_Bairro:     String;
    F_Cidade:     String;
    F_Estado:     String;
    F_Erro:       Boolean;

  public
    property Logradouro:  String  read F_Logradouro;
    property Bairro:      String  read F_Bairro;
    property Cidade:      String  read F_Cidade;
    property Estado:      String  read F_Estado;
    property Erro:        Boolean read F_Erro;

    function BuscarCEP(aCEP: string): Boolean;

  end;

implementation


{ TConsultaCEP }

function TConsultaCEP.BuscarCEP(aCEP: string): Boolean;
var
  rClient: TRESTClient;
  rRequest: TRESTRequest;
  rResponse: TRESTResponse;
  Json: TJSONObject;
  Valor: string;
begin
  Result := False;
  F_Erro := False;

  aCEP := StringReplace(aCEP, '-', '', [rfReplaceAll]);

  if Length(aCEP) <> 8 then
    Exit;

  rClient   := TRESTClient.Create(nil);
  rRequest  := TRESTRequest.Create(nil);
  rResponse := TRESTResponse.Create(nil);

  try
    rClient.BaseURL := 'https://viacep.com.br/ws/' + aCEP + '/json/';

    rRequest.Client := rClient;
    rRequest.Response := rResponse;

    rRequest.Execute;

    if Assigned(rResponse.JSONValue) then
    begin
      Json := rResponse.JSONValue as TJSONObject;

      if Json.TryGetValue<Boolean>('erro', F_Erro) and F_Erro then
        Exit;

      if Json.TryGetValue('logradouro', Valor) then
        F_Logradouro := Valor;

      if Json.TryGetValue('bairro', Valor) then
        F_Bairro := Valor;

      if Json.TryGetValue('localidade', Valor) then
        F_Cidade := Valor;

      if Json.TryGetValue('uf', Valor) then
        F_Estado := Valor;

      Result := True;
    end;

  finally
    rResponse.Free;
    rRequest.Free;
    rClient.Free;
  end;
end;

end.

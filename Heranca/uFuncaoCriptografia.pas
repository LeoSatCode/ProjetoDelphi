unit uFuncaoCriptografia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uDTMConexao, uDTMVenda, RxToolEdit, RxCurrEdit, cProVendas, uEnum;

function Criptografar(const aEntrada:String): string;
function Descriptografar(const aEntrada:string):string;

implementation

function Criptografar(const aEntrada:String): string;
var i, iQtdeEnt, iIntervalo:Integer;
    sSaida:string;
    sProximoCaracter:String;
begin
  iIntervalo:=7;
  i         :=0;
  iQtdeEnt  :=0;

  if (aEntrada <> EmptyStr) then
  begin
    iQtdeEnt  := Length(aEntrada);
    for i     := iQtdeEnt downto 1 do //Faz o Loop Contrário
    begin
      sProximoCaracter  := Copy(aEntrada, i, 1);
      sSaida := sSaida + (Char(Ord(sProximoCaracter[1])+iIntervalo));
    end;
  end;
  Result:=sSaida;
end;

function Descriptografar(const aEntrada:String): string;
var i, iQtdeEnt, iIntervalo:Integer;
    sSaida:string;
    sProximoCaracter:String;
begin
  iIntervalo:=7;
  i         :=0;
  iQtdeEnt  :=0;
  if (aEntrada <> EmptyStr) then
  begin
    iQtdeEnt  := Length(aEntrada);

    for i     := iQtdeEnt downto 1 do //Faz o Loop Contrário
    begin
      sProximoCaracter  := Copy(aEntrada, i, 1);
      sSaida := sSaida + (Char(Ord(sProximoCaracter[1])-iIntervalo));
    end;
  end;
  Result:=sSaida;
end;
end.

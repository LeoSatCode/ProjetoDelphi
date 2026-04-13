unit cArquivoIni;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     System.SysUtils,
     System.IniFiles,
     Vcl.Forms;

type
  TArquivo = class
  private

  public
    class function  ArquivoIni:string; static; // Classe de Função Estática
    class function  LerIni(aSecao:string; aEntrada:string):string; static; //Sempre que usado 'Static'
    class procedure AtualizarIni(aSecao, aEntrada, aValor:string); static; //Colocar 'Class' antes
  end;

implementation

{ TArquivo }

class function TArquivo.ArquivoIni: string;
begin
  Result:=ChangeFileExt(Application.ExeName, '.INI'); //Muda a extensão do arquivo EXE para INI
end;

class procedure TArquivo.AtualizarIni(aSecao, aEntrada, aValor: string);
var Ini:TIniFile; //Variável do tipo INI
begin
  try
    Ini:=TIniFile.Create(ArquivoIni); //Chamada de Função para criar o INI File
    Ini.WriteString(aSecao, aEntrada, aValor); // Aquia a String da Sessão, Entrada e Valor é escrita
  finally

  end;
end;

class function TArquivo.LerIni(aSecao, aEntrada: string): string;
var Ini:TIniFile; //Variável do tipo INI
begin
  try
    Ini    :=TIniFile.Create(ArquivoIni); //Chamada de Função para criar o INI File
    Result :=Ini.ReadString( aSecao, aEntrada, 'NAO ENCONTRADO' ); //Lê a String da Sessão, Entrada e Valor se não encontrar nada "Não Encontrado"
  finally
    Ini.Free;
  end;
end;

end.

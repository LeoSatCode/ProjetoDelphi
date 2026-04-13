unit cValidacoes;

interface

uses
  System.SysUtils;

// Declaramos a função para o sistema inteiro enxergar
function ValidarCPF(const aCPF: string): Boolean;
function ValidarCNPJ(const aCNPJ: string): Boolean;

implementation

function SomenteNumeros(const Num:string):string;
var
  I:Integer;
begin
  Result:='';

  for I:= 1 to Length(Num) do
    if Num[I] in ['0'..'9'] then
    Result:= Result+Num[I];
end;

function ValidarCPF(const aCPF: string): Boolean;
var
  CPFLimpo: string;
  I, Soma, Resto, Digito1, Digito2:Integer;
begin
  CPFLimpo := SomenteNumeros(aCPF); // lógica de limpeza (Somente Numeros)

  if Length(CPFLimpo) <> 11 then
    Exit;

  if CPFLimpo = StringOfChar(CPFLimpo[1], 11) then
    Exit;

  Soma := 0; //Definimos a soma como 0

  for I := 1 to 9 do // Para cada I de 1 à 9
    Soma := Soma + StrToInt(CPFLimpo[I]) * (11 - I); //A Soma recebe a Soma + o I do CPFLimpo ex (4) * 11 - I atual.
    //que na primeira vez é 1. Na segunda vez a Soma recebe a SOma + o I do CPFLimpo ex o segundo numero do
    //cpf (1) * 11 - 2(I atual) e assim sucessivamente.

  Resto := (Soma * 10) mod 11; //Após percorrer o loop, o Resto rebe a Soma * 10 divide por 11 e pega o Resto.
  if Resto = 10 then // Se o Resto = 10
    Resto := 0; //ele recebe 0

  Digito1 := Resto; // Digito1 = ao Resto da lógica acima.

  //A lógia para o segundo dígito é a mesma porém do 1 ao 10 ao invés do 1 ao 9
  Soma := 0;

  for I := 1 to 10 do
    Soma := Soma + StrToInt(CPFLimpo[I]) * (12 - I);

  Resto := (Soma * 10) mod 11;
  if Resto = 10 then
    Resto := 0;

  Digito2 := Resto;

  Result := (Digito1 = StrToInt(CPFLimpo[10])) and
            (Digito2 = StrToInt(CPFLimpo[11]));  //E aqui a função retorna os 2 dígitos.
end;

function ValidarCNPJ(const aCNPJ: string): Boolean;
var
  CNPJLimpo: string;
  I, Soma, Resto, Digito1, Digito2: Integer;
  Pesos1, Pesos2: array[0..12] of Integer;  // Array com os pesos do CNPJ
begin
  CNPJLimpo := SomenteNumeros(aCNPJ);

  // CNPJ tem 14 dígitos
  if Length(CNPJLimpo) <> 14 then
    Exit(False);

  // Evita falsos positivos como '00000000000000'
  if CNPJLimpo = StringOfChar(CNPJLimpo[1], 14) then
    Exit(False);

  // Carregando os pesos do primeiro dígito  (ainda não entendi bem essa parte)
  Pesos1[0]:=5; Pesos1[1]:=4; Pesos1[2]:=3; Pesos1[3]:=2; Pesos1[4]:=9; Pesos1[5]:=8;
  Pesos1[6]:=7; Pesos1[7]:=6; Pesos1[8]:=5; Pesos1[9]:=4; Pesos1[10]:=3; Pesos1[11]:=2;

  // CÁLCULO DO 1º DÍGITO
  Soma := 0;
  for I := 1 to 12 do
    Soma := Soma + (StrToInt(CNPJLimpo[I]) * Pesos1[I-1]);

  Resto := Soma mod 11;
  // A regra do CNPJ diz que se o resto for menor que 2, o dígito é 0.
  // Senão, é 11 menos o resto.
  if Resto < 2 then
    Digito1 := 0
  else
    Digito1 := 11 - Resto;

  // Carregando os pesos do segundo dígito (ele inclui o peso 6 no começo)
  Pesos2[0]:=6; Pesos2[1]:=5; Pesos2[2]:=4; Pesos2[3]:=3; Pesos2[4]:=2; Pesos2[5]:=9;
  Pesos2[6]:=8; Pesos2[7]:=7; Pesos2[8]:=6; Pesos2[9]:=5; Pesos2[10]:=4; Pesos2[11]:=3;
  Pesos2[12]:=2;

  // CÁLCULO DO 2º DÍGITO (Agora o laço vai até 13, pegando o Digito1 que já achamos)
  Soma := 0;
  for I := 1 to 13 do
    Soma := Soma + (StrToInt(CNPJLimpo[I]) * Pesos2[I-1]);

  Resto := Soma mod 11;
  if Resto < 2 then
    Digito2 := 0
  else
    Digito2 := 11 - Resto;

  //Retorno com os valores do primeiro e segundo dígito
  Result := (Digito1 = StrToInt(CNPJLimpo[13])) and
            (Digito2 = StrToInt(CNPJLimpo[14]));
end;

end.



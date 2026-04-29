unit cCadCliente;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TCliente = class
     ConexaoDB:TFDConnection;
     F_clienteId:Integer; //Int
     F_nome:String; //VarChar
     F_documento:string;
     F_endereco:string;
     F_cidade:string;
     F_bairro:string;
     F_estado:string;
     F_cep:string;
     F_numero:string;
     F_telefone:string;
     F_email:string;
     F_situacaoId: Integer;
     F_dataNascimento: TDateTime;
     F_observacao: string;

  public
     constructor Create(aConexao:TFDConnection);
     destructor Destroy; override;
     function Inserir:Boolean;
     function Atualizar:Boolean;
     function Apagar:Boolean;
     function Selecionar(id:Integer):Boolean;
  published
     property codigo               :Integer    read F_clienteId         write F_clienteID;
     property nome                 :String     read F_nome              write F_nome;
     property documento            :string     read F_documento         write F_documento;
     property endereco             :String     read F_endereco          write F_endereco;
     property cidade               :String     read F_cidade            write F_cidade;
     property bairro               :String     read F_bairro            write F_bairro;
     property estado               :String     read F_estado            write F_estado;
     property cep                  :String     read F_cep               write F_cep;
     property numero               :String     read F_numero            write F_numero;
     property telefone             :String     read F_telefone          write F_telefone;
     property email                :String     read F_email             write F_email;
     property situacaoId           :Integer    read F_situacaoId        write F_situacaoId;
     property dataNascimento       :TDateTime  read F_dataNascimento    write F_dataNascimento;
     property observacao           :string     read F_observacao        write F_observacao;
  end;

implementation

{$REGION 'Constructor and Destrictor'}
//O constructor e o destructor recebem uma conexão injetada para a conexão local
constructor TCliente.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao; // Conexão local
end;

destructor TCliente.Destroy;
begin
  inherited;
end;
{$ENDREGION}

{$REGION 'Métodos CRUD'}
function TCliente.Inserir: Boolean;
var Qry:TFDQuery;
begin
  if Trim(F_nome) = '' then Exit(False);
  if (F_situacaoId = 0) then Exit(False);

  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear;
      SQL.Add('INSERT INTO clientes (nome, '+
              '                      documento, '+
              '                      endereco, '+
              '                      cidade, '+
              '                      bairro, '+
              '                      estado, '+
              '                      cep, '+
              '                      numero, '+
              '                      telefone, '+
              '                      email, '+
              '                      situacaoId, '+
              '                      observacao, '+
              '                      datanascimento) '+
              'VALUES                (:nome, '+
              '                       :documento, '+
              '                       :endereco, '+
              '                       :cidade, '+
              '                       :bairro, '+
              '                       :estado, '+
              '                       :cep, '+
              '                       :numero, '+
              '                       :telefone, '+
              '                       :email, '+
              '                       :situacaoId, '+
              '                       :observacao, '+
              '                       :datanascimento)' );

      ParamByName('nome').AsString                          :=Self.F_nome;
      ParamByName('documento').AsString                     :=Self.F_documento;
      ParamByName('endereco').AsString                      :=Self.F_endereco;
      ParamByName('cidade').AsString                        :=Self.F_cidade;
      ParamByName('bairro').AsString                        :=Self.F_bairro;
      ParamByName('estado').AsString                        :=Self.F_estado;
      ParamByName('cep').AsString                           :=Self.F_cep;
      ParamByName('numero').AsString                        :=Self.F_numero;
      ParamByName('telefone').AsString                      :=Self.F_telefone;
      ParamByName('email').AsString                         :=Self.F_email;
      ParamByName('situacaoId').AsInteger                   :=Self.F_situacaoId;
      ParamByName('observacao').AsString                    :=Self.F_observacao;
      ParamByName('dataNascimento').AsDateTime              :=Self.F_dataNascimento;

      try
        ConexaoDB.StartTransaction;
        Qry.ExecSQL;
        ConexaoDB.Commit;
      except
        on E: EFDDBEngineException do
        begin
          ConexaoDB.Rollback;
          // Verifica erro de violação de chave única
        if E.Kind = ekUKViolated then
          raise Exception.Create('Já existe um cliente com este CPF/CNPJ!')
        else
          raise; // outros erros sobem normal
        end;
      end;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TCliente.Atualizar: Boolean;
var Qry:TFDQuery;
begin

if F_clienteId = 0 then
   raise Exception.Create('Cliente inválido para atualização');

try
  Result:=True;
  Qry:=TFDQuery.Create(nil);
  with Qry do begin
    Connection:=ConexaoDB;
    SQL.Clear;
    SQL.Add('UPDATE clientes '+
            '   SET nome              =:nome '+
            '       ,documento        =:documento '+
            '       ,endereco         =:endereco '+
            '       ,cidade           =:cidade '+
            '       ,bairro           =:bairro ' +
            '       ,estado           =:estado '+
            '       ,cep              =:cep '+
            '       ,numero           =:numero '+
            '       ,telefone         =:telefone '+
            '       ,email            =:email '+
            '       ,situacaoId       =:situacaoId '+
            '       ,observacao       =:observacao '+
            '       ,dataNascimento   =:dataNascimento '+
            ' WHERE clienteId=:clienteId ');
    ParamByName('clienteId').AsInteger              :=Self.F_clienteId;
    ParamByName('nome').AsString                    :=Self.F_nome;
    ParamByName('documento').AsString               :=Self.F_documento;
    ParamByName('endereco').AsString                :=Self.F_endereco;
    ParamByName('cidade').AsString                  :=Self.F_cidade;
    ParamByName('bairro').AsString                  :=Self.F_bairro;
    ParamByName('estado').AsString                  :=Self.F_estado;
    ParamByName('cep').AsString                     :=Self.F_cep;
    ParamByName('numero').AsString                  :=Self.F_numero;
    ParamByName('telefone').AsString                :=Self.telefone;
    ParamByName('email').AsString                   :=Self.F_email;
    ParamByName('situacaoId').AsInteger             :=Self.F_situacaoId;
    ParamByName('observacao').AsString              :=Self.F_observacao;
    ParamByName('dataNascimento').AsDateTime        :=Self.F_dataNascimento;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      on E: EFDDBEngineException do
      begin
        ConexaoDB.Rollback;
          // Verifica erro de violação de chave única
        if E.Kind = ekUKViolated then
          raise Exception.Create('Já existe um cliente com este CPF/CNPJ!')
        else
          raise; // outros erros sobem normal
      end;
    end;
  end;
finally
  if Assigned(Qry) then FreeAndNil(Qry);
end;
end;

function TCliente.Apagar: Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_clienteId)+#13+
                'Descrição '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=False;
     Abort;
  end;

  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
    Connection:=ConexaoDB;
    SQL.Clear;
    SQL.Add('DELETE FROM clientes '+
            '  WHERE clienteId=:clienteId ');
    ParamByName('clienteId').AsInteger :=F_clienteId;
    end;
    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TCliente.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear;
      SQL.Add('SELECT clienteId, '+
              '       nome, '+
              '       documento, '+
              '       endereco, '+
              '       cidade, ' +
              '       bairro, '+
              '       estado, ' +
              '       cep, ' +
              '       numero, ' +
              '       telefone, '+
              '       email, '+
              '       situacaoId, '+
              '       observacao, '+
              '       datanascimento '+
              '  FROM clientes ' +
              ' WHERE clienteId=:clienteId');
      ParamByName('clienteId').AsInteger:=id;
      try
        Open;
        Self.F_clienteId          := FieldByName('clienteId').AsInteger;
        Self.F_nome               := FieldByName('nome').AsString;
        Self.F_documento          := FieldByName('documento').AsString;
        Self.F_endereco           := FieldByName('endereco').AsString;
        Self.F_cidade             := FieldByName('cidade').AsString;
        Self.F_bairro             := FieldByName('bairro').AsString;
        Self.F_estado             := FieldByName('estado').AsString;
        Self.F_cep                := FieldByName('cep').AsString;
        Self.F_numero             := FieldByName('numero').AsString;
        Self.F_telefone           := FieldByName('telefone').AsString;
        Self.F_observacao         := FieldByName('observacao').AsString;
        Self.F_email              := FieldByName('email').AsString;
        Self.F_dataNascimento     := FieldByName('dataNascimento').AsDateTime;
        if not FieldByName('situacaoId').IsNull then
          Self.F_situacaoId       := FieldByName('situacaoId').AsInteger;
        Self.F_dataNascimento     := FieldByName('dataNascimento').AsDateTime;
      except
      Result:=False;
      end;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

end.

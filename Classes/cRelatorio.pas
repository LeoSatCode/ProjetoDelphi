unit cRelatorio;

interface

uses
     System.Classes,Vcl.Controls,Vcl.ExtCtrls,
     Vcl.Dialogs,Vcl.Forms,Vcl.Buttons,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils,
     cAcaoAcesso, cUsuarioLogado, RLReport,
     cProVendas, uRelProVenda, uRelPreVenda,

     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Vcl.Graphics,
     Vcl.ExtDlgs;

type
  TRel = class
  private


  public
    oVenda:TVenda;
    class procedure MostrarRelatorioPreVenda(Form:TForm; oVenda:TVenda); static;
  end;

implementation


{ TRel }

class procedure TRel.MostrarRelatorioPreVenda(Form: TForm; oVenda:TVenda);
begin
  frmRelPreVenda:=TfrmRelPreVenda.Create(Form);
  frmRelPreVenda.QryVendas.Close;
  frmRelPreVenda.QryVendas.ParamByName('preVendaId').AsInteger     :=oVenda.VendaId;
  frmRelPreVenda.QryVendas.Open;

  frmRelPreVenda.QryVendaItens.Close;
  frmRelPreVenda.QryVendaItens.ParamByName('preVendaId').AsInteger :=oVenda.VendaId;
  frmRelPreVenda.QryVendaItens.Open;

  frmRelPreVenda.Relatorio.PreviewModal;
  frmRelPreVenda.Release;
end;

end.

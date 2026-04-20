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
     cProVendas, uRelGenerico,

     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Vcl.Graphics,
     Vcl.ExtDlgs;

type
  TFormRelClass = class of TfrmGenerico; // Tipo que representa a CLASSE do form e não a instancia dele

  TRel = class
  private


  public
    class procedure MostrarRelatorio(AOwner: TComponent; FormClass: TFormRelClass; oVenda: TVenda); static;
  end;

implementation


{ TRel }


{ TRel }

class procedure TRel.MostrarRelatorio(AOwner: TComponent; FormClass: TFormRelClass; oVenda: TVenda);
var frmRel: TfrmGenerico;
begin
  frmRel := FormClass.Create(AOwner);
  try
    frmRel.QryMaster.Close;
    frmRel.QryMaster.ParamByName('id').AsInteger := oVenda.VendaId;
    frmRel.QryMaster.Open;

    frmRel.QryDetalhes.Close;
    frmRel.QryDetalhes.ParamByName('id').AsInteger := oVenda.VendaId;
    frmRel.QryDetalhes.Open;

    frmRel.Relatorio.PreviewModal;
  finally
    frmRel.Free;
  end;
end;

end.

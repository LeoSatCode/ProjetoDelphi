unit cFuncao;

interface

uses System.Classes,Vcl.Controls,Vcl.ExtCtrls,
     Vcl.Dialogs,Vcl.Forms,Vcl.Buttons,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client, System.SysUtils,
     cAcaoAcesso, cUsuarioLogado, RLReport, cProVendas,

     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Vcl.Graphics,
     Vcl.ExtDlgs;

type
  TFuncao = class
  private


  public
    class procedure CriarForm(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TFDConnection); static;
    class procedure CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao:TFDConnection); static;
    class procedure CarregarImagem(aImage:TImage); static;
    class procedure LimparImagem(var aImage:TImage); static;
    class function SomenteNumeros(const Num: string): string; static;
  end;

implementation

uses
  uPrincipal;

{ TFuncao }

class procedure TFuncao.CarregarImagem(aImage:TImage);
var
  Bmp, BmpTrans: TBitmap;
  Jpg: TJPEGImage;
  Pic: TPicture;
  Png: TPngImage;
  opdSelecionar:TOpenPictureDialog;
  iWidth:Integer;
  iHeight:Integer;
begin
  Try
    iWidth:=160;
    iHeight:=130;
    opdSelecionar:=TOpenPictureDialog.Create(nil);
    opdSelecionar.Filter:='All (*.bmp;*.jpg; *.jpeg;*.png)|*.jpg; *.jpeg; *.bmp;*.png|Bitmaps '+
                          '(*.bmp)|*.bmp|JPEG Image File (*.jpg;*.jpeg)|*.jpg; *.jpeg| '+
                          'PNG(*.png)|*.png';
    opdSelecionar.Title:='Selecione a Imagem';
    opdSelecionar.Execute;

    if opdSelecionar.FileName<>EmptyStr then begin
      if (Pos('.JPG',UpperCase(opdSelecionar.FileName))>0) or ( Pos('.JPEG',UpperCase(opdSelecionar.FileName))>0) then begin
        Bmp := TBitmap.Create;
        Jpg := TJPEGImage.Create;
        Pic := TPicture.Create;
        try
          Pic.LoadFromFile(opdSelecionar.FileName);
          Jpg.Assign(Pic);
          Jpg.CompressionQuality :=7;
          Bmp.Width  :=iWidth;
          Bmp.Height :=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), Jpg);
          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          Jpg.Free;
          Bmp.Free;
        end
      End
      else if Pos('.PNG',UpperCase(opdSelecionar.FileName))>0 then begin
        Bmp := TBitmap.Create;
        png := TPngImage.Create;
        Pic := TPicture.Create;
        try
          Pic.LoadFromFile(opdSelecionar.FileName);
          png.Assign(Pic);
          Bmp.Width  :=iWidth;
          Bmp.Height :=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), png);

          aImage.Picture.Bitmap:=Bmp;

        finally
          Pic.Free;
          png.Free;
          Bmp.Free;
        end
      end
      else begin
        try
          Bmp := TBitmap.Create;
          BmpTrans:= TBitmap.Create;
          Pic := TPicture.Create;

          Pic.LoadFromFile(opdSelecionar.FileName);
          BmpTrans.Assign(Pic.Bitmap);
          Bmp.Width :=iWidth;
          Bmp.Height:=iHeight;
          Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.width, Bmp.Height), BmpTrans);
          aImage.Picture.Bitmap:=Bmp;
        finally
          Pic.Free;
          BmpTrans.Free;
          Bmp.Free;
        end;
      end;
    end;

  Finally
     FreeAndNil(opdSelecionar);
  End;

end;

class procedure TFuncao.CriarForm(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao: TFDConnection);
var form: TForm;
begin

  if(oUsuarioLogado.codigo <= 0) or (oUsuarioLogado.nome=EmptyStr) or (oUsuarioLogado.senha=EmptyStr) then exit;

  try
    uPrincipal.frmPrincipal.tmrAtualizacaoDashBoard.Enabled:=false;
    form := aNomeForm.Create(Application);
    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.name, aConexao) then
    begin
      form.ShowModal;
    end
    else
    begin
      MessageDlg('Usuario '+oUsuarioLogado.nome +' Não tem Permissão de Acesso',mtWarning,[mbOK],0);
    end;
  finally
    if Assigned(form) then
       form.Release;
    uPrincipal.frmPrincipal.tmrAtualizacaoDashBoard.Enabled:=True;
  end;

end;

class procedure TFuncao.CriarRelatorio(aNomeForm: TFormClass; oUsuarioLogado: TUsuarioLogado; aConexao: TFDConnection);
var form: TForm;
    aRelatorio:TRLReport;
    i:Integer;
begin
  try
    uPrincipal.frmPrincipal.tmrAtualizacaoDashBoard.Enabled:=false;
    form := aNomeForm.Create(Application);
    if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, form.Name, aConexao) then
    begin
      for I := 0 to form.ComponentCount-1 do
      begin
        if form.Components[i] is TRLReport then
        begin
          TRLReport(form.Components[i]).PreviewModal;
          Break;
        end;
      end;
    end
    else begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
    end;
  finally
    if Assigned(form) then
       form.Release;
    uPrincipal.frmPrincipal.tmrAtualizacaoDashBoard.Enabled:=True;
  end;
end;

class procedure TFuncao.LimparImagem(var aImage: TImage);
begin
  aImage.Picture.Assign(nil);
end;

class function TFuncao.SomenteNumeros(const Num:string):string;
var
  I:Integer;
begin
  Result:='';

  for I:= 1 to Length(Num) do
    if Num[I] in ['0'..'9'] then
    Result:= Result+Num[I];
end;


end.

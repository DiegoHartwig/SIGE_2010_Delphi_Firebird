// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UTema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,RibbonLunaStyleActnCtrls, RibbonObsidianStyleActnCtrls,RibbonSilverStyleActnCtrls, TeCanvas, TeeEdiGrad, ImgList;

type
  TfrmTemas = class(TForm)
    ButtonGradient1: TButtonGradient;
    Panel1: TPanel;
    ButtonGradient2: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemas: TfrmTemas;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TfrmTemas.ButtonGradient1Click(Sender: TObject);
begin
  frmPrincipal.Ribbon1.Style:=RibbonLunaStyle;
  frmPrincipal.Color:=$00F8E6D6;
  Panel1.Caption:='SIGE Tema Padrão';
  Panel1.Color:= $00F8E6D6;
  Panel1.Font.Color:=clBlue;
  Close;
end;

procedure TfrmTemas.ButtonGradient2Click(Sender: TObject);
begin
  frmPrincipal.Ribbon1.Style:=RibbonObsidianStyle;
  frmPrincipal.Color:=clScrollBar;
  frmPrincipal.Font.Color:=clWhite;
  Panel1.Caption:='SIGE Dark Theme';
  Panel1.Color:=clGrayText;
  Panel1.Font.Color:=clWhite;
  Close;
end;

procedure TfrmTemas.ButtonGradient3Click(Sender: TObject);
begin
  frmPrincipal.Ribbon1.Style:=RibbonSilverStyle;
  frmPrincipal.Color:=$00EBEBEB;
  Panel1.Caption:='SIGE Tema Prateado';
  Panel1.Color:=clBtnFace;
  Panel1.Font.Color:=clGray;
  Close;
end;

procedure TfrmTemas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.

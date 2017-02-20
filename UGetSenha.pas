//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UGetSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, TeCanvas, TeeEdiGrad, DB,
  IBCustomDataSet, IBQuery, pngimage;

type
  TfrmGetSenha = class(TForm)
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label3: TLabel;
    btnEntrar: TButtonGradient;
    btnFechar: TButtonGradient;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;

  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetSenha: TfrmGetSenha;

implementation

uses UdmBD, UPrincipal;

{$R *.dfm}













end.

// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, Mask, DBCtrls, ImgList,
  TeCanvas, TeeEdiGrad, IBQuery;

type
  TfrmSenhas = class(TForm)
    tabUsuarios: TIBDataSet;
    dsUsuarios: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TButtonGradient;
    btnSair: TButtonGradient;
    ImageList1: TImageList;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    edtLogin: TDBEdit;
    edtSenha: TDBEdit;
    tabUsuariosCOD_USU: TIntegerField;
    tabUsuariosNOME: TIBStringField;
    tabUsuariosSENHA: TIBStringField;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhas: TfrmSenhas;

implementation

uses UGetSenha, UdmBD;

{$R *.dfm}


procedure TfrmSenhas.btnSairClick(Sender: TObject);
begin
  if edtLogin.Text='' then
    Close
  else
   if MessageDlg('Você deseja sair sem Salvar?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      Close;
  end
  else
  btnSalvar.SetFocus;
end;
procedure TfrmSenhas.btnSalvarClick(Sender: TObject);
begin
  if (dsUsuarios.State in [dsBrowse]) and (edtLogin.Text='') and (edtSenha.Text='') then
  begin
     Application.MessageBox('Por Favor preêncha todos os campos corretamente!', 'Atenção  .:: S.I.G.E ::.', 48);
     exit;
  end
  else
  if (edtLogin.Text='') then
  begin
     Application.MessageBox('Preêncha o campo "Login"!', 'Atenção  .:: S.I.G.E ::.', 48);
     exit;
  end
  else
  if (edtSenha.Text='') then
  begin
     Application.MessageBox('Preêncha o campo "Senha" Corretamente!', 'Atenção  .:: S.I.G.E ::.', 48);
     exit;
  end
  else


  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then

      tabUsuarios.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      Application.MessageBox('Dados gravados com Sucesso!', 'Mensagem de Confirmação  .:: S.I.G.E ::.', 48);
      edtLogin.Text:='';
      edtSenha.Text:='';
      tabUsuarios.Append;

end;

procedure TfrmSenhas.FormCreate(Sender: TObject);
begin
  tabUsuarios.Open;
  tabUsuarios.FetchAll;


end;

procedure TfrmSenhas.FormShow(Sender: TObject);
begin
  tabUsuarios.Append;
  edtLogin.SetFocus;
end;

end.

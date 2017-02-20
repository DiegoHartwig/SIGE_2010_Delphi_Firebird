//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadSetor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeCanvas, TeeEdiGrad, DB, Mask, DBCtrls, IBCustomDataSet,
  ExtCtrls, ImgList;

type
  TfrmCadSetor = class(TForm)
    tabCadSetor: TIBDataSet;
    tabCadSetorNOME: TIBStringField;
    dsCadSetor: TDataSource;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ImageList: TImageList;
    ImageList1: TImageList;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    ButtonGradient4: TButtonGradient;
    tabCadSetorCOD_SET: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtSetor: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonGradient4Click(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
  private
    { Private declarations }
  public
     Cod_Setor : integer;
    { Public declarations }
  end;

var
  frmCadSetor: TfrmCadSetor;

implementation

uses UdmBD,  UCadUtilizador;

{$R *.dfm}

procedure TfrmCadSetor.btnEditarClick(Sender: TObject);
begin
   if dsCadSetor.State in [dsBrowse] then
   begin
    Application.MessageBox('Não há dados para editar!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else

   if (edtSetor.Text = '') then
  begin
    Application.MessageBox('Nenhum dado para Editar, Preencha o Campo Setor e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    exit
  end
  else
  tabCadSetor.Edit;
  edtSetor.SetFocus;
end;



procedure TfrmCadSetor.btnExcluirClick(Sender: TObject);
begin
if (dsCadSetor.State in [dsBrowse]) or (edtSetor.Text = '') then
    begin
     Application.MessageBox('Não há dados para Exclusão!', 'Atenção .:: S.I.G.E ::.', 48);
     exit;
    end
  else
    if MessageDlg('O Campo selecionado será excluído!  Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadSetor.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;



procedure TfrmCadSetor.btnFecharClick(Sender: TObject);
begin
  if edtSetor.Text='' then
    Close
  else

  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      Close;
      tabCadSetor.Close;
      tabCadSetor.Open;
    end
    else
    btnSalvar.SetFocus;
end;

procedure TfrmCadSetor.btnNovoClick(Sender: TObject);
begin
if (dsCadSetor.State in [dsBrowse]) or (edtSetor.Text='') then
begin
  Application.MessageBox('Por Favor Preecnha o Campo "Setor"!','Atenção .:: S.I.G.E .::', 48);
  exit;
end
else
  tabCadSetor.Append;
  edtSetor.SetFocus;
end;

procedure TfrmCadSetor.btnSalvarClick(Sender: TObject);
begin
  if (edtSetor.Text='') then
    begin
       Application.MessageBox('Por Favor preencha o Campo Descrição e Clique em Salvar!', 'Atenção .:: S.I.G.E .::', 48);
       Exit;
    end
  else
  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin
      tabCadSetor.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      ShowMessage('Dados gravados com Sucesso!');
      tabCadSetor.Append;
      edtSetor.SetFocus;
    end;

end;



procedure TfrmCadSetor.ButtonGradient1Click(Sender: TObject);
begin
  tabCadSetor.Last;
end;

procedure TfrmCadSetor.ButtonGradient2Click(Sender: TObject);
begin
  tabCadSetor.Next;
end;

procedure TfrmCadSetor.ButtonGradient3Click(Sender: TObject);
begin
  tabCadSetor.Prior;
end;

procedure TfrmCadSetor.ButtonGradient4Click(Sender: TObject);
begin
  tabCadSetor.First;
end;

procedure TfrmCadSetor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadSetor.FormShow(Sender: TObject);
begin
  tabCadSetor.Open;
  tabCadSetor.FetchAll;
  tabCadSetor.Append;
  edtSetor.SetFocus;
end;

end.

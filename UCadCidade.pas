//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, TeCanvas, TeeEdiGrad, DB, Mask, DBCtrls,
  IBCustomDataSet;

type
  TfrmCadCidade = class(TForm)
    tabCadCidade: TIBDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCadCidade: TDataSource;
    Label2: TLabel;
    edtCadCidade: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ImageList1: TImageList;
    ImageList: TImageList;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    ButtonGradient4: TButtonGradient;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    tabCadCidadeCOD_CID: TIntegerField;
    tabCadCidadeNOME: TIBStringField;
    tabCadCidadeCEP: TIBStringField;
    tabCadCidadeUF: TIBStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ButtonGradient4Click(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Cidade : integer;
  end;

var
  frmCadCidade: TfrmCadCidade;

implementation

uses UdmBD, UCadUtilizador;

{$R *.dfm}

procedure TfrmCadCidade.btnEditarClick(Sender: TObject);
begin
   if dsCadCidade.State in [dsBrowse] then
   begin
    Application.MessageBox('Não há dados para editar!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else

   if (edtCadCidade.Text = '') then
  begin
    Application.MessageBox('Nenhum dado para Editar, Preencha o Campo "Cidade" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    exit
  end
  else
  tabCadCidade.Edit;
  edtCadCidade.SetFocus;
end;

procedure TfrmCadCidade.btnExcluirClick(Sender: TObject);
begin
if (dsCadCidade.State in [dsBrowse]) or (edtCadCidade.Text = '') then
    begin
     Application.MessageBox('Não há dados para Exclusão!', 'Atenção .:: S.I.G.E ::.', 48);
     exit;
    end
  else
    if MessageDlg('O Campo selecionado será excluído!  Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadCidade.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;


procedure TfrmCadCidade.btnFecharClick(Sender: TObject);
begin
  if dsCadCidade.State in [dsBrowse] then
  Close
  else
  if edtCadCidade.Text='' then
    Close
  else

   if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],1) = id_yes then
     btnSalvar.SetFocus
   else
   Close;
end;


procedure TfrmCadCidade.btnNovoClick(Sender: TObject);
begin
  tabCadCidade.Append;
  edtCadCidade.SetFocus;
end;




procedure TfrmCadCidade.btnSalvarClick(Sender: TObject);
begin
  if (edtCadCidade.Text='') then
    begin
       Application.MessageBox('Por Favor preencha o Campo "Cidade" e Clique em Salvar!', 'Atenção .:: S.I.G.E .::', 48);
       Exit;
    end
  else
  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin

      tabCadCidade.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      ShowMessage('Dados gravados com Sucesso!');
      tabCadCidade.Close;
      tabCadCidade.Open;
      tabCadCidade.Append;
      edtCadCidade.SetFocus;
    end;
end;


procedure TfrmCadCidade.ButtonGradient1Click(Sender: TObject);
begin
  tabCadCidade.Last;
end;

procedure TfrmCadCidade.ButtonGradient2Click(Sender: TObject);
begin
  tabCadCidade.Next;
end;

procedure TfrmCadCidade.ButtonGradient3Click(Sender: TObject);
begin
  tabCadCidade.Prior;
end;

procedure TfrmCadCidade.ButtonGradient4Click(Sender: TObject);
begin
  tabCadCidade.Append;
end;

procedure TfrmCadCidade.FormCreate(Sender: TObject);
begin
  tabCadCidade.Open;
  tabCadCidade.FetchAll;
end;

procedure TfrmCadCidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

procedure TfrmCadCidade.FormShow(Sender: TObject);
begin
  tabCadCidade.Append;
  edtCadCidade.SetFocus;
end;

end.

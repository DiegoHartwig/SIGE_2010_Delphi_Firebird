//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, IBCustomDataSet, ImgList, TeCanvas,
  TeeEdiGrad;

type
  TfrmCadModelo = class(TForm)
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    ButtonGradient4: TButtonGradient;
    btnFechar: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnEditar: TButtonGradient;
    btnNovo: TButtonGradient;
    ImageList1: TImageList;
    ImageList: TImageList;
    tabCadModelo: TIBDataSet;
    tabCadModeloCOD_MOD: TIntegerField;
    tabCadModeloNOME: TIBStringField;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    dsCadModelo: TDataSource;
    Label2: TLabel;
    edtModelo: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonGradient4Click(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Modelo : integer;
  end;

var
  frmCadModelo: TfrmCadModelo;

implementation

uses UdmBD, UCadEquipamento;

{$R *.dfm}

procedure TfrmCadModelo.btnEditarClick(Sender: TObject);
begin
  begin
   if dsCadModelo.State in [dsBrowse] then
   begin
    Application.MessageBox('Não há dados para editar!', 'Mensagem de Alerta  .:: S.I.G.E ::.', 48);
    exit;
   end
   else

   if (edtModelo.Text = '') then
  begin
    Application.MessageBox('Nenhum dado para Editar!', 'Aviso', 48);
    exit
  end
  else
  tabCadModelo.Edit;
  dmBD.trBD_SIGE.CommitRetaining;
  edtModelo.SetFocus;
end;
end;

procedure TfrmCadModelo.btnExcluirClick(Sender: TObject);
begin
if (dsCadModelo.State in [dsBrowse]) or (edtModelo.Text = '') then
    begin
     Application.MessageBox('Não há dados para Exclusão!', 'Mensagem de Alerta  .:: S.I.G.E ::.', 48);
     exit;
    end
  else
    if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadModelo.Delete;
    dmBD.trBD_SIGE.CommitRetaining;
    ShowMessage('Dados Excluídos com Sucesso');
end;

procedure TfrmCadModelo.btnNovoClick(Sender: TObject);

begin
  if (dsCadModelo.State in [dsBrowse]) and (edtModelo.Text ='') then
    begin
      Application.MessageBox('Por Favor Preencha todos os campos corretamente e clique em Salvar!', 'Mensagem de Alerta  .:: S.I.G.E ::.', 48);
      exit;
    end
  else
  tabCadModelo.Append;
  edtModelo.SetFocus;
end;
procedure TfrmCadModelo.btnFecharClick(Sender: TObject);
begin
  if edtModelo.Text = '' then
    Close
  else
   if MessageDlg('Você está certo disso??',mtConfirmation, [mbYes,mbNo],1) = id_yes then
     btnSalvar.SetFocus
   else
   Close;
   tabCadModelo.Close;
   tabCadModelo.Open;
   frmCadEquipamento.tabModelo.Close;
   frmCadEquipamento.tabModelo.Open;
end;


procedure TfrmCadModelo.btnSalvarClick(Sender: TObject);
begin

  if (edtModelo.Text='') then
    begin
       Application.MessageBox('Por Favor preencha o Campo Descrição!', 'Mensagem de Alerta  .:: S.I.G.E ::.', 48);
       Exit;
    end
  else
  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin
      tabCadModelo.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      frmCadEquipamento.tabModelo.Close;
      frmCadEquipamento.tabModelo.Open;
      ShowMessage('Dados gravados com Sucesso!');
      tabCadModelo.Append;
      edtModelo.SetFocus;
    end
end;


procedure TfrmCadModelo.ButtonGradient1Click(Sender: TObject);
begin
  tabCadModelo.Last;
end;

procedure TfrmCadModelo.ButtonGradient2Click(Sender: TObject);
begin
  tabCadModelo.Next;
end;

procedure TfrmCadModelo.ButtonGradient3Click(Sender: TObject);
begin
  tabCadModelo.Prior;
end;

procedure TfrmCadModelo.ButtonGradient4Click(Sender: TObject);
begin
  tabCadModelo.First;
end;

procedure TfrmCadModelo.FormCreate(Sender: TObject);
begin
  tabCadModelo.Open;
  tabCadModelo.FetchAll;
end;

procedure TfrmCadModelo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;
end;

procedure TfrmCadModelo.FormShow(Sender: TObject);
begin
  tabCadModelo.Append;
  edtModelo.SetFocus;
end;

end.

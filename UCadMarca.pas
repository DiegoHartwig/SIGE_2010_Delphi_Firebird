//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, IBCustomDataSet, ImgList, TeCanvas,
  TeeEdiGrad;

type
  TfrmCadMarca = class(TForm)
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    tabCadMarca: TIBDataSet;
    tabCadMarcaCOD_MARC: TIntegerField;
    tabCadMarcaNOME: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCadMarca: TDataSource;
    Label2: TLabel;
    edtMarca: TDBEdit;
    ImageList: TImageList;
    ButtonGradient4: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient1: TButtonGradient;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure ButtonGradient4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Marca : integer;
  end;

var
  frmCadMarca: TfrmCadMarca;

implementation

uses UdmBD, UCadEquipamento;

{$R *.dfm}

procedure TfrmCadMarca.btnEditarClick(Sender: TObject);
begin
   if dsCadMarca.State in [dsBrowse] then
   begin
    Application.MessageBox('Não há dados para editar!', 'Aviso', 48);
    exit;
   end
   else

   if (edtMarca.Text = '') then
  begin
    Application.MessageBox('Nenhum dado para Editar!', 'Aviso', 48);
    exit
  end
  else
  tabCadMarca.Edit;
  edtMarca.SetFocus;
end;


procedure TfrmCadMarca.btnExcluirClick(Sender: TObject);
begin
if (dsCadMarca.State in [dsBrowse]) or (edtMarca.Text = '') then
    begin
     Application.MessageBox('Não há dados para Exclusão!', 'Aviso', 48);
     exit;
    end
  else
    if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadMarca.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;

procedure TfrmCadMarca.btnFecharClick(Sender: TObject);
begin
  if edtMarca.Text='' then
    Close
  else
   if MessageDlg('Você está certo disso??',mtConfirmation, [mbYes,mbNo],1) = id_yes then
    begin
      btnSalvar.SetFocus;
      frmCadEquipamento.tabMarcaEquip.Close;
      frmCadEquipamento.tabMarcaEquip.Open;
    end
   else
    Close;
end;








procedure TfrmCadMarca.btnNovoClick(Sender: TObject);
begin
  if (dsCadMarca.State in [dsBrowse]) and (edtMarca.Text ='') then
    begin
      Application.MessageBox('Por Favor Preencha todos os campos corretamente e clique em Salvar!', 'Aviso', 48);
      exit;

    end
  else
  tabCadMarca.Append;
  edtMarca.SetFocus;
end;

procedure TfrmCadMarca.btnSalvarClick(Sender: TObject);
begin
  if (edtMarca.Text='') then
    begin
       Application.MessageBox('Por Favor preencha o Campo Descrição!', 'Aviso', 48);
       Exit;
    end
  else
  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin
      tabCadMarca.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      frmCadEquipamento.tabMarcaEquip.Close;
      frmCadEquipamento.tabMarcaEquip.Open;
      ShowMessage('Dados gravados com Sucesso!');
      tabCadMarca.Append;
      edtMarca.SetFocus;
    end
end;


procedure TfrmCadMarca.ButtonGradient1Click(Sender: TObject);
begin
  tabCadMarca.Last;
end;

procedure TfrmCadMarca.ButtonGradient2Click(Sender: TObject);
begin
  tabCadMarca.Next;
end;

procedure TfrmCadMarca.ButtonGradient3Click(Sender: TObject);
begin
  tabCadMarca.Prior;
end;

procedure TfrmCadMarca.ButtonGradient4Click(Sender: TObject);
begin
  tabCadMarca.First;
end;

procedure TfrmCadMarca.FormCreate(Sender: TObject);
begin

  tabCadMarca.Open;
  tabCadMarca.FetchAll;
end;

procedure TfrmCadMarca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;


procedure TfrmCadMarca.FormShow(Sender: TObject);
begin
  tabCadMarca.Append;
  edtMarca.SetFocus;
end;

end.

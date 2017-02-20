//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadTipoEquip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, IBCustomDataSet, TeCanvas, TeeEdiGrad,
  ImgList;

type
  TfrmCadTipoEquip = class(TForm)
    tabCadTipoEquip: TIBDataSet;
    dsCadTipoEquip: TDataSource;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    ButtonGradient4: TButtonGradient;
    ImageList1: TImageList;
    ImageList: TImageList;
    tabCadTipoEquipCOD_TIP_EQ: TIntegerField;
    tabCadTipoEquipNOME: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtCadTipo: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    { Public declarations }

  end;

var
  frmCadTipoEquip: TfrmCadTipoEquip;
  Cod_Tipo_Equip : integer;

implementation

uses UdmBD, UCadEquipamento;

{$R *.dfm}

procedure TfrmCadTipoEquip.btnEditarClick(Sender: TObject);
begin
   if dsCadTipoEquip.State in [dsBrowse] then
   begin
    Application.MessageBox('Não há dados para editar!', 'Aviso', 48);
    exit;
   end
   else

   if (edtCadTipo.Text = '') then
  begin
    Application.MessageBox('Nenhum dado para Editar!', 'Aviso', 48);
    exit
  end
  else
  tabCadTipoEquip.Edit;
  edtCadTipo.SetFocus;
end;

procedure TfrmCadTipoEquip.btnExcluirClick(Sender: TObject);
begin
if (dsCadTipoEquip.State in [dsBrowse]) or (edtCadTipo.Text = '') then
    begin
     Application.MessageBox('Não há dados para Exclusão!', 'Aviso', 48);
     exit;
    end
  else
    if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadTipoEquip.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;

procedure TfrmCadTipoEquip.btnFecharClick(Sender: TObject);
begin

  if (edtCadTipo.Text ='') then
    Close
  else
  if MessageDlg('Você Está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
       frmCadEquipamento.tabTipoEquip.Close;
       frmCadEquipamento.tabTipoEquip.Open;
       Close;
    end
    else
    btnSalvar.SetFocus;
end;


procedure TfrmCadTipoEquip.btnNovoClick(Sender: TObject);
begin
  if (dsCadTipoEquip.State in [dsBrowse]) and (edtCadTipo.Text ='') then
    begin
      Application.MessageBox('Por Favor Preencha todos os campos corretamente e clique em Salvar!', 'Aviso', 48);
      exit;

    end
  else
  tabCadTipoEquip.Append;
  edtCadTipo.SetFocus;
end;

procedure TfrmCadTipoEquip.btnSalvarClick(Sender: TObject);
begin

  if (edtCadTipo.Text='') then
    begin
       Application.MessageBox('Por Favor preencha o Campo Descrição!', 'Aviso', 48);
       Exit;
    end
  else
  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin
      tabCadTipoEquip.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      frmCadEquipamento.tabTipoEquip.Close;
      frmCadEquipamento.tabTipoEquip.Open;
      ShowMessage('Dados gravados com Sucesso!');
    end
end;

procedure TfrmCadTipoEquip.ButtonGradient1Click(Sender: TObject);
begin
  tabCadTipoEquip.Last;
end;

procedure TfrmCadTipoEquip.ButtonGradient2Click(Sender: TObject);
begin
  tabCadTipoEquip.Next;
end;

procedure TfrmCadTipoEquip.ButtonGradient3Click(Sender: TObject);
begin
  tabCadTipoEquip.Prior;
end;

procedure TfrmCadTipoEquip.ButtonGradient4Click(Sender: TObject);
begin
  tabCadTipoEquip.First;
end;

procedure TfrmCadTipoEquip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadTipoEquip.FormCreate(Sender: TObject);
begin
  tabCadTipoEquip.Open;
  tabCadTipoEquip.FetchAll;
end;

procedure TfrmCadTipoEquip.FormShow(Sender: TObject);
begin
  tabCadTipoEquip.Append;
  edtCadTipo.SetFocus;
end;

end.

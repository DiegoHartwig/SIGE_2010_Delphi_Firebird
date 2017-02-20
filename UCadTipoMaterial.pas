//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadTipoMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeCanvas, TeeEdiGrad, ImgList, DB, Mask, DBCtrls,
  IBCustomDataSet;

type
  TfrmCadTipoMaterial = class(TForm)
    tabCadTipoMaterial: TIBDataSet;
    tabCadTipoMaterialCOD_TIP_MT: TIntegerField;
    tabCadTipoMaterialNOME: TIBStringField;
    Label1: TLabel;
    edtCodTipoMaterial: TDBEdit;
    dsCadTipoMaterial: TDataSource;
    Label2: TLabel;
    edtTipoMaterial: TDBEdit;
    ImageList: TImageList;
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
    procedure ButtonGradient4Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_TipoMaterial : integer;
  end;

var
  frmCadTipoMaterial: TfrmCadTipoMaterial;

implementation

uses UdmBD, UCadMaterial;

{$R *.dfm}

procedure TfrmCadTipoMaterial.btnEditarClick(Sender: TObject);
begin
  if (dsCadTipoMaterial.State in [dsBrowse]) or (edtTipoMaterial.Text='') then
    begin
      Application.MessageBox('Não há dados para Editar!', 'Atenção .:: S.I.G.E .::', 48);
      exit;
    end
    else
    tabCadTipoMaterial.Edit;
    edtTipoMaterial.SetFocus;
end;


procedure TfrmCadTipoMaterial.btnExcluirClick(Sender: TObject);
begin
  if (dsCadTipoMaterial.State in [dsBrowse]) or (edtTipoMaterial.Text='') then
    begin
      Application.MessageBox('Por Favor preêncha os campos corretamente e clique em salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
      exit;
    end
    else
    tabCadTipoMaterial.Delete;
    ShowMessage('Dados excluídos com Sucesso!');
end;

procedure TfrmCadTipoMaterial.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadTipoMaterial.btnNovoClick(Sender: TObject);
begin
if (dsCadTipoMaterial.State in [dsBrowse]) or (edtTipoMaterial.Text='') then
  begin
    Application.MessageBox('Por Favor preêncha os campos corretamente e clique em salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
    exit;
  end
  else
  tabCadTipoMaterial.Append;
  edtTipoMaterial.SetFocus;
end;

procedure TfrmCadTipoMaterial.btnSalvarClick(Sender: TObject);
begin
  if (dsCadTipoMaterial.State in [dsBrowse]) and (edtTipoMaterial.Text='') then
    begin
     Application.MessageBox('Por Favor preêncha os campos corretamente e clique em salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
     exit;
    end
    else
    if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin
     tabCadTipoMaterial.Post;
      dmBD.trBD_SIGE.CommitRetaining;
      ShowMessage('Dados gravados com Sucesso!');
      tabCadTipoMaterial.Append;
      edtTipoMaterial.SetFocus;
      frmCadMaterial.tabTipoMaterial.Close;
      frmCadMaterial.tabTipoMaterial.Open;
end;
end;

procedure TfrmCadTipoMaterial.ButtonGradient1Click(Sender: TObject);
begin
  tabCadTipoMaterial.Last;
end;

procedure TfrmCadTipoMaterial.ButtonGradient2Click(Sender: TObject);
begin
  tabCadTipoMaterial.Next;
end;

procedure TfrmCadTipoMaterial.ButtonGradient3Click(Sender: TObject);
begin
  tabCadTipoMaterial.Prior;
end;

procedure TfrmCadTipoMaterial.ButtonGradient4Click(Sender: TObject);
begin
  tabCadTipoMaterial.First;
end;

procedure TfrmCadTipoMaterial.FormShow(Sender: TObject);
begin
  edtTipoMaterial.SetFocus;
end;

end.

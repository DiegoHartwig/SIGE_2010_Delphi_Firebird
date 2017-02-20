//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, IBCustomDataSet, TeCanvas, TeeEdiGrad,
  ImgList, Grids, DBGrids, ExtCtrls;

type
  TfrmCadMaterial = class(TForm)
    tabCadMaterial: TIBDataSet;
    tabCadMaterialCOD_MAT: TIntegerField;
    tabCadMaterialNOME: TIBStringField;
    tabCadMaterialCOD_TIP_MT: TIntegerField;
    tabCadMaterialQUANTIDADE: TIBBCDField;
    tabCadMaterialOBSERVACOES: TIBStringField;
    Label1: TLabel;
    edtCodMaterial: TDBEdit;
    dsCadMaterial: TDataSource;
    Label2: TLabel;
    edtMaterial: TDBEdit;
    Label3: TLabel;
    edtCodTipoMaterial: TDBEdit;
    Label4: TLabel;
    edtQuantidade: TDBEdit;
    Label5: TLabel;
    edtObservacoes: TDBMemo;
    ImageList1: TImageList;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    panelTipoMaterial: TPanel;
    panelCid: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridTipoMaterial: TDBGrid;
    tabTipoMaterial: TIBDataSet;
    edtTipoMaterial: TDBEdit;
    tabTipoMaterialCOD_TIP_MT: TIntegerField;
    tabTipoMaterialNOME: TIBStringField;
    dsTipoMaterial: TDataSource;
    ButtonGradient1: TButtonGradient;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCidOkClick(Sender: TObject);
    procedure DBGridTipoMaterialDblClick(Sender: TObject);
    procedure btnCadastrarCidClick(Sender: TObject);
    procedure btnCidExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnUtilCidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
  COD_MATERIAL : integer;
    { Public declarations }
  end;

var
  frmCadMaterial: TfrmCadMaterial;

implementation

uses UdmBD, UCadTipoMaterial;

{$R *.dfm}

procedure TfrmCadMaterial.btnCadastrarCidClick(Sender: TObject);
begin
 with TfrmCadTipoMaterial.Create(self) do
 begin
   try
     Cod_TipoMaterial:= tabCadTipoMaterialCOD_TIP_MT.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabTipoMaterial.Close;
 tabTipoMaterial.Open;
 tabTipoMaterial.FetchAll;

end;


procedure TfrmCadMaterial.btnCidExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabTipoMaterial.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmCadMaterial.btnCidOkClick(Sender: TObject);
var
  NOME : integer;
  TIPO: string;
begin
  NOME:= tabTipoMaterialCOD_TIP_MT.AsInteger;
  if NOME = tabTipoMaterialCOD_TIP_MT.Value then
    edtCodTipoMaterial.Text:=IntToStr(NOME);
    TIPO:=tabTipoMaterialNOME.AsString;
    if TIPO =tabTipoMaterialNOME.Value then
      edtTipoMaterial.Text:=(TIPO);
      panelTipoMaterial.Visible:=false;
      frmCadMaterial.Width:=503;
      edtQuantidade.SetFocus;

end;


procedure TfrmCadMaterial.btnEditarClick(Sender: TObject);
begin
  if (edtMaterial.Text='') then
  begin
    Application.MessageBox('Nenhum dado para editar!', 'Atenção  .:: S.I.G.E', 48);
  end
  else
  tabCadMaterial.Edit;
  edtMaterial.SetFocus;
end;

procedure TfrmCadMaterial.btnExcluirClick(Sender: TObject);
  begin
  if(dsCadMaterial.State in [dsBrowse]) or (edtMaterial.Text='') then
  begin
    Application.MessageBox('Não há dados para apagar!', 'Atenção  .:: S.I.G.E', 48);
    exit;
   end
  else
  if messageDlg('Você está certo disso?', mtconfirmation, [mbyes, mbno], 0) =id_yes then
  begin
    edtCodMaterial.text:='';
    edtMaterial.Text:='';
    edtCodTipoMaterial.Text:='';
    edtTipoMaterial.Text:='';
    edtQuantidade.Text:='';
    edtObservacoes.Text:='';
  end;
end;

procedure TfrmCadMaterial.btnFecharClick(Sender: TObject);
begin
  if edtMaterial.Text='' then
    Close
  else

  if MessageDlg('Você deseja sair sem Salvar?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      Close;
    end
    else
    btnSalvar.SetFocus;
end;

procedure TfrmCadMaterial.btnNovoClick(Sender: TObject);
begin
  if (dsCadMaterial.State in [dsBrowse]) and (edtMaterial.Text='') and (edtTipoMaterial.Text='') and (edtQuantidade.Text='')then
   Application.MessageBox('Por Favor Preencha todos os campos corretamente e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
   exit;

end;

procedure TfrmCadMaterial.btnSalvarClick(Sender: TObject);
begin
  if (dsCadMaterial.State in [dsBrowse]) and (edtMaterial.Text='') and (edtCodTipoMaterial.Text='') and (edtTipoMaterial.Text='') and (edtQuantidade.Text='') and (edtObservacoes.Text='') then
  begin
      Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
      Exit;
    end
    else
    if (edtMaterial.Text='') then
      begin
        Application.MessageBox('Por Favor preencha o campo "Material" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
       exit;
  end
  else
  if (edtTipoMaterial.text='') then
    begin
      Application.MessageBox('Por Favor preencha o campo "Tipo de Material" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;

  end
  else
  if (edtQuantidade.text='') then
    begin
      Application.MessageBox('Por Favor preencha o campo "Quantidade" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
  end
  else
     if Messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno],0)=id_yes then
      begin
        frmCadMaterial.tabCadMaterialCOD_TIP_MT.Text:=edtCodTipoMaterial.Text;
      end;
      begin
        tabCadMaterial.Post;
        dmBD.trBD_SIGE.CommitRetaining;
      end;
        begin
          Application.MessageBox('Dados Gravados com Sucesso!', 'Atenção .:: S.I.G.E ::. ', 48);
          tabCadMaterial.Append;
          edtMaterial.SetFocus;
          edtCodMaterial.text:='';
          edtMaterial.Text:='';
          edtCodTipoMaterial.Text:='';
          edtTipoMaterial.Text:='';
          edtQuantidade.Text:='';
          edtObservacoes.Text:='';
        end;

end;

procedure TfrmCadMaterial.btnUtilCidadeClick(Sender: TObject);
begin
    panelTipoMaterial.Visible:=false;
    frmCadMaterial.Width:=503;
end;

procedure TfrmCadMaterial.ButtonGradient1Click(Sender: TObject);
begin
   frmCadMaterial.Width:=1026;
  frmCadMaterial.Height:=555;
  panelTipoMaterial.Visible:=True;
end;

procedure TfrmCadMaterial.DBGridTipoMaterialDblClick(Sender: TObject);
var
  NOME : integer;
  TIPO: string;
begin
  NOME:= tabTipoMaterialCOD_TIP_MT.AsInteger;
  if NOME = tabTipoMaterialCOD_TIP_MT.Value then
    edtCodTipoMaterial.Text:=IntToStr(NOME);
    TIPO:=tabTipoMaterialNOME.AsString;
    if TIPO =tabTipoMaterialNOME.Value then
      edtTipoMaterial.Text:=(TIPO);
      panelTipoMaterial.Visible:=false;
      frmCadMaterial.Width:=503;
      edtQuantidade.SetFocus;

end;

procedure TfrmCadMaterial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadMaterial.FormCreate(Sender: TObject);
begin
  tabCadMaterial.Open;
  tabCadMaterial.FetchAll;
  tabTipoMaterial.Open;
  tabTipoMaterial.FetchAll;
end;

procedure TfrmCadMaterial.FormShow(Sender: TObject);
begin
  tabCadMaterial.Append;
  edtMaterial.SetFocus;
end;

end.

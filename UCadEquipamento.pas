//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadEquipamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeCanvas, TeeEdiGrad, ImgList, DBCtrls, DB, Mask,
  IBCustomDataSet, ExtCtrls, Grids, DBGrids, IBQuery;

type
  TfrmCadEquipamento = class(TForm)
    tabCadEquipamento: TIBDataSet;
    tabCadEquipamentoCOD_EQ: TIntegerField;
    tabCadEquipamentoNOME: TIBStringField;
    tabCadEquipamentoCOD_TIP_EQ: TIntegerField;
    tabCadEquipamentoCOD_MARC: TIntegerField;
    tabCadEquipamentoCOD_MOD: TIntegerField;
    tabCadEquipamentoOBS: TMemoField;
    Label1: TLabel;
    edtCodEquip: TDBEdit;
    dsCadEquipamento: TDataSource;
    edtEquipamento: TDBEdit;
    Label3: TLabel;
    edtCodTipo: TDBEdit;
    Label4: TLabel;
    edtCodMarca: TDBEdit;
    Label5: TLabel;
    edtCodModelo: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    edtTipoEquip: TDBEdit;
    edtMarca: TDBEdit;
    edtModelo: TDBEdit;
    ImageList1: TImageList;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient1: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    panelTipo: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    tabTipoEquip: TIBDataSet;
    Label7: TLabel;
    dsTipoEquip: TDataSource;
    btnExcluirEquip: TButtonGradient;
    panelMarca: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    tabMarcaEquip: TIBDataSet;
    tabMarcaEquipCOD_MARC: TIntegerField;
    tabMarcaEquipNOME: TIBStringField;
    dsMarca: TDataSource;
    tabModelo: TIBDataSet;
    btnEquipExcluir: TButtonGradient;
    panelmodelo: TPanel;
    Label8: TLabel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    btnModeloFechar: TButtonGradient;
    btnModeloExcluir: TButtonGradient;
    tabModeloCOD_MOD: TIntegerField;
    tabModeloNOME: TIBStringField;
    dsModelo: TDataSource;
    btnCadastrarModelo: TButtonGradient;
    btnCadastrarTipoEquip: TButtonGradient;
    btnMarcaOK: TButtonGradient;
    btnMarcaCadastrar: TButtonGradient;
    btnMarcaExcluir: TButtonGradient;
    btnMarcaFechar: TButtonGradient;
    btnTipoOk: TButtonGradient;
    btnModeloOk: TButtonGradient;
    DBGrid2: TDBGrid;
    tabTipoEquipCOD_TIP_EQ: TIntegerField;
    tabTipoEquipNOME: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEquipOkClick(Sender: TObject);
    procedure btnExcluirEquipClick(Sender: TObject);

    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure btnEquipExcluirClick(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure ButtonGradient9Click(Sender: TObject);
    procedure btnModeloExcluirClick(Sender: TObject);
    procedure btnMarcaOKClick(Sender: TObject);
    procedure btnMarcaCadastrarClick(Sender: TObject);
    procedure btnMarcaExcluirClick(Sender: TObject);
    procedure btnMarcaFecharClick(Sender: TObject);
    procedure btnCadastrarModeloClick(Sender: TObject);
    procedure btnCadastrarTipoEquipClick(Sender: TObject);
    procedure tabModeloAfterDelete(DataSet: TDataSet);
    procedure tabCadEquipamentoAfterDelete(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnTipoOkClick(Sender: TObject);
    procedure btnModeloOkClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Marca : integer;
    Cod_Equipamento : integer;
    Cod_Modelo : integer;
    Cod_Tipo_Equip : integer;
  end;

var
  frmCadEquipamento: TfrmCadEquipamento;

implementation

uses UdmBD, UCadTipoEquip, UCadMarca, UCadModelo;

{$R *.dfm}

procedure TfrmCadEquipamento.btnCadastrarModeloClick(Sender: TObject);
begin
 with TfrmCadModelo.Create(self) do
 begin
   try
     Cod_Modelo:= tabModeloCOD_MOD.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabModelo.Close;
 tabModelo.Open;
 tabModelo.FetchAll;
end;



procedure TfrmCadEquipamento.btnMarcaCadastrarClick(Sender: TObject);
begin
 with TfrmCadMarca.Create(self) do
 begin
   try
     Cod_Marca:= tabMarcaEquipCOD_MARC.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabMarcaEquip.Close;
 tabMarcaEquip.Open;
 tabMarcaEquip.FetchAll;
end;

procedure TfrmCadEquipamento.btnMarcaExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabMarcaEquip.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;

procedure TfrmCadEquipamento.btnMarcaFecharClick(Sender: TObject);
begin
 panelMarca.Visible:=false;
 panelModelo.Visible:=true;

end;

procedure TfrmCadEquipamento.btnMarcaOKClick(Sender: TObject);
var
  NOME : integer;
  MARCA: string;
begin
  NOME:= tabMarcaEquipCOD_MARC.AsInteger;
  if NOME = tabMarcaEquipCOD_MARC.Value then
    edtCodMarca.Text:=IntToStr(NOME);
    MARCA:=tabMarcaEquipNOME.AsString;
    if MARCA = tabMarcaEquipNOME.Value then
      edtMarca.Text:=(MARCA);
    frmCadEquipamento.Width:=503;
    panelMarca.Visible:=false;
    panelModelo.Visible:=false;
    panelTipo.Visible:=false;
end;


procedure TfrmCadEquipamento.btnEquipOkClick(Sender: TObject);
var
  NOME : integer;
  MODELO: string;
begin
  NOME:= tabModeloCOD_MOD.AsInteger;
  if NOME = tabModeloCOD_MOD.Value then
    edtCodModelo.Text:=IntToStr(NOME);
    MODELO:=tabModeloNOME.AsString;
    if MODELO = tabModeloNOME.Value then
      edtModelo.Text:=(MODELO);
      frmCadEquipamento.Width:=503;
end;



procedure TfrmCadEquipamento.btnModeloExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabMODELO.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmCadEquipamento.btnModeloOkClick(Sender: TObject);
var
  NOME : integer;
  MODELO: string;
begin
  NOME:= tabModeloCOD_MOD.AsInteger;
  if NOME = tabModeloCOD_MOD.Value then
    edtCodModelo.Text:=IntToStr(NOME);
    MODELO:=tabModeloNOME.AsString;
    if MODELO = tabModeloNOME.Value then
      edtModelo.Text:=(MODELO);
  frmCadEquipamento.Width:=503;
  panelmodelo.Visible:=false;
end;


procedure TfrmCadEquipamento.btnNovoClick(Sender: TObject);
begin
  if (dsCadEquipamento.State in [dsBrowse]) and (edtEquipamento.Text='') and (edtTipoEquip.Text ='') and (edtMarca.Text ='') and (edtModelo.Text ='') then
  begin
    Application.MessageBox('Por Favor Preencha todos os campos corretamente e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
  if (edtEquipamento.Text ='') then
   begin
    Application.MessageBox('Por Favor preencha o campo "Equipamento"!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else
   if (edtTipoEquip.Text='') then
   begin
     Application.MessageBox('Por Favor Selecione o "Tipo de Equipamento"!', 'Atenção .:: S.I.G.E ::.', 48);
     exit;
     end
   else
   if (edtMarca.Text ='') then
   begin
     Application.MessageBox('Por Favor Selecione a "Marca do Equipamento"!', 'Atenção .:: S.I.G.E ::.', 48);
     exit;
   end
   else
   if (edtModelo.Text ='')then
   begin
    Application.MessageBox('Por Favor Selecione o "Modelo do Equipamento"!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end


end;



procedure TfrmCadEquipamento.btnSalvarClick(Sender: TObject);
begin
 if (dsCadEquipamento.State in [dsBrowse]) and (edtEquipamento.Text='') and (edtTipoEquip.Text ='') and (edtMarca.Text ='') and (edtModelo.Text ='') then
  begin
    Application.MessageBox('Por Favor Preencha todos os campos corretamente e Clique em Salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
    exit;
  end
  else
  if (edtEquipamento.Text='') then
    begin
      Application.MessageBox('Por Favor Preencha O campo "Equipamento", e Clique em Salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
      exit;
    end
    else
    if (edtTipoEquip.Text='') then
      begin
        Application.MessageBox('Por Favor escolha o "Tipo de Equipamento", e Clique em Salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
        exit;


      end
      else
      if (edtMarca.Text='') then
      begin
        Application.MessageBox('Por Favor Escolha a "Marca do Equipamento"  e Clique em Salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
        exit;

      end
      else
      if (edtModelo.Text='') then
      begin
        Application.MessageBox('Por Favor escolha o "Modelo do Equipamento",  e Clique em Salvar!', 'Atenção  .:: S.I.G.E ::.', 48);
        exit;

      end
      else

    begin
      if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then

      frmCadEquipamento.tabCadEquipamentoCOD_TIP_EQ.Text:=edtCodTipo.Text;
      frmCadEquipamento.tabCadEquipamentoCOD_MARC.Text:=edtCodMarca.Text;
      frmCadEquipamento.tabCadEquipamentoCOD_MOD.Text:=edtCodModelo.Text;
      tabCadEquipamento.Post;
      dmBD.trBD_SIGE.CommitRetaining;
       Application.MessageBox('Dados gravados com Sucesso!', 'Mensagem de Confirmação  .:: S.I.G.E ::.', 48);

       edtTipoEquip.Text:='';
       edtMarca.Text:='';
       edtModelo.Text:='';
       tabCadEquipamento.Append;
       edtEquipamento.SetFocus;
    end
end;

procedure TfrmCadEquipamento.btnTipoOkClick(Sender: TObject);
var
  NOME : integer;
  TIPO: string;
begin
  NOME:= tabTipoEquipCOD_TIP_EQ.AsInteger;
  if NOME = tabTipoEquipCOD_TIP_EQ.Value then
    edtCodTipo.Text:=IntToStr(NOME);
    TIPO:=tabTipoEquipNOME.AsString;
    if TIPO = tabTipoEquipNOME.Value then
      edtTipoEquip.Text:=(TIPO);
      frmCadEquipamento.Width:=503;
      panelTipo.Visible:=false;
      panelMarca.Visible:=true;
      panelModelo.Visible:=false;
end;


procedure TfrmCadEquipamento.ButtonGradient1Click(Sender: TObject);
begin
  frmCadEquipamento.Width:=1026;
  frmCadEquipamento.Height:=555;
  panelTipo.Visible:=True;
  panelModelo.Visible:=false;
  panelMarca.Visible:=false;
end;

procedure TfrmCadEquipamento.ButtonGradient2Click(Sender: TObject);
begin
  frmCadEquipamento.Width:=1026;
  frmCadEquipamento.Height:=555;
  panelTipo.Visible:=false;
  panelMarca.Visible:=True;
  panelModelo.Visible:=false;
end;

procedure TfrmCadEquipamento.ButtonGradient3Click(Sender: TObject);
begin
  frmCadEquipamento.Width:=1026;
  frmCadEquipamento.Height:=555;
  panelTipo.Visible:=false;
  panelMarca.Visible:=false;
  panelModelo.Visible:=True;
end;

procedure TfrmCadEquipamento.btnExcluirClick(Sender: TObject);
begin
  if (dsCadEquipamento.State in [dsBrowse]) or (edtEquipamento.Text = '') then
    begin
     Application.MessageBox('Não há dados para Apagar!', 'Atenção  .:: S.I.G.E ::.', 48);
      exit;
    end
  else
    if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadEquipamento.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;


procedure TfrmCadEquipamento.btnExcluirEquipClick(Sender: TObject);
begin
  panelModelo.Visible:=false;
  panelMarca.Visible:=false;
  panelTipo.Visible:=false;
  frmCadEquipamento.Width:=503;
  tabModelo.Close;
  tabModelo.Open;
end;

procedure TfrmCadEquipamento.btnFecharClick(Sender: TObject);
begin
  if edtEquipamento.Text='' then
    Close
  else

  if MessageDlg('Você deseja sair sem Salvar?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      Close;
    end
    else
    btnSalvar.SetFocus;
end;



procedure TfrmCadEquipamento.btnCadastrarTipoEquipClick(Sender: TObject);
begin

 with TfrmCadTipoEquip.Create(self) do
 begin
   try
     Cod_Tipo_equip:= tabTipoEquipCOD_TIP_EQ.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabTipoEquip.Close;
 tabTipoEquip.Open;
 tabTipoEquip.FetchAll;
end;



procedure TfrmCadEquipamento.btnEditarClick(Sender: TObject);
begin
  if edtEquipamento.Text = '' then
  begin
    Application.MessageBox('Nenhum dado para Editar!', 'Atenção  .:: S.I.G.E ::.', 48);
    exit
  end
  else
  tabCadEquipamento.Edit;
  edtEquipamento.SetFocus;
end;

procedure TfrmCadEquipamento.btnEquipExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabTipoEquip.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmCadEquipamento.ButtonGradient9Click(Sender: TObject);
begin
if (dsMarca.State in [dsBrowse]) or (edtMarca.Text = '') then
    begin
     Application.MessageBox('Não há dados para Apagar!', 'Aviso', 48);
      exit;
    end
  else
    if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabCadEquipamento.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;


procedure TfrmCadEquipamento.DBGrid1DblClick(Sender: TObject);
var
  NOME : integer;
  TIPO: string;
begin
  NOME:= tabTipoEquipCOD_TIP_EQ.AsInteger;
  if NOME = tabTipoEquipCOD_TIP_EQ.Value then
    edtCodTipo.Text:=IntToStr(NOME);
    TIPO:=tabTipoEquipNOME.AsString;
    if TIPO = tabTipoEquipNOME.Value then
      edtTipoEquip.Text:=(TIPO);
      frmCadEquipamento.Width:=503;
       panelTipo.Visible:=false;
      panelMarca.Visible:=true;
      panelModelo.Visible:=false;
end;

procedure TfrmCadEquipamento.DBGrid2DblClick(Sender: TObject);
var
  NOME : integer;
  MARCA: string;
begin
  NOME:= tabMarcaEquipCOD_MARC.AsInteger;
  if NOME = tabMarcaEquipCOD_MARC.Value then
    edtCodMarca.Text:=IntToStr(NOME);
    MARCA:=tabMarcaEquipNOME.AsString;
    if MARCA = tabMarcaEquipNOME.Value then
      edtMarca.Text:=(MARCA);
  frmCadEquipamento.Width:=503;
  panelmarca.Visible:=false;
  panelModelo.Visible:=false;
  panelTipo.Visible:=false;
end;


procedure TfrmCadEquipamento.DBGrid3DblClick(Sender: TObject);
var
  NOME : integer;
  MODELO: string;
begin
  NOME:= tabModeloCOD_MOD.AsInteger;
  if NOME = tabModeloCOD_MOD.Value then
    edtCodModelo.Text:=IntToStr(NOME);
    MODELO:=tabModeloNOME.AsString;
    if MODELO = tabModeloNOME.Value then
      edtModelo.Text:=(MODELO);
  frmCadEquipamento.Width:=503;
  panelmodelo.Visible:=false;
end;


procedure TfrmCadEquipamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadEquipamento.FormCreate(Sender: TObject);
begin
  tabCadEquipamento.Open;
  tabCadEquipamento.FetchAll;
  panelTipo.Visible:=false;
  tabMarcaEquip.Open;
  tabMarcaEquip.FetchAll;
  panelMarca.Visible:=false;
  tabModelo.Open;
  tabModelo.FetchAll;
  panelmodelo.Visible:=false;
end;

procedure TfrmCadEquipamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;


procedure TfrmCadEquipamento.FormShow(Sender: TObject);
begin
  tabTipoEquip.Open;
  tabTipoEquip.FetchAll;
  tabCadEquipamento.Append;
  edtEquipamento.SetFocus;
end;

procedure TfrmCadEquipamento.tabCadEquipamentoAfterDelete(DataSet: TDataSet);
begin
  dmBD.trBD_SIGE.CommitRetaining;
end;

procedure TfrmCadEquipamento.tabModeloAfterDelete(DataSet: TDataSet);
begin
  dmBD.trBD_SIGE.CommitRetaining;
end;

end.

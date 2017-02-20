// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit URetiradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, DB, Mask, IBCustomDataSet, IBQuery,
  TeCanvas, TeeEdiGrad, ImgList, Grids, DBGrids, ExtCtrls;

type
  TfrmRetiradas = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodUtilizador: TDBEdit;
    Label6: TLabel;
    edtCodMaterial: TDBEdit;
    Label7: TLabel;
    edtUtilidade: TDBEdit;
    Label8: TLabel;
    edtData: TDateTimePicker;
    ImageList1: TImageList;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ImageList2: TImageList;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    edtUtilizador: TDBEdit;
    edtMaterial: TDBEdit;
    panelUtilizador: TPanel;
    panelCid: TPanel;
    btnUtilizadorOk: TButtonGradient;
    btnCadastrarUtilizador: TButtonGradient;
    btnExcluirUtilizador: TButtonGradient;
    btnUtilizadorFechar: TButtonGradient;
    DBGridUtilizador: TDBGrid;
    tabUtilizador: TIBDataSet;
    tabUtilizadorCOD_UTI: TIntegerField;
    tabUtilizadorNOME: TIBStringField;
    tabUtilizadorCOD_CID: TIntegerField;
    tabUtilizadorCOD_SET: TIntegerField;
    tabUtilizadorCOD_CARG: TIntegerField;
    tabUtilizadorEMAIL: TIBStringField;
    tabUtilizadorTELEFONE: TIBStringField;
    tabUtilizadorOBS: TWideMemoField;
    dsUtilizador: TDataSource;
    tabMaterial: TIBDataSet;
    tabMaterialCOD_MAT: TIntegerField;
    tabMaterialNOME: TIBStringField;
    tabMaterialCOD_TIP_MT: TIntegerField;
    tabMaterialQUANTIDADE: TIBBCDField;
    tabMaterialOBSERVACOES: TIBStringField;
    dsMaterial: TDataSource;
    tabRetiradas: TIBDataSet;
    tabRetiradasCOD_RET: TIntegerField;
    tabRetiradasCOD_MAT: TIntegerField;
    tabRetiradasCOD_USU: TIntegerField;
    tabRetiradasDATA: TDateField;
    tabRetiradasHORA: TTimeField;
    tabRetiradasQUANTIDADE: TIBBCDField;
    tabRetiradasUTILIDADE: TIBStringField;
    tabRetiradasCOD_UTI: TIntegerField;
    tabRetiradasOBSERVACOES: TIBStringField;
    Label1: TLabel;
    edtCodRetiradas: TDBEdit;
    dsRetiradas: TDataSource;
    edtQuantidade: TDBEdit;
    edtOBs: TDBMemo;
    Label5: TLabel;
    panelMaterial: TPanel;
    Panel1: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridTipoMaterial: TDBGrid;
    edtHora: TDateTimePicker;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure btnUtilizadorOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridUtilizadorDblClick(Sender: TObject);
    procedure btnCadastrarUtilizadorClick(Sender: TObject);
    procedure btnExcluirUtilizadorClick(Sender: TObject);
    procedure btnUtilizadorFecharClick(Sender: TObject);
    procedure btnCidOkClick(Sender: TObject);
    procedure DBGridTipoMaterialDblClick(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Retiradas : integer;
  end;

var
  frmRetiradas: TfrmRetiradas;

  //Declarando a funcao que verifica o form antes de cria-lo
function  LocalizaForm (form : TForm) : Boolean;

implementation

uses UdmBD, UConRetiradas, UCadUtilizador, UPrincipal;

{$R *.dfm}

//Implementando a funcao que verifica o form antes de cria-lo
function  LocalizaForm (form : TForm) : Boolean;
var
	i : integer;
begin
	Result := False;
	for i := 0 to Screen.FormCount -1 do
	if Screen.Forms[i] = form then
	begin
		Result := True;
		Break;
	end;
 end;


procedure TfrmRetiradas.btnCadastrarUtilizadorClick(Sender: TObject);
begin
if not localizaForm(frmCadUtilizador) then
  frmCadUtilizador:= TfrmCadUtilizador.Create(Application);
  frmCadUtilizador.Width:=503;
  frmCadUtilizador.Height:=582;
  frmCadUtilizador.show;
  frmRetiradas.Width:=503;
  frmRetiradas.Height:=582;
  frmCadUtilizador.tabCadUtilizador.Append;
  frmCadUtilizador.Color:=frmPrincipal.Color;
  frmCadUtilizador.edtUtilizador.SetFocus;

end;

procedure TfrmRetiradas.btnCidOkClick(Sender: TObject);
var
  NOME : integer;
  MATERIAL: string;
begin
  NOME:= tabMaterialCOD_MAT.AsInteger;
  if NOME = tabMaterialCOD_MAT.Value then
    edtCodMaterial.Text:=IntToStr(NOME);
    MATERIAL:=tabMaterialNOME.AsString;
    if MATERIAL =tabMaterialNOME.Value then
      edtMaterial.Text:=(MATERIAL);
      panelMaterial.Visible:=false;
      frmRetiradas.Width:=503;
      edtUtilidade.SetFocus;

end;



procedure TfrmRetiradas.btnEditarClick(Sender: TObject);
begin
  if (edtUtilizador.Text='')then
  begin
     Application.MessageBox('Não há dados para editar!', 'Atenção .:: S.I.G.E ::.', 48);
     exit;
  end
  else
  tabRetiradas.Edit;
  edtHora.SetFocus;

end;

procedure TfrmRetiradas.btnExcluirClick(Sender: TObject);
begin
    if (dsRetiradas.State in [dsBrowse]) and (edtUtilizador.Text='') and (edtMaterial.Text='') and (edtUtilidade.Text='') and (edtQuantidade.Text='') then
    begin
       Application.MessageBox('Não há dados para apagar!', 'Atenção .:: S.I.G.E ::.', 48);
       exit;
    end
    else
    if Messagedlg('Você está certo disso?',mtconfirmation, [mbyes, mbno],0)=id_yes then
    begin
      edtCodUtilizador.Text:='';
      edtUtilizador.Text:='';
      edtCodMaterial.Text:='';
      edtMaterial.Text:='';
      edtUtilidade.Text:='';
      edtQuantidade.Text:='';
      edtObs.Text:='';
      edthora.SetFocus;
    end;

end;

procedure TfrmRetiradas.btnExcluirUtilizadorClick(Sender: TObject);
begin
  if messageDlg('Você está certo disso?', mtconfirmation, [mbyes, mbno],0)=id_yes then
    begin
      tabUtilizador.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
      end;
      end;


procedure TfrmRetiradas.btnFecharClick(Sender: TObject);
begin
    Close;
   
end;

procedure TfrmRetiradas.btnNovoClick(Sender: TObject);
begin
  if (dsRetiradas.State in [dsBrowse]) and (edtUtilizador.Text='') and (edtMaterial.Text='') and (edtUtilidade.Text='') and (edtQuantidade.Text='') then
  begin
    Application.MessageBox('Por Favor Preencha todos os campos corretamente e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
  if (edtUtilizador.text='') then
  begin
    Application.MessageBox('Por Favor selecione o  "Utilizador"!', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
  if (edtMaterial.Text='') then
  begin
    Application.MessageBox('Por Favor selecione o "Material"!', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
  if (edtUtilidade.Text='') then
  begin
    Application.MessageBox('Por Favor Preencha o campo "Utilidade"', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
  if (edtQuantidade.Text='') then
  begin
    Application.MessageBox('Por Favor Preencha o campo "Qualidade"', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end;
end;

procedure TfrmRetiradas.btnSalvarClick(Sender: TObject);
begin
  if (dsRetiradas.State in [dsBrowse]) and (edtUtilizador.Text='') and (edtMaterial.Text='')and (edtQuantidade.Text='') then
begin
  Application.MessageBox ('Por Favor preêncha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.',48);
  exit;
end
else
if (edtUtilizador.Text='') then
  begin
    Application.MessageBox ('Por Favor selecione o "Utilizador"!', 'Atenção .:: S.I.G.E ::.',48);    exit;
     exit;
  end
  else
  if (edtMaterial.Text='') then
  begin
    Application.MessageBox ('Por Favor selecione o respectivo "Material"!!', 'Atenção .:: S.I.G.E ::.',48);
    exit;;
  end
  else
  if (edtQuantidade.Text='') then
  begin
    Application.MessageBox ('Por Favor especifique a Quantidade!', 'Atenção .:: S.I.G.E ::.',48);
    exit;
  end
  else
  begin
    if messagedlg('Você deseja salvar os dados?',mtconfirmation,[mbyes, mbno],0)=id_yes then
    begin
      frmRetiradas.tabRetiradasHORA.AsDateTime:=edtHora.DateTime;
      frmRetiradas.tabRetiradasDATA.AsDateTime:=edtData.dateTime;
      frmRetiradas.tabRetiradasCOD_UTI.Text:=edtCodUtilizador.Text;
      frmRetiradas.tabRetiradasCOD_MAT.Text:=edtCodMaterial.Text;
      frmRetiradas.tabRetiradasUTILIDADE.Text:=edtUtilidade.Text;
      frmRetiradas.tabRetiradasOBSERVACOES.Text:=edtObs.text;
      frmRetiradas.tabRetiradasCOD_USU.Text:=IntToStr(frmPrincipal.COD_USUARIO);
    end;
  end;
  begin
    tabRetiradas.Post;
    dmBD.trBD_SIGE.CommitRetaining;
  end;
  begin
    Application.MessageBox ('Dados Gravados com Sucesso!', 'Atenção .:: S.I.G.E ::.',48);
    tabRetiradas.Append;
    edtCodUtilizador.Text:='';
    edtUtilizador.Text:='';
    edtCodMaterial.Text:='';
    edtMaterial.Text:='';
    edtQuantidade.Text:='';
    edtObs.Text:='';
    btnFechar.SetFocus;
    frmConRetiradas.qConsultaRetiradas.Close;
    frmConRetiradas.qConsultaRetiradas.Open;
  end;
end;

procedure TfrmRetiradas.btnUtilizadorFecharClick(Sender: TObject);
begin
  panelUtilizador.Visible:=false;
  frmRetiradas.Width:=503;
end;

procedure TfrmRetiradas.btnUtilizadorOkClick(Sender: TObject);
var
  NOME : integer;
  UTILIZADOR: string;
begin
  NOME:= tabUtilizadorCOD_UTI.AsInteger;
  if NOME = tabUtilizadorCOD_UTI.Value then
    edtCodUtilizador.Text:=IntToStr(NOME);
    UTILIZADOR:=tabUtilizadorNOME.AsString;
    if UTILIZADOR =tabUtilizadorNOME.Value then
      edtUtilizador.Text:=(UTILIZADOR);
      panelUtilizador.Visible:=false;
      frmRetiradas.Width:=503;
      edtHora.SetFocus;

end;


procedure TfrmRetiradas.ButtonGradient1Click(Sender: TObject);
begin
  frmRetiradas.Width:=1026;
  frmRetiradas.Height:=555;
  panelUtilizador.Visible:=True;
  panelMaterial.Visible:=false;
end;

procedure TfrmRetiradas.ButtonGradient2Click(Sender: TObject);
begin
  frmRetiradas.Width:=1026;
  frmRetiradas.Height:=555;
  panelUtilizador.Visible:=false;
  panelMaterial.Visible:=true;
end;

procedure TfrmRetiradas.DBGridTipoMaterialDblClick(Sender: TObject);
var
  NOME : integer;
  MATERIAL: string;
begin
  NOME:= tabMaterialCOD_MAT.AsInteger;
  if NOME = tabMaterialCOD_MAT.Value then
    edtCodMaterial.Text:=IntToStr(NOME);
    MATERIAL:=tabMaterialNOME.AsString;
    if MATERIAL =tabMaterialNOME.Value then
      edtMaterial.Text:=(MATERIAL);
      panelMaterial.Visible:=false;
      frmRetiradas.Width:=503;
      edtUtilidade.SetFocus;

end;


procedure TfrmRetiradas.DBGridUtilizadorDblClick(Sender: TObject);

var
  NOME : integer;
  UTILIZADOR: string;
begin
  NOME:= tabUtilizadorCOD_UTI.AsInteger;
  if NOME = tabUtilizadorCOD_UTI.Value then
    edtCodUtilizador.Text:=IntToStr(NOME);
    UTILIZADOR:=tabUtilizadorNOME.AsString;
    if UTILIZADOR =tabUtilizadorNOME.Value then
      edtUtilizador.Text:=(UTILIZADOR);
      panelUtilizador.Visible:=false;
      frmRetiradas.Width:=503;
      edtHora.SetFocus;
end;





procedure TfrmRetiradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmRetiradas.FormCreate(Sender: TObject);
begin
  tabRetiradas.Open;
  tabRetiradas.FetchAll;
  tabUtilizador.Open;
  tabUtilizador.FetchAll;
  tabMaterial.Open;
  tabMaterial.FetchAll;

end;

procedure TfrmRetiradas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

procedure TfrmRetiradas.FormShow(Sender: TObject);
begin
  edtHora.SetFocus;
  edtData.DateTime:=date;
  edtHora.DateTime:=Time;
  tabRetiradas.Append;
  edtHora.SetFocus;

end;

end.

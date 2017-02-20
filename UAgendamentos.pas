//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##

unit UAgendamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  StdCtrls, TeCanvas, TeeEdiGrad, ImgList, DBCtrls, Mask;

type
  TfrmAgendamentos = class(TForm)
    ImageList1: TImageList;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtDataAgenda: TDateTimePicker;
    edtDataDevol: TDateTimePicker;
    GroupBox3: TGroupBox;
    ButtonGradient1: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    GroupBox4: TGroupBox;
    tabAgendaEquip: TIBDataSet;
    tabAgendaEquipCOD_AG: TIntegerField;
    tabAgendaEquipCOD_EQ: TIntegerField;
    tabAgendaEquipCOD_USU: TIntegerField;
    tabAgendaEquipCOD_UTI: TIntegerField;
    tabAgendaEquipDATA_AG: TDateField;
    tabAgendaEquipHORA_AG: TTimeField;
    tabAgendaEquipDATA_DV: TDateField;
    tabAgendaEquipHORA_DV: TTimeField;
    tabAgendaEquipOBS: TWideMemoField;
    tabAgendaEquipUTILIDADE: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsAgendaEquip: TDataSource;
    panelEquipamento: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    btnModeloFechar: TButtonGradient;
    btnModeloExcluir: TButtonGradient;
    btnCadastrarModelo: TButtonGradient;
    btnModeloOk: TButtonGradient;
    Label3: TLabel;
    edtCodEquip: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    edtEquipamento: TDBEdit;
    edtUtilizador: TDBEdit;
    Label7: TLabel;
    edtCodUti: TDBEdit;
    DBMemo1: TDBMemo;
    tabEquipamento: TIBDataSet;
    tabEquipamentoCOD_EQ: TIntegerField;
    tabEquipamentoNOME: TIBStringField;
    tabEquipamentoCOD_TIP_EQ: TIntegerField;
    tabEquipamentoCOD_MARC: TIntegerField;
    tabEquipamentoCOD_MOD: TIntegerField;
    tabEquipamentoOBS: TMemoField;
    dsEquipamento: TDataSource;
    tabUtilizador: TIBDataSet;
    tabUtilizadorCOD_UTI: TIntegerField;
    tabUtilizadorNOME: TIBStringField;
    tabUtilizadorCOD_CID: TIntegerField;
    tabUtilizadorCOD_SET: TIntegerField;
    tabUtilizadorCOD_CARG: TIntegerField;
    tabUtilizadorEMAIL: TIBStringField;
    tabUtilizadorTELEFONE: TIBStringField;
    tabUtilizadorOBS: TMemoField;
    dsUtilizador: TDataSource;
    DateTimePickerHoraAgenda: TDateTimePicker;
    DateTimePickerHoraDev: TDateTimePicker;
    panelUtilizador: TPanel;
    panelCid: TPanel;
    btnUtilizadorOk: TButtonGradient;
    btnCadastrarUtilizador: TButtonGradient;
    btnExcluirUtilizador: TButtonGradient;
    btnUtilizadorFechar: TButtonGradient;
    DBGridUtilizador: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure btnModeloOkClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnCadastrarModeloClick(Sender: TObject);
    procedure btnModeloExcluirClick(Sender: TObject);
    procedure btnModeloFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure btnUtilizadorOkClick(Sender: TObject);
    procedure DBGridUtilizadorDblClick(Sender: TObject);
    procedure btnCadastrarUtilizadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Equipamento : integer;
  end;

var
  frmAgendamentos: TfrmAgendamentos;

implementation

uses UdmBD, UCadUtilizador, UCadEquipamento, UPrincipal;

{$R *.dfm}

procedure TfrmAgendamentos.btnCadastrarModeloClick(Sender: TObject);
begin
   if not localizaForm(frmCadEquipamento) then
		frmCadEquipamento := TfrmCadEquipamento.Create(Application);
		frmCadEquipamento.Color:=frmPrincipal.Color;
		frmCadEquipamento.Width:=503;
		frmCadEquipamento.Height:=582;
		frmCadEquipamento.show;
		frmAgendamentos.Width:=500;
		frmAgendamentos.Height:=500;
end;


procedure TfrmAgendamentos.btnCadastrarUtilizadorClick(Sender: TObject);
begin
   if not localizaForm(frmCadUtilizador) then
		frmCadUtilizador:= TfrmCadUtilizador.Create(Application);
		frmCadUtilizador.Color:=frmPrincipal.Color;
		frmCadUtilizador.Width:=503;
		frmCadUtilizador.Height:=582;
		frmCadUtilizador.show;
		frmAgendamentos.Width:=500;
		frmAgendamentos.Height:=500;
end;

procedure TfrmAgendamentos.btnEditarClick(Sender: TObject);
begin
		tabAgendaEquip.Edit;
end;

procedure TfrmAgendamentos.btnExcluirClick(Sender: TObject);
begin
		tabAgendaEquip.Delete;
end;

procedure TfrmAgendamentos.btnFecharClick(Sender: TObject);
begin
		Close;
end;

procedure TfrmAgendamentos.btnModeloExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabUtilizador.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;



procedure TfrmAgendamentos.btnModeloFecharClick(Sender: TObject);
begin
  panelEquipamento.Visible:=false;
  panelUtilizador.Visible:=false;
  frmAgendamentos.Width:=503;
  tabEquipamento.Close;
  tabEquipamento.Open;
end;

procedure TfrmAgendamentos.btnModeloOkClick(Sender: TObject);
var
  NOME : integer;
  EQUIPAMENTO: string;
begin
  NOME:= tabEquipamentoCOD_EQ.AsInteger;
  if NOME = TabEquipamentoCOD_EQ.Value then
    edtCodEquip.Text:=IntToStr(NOME);
    EQUIPAMENTO:=tabEquipamentoNOME.AsString;
    if EQUIPAMENTO = tabEquipamentoNOME.Value then
      edtEquipamento.Text:=(EQUIPAMENTO);
  frmAgendamentos.Width:=503;
  panelEquipamento.Visible:=false;
end;

procedure TfrmAgendamentos.btnNovoClick(Sender: TObject);
begin
  tabAgendaEquip.Append;
end;

procedure TfrmAgendamentos.btnSalvarClick(Sender: TObject);
begin
  if (dsAgendaEquip.State in [dsBrowse]) and (edtEquipamento.Text='') and (edtUtilizador.Text='') then
   begin
    Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else
   if (edtEquipamento.Text='') then
   begin
    Application.MessageBox('Por Favor preencha o campo "Equipamento"!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else
   if (edtUtilizador.Text='') then
   begin
      Application.MessageBox('Por Favor preencha o campo "Utilizador"!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
   end
     else
     if Messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno],0)=id_yes then
      begin
        frmAgendamentos.tabAgendaEquipDATA_AG.AsDateTime:=edtDataAgenda.Date;
        frmAgendamentos.tabAgendaEquipHORA_AG.AsDateTime:=DateTimePickerHoraAgenda.Time;
        frmAgendamentos.tabAgendaEquipDATA_DV.AsDateTime:=edtDataDevol.Date;
        frmAGendamentos.tabAgendaEquipHORA_DV.AsDateTime:=DateTimePickerHoraDev.Time;
        frmAgendamentos.tabAgendaEquipCOD_EQ.Text:=edtCodEquip.Text;
        frmAgendamentos.tabAgendaEquipCOD_UTI.Text:=edtCodUti.Text;
        frmAgendamentos.tabAgendaEquipCOD_USU.Text:=IntToStr(FrmPrincipal.COD_USUARIO);
      end;
      begin
        tabAgendaEquip.Post;
        dmBD.trBD_SIGE.CommitRetaining;

      end;
        begin
          Application.MessageBox('Dados Gravados com Sucesso!', 'Atenção .:: S.I.G.E ::. ', 48);
          tabAgendaEquip.Append;
          edtDataAgenda.SetFocus;
          edtEquipamento.Text:='';
          edtUtilizador.Text:='';


end;
end;

procedure TfrmAgendamentos.btnUtilizadorOkClick(Sender: TObject);
var
  NOME : integer;
  UTILIZADOR: string;
begin
  NOME:= tabUtilizadorCOD_UTI.AsInteger;
  if NOME = tabUtilizadorCOD_UTI.Value then
    edtCodUti.Text:=IntToStr(NOME);
    UTILIZADOR:=tabUtilizadorNOME.AsString;
    if UTILIZADOR =tabUtilizadorNOME.Value then
      edtUtilizador.Text:=(UTILIZADOR);
      panelUtilizador.Visible:=false;
      frmAgendamentos.Width:=503;
end;


procedure TfrmAgendamentos.ButtonGradient1Click(Sender: TObject);
begin
  frmAgendamentos.Width:=1026;
  frmAgendamentos.Height:=555;
  panelEquipamento.Visible:=True;
  panelUtilizador.Visible:=false;
end;

procedure TfrmAgendamentos.ButtonGradient2Click(Sender: TObject);
begin
  panelUtilizador.Visible:=false;
  panelEquipamento.Visible:=false;
  frmCadEquipamento.Width:=503;
  tabUtilizador.Close;
  tabUtilizador.Open;
end;



procedure TfrmAgendamentos.ButtonGradient3Click(Sender: TObject);
begin
 frmAgendamentos.Width:=1026;
  frmAgendamentos.Height:=555;
  panelEquipamento.Visible:=False;
  panelUtilizador.Visible:=True;
end;

procedure TfrmAgendamentos.DBGrid1DblClick(Sender: TObject);
begin
     //frmAgendar.Show;
end;

procedure TfrmAgendamentos.DBGrid3DblClick(Sender: TObject);
var
  NOME : integer;
  EQUIPAMENTO: string;
begin
  NOME:= tabEquipamentoCOD_EQ.AsInteger;
  if NOME = TabEquipamentoCOD_EQ.Value then
    edtCodEquip.Text:=IntToStr(NOME);
    EQUIPAMENTO:=tabEquipamentoNOME.AsString;
    if EQUIPAMENTO = tabEquipamentoNOME.Value then
      edtEquipamento.Text:=(EQUIPAMENTO);
  frmAgendamentos.Width:=503;
  panelEquipamento.Visible:=false;
end;

procedure TfrmAgendamentos.DBGridUtilizadorDblClick(Sender: TObject);
var
  NOME : integer;
  UTILIZADOR: string;
begin
  NOME:= tabUtilizadorCOD_UTI.AsInteger;
  if NOME = tabUtilizadorCOD_UTI.Value then
    edtCodUti.Text:=IntToStr(NOME);
    UTILIZADOR:=tabUtilizadorNOME.AsString;
    if UTILIZADOR =tabUtilizadorNOME.Value then
      edtUtilizador.Text:=(UTILIZADOR);
      panelUtilizador.Visible:=false;
      frmAgendamentos.Width:=503;
end;


procedure TfrmAgendamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmAgendamentos.FormCreate(Sender: TObject);
begin
  tabAgendaEquip.Open;
  tabAgendaEquip.FetchAll;
  tabEquipamento.Open;
  tabEquipamento.FetchAll;
  tabUtilizador.Open;
  tabUtilizador.FetchAll;
  edtDataAgenda.DateTime:=Date;
  edtDataDevol.DateTime:=Date;
  DateTimePickerHoraAgenda.DateTime:=Time;
  DateTimePickerHoraDev.DateTime:=Time;

end;

procedure TfrmAgendamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

end.

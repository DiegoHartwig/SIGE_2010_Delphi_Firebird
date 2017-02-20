//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit ULigacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, Mask, IBCustomDataSet, IBQuery, ComCtrls,
  TeCanvas, TeeEdiGrad, ImgList, Grids, DBGrids, ExtCtrls, Buttons;

type
  TfrmLigacoes = class(TForm)
    Label4: TLabel;
    edtCodContato: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    edtData: TDateTimePicker;
    Label2: TLabel;
    edtTelefone: TDBEdit;
    GroupBox2: TGroupBox;
    edtContato: TDBEdit;
    ImageList1: TImageList;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    panelCidade: TPanel;
    panelCid: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridCidade: TDBGrid;
    edtHora: TDateTimePicker;
    edtCidade: TDBEdit;
    edtCodCidade: TDBEdit;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    ImageList2: TImageList;
    tabTelefonemas: TIBDataSet;
    tabTelefonemasCOD_LIG: TIntegerField;
    tabTelefonemasCOD_CONT: TIntegerField;
    tabTelefonemasCOD_CID: TIntegerField;
    tabTelefonemasDATA: TDateField;
    tabTelefonemasHORA: TTimeField;
    tabTelefonemasLIG_COMP: TIBStringField;
    tabTelefonemasTELEFONE: TIBStringField;
    tabTelefonemasOBS: TMemoField;
    dsTelefonemas: TDataSource;
    tabContato: TIBDataSet;
    tabCidade: TIBDataSet;
    tabContatoCOD_CONT: TIntegerField;
    tabContatoNOME: TIBStringField;
    tabContatoCOD_CID: TIntegerField;
    tabContatoCOD_SET: TIntegerField;
    tabContatoCOD_CARG: TIntegerField;
    tabContatoEMAIL: TIBStringField;
    tabContatoTELEFONE_RESID: TIBStringField;
    tabContatoTELEFONE_CEL: TIBStringField;
    dsContato: TDataSource;
    tabCidadeCOD_CID: TIntegerField;
    tabCidadeNOME: TIBStringField;
    tabCidadeCEP: TIBStringField;
    tabCidadeUF: TIBStringField;
    dsCidade: TDataSource;
    panelContato: TPanel;
    Label8: TLabel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    btnModeloFechar: TButtonGradient;
    btnModeloExcluir: TButtonGradient;
    btnCadastrarModelo: TButtonGradient;
    btnModeloOk: TButtonGradient;
    btnClose: TButtonGradient;
    tabTelefonemasCOD_USU: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    edtObs: TDBMemo;
    procedure ButtonGradient2Click(Sender: TObject);
    procedure btnCidOkClick(Sender: TObject);
    procedure btnCadastrarCidClick(Sender: TObject);
    procedure btnCidExcluirClick(Sender: TObject);
    procedure btnUtilCidadeClick(Sender: TObject);
    procedure DBGridCidadeDblClick(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure btnModeloOkClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnCadastrarModeloClick(Sender: TObject);
    procedure btnModeloExcluirClick(Sender: TObject);
    procedure btnModeloFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTelefoneClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Contato : integer;
  end;

var
  frmLigacoes: TfrmLigacoes;

implementation

uses UdmBD, UCadCidade, UCadContatos, UPrincipal, UConsultaLigacoes;

{$R *.dfm}

procedure TfrmLigacoes.btnCadastrarCidClick(Sender: TObject);
begin
 with TfrmCadCidade.Create(self) do
 begin
   try
     Cod_Cidade:= tabCidadeCOD_CID.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabCidade.Close;
 tabCidade.Open;
 tabCidade.FetchAll;
end;


procedure TfrmLigacoes.btnCadastrarModeloClick(Sender: TObject);
begin

if not localizaForm(frmCadContatos) then
		frmCadContatos:= TfrmCadContatos.Create(Application);
    frmCadContatos.Color:=frmPrincipal.Color;
    frmCadContatos.Width:=503;
    frmCadContatos.Height:=555;
    frmLigacoes.Width:=500;
    frmCadContatos.Show;
end;


procedure TfrmLigacoes.btnCidExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabCidade.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmLigacoes.btnCidOkClick(Sender: TObject);
var
  NOME : integer;
  CIDADE: string;
begin
  NOME:= tabCidadeCOD_CID.AsInteger;
  if NOME = tabCidadeCOD_CID.Value then
    edtCodCidade.Text:=IntToStr(NOME);
    CIDADE:=tabCidadeNOME.AsString;
    if CIDADE =tabCidadeNOME.Value then
      edtCidade.Text:=(CIDADE);
      panelCidade.Visible:=false;
      frmLigacoes.Width:=503;
      tabTelefonemasTELEFONE.EditMask:='!\(99\)0000-0000;1;';
      edtTelefone.SetFocus;
end;

procedure TfrmLigacoes.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLigacoes.btnEditarClick(Sender: TObject);
begin
 begin
  if (edtContato.Text='') then
  begin
    Application.MessageBox('Nenhum dado para editar!', 'Atenção  .:: S.I.G.E', 48);
  end
  else
  tabTelefonemas.Edit;
  edtContato.SetFocus;
end;

end;

procedure TfrmLigacoes.btnExcluirClick(Sender: TObject);
begin
  if (dsTelefonemas.State in [dsBrowse]) then
  begin
     Application.MessageBox('Não há dados para apagar!', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
   if messageDlg('Você está certo disso?', mtconfirmation, [mbyes, mbno], 0) =id_yes then
  begin
    tabTelefonemas.Delete;
    dmBD.trBD_SIGE.CommitRetaining;
  end;
end;



procedure TfrmLigacoes.btnModeloExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabContato.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmLigacoes.btnModeloFecharClick(Sender: TObject);
begin
 panelContato.Visible:=false;
  frmLigacoes.Width:=503;
end;

procedure TfrmLigacoes.btnModeloOkClick(Sender: TObject);
var
  NOME : integer;
  CONTATO: string;
begin
  NOME:= tabContatoCOD_CONT.AsInteger;
  if NOME = tabContatoCOD_CONT.Value then
    edtCodContato.Text:=IntToStr(NOME);
    CONTATO:=tabContatoNOME.AsString;
    if CONTATO =tabContatoNOME.Value then
      edtContato.Text:=(CONTATO);
      panelCidade.Visible:=false;
      frmLigacoes.Width:=503;
      buttongradient2.SetFocus;
end;


procedure TfrmLigacoes.btnNovoClick(Sender: TObject);
begin
  if (dsTelefonemas.State in [dsBrowse]) and (edtContato.Text='') and (edtCidade.Text='') and (edtTelefone.Text='') then
   begin
    Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else
   if (edtContato.Text='') then
    begin
      Application.MessageBox('Por Favor selecione o respectivo "Contato"!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
    end
    else
    if (edtCidade.Text='') then
      begin
        Application.MessageBox('Por Favor selecione a "Cidade"!', 'Atenção .:: S.I.G.E ::.', 48);
        exit;
      end
      else
      if (edtTelefone.Text='') then
        begin
          Application.MessageBox('Por Favor informe o "Telefone"!', 'Atenção .:: S.I.G.E ::.', 48);
          exit;
        end;

end;

procedure TfrmLigacoes.btnSalvarClick(Sender: TObject);
begin
  if (dsTelefonemas.State in [dsBrowse]) and (edtContato.Text='') and (edtCidade.Text='') and (edtTelefone.Text='') then
   begin
    Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
    exit;
   end
   else
   if (edtContato.Text='') then
    begin
      Application.MessageBox('Por Favor selecione o respectivo "Contato"!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
    end
    else
    if (edtCidade.Text='') then
      begin
        Application.MessageBox('Por Favor selecione a "Cidade"!', 'Atenção .:: S.I.G.E ::.', 48);
        exit;
      end
      else
      if (edtTelefone.Text='') then
        begin
          Application.MessageBox('Por Favor informe o "Telefone"!', 'Atenção .:: S.I.G.E ::.', 48);
          tabTelefonemasTELEFONE.EditMask:='!\(99\)0000-0000;1;';
          exit;
        end
        else
         if Messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno],0)=id_yes then
      begin
        frmLigacoes.tabTelefonemasDATA.AsDateTime:=edtData.Date;
        frmLigacoes.tabTelefonemasHORA.AsDateTime:=edtHora.Time;
        frmLigacoes.tabTelefonemasCOD_CONT.Text:=edtCodContato.Text;
        frmLigacoes.tabTelefonemasCOD_CID.Text:=edtCodCidade.Text;
        frmLigacoes.tabTelefonemasTELEFONE.Text:=edtTelefone.Text;
        frmLigacoes.tabTelefonemasOBS.Text:=edtObs.Text;
        frmLigacoes.tabTelefonemasCOD_USU.Text:=IntToStr(frmPrincipal.COD_USUARIO);
      end;
      begin
        tabTelefonemas.Post;
        dmBD.trBD_SIGE.CommitRetaining;
      end;
        begin
          Application.MessageBox('Dados Gravados com Sucesso!', 'Atenção .:: S.I.G.E ::. ', 48);
          frmconsultaLigacoes.qConsultaLigacoes.Close;
          frmConsultaLigacoes.qConsultaLigacoes.Open;
          tabTelefonemas.Append;
        end;
        begin
          edtCodContato.Text:='';
          edtContato.Text:='';
          edtCodCidade.Text:='';
          edtcidade.Text:='';
          edtTelefone.Text:='';
          edtObs.Text:=''
        end;
       end;

procedure TfrmLigacoes.btnUtilCidadeClick(Sender: TObject);
begin
 panelCidade.Visible:=false;
  frmLigacoes.Width:=503;
end;

procedure TfrmLigacoes.ButtonGradient1Click(Sender: TObject);
begin
  frmLigacoes.Width:=1026;
  frmLigacoes.Height:=555;
  panelContato.Visible:=true;
end;

procedure TfrmLigacoes.ButtonGradient2Click(Sender: TObject);
begin
   frmLigacoes.Width:=1026;
  frmLigacoes.Height:=555;
  panelCidade.Visible:=true;
  panelContato.Visible:=false;
end;

procedure TfrmLigacoes.DBGrid3DblClick(Sender: TObject);
var
  NOME : integer;
  CONTATO: string;
begin
  NOME:= tabContatoCOD_CONT.AsInteger;
  if NOME = tabContatoCOD_CONT.Value then
    edtCodContato.Text:=IntToStr(NOME);
    CONTATO:=tabContatoNOME.AsString;
    if CONTATO =tabContatoNOME.Value then
      edtContato.Text:=(CONTATO);
      panelCidade.Visible:=false;
      frmLigacoes.Width:=503;
      buttongradient2.SetFocus;
end;

procedure TfrmLigacoes.DBGridCidadeDblClick(Sender: TObject);
var
  NOME : integer;
  CIDADE: string;
begin
  NOME:= tabCidadeCOD_CID.AsInteger;
  if NOME = tabCidadeCOD_CID.Value then
    edtCodCidade.Text:=IntToStr(NOME);
    CIDADE:=tabCidadeNOME.AsString;
    if CIDADE =tabCidadeNOME.Value then
      edtCidade.Text:=(CIDADE);
      panelCidade.Visible:=false;
      frmLigacoes.Width:=503;
      tabTelefonemasTELEFONE.EditMask:='!\(99\)0000-0000;1;';
      edtTelefone.SetFocus;
end;

procedure TfrmLigacoes.edtTelefoneClick(Sender: TObject);
begin
  tabTelefonemasTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmLigacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmLigacoes.FormCreate(Sender: TObject);
begin
  tabTelefonemas.Open;
  tabTelefonemas.FetchAll;
  tabContato.Open;
  tabContato.FetchAll;
  tabCidade.Open;
  tabCidade.FetchAll;
end;

procedure TfrmLigacoes.FormShow(Sender: TObject);
begin
  panelCidade.Visible:=false;
  panelContato.Visible:=false;
  tabTelefonemas.Append;
  edtData.DateTime:=date;
  edtData.SetFocus;
  btnClose.Enabled:=true;
end;

end.

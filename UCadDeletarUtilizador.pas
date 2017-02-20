//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadDeletarUtilizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeCanvas, TeeEdiGrad, DBCtrls, DB, Mask, IBCustomDataSet,
  ImgList, ExtCtrls, IBQuery, ComCtrls, Grids, DBGrids;

type
  TfrmCadUtilizador = class(TForm)
    tabUTILIZADOR: TIBDataSet;
    tabUTILIZADORCOD_UTI: TIntegerField;
    tabUTILIZADORNOME: TIBStringField;
    tabUTILIZADORCOD_SET: TIntegerField;
    tabUTILIZADORCOD_CARG: TIntegerField;
    tabUTILIZADOROBS: TMemoField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsUTILIZADOR: TDataSource;
    Label2: TLabel;
    edtUtilizador: TDBEdit;
    Label3: TLabel;
    edtCodSetor: TDBEdit;
    Label4: TLabel;
    edtCodCargo: TDBEdit;
    Label5: TLabel;
    edtObs: TDBMemo;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    edtSetor: TDBEdit;
    edtCargo: TDBEdit;
    ImageList1: TImageList;
    ButtonGradient2: TButtonGradient;
    ImageList2: TImageList;
    panelSetor: TPanel;
    Panel1: TPanel;
    DBGridSetor: TDBGrid;
    btnSetorOk: TButtonGradient;
    btnSetorCadastrar: TButtonGradient;
    btnSetorExcluir: TButtonGradient;
    btnSetorFechar: TButtonGradient;
    tabSetor: TIBDataSet;
    tabSetorCOD_SET: TIntegerField;
    tabSetorNOME: TIBStringField;
    tabCargo: TIBDataSet;
    dsSetor: TDataSource;
    dsCargo: TDataSource;
    tabCargoCOD_CARG: TIntegerField;
    tabCargoNOME: TIBStringField;
    btnBuscarSetor: TButtonGradient;
    panelCargo: TPanel;
    Panel3: TPanel;
    DBGridCargo: TDBGrid;
    btnSelCargoOk: TButtonGradient;
    btnSelCargoCadastrar: TButtonGradient;
    btnSelCargoExcluir: TButtonGradient;
    btnSelCargoFechar: TButtonGradient;
    tabUTILIZADORTELEFONE: TIBStringField;
    tabUTILIZADOREMAIL: TIBStringField;
    tabUTILIZADORCOD_CID: TIntegerField;
    Label6: TLabel;
    edtTelefone: TDBEdit;
    Label7: TLabel;
    edtEmail: TDBEdit;
    Label8: TLabel;
    edtCidade: TEdit;
    btnBuscarCidade: TButtonGradient;
    panelCidade: TPanel;
    panelCid: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridCidade: TDBGrid;
    tabCidade: TIBDataSet;
    tabCidadeCOD_CID: TIntegerField;
    tabCidadeNOME: TIBStringField;
    tabCidadeCEP: TIBStringField;
    edtCodCid: TDBEdit;
    dsCidade: TDataSource;
    tabCidadeUF: TIBStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSetorOkClick(Sender: TObject);
    procedure btnSetorCadastrarClick(Sender: TObject);
    procedure DBGridSetorDblClick(Sender: TObject);
    procedure btnBuscarSetorClick(Sender: TObject);
    procedure btnSetorExcluirClick(Sender: TObject);
    procedure btnSetorFecharClick(Sender: TObject);
    procedure btnSelCargoOkClick(Sender: TObject);
    procedure btnSelCargoCadastrarClick(Sender: TObject);
    procedure btnSelCargoExcluirClick(Sender: TObject);
    procedure btnSelCargoFecharClick(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure DBGridCargoDblClick(Sender: TObject);
    procedure BtnCadCidClick(Sender: TObject);
    procedure btnCidOkClick(Sender: TObject);
    procedure btnUtilCidadeClick(Sender: TObject);
    procedure btnCidExcluirClick(Sender: TObject);
    procedure btnBuscarCidadeClick(Sender: TObject);
    procedure DBGridCidadeDblClick(Sender: TObject);
    procedure btnCadastrarCidClick(Sender: TObject);
    procedure edtTelefoneClick(Sender: TObject);
    procedure edtTelefoneEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Setor : integer;
    Cod_Cargo : integer;
    Cod_Cid : integer;
  end;

var
  frmCadUtilizador: TfrmCadUtilizador;

implementation

uses UdmBD,  UPrincipal, UCadSetor, UCadCargo, UCadCidade;

{$R *.dfm}

procedure TfrmCadUtilizador.btnBuscarCidadeClick(Sender: TObject);
begin
 frmCadUtilizador.Width:=1026;
  frmCadUtilizador.Height:=582;
  panelCargo.Visible:=false;
  panelSetor.Visible:=false;
  panelCidade.Visible:=True;
  dbgridCidade.SetFocus;
end;

procedure TfrmCadUtilizador.btnBuscarSetorClick(Sender: TObject);

begin
  frmCadUtilizador.Width:=1026;
  frmCadUtilizador.Height:=582;
  panelSetor.Visible:=True;
  panelCargo.Visible:=false;
  dbgridSetor.SetFocus;
end;


procedure TfrmCadUtilizador.btnCadastrarCidClick(Sender: TObject);
begin
 with TfrmCadCidade.Create(self) do
 begin
   try
     Cod_Cid:= tabCidadeCOD_CID.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabCidade.Close;
 tabCidade.Open;
 tabCidade.FetchAll;
end;

procedure TfrmCadUtilizador.BtnCadCidClick(Sender: TObject);
begin
  if not localizaForm(frmCadCidade) then
      frmCadCidade:= TfrmCadCidade.Create(Application);
      frmCadCidade.Show;
end;

procedure TfrmCadUtilizador.btnCidExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabCidade.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;

procedure TfrmCadUtilizador.btnCidOkClick(Sender: TObject);
var
  NOME : integer;
  CIDADE: string;
begin
  NOME:= tabCidadeCOD_CID.AsInteger;
  if NOME = tabCidadeCOD_CID.Value then
    edtCodCid.Text:=IntToStr(NOME);
    CIDADE:=tabCidadeNOME.AsString;
    if CIDADE = tabCidadeNOME.Value then
      edtCidade.Text:=(CIDADE);
      frmCadUtilizador.Width:=503;
      panelCidade.Visible:=false;
      edtObs.SetFocus;



end;

procedure TfrmCadUtilizador.btnEditarClick(Sender: TObject);
begin
  if edtUtilizador.Text = '' then
  begin
    Application.MessageBox('Nenhum dado para Editar!', 'Aviso', 48);
    exit
  end
  else
  tabUTILIZADOR.Edit;
  edtUtilizador.SetFocus;

end;

procedure TfrmCadUtilizador.btnExcluirClick(Sender: TObject);
begin
  if (tabUTILIZADOR.State in [dsBrowse]) or (edtUtilizador.Text = '') then
    begin
     Application.MessageBox('Não há dados para Apagar!', 'Aviso', 48);
      exit;
    end
  else
    if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    tabUTILIZADOR.Delete;
    ShowMessage('Dados Excluídos com Sucesso');
end;

procedure TfrmCadUtilizador.btnNovoClick(Sender: TObject);
begin
  tabUTILIZADOR.Append;
  edtUtilizador.SetFocus;
end;

procedure TfrmCadUtilizador.btnSalvarClick(Sender: TObject);
begin
  if (tabUTILIZADOR.State in [dsEdit, dsInsert])and(edtUtilizador.Text='') and (edtSetor.Text='')and(edtCargo.Text='') and (edtTelefone.Text='')and (edtEmail.Text='') and (edtCidade.Text='') then
    begin
       Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
       Exit;
    end
  else
  if (edtUtilizador.Text='') then
     begin
      Application.MessageBox('Por Favor preencha o campo "Utilizador" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
     end
  else
     begin
      if (edtSetor.Text='') then
       begin
        Application.MessageBox('Por Favor escolha o "Setor" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
        frmCadUtilizador.Width:=1026;
        frmCadUtilizador.Height:=650;
        panelSetor.Visible:=True;
        panelCargo.Visible:=false;
        dbGridSetor.SetFocus;
       end
       else
       if (edtCargo.Text='') then
       begin
          Application.MessageBox('Por Favor escolha o respectivo "Cargo",  e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
          frmCadUtilizador.Width:=1026;
          frmCadUtilizador.Height:=650;
          panelCargo.Visible:=True;
          panelSetor.Visible:=false;
          dbGridCargo.SetFocus;
       end
       else
       if (edtTelefone.text='') then
       begin
         Application.MessageBox('Por Favor Digite o "Telefone", e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
         tabUtilizadorTELEFONE.EditMask:='!\(99\)0000-0000;1;';
         edtTelefone.SetFocus;
       end
       else
       if (edtEmail.Text ='') then
        begin
         Application.MessageBox('Por Favor Digite o "E-mail", e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
         edtEmail.SetFocus;
        end
        else
       if (edtCidade.Text='') then
        begin
         Application.MessageBox('Por Favor selecione a respectiva "Cidade", e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
         frmCadUtilizador.Width:=1026;
         frmCadUtilizador.Height:=650;
         panelCargo.Visible:=false;
         panelSetor.Visible:=false;
         panelCidade.Visible:=True;
         dbgridCidade.SetFocus;
        end
        else
        begin
          if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
          begin
            frmCadUtilizador.tabUtilizadorCOD_SET.text:=edtCodSetor.Text;
            frmCadUtilizador.tabUtilizadorCOD_CARG.Text:=edtCodCargo.Text;
            frmCadUtilizador.tabUtilizadorCOD_CID.text:=edtCodCid.Text;
          end;
            tabUTILIZADOR.Post;
            dmBD.trBD_SIGE.CommitRetaining;
            ShowMessage('Dados gravados com Sucesso!');
    end
end;
end;


procedure TfrmCadUtilizador.btnSelCargoCadastrarClick(Sender: TObject);
begin
 with TfrmCadCargo.Create(self) do
 begin
   try
     Cod_Cargo:= tabCargoCOD_CARG.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabCargo.Close;
 tabCargo.Open;
 tabCargo.FetchAll;
end;

procedure TfrmCadUtilizador.btnSelCargoExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabCargo.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;



procedure TfrmCadUtilizador.btnSelCargoFecharClick(Sender: TObject);
begin
   panelCargo.Visible:=false;
  frmCadUtilizador.Width:=503;
end;

procedure TfrmCadUtilizador.btnSelCargoOkClick(Sender: TObject);
var
  NOME : integer;
  CARGO: string;
begin
  NOME:= tabCargoCOD_CARG.AsInteger;
  if NOME = tabCargoCOD_CARG.Value then
    edtCodCargo.Text:=IntToStr(NOME);
    CARGO:=tabCargoNOME.AsString;
    if CARGO = tabCargoNOME.Value then
      edtCargo.Text:=(CARGO);
      frmCadUtilizador.Width:=503;
      panelSetor.Visible:=false;
      panelCargo.Visible:=false;
      edtTelefone.SetFocus;
end;


procedure TfrmCadUtilizador.btnSetorCadastrarClick(Sender: TObject);
begin
 with TfrmCadSetor.Create(self) do
 begin
   try
     Cod_Setor:= tabSetorCOD_SET.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabSetor.Close;
 tabSetor.Open;
 tabSetor.FetchAll;

end;


procedure TfrmCadUtilizador.btnSetorExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabSetor.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmCadUtilizador.btnSetorFecharClick(Sender: TObject);
begin
  panelSetor.Visible:=false;
  frmCadUtilizador.Width:=503;

end;

procedure TfrmCadUtilizador.btnSetorOkClick(Sender: TObject);
var
  NOME : integer;
  SETOR: string;
begin
  NOME:= tabSetorCOD_SET.AsInteger;
  if NOME = tabSetorCOD_SET.Value then
    edtCodSetor.Text:=IntToStr(NOME);
    SETOR:=tabSetorNOME.AsString;
    if SETOR = tabSetorNOME.Value then
      edtSetor.Text:=(SETOR);
      panelSetor.Visible:=false;
      panelCargo.Visible:=True;
      dbGridCargo.SetFocus;
end;



procedure TfrmCadUtilizador.btnUtilCidadeClick(Sender: TObject);
begin
   panelCidade.Visible:=true;
   frmCadUtilizador.Width:=503;
end;

procedure TfrmCadUtilizador.ButtonGradient2Click(Sender: TObject);
begin
  frmCadUtilizador.Width:=1026;
  frmCadUtilizador.Height:=582;
  panelCargo.Visible:=True;
  panelSetor.Visible:=false;
  dbgridCargo.SetFocus;
end;

procedure TfrmCadUtilizador.DBGridSetorDblClick(Sender: TObject);
var
  NOME : integer;
  SETOR: string;
begin
  NOME:= tabSetorCOD_SET.AsInteger;
  if NOME = tabSetorCOD_SET.Value then
    edtCodSetor.Text:=IntToStr(NOME);
    SETOR:=tabSetorNOME.AsString;
    if SETOR = tabSetorNOME.Value then
      edtSetor.Text:=(SETOR);
      panelSetor.Visible:=false;
      panelCargo.Visible:=True;
      dbGridCargo.SetFocus;
end;





procedure TfrmCadUtilizador.edtTelefoneClick(Sender: TObject);
begin
   tabUTILIZADORTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadUtilizador.edtTelefoneEnter(Sender: TObject);
begin
  tabUTILIZADORTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadUtilizador.DBGridCargoDblClick(Sender: TObject);
var
  NOME : integer;
  CARGO: string;
begin
  NOME:= tabCargoCOD_CARG.AsInteger;
  if NOME = tabCargoCOD_CARG.Value then
    edtCodCargo.Text:=IntToStr(NOME);
    CARGO:=tabCargoNOME.AsString;
    if CARGO = tabCargoNOME.Value then
      edtCargo.Text:=(CARGO);
      frmCadUtilizador.Width:=503;
      panelSetor.Visible:=false;
      panelCargo.Visible:=false;
      edtTelefone.SetFocus;
end;



procedure TfrmCadUtilizador.DBGridCidadeDblClick(Sender: TObject);
var
  NOME : integer;
  CIDADE: string;
begin
  NOME:= tabCidadeCOD_CID.AsInteger;
  if NOME = tabCidadeCOD_CID.Value then
    edtCodCid.Text:=IntToStr(NOME);
    CIDADE:=tabCidadeNOME.AsString;
    if CIDADE = tabCidadeNOME.Value then
      edtCidade.Text:=(CIDADE);
      panelCidade.Visible:=false;
       frmCadUtilizador.Width:=503;
      edtObs.SetFocus;


end;

procedure TfrmCadUtilizador.btnFecharClick(Sender: TObject);
begin
  if edtUtilizador.Text='' then
    Close
  else
     if MessageDlg('Deseja salvar as alterações no Cadastro da Instituição?',mtConfirmation, [mbYes,mbNo],1) = id_yes then
      btnSalvar.SetFocus
    else
    Close;
end;



procedure TfrmCadUtilizador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadUtilizador.FormCreate(Sender: TObject);
begin
  panelSetor.Visible:=false;
  panelCargo.Visible:=false;
  panelCidade.Visible:=false;
  tabUTILIZADOR.Open;
  tabUTILIZADOR.FetchAll;
  tabSetor.Open;
  tabSetor.FetchAll;
  tabCargo.Open;
  tabCargo.FetchAll;
  tabCidade.Open;
  tabCidade.FetchAll;

end;

procedure TfrmCadUtilizador.FormShow(Sender: TObject);
begin
   tabUTILIZADOR.Append;
   edtUtilizador.SetFocus;
end;

end.

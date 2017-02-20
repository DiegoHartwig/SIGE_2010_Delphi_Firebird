//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadUtilizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, Mask, IBCustomDataSet, ImgList, TeCanvas,
  TeeEdiGrad, Grids, DBGrids, ExtCtrls;

type
  TfrmCadUtilizador = class(TForm)
    tabCadUtilizador: TIBDataSet;
    tabCadUtilizadorCOD_UTI: TIntegerField;
    tabCadUtilizadorNOME: TIBStringField;
    tabCadUtilizadorCOD_CID: TIntegerField;
    tabCadUtilizadorCOD_SET: TIntegerField;
    tabCadUtilizadorCOD_CARG: TIntegerField;
    tabCadUtilizadorEMAIL: TIBStringField;
    tabCadUtilizadorTELEFONE: TIBStringField;
    tabCadUtilizadorOBS: TMemoField;
    Label1: TLabel;
    edtCodUtilizador: TDBEdit;
    dsCadUtilizador: TDataSource;
    Label2: TLabel;
    edtUtilizador: TDBEdit;
    Label3: TLabel;
    edtcodCidade: TDBEdit;
    Label4: TLabel;
    edtcodSetor: TDBEdit;
    Label5: TLabel;
    edtCodCargo: TDBEdit;
    Label6: TLabel;
    edtEmail: TDBEdit;
    Label7: TLabel;
    edtTelefone: TDBEdit;
    Label8: TLabel;
    edtObs: TDBMemo;
    ImageList1: TImageList;
    tabCidade: TIBDataSet;
    tabSetor: TIBDataSet;
    tabCargo: TIBDataSet;
    edtCidade: TDBEdit;
    edtSetor: TDBEdit;
    edtCargo: TDBEdit;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    tabCidadeCOD_CID: TIntegerField;
    tabCidadeNOME: TIBStringField;
    tabCidadeCEP: TIBStringField;
    tabCidadeUF: TIBStringField;
    dsCidade: TDataSource;
    tabSetorCOD_SET: TIntegerField;
    tabSetorNOME: TIBStringField;
    dsSetor: TDataSource;
    tabCargoCOD_CARG: TIntegerField;
    tabCargoNOME: TIBStringField;
    dsCargo: TDataSource;
    panelCargo: TPanel;
    Panel3: TPanel;
    DBGridCargo: TDBGrid;
    btnSelCargoOk: TButtonGradient;
    btnSelCargoCadastrar: TButtonGradient;
    btnSelCargoExcluir: TButtonGradient;
    btnSelCargoFechar: TButtonGradient;
    panelSetor: TPanel;
    Panel1: TPanel;
    DBGridSetor: TDBGrid;
    btnSetorOk: TButtonGradient;
    btnSetorCadastrar: TButtonGradient;
    btnSetorExcluir: TButtonGradient;
    btnSetorFechar: TButtonGradient;
    PanelMunicipio: TPanel;
    panelCid: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridMunicipio: TDBGrid;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    btnExcluir: TButtonGradient;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure btnCidOkClick(Sender: TObject);
    procedure DBGridMunicipioDblClick(Sender: TObject);
    procedure btnCadastrarCidClick(Sender: TObject);
    procedure btnCidExcluirClick(Sender: TObject);
    procedure btnUtilCidadeClick(Sender: TObject);
    procedure btnSetorOkClick(Sender: TObject);
    procedure btnSetorCadastrarClick(Sender: TObject);
    procedure btnSetorExcluirClick(Sender: TObject);
    procedure btnSetorFecharClick(Sender: TObject);
    procedure btnSelCargoOkClick(Sender: TObject);
    procedure btnSelCargoCadastrarClick(Sender: TObject);
    procedure btnSelCargoExcluirClick(Sender: TObject);
    procedure btnSelCargoFecharClick(Sender: TObject);
    procedure DBGridCargoDblClick(Sender: TObject);
    procedure DBGridSetorDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtUtilizadorClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtTelefoneClick(Sender: TObject);
    procedure edtTelefoneEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Utilizador : integer;
  end;

var
  frmCadUtilizador: TfrmCadUtilizador;

implementation

uses UdmBD, UCadCidade, UCadSetor, UCadCargo, URetiradas;

{$R *.dfm}

procedure TfrmCadUtilizador.btnCadastrarCidClick(Sender: TObject);
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
 frmCadUtilizador.Width:=500;

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
    edtCodCidade.Text:=IntToStr(NOME);
    CIDADE:=tabCidadeNOME.AsString;
    if CIDADE =tabCidadeNOME.Value then
      edtCidade.Text:=(CIDADE);
      panelMunicipio.Visible:=false;
      frmCadUtilizador.Width:=503;
      buttongradient2.SetFocus;
      buttongradient2.ShowHint:=true;


end;




procedure TfrmCadUtilizador.btnEditarClick(Sender: TObject);
begin
  if (edtUtilizador.Text='') then
  begin
    Application.MessageBox('Nenhum dado para editar!', 'Atenção  .:: S.I.G.E', 48);
    exit;
  end
  else
  tabCadUtilizador.Edit;
  edtUtilizador.SetFocus;
end;

procedure TfrmCadUtilizador.btnExcluirClick(Sender: TObject);
begin
  if(tabCadUtilizador.State in [dsBrowse]) or (edtUtilizador.Text='') then
  begin
    Application.MessageBox('Não há dados para apagar!', 'Atenção  .:: S.I.G.E', 48);
    exit;
   end
  else
  if messageDlg('Você está certo disso?', mtconfirmation, [mbyes, mbno], 0) =id_yes then
  begin
    edtCodUtilizador.text:='';
    edtUtilizador.text:='';
    edtCodCidade.Text:='';
    edtCidade.Text:='';
    edtCodSetor.Text:='';
    edtSetor.Text:='';
    edtCodCargo.Text:='';
    edtCargo.Text:='';
    edtEmail.Text:='';
    edtTelefone.Text:='';
    edtObs.Text:='';
  end;
end;


procedure TfrmCadUtilizador.btnFecharClick(Sender: TObject);
begin
  if edtUtilizador.Text='' then
    Close

  else

  if MessageDlg('Você deseja sair sem Salvar?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      Close;
    end
    else
    btnSalvar.SetFocus;
end;




procedure TfrmCadUtilizador.btnNovoClick(Sender: TObject);
begin
  if (dsCadUtilizador.State in [dsBrowse]) and (edtUtilizador.Text='') and (edtSetor.Text='') and (edtCargo.Text='') and (edtEmail.Text='') and (edtTelefone.Text='') then
    begin
      Application.MessageBox('Por Favor Preencha todos os campos corretamente e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
       exit;
    end
    else
    if (edtUtilizador.Text='') then
        begin
      Application.MessageBox('Por Favor Preencha o campo "Utilizador" e clique em Salvar!', 'Atenção  .:: S.I.G.E', 48);
       exit;
        end
    else
    if (edtCidade.Text='') then
       begin
          Application.MessageBox('Por Favor selecione a respectiva "Cidade" e clique em Salvar!', 'Atenção  .:: S.I.G.E', 48);
          exit;
       end
    else
    if (edtSetor.Text='') then
       begin
          Application.MessageBox('Por Favor Preencha o campo "Setor" e clique em Salvar!', 'Atenção  .:: S.I.G.E', 48);
          exit;
       end
    else
    if (edtCargo.Text='') then
      begin
          Application.MessageBox('Por Favor Preencha o campo "Cargo" e clique em Salvar!', 'Atenção  .:: S.I.G.E', 48);
          exit;
      end
      else
      if (edtEmail.Text='') then
        begin
                Application.MessageBox('Por Favor Preencha o campo "Email" e clique em Salvar!', 'Atenção  .:: S.I.G.E', 48);
             exit;
        end
        else
      if (edtTelefone.Text='') then
      begin
              Application.MessageBox('Por Favor Preencha o campo "Telefone" e clique em Salvar!', 'Atenção  .:: S.I.G.E', 48);
      end
      else
      tabCadUtilizador.Append;




end;

procedure TfrmCadUtilizador.btnSalvarClick(Sender: TObject);
begin
  if (dsCadUtilizador.State in [dsEdit, dsInsert]) and (edtUtilizador.Text='') and (edtCidade.Text='') and (edtSetor.Text='') and (edtCargo.Text='') and (edtEmail.Text='') and (edtTelefone.Text='') and (edtObs.text='') then
  begin
    Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
    Exit;
  end
  else
  if (edtUtilizador.text='') then
  begin
    Application.MessageBox('Por Favor preencha o campo "Utilizador" e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    Exit;
  end
  else
  if (edtCidade.Text='') then
  begin
    Application.MessageBox('Por Favor selecione a respectiva "Cidade" e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    Exit;
  end
  else
  if (edtSetor.Text='') then
  begin
    Application.MessageBox('Por Favor selecione o "Setor" e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    Exit;
  end
  else
  if (edtCargo.Text='') then
  begin
    Application.MessageBox('Por Favor selecione o "Cargo" e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    Exit;
  end
  else
  if (edtEmail.Text='') then
  begin
    Application.MessageBox('Por Favor preencha o campo "Email" e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
    Exit;
  end
  else
  if (edtTelefone.Text='') then
  begin
     Application.MessageBox('Por Favor preencha o campo "Telefone" e clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
     tabCadUtilizadorTELEFONE.EditMask:='!\(99\)0000-0000;1;';
     exit;
  end
  else
  begin
   if Messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno],0)=id_yes then
   begin
     frmCadUtilizador.tabCadUtilizadorCOD_CID.Text:=edtCodCidade.Text;
     frmCadUtilizador.tabCadUtilizadorCOD_SET.Text:=edtCodSetor.Text;
     frmCadUtilizador.tabCadUtilizadorCOD_CARG.Text:=edtCodCargo.Text;
   end;
   begin
     tabCadUtilizador.Post;
     dmBD.trBD_SIGE.CommitRetaining;
     Application.MessageBox('Dados gravados com sucesso!', 'Mensagem de Confirmação.:: S.I.G.E ::.', 48);
     edtCodUtilizador.Text:='';
     edtUtilizador.Text:='';
     edtCodCidade.Text:='';
     edtCidade.Text:='';
     edtCodSetor.Text:='';
     edtSetor.Text:='';
     edtCodCargo.Text:='';
     edtCargo.Text:='';
     edtEmail.Text:='';
     edtTelefone.Text:='';
     edtObs.Text:='';
   end;

  end;









end;

procedure TfrmCadUtilizador.btnSelCargoCadastrarClick(Sender: TObject);
begin
 with TfrmCadCargo.Create(self) do
 begin
   try
     Cod_Cargo:= tabCadCargoCOD_CARG.AsInteger;
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
      tabCidade.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmCadUtilizador.btnSelCargoFecharClick(Sender: TObject);
begin
 panelMunicipio.Visible:=false;
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
      panelCargo.Visible:=false;
      edtEmail.SetFocus;
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
      panelCargo.Visible:=false;
      frmCadUtilizador.Width:=503;
      buttongradient3.SetFocus;
end;



procedure TfrmCadUtilizador.btnUtilCidadeClick(Sender: TObject);
begin
  panelMunicipio.Visible:=false;
  frmCadUtilizador.Width:=503;
end;

procedure TfrmCadUtilizador.ButtonGradient1Click(Sender: TObject);
begin
  frmCadUtilizador.Width:=1026;
  frmCadUtilizador.Height:=555;
  panelMunicipio.Visible:=true;
  panelSetor.Visible:=false;
  panelCargo.Visible:=false;
end;


procedure TfrmCadUtilizador.ButtonGradient2Click(Sender: TObject);
  begin
  frmCadUtilizador.Width:=1026;
  frmCadUtilizador.Height:=555;
  panelSetor.Visible:=true;
  panelMunicipio.Visible:=false;
  panelCargo.Visible:=false;
end;



procedure TfrmCadUtilizador.ButtonGradient3Click(Sender: TObject);
begin
  frmCadUtilizador.Width:=1026;
  frmCadUtilizador.Height:=555;
  panelSetor.Visible:=false;
  panelMunicipio.Visible:=false;
  panelCargo.Visible:=true;
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
      panelCargo.Visible:=false;
      edtEmail.SetFocus;
end;

procedure TfrmCadUtilizador.DBGridMunicipioDblClick(Sender: TObject);
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
      panelMunicipio.Visible:=false;
      frmCadUtilizador.Width:=503;
      buttongradient2.SetFocus;
      buttongradient2.ShowHint:=true;

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
      panelCargo.Visible:=false;
      frmCadUtilizador.Width:=503;
      buttongradient3.SetFocus;
end;

procedure TfrmCadUtilizador.edtTelefoneClick(Sender: TObject);
begin
   tabCadUtilizadorTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadUtilizador.edtTelefoneEnter(Sender: TObject);
begin
   tabCadUtilizadorTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadUtilizador.edtUtilizadorClick(Sender: TObject);
begin
  edtUtilizador.Clear;
end;

procedure TfrmCadUtilizador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadUtilizador.FormCreate(Sender: TObject);
begin
  tabCadUtilizador.Open;
  tabCadUtilizador.FetchAll;
  tabCidade.Open;
  tabCidade.FetchAll;
  tabSetor.Open;
  tabSetor.FetchAll;
  tabCargo.Open;
  tabCargo.FetchAll;
end;

procedure TfrmCadUtilizador.FormShow(Sender: TObject);
begin
  tabCadUtilizador.Append;
  edtUtilizador.SetFocus;
end;

end.

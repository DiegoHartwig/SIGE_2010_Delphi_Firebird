//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, IBCustomDataSet, ImgList, TeCanvas,
  TeeEdiGrad, Grids, DBGrids, ExtCtrls;

type
  TfrmCadContatos = class(TForm)
    tabCONTATOS: TIBDataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCONTATOS: TDataSource;
    Label2: TLabel;
    edtContato: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtEmail: TDBEdit;
    edtSetor: TDBEdit;
    edtMunicipio: TDBEdit;
    edtCargo: TDBEdit;
    ButtonGradient1: TButtonGradient;
    ButtonGradient2: TButtonGradient;
    ImageList1: TImageList;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ButtonGradient3: TButtonGradient;
    panelSetor: TPanel;
    Panel1: TPanel;
    DBGridSetor: TDBGrid;
    btnSetorOk: TButtonGradient;
    btnSetorCadastrar: TButtonGradient;
    btnSetorExcluir: TButtonGradient;
    btnSetorFechar: TButtonGradient;
    panelCargo: TPanel;
    Panel3: TPanel;
    DBGridCargo: TDBGrid;
    btnSelCargoOk: TButtonGradient;
    btnSelCargoCadastrar: TButtonGradient;
    btnSelCargoExcluir: TButtonGradient;
    btnSelCargoFechar: TButtonGradient;
    PanelMunicipio: TPanel;
    panelCid: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridMunicipio: TDBGrid;
    tabSetor: TIBDataSet;
    tabCadMunicipio: TIBDataSet;
    tabCadCargo: TIBDataSet;
    tabSetorCOD_SET: TIntegerField;
    tabSetorNOME: TIBStringField;
    edtCodSetor: TDBEdit;
    dsSetor: TDataSource;
    tabCadMunicipioCOD_CID: TIntegerField;
    tabCadMunicipioNOME: TIBStringField;
    tabCadMunicipioCEP: TIBStringField;
    tabCadMunicipioUF: TIBStringField;
    edtCodmunicipio: TDBEdit;
    dsCadMunicipio: TDataSource;
    tabCadCargoCOD_CARG: TIntegerField;
    tabCadCargoNOME: TIBStringField;
    edtCodCargo: TDBEdit;
    dsCargo: TDataSource;
    tabCONTATOSCOD_CONT: TIntegerField;
    tabCONTATOSNOME: TIBStringField;
    tabCONTATOSCOD_CID: TIntegerField;
    tabCONTATOSCOD_SET: TIntegerField;
    tabCONTATOSCOD_CARG: TIntegerField;
    tabCONTATOSEMAIL: TIBStringField;
    tabCONTATOSTELEFONE_RESID: TIBStringField;
    tabCONTATOSTELEFONE_CEL: TIBStringField;
    Label6: TLabel;
    edtFoneResid: TDBEdit;
    Label8: TLabel;
    edtCelular: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure btnSelCargoOkClick(Sender: TObject);
    procedure btnSelCargoCadastrarClick(Sender: TObject);
    procedure btnSelCargoExcluirClick(Sender: TObject);
    procedure btnSelCargoFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridCargoDblClick(Sender: TObject);
    procedure btnSetorOkClick(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
    procedure btnSetorCadastrarClick(Sender: TObject);
    procedure btnSetorExcluirClick(Sender: TObject);
    procedure btnSetorFecharClick(Sender: TObject);
    procedure btnCidOkClick(Sender: TObject);
    procedure btnCadastrarCidClick(Sender: TObject);
    procedure btnCidExcluirClick(Sender: TObject);
    procedure btnUtilCidadeClick(Sender: TObject);
    procedure DBGridSetorDblClick(Sender: TObject);
    procedure DBGridMunicipioDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtFoneResidClick(Sender: TObject);
    procedure edtFoneResidEnter(Sender: TObject);
    procedure edtCelularClick(Sender: TObject);
    procedure edtCelularEnter(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmCadContatos: TfrmCadContatos;
  Cod_Contato : integer;

implementation

uses UdmBD, UCadCargo, UCadSetor, UCadCidade, ULigacoes;

{$R *.dfm}

procedure TfrmCadContatos.btnCadastrarCidClick(Sender: TObject);
begin
 with TfrmCadCidade.Create(self) do
 begin
   try
     Cod_Cidade:= tabCadMunicipioCOD_CID.AsInteger;
     Showmodal;
   finally
     free;
   end;
 end;
 tabcadMunicipio.Close;
 tabcadMunicipio.Open;
 tabcadMunicipio.FetchAll;

end;

procedure TfrmCadContatos.btnCidExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabCadMunicipio.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;
procedure TfrmCadContatos.btnCidOkClick(Sender: TObject);
var
  NOME : integer;
  CIDADE: string;
begin
  NOME:= tabCadMunicipioCOD_CID.AsInteger;
  if NOME = tabCadMunicipioCOD_CID.Value then
    edtCodMunicipio.Text:=IntToStr(NOME);
    CIDADE:=tabCadMunicipioNOME.AsString;
    if CIDADE =tabCadMunicipioNOME.Value then
      edtMunicipio.Text:=(CIDADE);
      panelMunicipio.Visible:=false;
      frmCadContatos.Width:=503;
end;


procedure TfrmCadContatos.btnEditarClick(Sender: TObject);
 begin
  if (edtContato.Text='') then
  begin
    Application.MessageBox('Nenhum dado para editar!', 'Atenção  .:: S.I.G.E', 48);
  end
  else
  tabContatos.Edit;
  edtContato.SetFocus;
end;


procedure TfrmCadContatos.btnExcluirClick(Sender: TObject);
begin
  if(dsContatos.State in [dsBrowse]) or (edtContato.Text='') then
  begin
    Application.MessageBox('Não há dados para apagar!', 'Atenção  .:: S.I.G.E', 48);
    exit;
   end
  else
  if messageDlg('Você está certo disso?', mtconfirmation, [mbyes, mbno], 0) =id_yes then
  begin
    edtContato.Text:='';
    edtCodSetor.Text:='';
    edtSetor.Text:='';
    edtCodMunicipio.Text:='';
    edtMunicipio.Text:='';
    edtCodCargo.Text:='';
    edtCargo.Text:='';
    edtEmail.Text:='';
    edtFoneResid.Text:='';
    edtCelular.Text:='';
  end;
end;

procedure TfrmCadContatos.btnFecharClick(Sender: TObject);
begin
  if edtContato.Text = '' then
    Close
  else
   if MessageDlg('Deseja salvar as alterações no Cadastro da Instituição?',mtConfirmation, [mbYes,mbNo],1) = id_yes then
     btnSalvar.SetFocus
   else
   Close;

end;

procedure TfrmCadContatos.btnNovoClick(Sender: TObject);
begin
  if (dsContatos.State in [dsBrowse]) and (edtContato.Text='') and (edtSetor.Text='') and (edtMunicipio.Text = '') and (edtCargo.Text='') and (edtEmail.Text ='') and (edtFoneResid.Text ='') then
     begin
      Application.MessageBox('Por Favor Preencha todos os campos corretamente e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
       exit;
     end
     else
     if (edtContato.Text ='') then
      begin
        Application.MessageBox('Por Favor Preencha o campo "Contato" e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
        exit;
      end
      else
      if (edtSetor.Text ='') then
      begin
         Application.MessageBox('Por Favor selecione o  respectivo "Setor" e  tente novamente!', 'Atenção  .:: S.I.G.E', 48);
         exit;
      end
      else
      if (edtMunicipio.Text ='') then
      begin
         Application.MessageBox('Por Favor selecione o "Municipio" desejado e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
         exit;
      end
      else
      if (edtCargo.Text='') then
      begin
         Application.MessageBox('Por Favor selecione o respectivo "Cargo" e  tente novamente!', 'Atenção  .:: S.I.G.E', 48);
         exit;
      end
      else
      if (edtEmail.Text='') then
      begin
         Application.MessageBox('Por Favor Preencha o campo "Email" e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
         exit;
      end
      else
      if (edtFoneResid.Text='') then
      begin
         Application.MessageBox('Por Favor Preencha o campo "Telefone" e tente novamente!', 'Atenção  .:: S.I.G.E', 48);
         exit;
      end;




end;

procedure TfrmCadContatos.btnSalvarClick(Sender: TObject);
begin
  if (dsContatos.state in [dsBrowse]) and (edtContato.Text='') and (edtSetor.Text='') and (edtMunicipio.Text='') and (edtCargo.Text='') and (edtEmail.Text='') and (edtFoneResid.Text='') and (edtCelular.Text='') then
    begin
       Application.MessageBox('Por Favor preencha todos os campos corretamente!', 'Atenção .:: S.I.G.E ::.', 48);
       Exit;
    end
  else
  if (edtContato.Text='') then
  begin
      Application.MessageBox('Por Favor preencha o campo "Contato" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
  end
  else
  if (edtSetor.Text='') then
  begin
      Application.MessageBox('Por Favor selecione o respectivo "Setor" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      panelSetor.Visible:=true;
      exit;
  end
  else
  if (edtMunicipio.Text='') then
  begin
      Application.MessageBox('Por Favor selecione o respectivo "Municipio" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      panelMunicipio.Visible:=true;
      exit;
  end
  else
  if (edtCargo.Text='') then
  begin
      Application.MessageBox('Por Favor selecione o respectivo "Cargo" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      panelCargo.Visible:=true;
      exit;
  end
  else
  if (edtEmail.Text='') then
  begin
      Application.MessageBox('Por Favor preencha o campo "Email" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      exit;
  end
  else
  if (edtFoneResid.Text='') then
  begin
      Application.MessageBox('Por Favor preencha o campo "Telefone Residencial" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      tabContatosTELEFONE_RESID.EditMask:='!\(99\)0000-0000;1;';
     exit;
    end
  else
  if (edtCelular.Text='') then
  begin
      Application.MessageBox('Por Favor preencha o campo "Celular" e Clique em Salvar!', 'Atenção .:: S.I.G.E ::.', 48);
      tabContatosTelefone_cel.EditMask:='!\(99\)0000-0000;1;';
      exit;
  end
    else
    begin
      if Messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno],0)=id_yes then
      begin
        frmCadContatos.tabContatosCOD_SET.Text:=edtCodSetor.Text;
        frmCadContatos.tabContatosCOD_CID.Text:=edtCodMunicipio.Text;
        frmCadContatos.tabCONTATOSCOD_CARG.Text:=edtCodCargo.Text;
      end;
      begin
        tabContatos.Post;
        dmBD.trBD_SIGE.CommitRetaining;
        tabCONTATOS.Close;
        tabCONTATOS.Open;
      end;
        begin
          Application.MessageBox('Dados Gravados com Sucesso!', 'Atenção .:: S.I.G.E ::. ', 48);
          tabContatos.Append;
          edtContato.SetFocus;
          edtCodSetor.Text:='';
          edtSetor.Text:='';
          edtCodMunicipio.Text:='';
          edtMunicipio.Text:='';
          edtCodCargo.Text:='';
          edtCargo.Text:='';
          edtFoneResid.Text:='';
          edtCelular.text:='';
       end;

end;
end;

procedure TfrmCadContatos.btnSelCargoCadastrarClick(Sender: TObject);
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
 tabCadCargo.Close;
 tabCadCargo.Open;
 tabCadCargo.FetchAll;
end;


procedure TfrmCadContatos.btnSelCargoExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabCadCargo.Delete;
      Application.MessageBox('Dados do "Contato" excluído com Sucesso!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;


procedure TfrmCadContatos.btnSelCargoFecharClick(Sender: TObject);
begin
  panelCargo.Visible:=false;
  panelCargo.Visible:=false;
  panelMunicipio.Visible:=false;
  frmCadContatos.Width:=503;
  tabCadCargo.Close;
  tabCadCargo.Open;
end;


procedure TfrmCadContatos.btnSelCargoOkClick(Sender: TObject);
var
  NOME : integer;
  CARGO: string;
begin
  NOME:= tabCadCargoCOD_CARG.AsInteger;
  if NOME = tabCadCargoCOD_CARG.Value then
    edtCodCargo.Text:=IntToStr(NOME);
    CARGO:=tabCadCargoNOME.AsString;
    if CARGO = tabCadCargoNOME.Value then
      edtCargo.Text:=(CARGO);
      frmCadContatos.Width:=503;
      panelCargo.Visible:=false;
      edtEmail.SetFocus;
end;



procedure TfrmCadContatos.btnSetorCadastrarClick(Sender: TObject);
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

procedure TfrmCadContatos.btnSetorExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você esta certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
    begin
      tabSetor.Delete;
      Application.MessageBox('Exclusão Concluída!', 'Mensagem de Confirmação .:: S.I.G.E ::.', 48);
    end
end;



procedure TfrmCadContatos.btnSetorFecharClick(Sender: TObject);
begin
 panelSetor.Visible:=false;
  frmCadContatos.Width:=503;
end;

procedure TfrmCadContatos.btnSetorOkClick(Sender: TObject);
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
      frmCadContatos.Width:=503;
      panelCargo.Visible:=false;
end;


procedure TfrmCadContatos.btnUtilCidadeClick(Sender: TObject);
begin
  panelMunicipio.Visible:=false;
  frmCadContatos.Width:=503;
end;
procedure TfrmCadContatos.ButtonGradient1Click(Sender: TObject);
begin
  frmCadContatos.Width:=1026;
  frmCadContatos.Height:=555;
  panelSetor.Visible:=false;
  panelMunicipio.Visible:=false;
  panelCargo.Visible:=true;
end;


procedure TfrmCadContatos.ButtonGradient2Click(Sender: TObject);
begin
  frmCadContatos.Width:=1026;
  frmCadContatos.Height:=555;
  panelSetor.Visible:=false;
  panelMunicipio.Visible:=true;
  panelCargo.Visible:=false;
end;

procedure TfrmCadContatos.ButtonGradient3Click(Sender: TObject);
begin
  frmCadContatos.Width:=1026;
  frmCadContatos.Height:=555;
  panelSetor.Visible:=true;
  panelMunicipio.Visible:=false;
  panelCargo.Visible:=false;
end;

procedure TfrmCadContatos.DBGridSetorDblClick(Sender: TObject);
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
      frmCadContatos.Width:=503;
      panelCargo.Visible:=false;
end;



procedure TfrmCadContatos.edtCelularClick(Sender: TObject);
begin
  tabContatosTELEFONE_RESID.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadContatos.edtCelularEnter(Sender: TObject);
begin
  tabContatosTELEFONE_CEL.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadContatos.edtFoneResidClick(Sender: TObject);
begin
  tabContatosTELEFONE_RESID.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadContatos.edtFoneResidEnter(Sender: TObject);
begin
  tabContatosTELEFONE_RESID.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadContatos.DBGridCargoDblClick(Sender: TObject);
var
  NOME : integer;
  CARGO: string;
begin
  NOME:= tabCadCargoCOD_CARG.AsInteger;
  if NOME = tabCadCargoCOD_CARG.Value then
    edtCodCargo.Text:=IntToStr(NOME);
    CARGO:=tabCadCargoNOME.AsString;
    if CARGO = tabCadCargoNOME.Value then
      edtCargo.Text:=(CARGO);
      frmCadContatos.Width:=503;
      panelCargo.Visible:=false;
end;

procedure TfrmCadContatos.DBGridMunicipioDblClick(Sender: TObject);
var
  NOME : integer;
  CIDADE: string;
begin
  NOME:= tabCadMunicipioCOD_CID.AsInteger;
  if NOME = tabCadMunicipioCOD_CID.Value then
    edtCodMunicipio.Text:=IntToStr(NOME);
    CIDADE:=tabCadMunicipioNOME.AsString;
    if CIDADE =tabCadMunicipioNOME.Value then
      edtMunicipio.Text:=(CIDADE);
      panelMunicipio.Visible:=false;
      frmCadContatos.Width:=503

end;




procedure TfrmCadContatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadContatos.FormCreate(Sender: TObject);
begin
   tabCONTATOS.Open;
   tabCONTATOS.FetchAll;
   tabSetor.Open;
   tabCadCargo.Open;
   tabCadMunicipio.Open;
end;

procedure TfrmCadContatos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

procedure TfrmCadContatos.FormShow(Sender: TObject);
begin
  tabContatos.Append;
  edtContato.SetFocus;
  panelSetor.Visible:=false;
  PanelMunicipio.Visible:=false;
  panelCargo.Visible:=false;
end;

end.

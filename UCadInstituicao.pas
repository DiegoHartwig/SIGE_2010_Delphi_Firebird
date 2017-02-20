//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadInstituicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, IBCustomDataSet, TeCanvas, TeeEdiGrad,
  ImgList, Grids, DBGrids, ExtCtrls;

type
  TfrmCadInstituicao = class(TForm)
    tabCadInstituicao: TIBDataSet;
    tabCadInstituicaoCOD_INST: TIntegerField;
    tabCadInstituicaoNOME: TIBStringField;
    tabCadInstituicaoEND: TIBStringField;
    tabCadInstituicaoN_END: TIBStringField;
    tabCadInstituicaoBAIRRO: TIBStringField;
    tabCadInstituicaoTELEFONE: TIBStringField;
    tabCadInstituicaoEMAIL: TIBStringField;
    tabCadInstituicaoWEBSITE: TIBStringField;
    tabCadInstituicaoCOD_CID: TIntegerField;
    tabCadInstituicaoCNPJ: TIBStringField;
    Label1: TLabel;
    edtCodigo: TDBEdit;
    dsCadInstituicao: TDataSource;
    Label2: TLabel;
    edtInstituicao: TDBEdit;
    Label3: TLabel;
    edtEndereco: TDBEdit;
    Label4: TLabel;
    edtNumero: TDBEdit;
    Label5: TLabel;
    edtBairro: TDBEdit;
    Label6: TLabel;
    edtTelefone: TDBEdit;
    Label7: TLabel;
    edtEmail: TDBEdit;
    Label8: TLabel;
    edtWebSite: TDBEdit;
    Label9: TLabel;
    edtCodCid: TDBEdit;
    Label10: TLabel;
    edtCNPJ: TDBEdit;
    btnNovo: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ImageList1: TImageList;
    edtCidade: TDBEdit;
    panelCidade: TPanel;
    panelCid: TPanel;
    btnCidOk: TButtonGradient;
    btnCadastrarCid: TButtonGradient;
    btnCidExcluir: TButtonGradient;
    btnUtilCidade: TButtonGradient;
    DBGridCidade: TDBGrid;
    btnBuscarCidade: TButtonGradient;
    tabCadCidade: TIBDataSet;
    tabCadCidadeCOD_CID: TIntegerField;
    tabCadCidadeNOME: TIBStringField;
    tabCadCidadeCEP: TIBStringField;
    tabCadCidadeUF: TIBStringField;
    dsCadCidade: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscarCidadeClick(Sender: TObject);
    procedure btnCidOkClick(Sender: TObject);
    procedure btnCadastrarCidClick(Sender: TObject);
    procedure btnCidExcluirClick(Sender: TObject);
    procedure btnUtilCidadeClick(Sender: TObject);
    procedure edtTelefoneEnter(Sender: TObject);
    procedure edtTelefoneClick(Sender: TObject);
    procedure edtCNPJClick(Sender: TObject);
    procedure edtCNPJEnter(Sender: TObject);
    procedure DBGridCidadeDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInstituicao: TfrmCadInstituicao;

implementation

uses UdmBD, UCadCidade;

{$R *.dfm}

procedure TfrmCadInstituicao.btnBuscarCidadeClick(Sender: TObject);
begin
  frmCadInstituicao.Width:=1026;
  frmCadInstituicao.Height:=555;
  panelCidade.Visible:=true;
  dbgridCidade.SetFocus;
end;

procedure TfrmCadInstituicao.btnCadastrarCidClick(Sender: TObject);
begin
  with TfrmCadCidade.Create(Self) do
    begin
      try
        Cod_Cidade:=tabCadCidadeCOD_CID.AsInteger;
        ShowModal;
      finally
        free;

      end;
    end;
    tabCadCidade.Close;
    tabCadCidade.Open;
    tabCadCidade.FetchAll;

end;

procedure TfrmCadInstituicao.btnCidExcluirClick(Sender: TObject);
begin
  if messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno], 0)= id_yes then
  begin
    tabCadCidade.Delete;
    Application.MessageBox('Dados Excluídos com Sucesso!', 'Atenção .:: S.I.G.E ::. ', 48);
  end;
end;

procedure TfrmCadInstituicao.btnCidOkClick(Sender: TObject);
var
  NOME : integer;
  CIDADE : String;
begin
  NOME :=tabCadCidadeCOD_CID.AsInteger;
  if NOME = tabCadCidadeCOD_CID.Value then
    edtCodCid.Text:=IntToStr(NOME);
    CIDADE:= tabCadCidadeNOME.AsString;
  if CIDADE = tabCadCidadeNOME.Value then
    edtCidade.Text:=(CIDADE);
    begin
      frmCadInstituicao.Width:=503;
      panelCidade.Visible:=false;
      edtWebSite.SetFocus;
end;
end;

procedure TfrmCadInstituicao.btnEditarClick(Sender: TObject);
begin
  if (edtInstituicao.Text='') then
    begin
      Application.MessageBox('Não há dados para edição!', 'Atenção .:: S.I.G.E ::. ', 48);
      exit
     end
  else
    tabCadInstituicao.Edit;
    edtInstituicao.SetFocus;
end;

procedure TfrmCadInstituicao.btnExcluirClick(Sender: TObject);
begin
  if (dsCadInstituicao.State in [dsBrowse]) or (edtInstituicao.Text='') then
    begin
      Application.MessageBox('Não existem dados a serem excluídos!', 'Atenção .:: S.I.G.E ::. ', 48);
      exit;
    end
  else
    if messagedlg('Você está certo disso?', mtconfirmation,[mbyes, mbno],0)=id_yes then
      begin
        tabCadInstituicao.Delete;
        Application.MessageBox('Dados excluídos com sucesso!', 'Confirmação .:: S.I.G.E ::. ', 48);
        exit;
      end;


end;

procedure TfrmCadInstituicao.btnFecharClick(Sender: TObject);
begin
  if (edtInstituicao.Text='') then
    Close
  else
  if messagedlg('Deseja salvar as Alterações no Cadastro da Instituição?', mtconfirmation, [mbyes,mbno], 1)=id_yes then
    btnSalvar.setfocus
  else
    Close;


end;

procedure TfrmCadInstituicao.btnNovoClick(Sender: TObject);
begin
  if (dsCadInstituicao.State in [dsBrowse]) and (edtInstituicao.Text='') and (edtEndereco.Text='')and (edtBairro.Text ='') and (edtNumero.Text='')and(edtTelefone.Text='')and (edtCidade.Text='')and (edtCNPJ.Text='')then
    begin
     Application.MessageBox('Por Favor Preêncha todos os campos corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
     exit;
    end
  else
    if (edtInstituicao.Text='') then
       begin
        Application.MessageBox('Por Favor Preêncha o campo "Instituição" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
       end
  else
   if(edtEndereco.Text='')then
      begin
        Application.MessageBox('Por Favor Preêncha o campo "Endereço" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
        exit;
    end
  else
    if (edtNumero.Text='') then
      begin
        Application.MessageBox('Por Favor Preêncha o campo "Número" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
       exit;
      end
  else
    if (edtBairro.Text='') then
      begin
        Application.MessageBox('Por Favor Preêncha o campo "Bairro" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
      end
  else
    if (edtTelefone.Text='') then
      begin
         Application.MessageBox('Por Favor Preêncha o campo "Telefone" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
      end
  else
    if (edtCidade.Text='') then
      begin
         Application.MessageBox('Por Favor Preêncha o campo "Cidade" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
      end
  else
    if (edtCNPJ.Text='') then
      begin
        Application.MessageBox('Por Favor Preêncha o campo "CNPJ" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
      end;
end;



procedure TfrmCadInstituicao.btnSalvarClick(Sender: TObject);
begin
  if (dsCadInstituicao.state in [dsBrowse]) and (edtInstituicao.Text='')and (edtEndereco.Text='') and (edtNumero.Text='')and (edtBairro.Text='')and (edtTelefone.Text='') and (edtCidade.Text='') and (edtWebSite.Text='')and(edtEmail.Text='')and(edtCNPJ.Text='') then
    begin
      Application.MessageBox('Por Favor Preêncha todos os campos corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
      exit;
    end
   else
   if (edtInstituicao.Text='') then
     begin
      Application.MessageBox('Por Favor Preêncha o campo "Instituição" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
      exit;
     end
   else
    if (edtEndereco.Text='') then
      begin
            Application.MessageBox('Por Favor Preêncha o campo "Endereço" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
           exit;
      end
   else
   if (edtNumero.Text='') then
    begin
          Application.MessageBox('Por Favor Preêncha o campo "Número" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
          exit;
    end
   else
   if (edtBairro.Text='') then
    begin
          Application.MessageBox('Por Favor Preêncha o campo "Bairro" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
          exit;
    end
   else
   if (edtTelefone.Text='') then
    begin
          Application.MessageBox('Por Favor Preêncha o campo "Telefone" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
    end
    else
    if (edtCidade.Text='') then
    begin
        Application.MessageBox('Por Favor Preêncha o campo "Cidade" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
        exit;
    end
    else
    if (edtWebSite.Text='') then
    begin
         Application.MessageBox('Por Favor Preêncha o campo "WebSite" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
         exit;
    end
    else
    if (edtEmail.Text='') then
    begin
      Application.MessageBox('Por Favor Preêncha o campo "Email" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
      exit;
    end
    else
    if (edtCNPJ.Text='') then
    begin
      Application.MessageBox('Por Favor Preêncha o campo "CNPJ" corretamente e Clique em Salvar!', 'Atenção .:: S.I.G.E ::. ', 48);
      exit;
    end
    else
    begin
      if Messagedlg('Você está certo disso?', mtConfirmation, [mbyes, mbno],0)=id_yes then
      begin
        frmCadInstituicao.tabCadInstituicaoCOD_CID.Text:=edtCodCid.Text;
        tabCadInstituicao.Post;
        dmBD.trBD_SIGE.CommitRetaining;
        begin
          Application.MessageBox('Dados Gravados com Sucesso!', 'Atenção .:: S.I.G.E ::. ', 48);
          tabCadInstituicao.Append;
          edtInstituicao.SetFocus;
          edtCodCid.Text:='';
          edtCidade.Text:='';
          edtTelefone.Text:='';
          edtCNPJ.Text:='';

        end;
      end;

    end;



end;

procedure TfrmCadInstituicao.btnUtilCidadeClick(Sender: TObject);
begin
  panelCidade.Visible:=false;
  frmCadInstituicao.Width:=503;

end;

procedure TfrmCadInstituicao.DBGridCidadeDblClick(Sender: TObject);
var
  NOME : integer;
  CIDADE : String;
begin
  NOME :=tabCadCidadeCOD_CID.AsInteger;
  if NOME = tabCadCidadeCOD_CID.Value then
    edtCodCid.Text:=IntToStr(NOME);
    CIDADE:= tabCadCidadeNOME.AsString;
  if CIDADE = tabCadCidadeNOME.Value then
    edtCidade.Text:=(CIDADE);
    begin
      frmCadInstituicao.Width:=503;
      panelCidade.Visible:=false;
      edtWebSite.SetFocus;
end;
end;


procedure TfrmCadInstituicao.edtCNPJClick(Sender: TObject);
begin
   tabCadInstituicaoCNPJ.EditMask:='00\.000\.000\-9999\.00;1;';
end;

procedure TfrmCadInstituicao.edtCNPJEnter(Sender: TObject);
begin
   tabCadInstituicaoCNPJ.EditMask:='00\.000\.000\-9999\.00;1;';
end;

procedure TfrmCadInstituicao.edtTelefoneClick(Sender: TObject);
begin
   tabCadInstituicaoTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadInstituicao.edtTelefoneEnter(Sender: TObject);
begin
   tabCadInstituicaoTELEFONE.EditMask:='!\(99\)0000-0000;1;';
end;

procedure TfrmCadInstituicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadInstituicao.FormCreate(Sender: TObject);
begin
  tabCadInstituicao.Open;
  panelCidade.Visible:=false;
  tabCadCidade.Open;
  tabCadCidade.Fetchall;
end;

procedure TfrmCadInstituicao.FormShow(Sender: TObject);
begin
  tabCadInstituicao.Append;
  edtInstituicao.SetFocus;
end;

end.

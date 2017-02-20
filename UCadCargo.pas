//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UCadCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeCanvas, TeeEdiGrad, DB, Mask, DBCtrls, IBCustomDataSet,
  ExtCtrls, ImgList;

type
  TfrmCadCargo = class(TForm)
    tabCadCargo: TIBDataSet;
    tabCadCargoCOD_CARG: TIntegerField;
    tabCadCargoNOME: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsCadCargo: TDataSource;
    Label2: TLabel;
    edtCargo: TDBEdit;
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
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonGradient4Click(Sender: TObject);
    procedure ButtonGradient3Click(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure ButtonGradient2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Cargo : integer;
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

uses UdmBD, UCadUtilizador, UPrincipal;

{$R *.dfm}

procedure TfrmCadCargo.btnEditarClick(Sender: TObject);
begin
  if (dscadCargo.State in [dsBrowse]) or (edtCargo.Text='') then
    begin
      Application.MessageBox('Não há dados para Editar!', 'Atenção .:: S.I.G.E .::', 48);
      exit;
    end
    else
    tabCadCargo.Edit;
end;

procedure TfrmCadCargo.btnExcluirClick(Sender: TObject);
begin
  tabCadCargo.Delete;
end;

procedure TfrmCadCargo.btnFecharClick(Sender: TObject);
begin
  if edtCargo.Text ='' then
    Close
  else
   if MessageDlg('Deseja salvar as alterações no Cadastro da Instituição?',mtConfirmation, [mbYes,mbNo],1) = id_yes then
   begin
      btnSalvar.SetFocus;
      tabCadCargo.Close;
      tabCadCargo.Open;
    end
   else
    Close;

 
end;

procedure TfrmCadCargo.btnNovoClick(Sender: TObject);
begin
  tabCadCargo.Append;
  edtCargo.SetFocus;
end;

procedure TfrmCadCargo.btnSalvarClick(Sender: TObject);
begin
  begin
  if (edtCargo.Text='') then
    begin
       Application.MessageBox('Por Favor preencha o Campo Descrição e Clique em Salvar!', 'Atenção .:: S.I.G.E .::', 48);
       Exit;
    end
  else
  if MessageDlg('Você está certo disso?',mtConfirmation, [mbYes,mbNo],0) = id_Yes then
     begin
      tabCadCargo.Post;
      ShowMessage('Dados gravados com Sucesso!');
      tabCadCargo.Append;
      edtCargo.SetFocus;

    end;
end;


end;

procedure TfrmCadCargo.ButtonGradient1Click(Sender: TObject);
begin
  tabCadCargo.Last;
end;

procedure TfrmCadCargo.ButtonGradient2Click(Sender: TObject);
begin
  tabCadCargo.Next;
end;

procedure TfrmCadCargo.ButtonGradient3Click(Sender: TObject);
begin
  tabCadCargo.Prior;
end;

procedure TfrmCadCargo.ButtonGradient4Click(Sender: TObject);
begin
  tabCadCargo.First;
end;

procedure TfrmCadCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin

  tabCadCargo.Open;
  tabCadCargo.FetchAll;
  tabCadCargo.Append;

end;

procedure TfrmCadCargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

procedure TfrmCadCargo.FormShow(Sender: TObject);
begin
    tabCadCargo.Append;
   edtCargo.SetFocus;


end;

end.

//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, TeCanvas, TeeEdiGrad, ExtCtrls;

type
  TfrmBackup = class(TForm)
    edtServidor: TEdit;
    edtBanco: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnProcurar: TButtonGradient;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    btnConectar: TButtonGradient;
    btnGerarBackup: TButtonGradient;
    btnRestaurar: TButtonGradient;
    panelConectado: TPanel;
    btnSair: TButtonGradient;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarBackupClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

uses UdmBD, UPrincipal, UGerarBackup, URestaurarBackup;

{$R *.dfm}

procedure TfrmBackup.btnConectarClick(Sender: TObject);
Procedure Status (Conectar: Boolean);
begin
  Label2.Enabled:= not Conectar;
  Label1.Enabled:= not Conectar;
  edtBanco.Enabled:= not Conectar;
  edtServidor.Enabled:= not Conectar;
  btnProcurar.Enabled:= not Conectar;
  btnGerarBackup.Enabled:= Conectar;
  if Conectar then
    btnConectar.Caption:='Desconectar'
  else
    btnConectar.Caption:='Conectar';
end;
begin
  if UdmBD.dmBD.BD_SIGE.Connected then
    begin
      UdmBD.dmBD.BD_SIGE.Connected:=false;
      Status(false);
      exit;
    end;
    if edtServidor.Text = '' then
    begin
      Application.MessageBox('Atenção! Informe o Nome do Servidor.', 'Aviso', 48);
      edtServidor.SetFocus;
      end;
    if edtBanco.Text = '' then
    begin
      Application.MessageBox('Atenção! informe o caminho da Base de Dados!','Aviso', 48);
      edtBanco.SetFocus ;
    end
    else
    begin
      with UdmBD.dmBD.BD_SIGE do
      begin
        DataBaseName:=edtServidor.Text+':'+edtBanco.Text;
        Connected:=true;
        if Connected then
          begin
          Status(True);
          panelConectado.Visible:=True;
          panelConectado.Caption:=('Conectado');
         end
        else
          Application.MessageBox('Não foi possivel Conectar ao Banco de Dados!', 'Aviso', 48);
       end;
 end;
end;


procedure TfrmBackup.btnGerarBackupClick(Sender: TObject);
begin
   if (edtServidor.Text='') then
    begin
      Application.MessageBox('Digite o Nome do Servidor, e Tente Novamente!', 'Aviso', 48);
      exit;
    end
  else
  if (edtBanco.Text='') then
    begin
      Application.MessageBox('Indique o Caminho da Base de Dados e Tente Novamente!', 'Aviso', 48);
      exit;
    end
  else

  if not LocalizaForm (frmGerarBackup) then
    frmGerarBackup:=TfrmGerarBackup.Create(Application);
    frmGerarBackup.Color:=frmBackup.Color;
    frmGerarBackup.Show;
end;

procedure TfrmBackup.btnProcurarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtBanco.Text:=OpenDialog1.FileName;
end;

procedure TfrmBackup.btnRestaurarClick(Sender: TObject);
begin
  if (edtServidor.Text='') then
    begin
      Application.MessageBox('Digite o Nome do Servidor, e Tente Novamente!', 'Aviso', 48);
      exit;
    end
  else
  if (edtBanco.Text='') then
    begin
      Application.MessageBox('Indique o Caminho da Base de Dados e Tente Novamente!', 'Aviso', 48);
      exit;
    end
  else
  if not localizaForm(frmRestaurarBackup) then
    frmRestaurarBackup:= TFrmRestaurarBackup.Create(Application);
    frmRestaurarBackup.Color:=frmPrincipal.Color;
    frmRestaurarBackup.Show;
end;

procedure TfrmBackup.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmBackup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada é a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  edtServidor.SetFocus;
  panelConectado.Visible:=false;
end;

end.

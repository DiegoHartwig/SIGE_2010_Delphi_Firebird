//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UGerarBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBServices, StdCtrls, TeCanvas, TeeEdiGrad, ImgList;

type
  TfrmGerarBackup = class(TForm)
    Memo1: TMemo;
    ImageList1: TImageList;
    btnGerar: TButtonGradient;
    IBBackupService1: TIBBackupService;
    SDArquBack: TSaveDialog;
    IBConfigService1: TIBConfigService;
    Opcoes: TGroupBox;
    cbxIgnoLimb: TCheckBox;
    chkRecoLixo: TCheckBox;
    cbxTran: TCheckBox;
    cbxIgnoChec: TCheckBox;
    cbxDetalhes: TCheckBox;
    btnSair: TButtonGradient;
    procedure btnGerarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarBackup: TfrmGerarBackup;

implementation

uses UdmBD, UBackup;

{$R *.dfm}

procedure TfrmGerarBackup.btnGerarClick(Sender: TObject);
begin
  if not SDArquBack.Execute then // Se o usuario n�o informar onde ser� salvo o arquivo de backup
    exit;                             //Cancela o procedimento
   Memo1.Clear;
   btnGerar.Enabled:=False;
   Memo1.Lines.Add('Preparando-se para Gerar o Backup...');
   Memo1.Lines.Add('');

  with  IBBackupService1 do
  begin
    UdmBD.dmBD.BD_SIGE.Connected:=false; //Desconectando da Base de dados
    DataBaseName:=frmBackup.edtBanco.Text;//recebe o caminho da base de dados
    ServerName:=frmBackup.edtServidor.Text;//recebe o nome do servidor
    backupfile.Clear;
    backupfile.Add(SDArquBack.filename); //Adiciona o caminho do arquivo de backup escolhido pelo usuario
    protocol:=TCP;// Protocolo da conex�o
    params.Clear;
    params.Add('user_name=SYSDBA');// nome de usuario
    params.Add('password=masterkey');// senha do usuario

    Options:=[]; // limpando a propriedade Options
    //O bloco de IF Abaixo est� adicionando as op��es de restaura��o de acordo com as op��es que o usuario escolheu.

    if cbxIgnoChec.Checked then
      Options:=Options+[ignoreCheckSums];
    if cbxIgnoLimb.Checked then
      Options:=Options+[ignoreCheckSums];
    if not cbxTran.checked then
      Options:=Options+[Nontransportable];

      {A propriedade Verbose do TIBBackupService especifica se durante o processo de Backup ser� retornado para a aplica��o o detalhamento da execu��o}

      Verbose:=cbxDetalhes.Checked;

      Memo1.Lines.Add('  Ignorar checksum: '+BoolToStr(cbxIgnoChec.Checked));
      Memo1.Lines.Add('  Ignorar transa��es em limbo: '+BoolToStr(cbxIgnoLimb.Checked));
      Memo1.Lines.Add('  Coletar lixo: '+BoolToStr(chkrecoLixo.Checked));
      Memo1.Lines.Add('  Formato transport�vel: '+BoolToStr(cbxTran.Checked));
      Memo1.Lines.Add('  Verbose: '+BoolToStr(cbxTran.Checked));
      Memo1.Lines.Add('  Nome do servidor: '+ServerName);
      Memo1.Lines.Add('');
      Active:=True;//ativa o servi�o de backup, mais ainda n�o inicia.
      Memo1.Lines.Add('');
      Memo1.Lines.Add('/***INICIO*** Iniciando Processo.::SIGE::. Backup \');
      Application.ProcessMessages;
      Memo1.Lines.Add('');
      try
        ServiceStart;//inicia o processo de backup
        while not Eof do
        begin
          {conforme o backup vai sendo executado o nos podemos pegar os detalhes da sua execu��o
          atrav�s da fun��o GetNextLine}
          Memo1.Lines.Add(GetNextLine);
        end;
      finally
      end;
      Active:=False;//desativa o servi�o de backup
      Memo1.Lines.Add('');
      Memo1.Lines.Add('/****FIM**** \');
      Memo1.Lines.Add('/.::SIGE::. FEMA Funda��o Educacional Machado de Assis\');
      Memo1.Lines.Add('/Todos os Direitos Reservados\');
    end;
    Memo1.Lines.Add(''); Memo1.Lines.Add('');
    Memo1.Lines.Add('Backup conclu�do.');
    UdmBD.dmBD.BD_SIGE.Connected:=True;//conecta o sistema na base de dados
    btnGerar.Enabled:=True;
    btnSair.Visible:=True;
    btnSair.Enabled:=True;
  {except
    on E: Exception do
    begin
      Memo1.Lines.Add('Ocorreu um erro inesperado. O backup n�o foi conclu�do.');
      Memo1.Lines.Add('Informa��es da exce��o:');
      Memo1.Lines.Add('  '+E.Message);
      DMBanco.IBDB.Connected:=True;//conecta o sistema na base de dados
      BTGeraBack.Enabled:=True; }
    end;




procedure TfrmGerarBackup.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerarBackup.FormShow(Sender: TObject);
begin
  btnSair.Visible:=false;
end;

end.

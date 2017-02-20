// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit URestaurarBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBServices, ImgList, StdCtrls, TeCanvas, TeeEdiGrad;

type
  TfrmRestaurarBackup = class(TForm)
    Opcoes: TGroupBox;
    cbSubstituir: TCheckBox;
    cbSemValidar: TCheckBox;
    cbSemShadow: TCheckBox;
    cbUmaTabela: TCheckBox;
    cbDesativarIndices: TCheckBox;
    Memo1: TMemo;
    btnRestaurar: TButtonGradient;
    ImageList1: TImageList;
    cbDetalhes: TCheckBox;
    IBConfigService1: TIBConfigService;
    IBRestoreService1: TIBRestoreService;
    OpenDialog1: TOpenDialog;
    btnSair: TButtonGradient;
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRestaurarBackup: TfrmRestaurarBackup;

implementation

uses UdmBD, UBackup;

{$R *.dfm}

procedure TfrmRestaurarBackup.btnRestaurarClick(Sender: TObject);
  begin
  try
    if not OpenDialog1.Execute then//se n�o selecionar o arquivo de backup
      Exit;                        //cancela o procedimento
    Memo1.Clear;
    btnRestaurar.Enabled:=False;
    Memo1.Lines.Add('Preparando-se para restaurar o backup...');
    Memo1.Lines.Add('');

    with IBRestoreService1 do
    begin
      UdmBD.dmBD.BD_SIGE.Connected:=False;//desconecta da base
      DatabaseName.Clear;
      DatabaseName.Add(frmBackup.edtBanco.text);//caminho da base
      ServerName:=frmBackup.edtServidor.Text;//nome do servidor
      BackupFile.Clear;
      BackupFile.Add(OpenDialog1.FileName);//caminho do arquivo de backup
      Protocol:=TCP;//protocolo de conex�o
      Params.Clear;
      Params.Add('user_name=SYSDBA');//nome de usu�rio
      Params.Add('password=masterkey');//senha do usu�rio

      Options:=[];
      Options:=[CreateNewDB];
      {o bloco de if abaixo esta adicionando as op��es de restaura��o de acordo com o que o usu�rio escolheu.
      Ap�s esta listagem voc� encontra um link para um outro artigo onde voc� encontra mais informa��es
      sobre essas e outras op��es de restaura��o}
      if CBDesativarIndices.Checked then
        Options:=Options+[DeactivateIndexes];
      if CBSemShadow.Checked then
        Options:=Options+[NoShadow];
      if CBSemValidar.Checked then
        Options:=Options+[NoValidityCheck];
      if CBUmaTabela.Checked then
        Options:=Options+[OneRelationAtATime];
      if CBSubstituir.Checked then
        Options:=Options+[Replace];

      {a propriedade verbose do TIBRestoreService especifica
      se durante o processo de restaura��o ser� retornado para a
      aplica��o o detalhamento da execu��o}
      Verbose:=CBDetalhes.Checked;

      Memo1.Lines.Add('  Desativar indices: '+BoolToStr(CBDesativarIndices.Checked));
      Memo1.Lines.Add('  Restaurar arquivo espelho: '+BoolToStr(not CBSemShadow.Checked));
      Memo1.Lines.Add('  Validar regras de integridade: '+BoolToStr(not CBSemValidar.Checked));
      Memo1.Lines.Add('  Restaurar uma tabela por vez: '+BoolToStr(CBUmaTabela.Checked));
      Memo1.Lines.Add('  Nome do servidor: '+ServerName);
      Memo1.Lines.Add('');
      Active:=True;//ativa o servico de restaura��o, mais ainda nao inicia.
      Memo1.Lines.Add('');
      Memo1.Lines.Add('/***INICIO***\');
      Application.ProcessMessages;
      Memo1.Lines.Add('');
      try
        ServiceStart;//inicia o restore
        while not Eof do
        begin
          {assim como no backup, conforme a restaura��o vai sendo executada
          os detalhes da execu��o podem ser lidos atrav�s da fun��o GetNextLine}
          Memo1.Lines.Add(GetNextLine);
        end;
      finally
      end;
      Active:=False;//desativa o servi�o de restore
      Memo1.Lines.Add('');
      Memo1.Lines.Add('/****FIM****\');
    end;
    Memo1.Lines.Add(''); Memo1.Lines.Add('');
    Memo1.Lines.Add('Backup restaurado com sucesso.');
    UdmBD.dmBD.BD_SIGE.Connected:=True;//conecta o sistema na base de dados
    btnRestaurar.Enabled:=True;
    btnSair.Visible:=True;
    btnSair.Enabled:=True;
  except
    on E: Exception do
    begin
      Memo1.Lines.Add('Ocorreu um erro inesperado. O restore n�o foi conclu�do.');
      Memo1.Lines.Add('Informa��es da exce��o:');
      Memo1.Lines.Add('  '+E.Message);
      UdmBD.dmBD.BD_SIGE.Connected:=True;//conecta o sistema na base de dados
      btnRestaurar.Enabled:=True;
    end;
  end;
end;

procedure TfrmRestaurarBackup.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRestaurarBackup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada � a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;

end;

procedure TfrmRestaurarBackup.FormShow(Sender: TObject);
begin
  btnSair.Visible:=False;
end;

end.

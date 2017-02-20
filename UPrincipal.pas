// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RibbonLunaStyleActnCtrls, Ribbon, ActnList, ImgList,
  PlatformDefaultStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus,
  RibbonActnMenus, ScreenTips, pngimage, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  ComCtrls;

type
  TFrmPrincipal = class(TForm)
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    actContatos: TAction;
    Action2: TAction;
    actUtilizador: TAction;
    actSetor: TAction;
    actEquipamentos: TAction;
    actMateriais: TAction;
    Action1: TAction;
    Action3: TAction;
    actRelLigacoes: TAction;
    Action5: TAction;
    actAgendamentos: TAction;
    actLigacoes: TAction;
    actRetiradas: TAction;
    actRelContato: TAction;
    actRelAgendamentos: TAction;
    actRelRetiradas: TAction;
    actTema: TAction;
    Action7: TAction;
    Ribbon1: TRibbon;
    RibbonPage3: TRibbonPage;
    RibbonGroup3: TRibbonGroup;
    RibbonPage2: TRibbonPage;
    RibbonGroup2: TRibbonGroup;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonPage5: TRibbonPage;
    RibbonGroup5: TRibbonGroup;
    RibbonPage6: TRibbonPage;
    RibbonGroup6: TRibbonGroup;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    Action4: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    ScreenTipsManager1: TScreenTipsManager;
    qUsuarios: TIBQuery;
    qVerificaSenha: TIBQuery;
    qCadSenha: TIBQuery;
    qUsuariosCOD_USU: TIntegerField;
    qUsuariosNOME: TIBStringField;
    qUsuariosSENHA: TIBStringField;
    qAlteraSenha: TIBQuery;
    actCadUsuario: TAction;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure actCadUtilizadorExecute(Sender: TObject);
    procedure actUtilizadorExecute(Sender: TObject);
    procedure actCadastrarExecute(Sender: TObject);
    procedure actContatosExecute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure actSetorExecute(Sender: TObject);
    procedure actEquipamentosExecute(Sender: TObject);
    procedure actMateriaisExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure actAgendamentosExecute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure actLigacoesExecute(Sender: TObject);
    procedure actRetiradasExecute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure actTemaExecute(Sender: TObject);
    procedure actRelLigacoesExecute(Sender: TObject);
    procedure actRelContatoExecute(Sender: TObject);
    procedure actRelAgendamentosExecute(Sender: TObject);
    procedure actRelRetiradasExecute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action11Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormClick(Sender: TObject);
    procedure actCadUsuarioExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
   // procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    COD_USUARIO : integer;
  end;

var
  FrmPrincipal: TFrmPrincipal;
//Declarando a funcao que verifica o form antes de cria-lo
function  LocalizaForm (form : TForm) : Boolean;

implementation

uses UConsultaAgendamentos, UCadContatos, UCadUtilizador, UCadEquipamento,
  UBackup, UConsultaLigacoes, UCadInstituicao, UAgendamentos, UAgendarBackup,
  UConsultaRetiradas, UConsultaUtiizador, USenha, UAjuda, ULigacoes,
  UCadMaterial, URelatAgendamentos, URelatContato, URelatLigacoes,
  URelatRetiradas, URetiradas, UCadSetor, UTema, UConRetiradas, UCadCargo,
  UCadMateriais, UGetSenha, UdmBD, URelatorioLigacoes;

//Implementando a funcao que verifica o form antes de cria-lo
function  LocalizaForm (form : TForm) : Boolean;
var
	i : integer;
begin
	Result := False;
	for i := 0 to Screen.FormCount -1 do
	if Screen.Forms[i] = form then
	begin
		Result := True;
		Break;
	end;
 end;


{$R *.dfm}

procedure TFrmPrincipal.actAgendamentosExecute(Sender: TObject);
begin
  if not localizaForm(frmConsultaAgendamentos) then
		frmConsultaAgendamentos := TfrmConsultaAgendamentos.Create(Application);
    frmConsultaAgendamentos.Color:=frmPrincipal.Color;
    frmConsultaAgendamentos.Width:=1252;
	  frmConsultaAgendamentos.Show;

end;

procedure TFrmPrincipal.actCadastrarExecute(Sender: TObject);
begin
   if not localizaForm(frmCadContatos) then
		frmCadContatos := TfrmCadContatos.Create(Application);
    frmCadContatos.Color:=frmPrincipal.Color;
    frmCadContatos.show;
end;

procedure TFrmPrincipal.actCadUsuarioExecute(Sender: TObject);
begin
  if not localizaForm(frmSenhas) then
		frmSenhas:= TfrmSenhas.Create(Application);
    frmSenhas.Color:=frmPrincipal.Color;
    frmSenhas.Width:=393;
    frmSenhas.Height:=293;
    frmSenhas.Show;
end;

procedure TFrmPrincipal.actCadUtilizadorExecute(Sender: TObject);
begin
  if not localizaForm(frmCadUtilizador) then
		frmCadUtilizador := TfrmCadUtilizador.Create(Application);
    frmCadUtilizador.Color:=frmPrincipal.Color;
    frmCadUtilizador.Show;
end;

procedure TFrmPrincipal.actContatosExecute(Sender: TObject);
begin
 if not localizaForm (frmCadContatos) then
		frmCadContatos := TfrmCadContatos.Create(Application);
    frmCadContatos.Color:=frmPrincipal.Color;
    frmCadContatos.Width:=503;
    frmCadContatos.Height:=555;
    frmCadContatos.Show;
end;

procedure TFrmPrincipal.actEquipamentosExecute(Sender: TObject);
begin
  if not localizaForm(frmCadEquipamento) then
		frmCadEquipamento := TfrmCadEquipamento.Create(Application);
    frmCadEquipamento.Color:=frmPrincipal.Color;
    frmCadEquipamento.Width:=503;
    frmCadEquipamento.Height:=555;
    frmCadEquipamento.Show;
    frmCadEquipamento.tabCadEquipamento.Append;
end;

procedure TFrmPrincipal.Action10Execute(Sender: TObject);
begin
  if not localizaForm(frmBackup) then
		frmBackup:= TfrmBackup.Create(Application);
    frmBackup.Color:=frmPrincipal.Color;
    frmBackup.Show;
end;

procedure TFrmPrincipal.Action11Execute(Sender: TObject);
begin
    if not localizaForm(frmCadCargo) then
		  frmCadCargo:= TfrmCadCargo.Create(Application);
      frmCadCargo.Color:=frmPrincipal.Color;
      frmCadCargo.Show;
      frmCadCargo.edtCargo.SetFocus;


end;

procedure TFrmPrincipal.Action1Execute(Sender: TObject);
begin
  if not localizaForm(frmConsultaLigacoes) then
		frmConsultaLigacoes:= TfrmConsultaLigacoes.Create(Application);
    frmConsultaLigacoes.Color:=frmPrincipal.Color;
    frmConsultaLigacoes.Width:=1252;
    frmConsultaLigacoes.Show;
end;

procedure TFrmPrincipal.Action2Execute(Sender: TObject);
begin
  if not localizaForm(frmCadInstituicao) then
		frmCadInstituicao:= TfrmCadInstituicao.Create(Application);
     frmCadInstituicao.Width:=503;
    frmCadInstituicao.Height:=582;
    frmCadInstituicao.Color:=frmPrincipal.Color;
    frmCadInstituicao.Show;
end;

procedure TFrmPrincipal.Action3Execute(Sender: TObject);
begin
   if not localizaForm(frmAgendamentos) then
		frmAgendamentos:= TfrmAgendamentos.Create(Application);
    frmAgendamentos.Color:=frmPrincipal.Color;
    frmAgendamentos.Width:=503;
    frmAgendamentos.Height:=582;
    frmAgendamentos.Show;
end;

procedure TFrmPrincipal.Action4Execute(Sender: TObject);
begin
  if not localizaForm(frmAgendarBackup) then
		frmAgendarBackup:= TfrmAgendarBackup.Create(Application);
    frmAgendarBackup.Color:=frmPrincipal.Color;
    frmAgendarBackup.Show;
end;

procedure TFrmPrincipal.Action5Execute(Sender: TObject);
begin
  if not localizaForm(frmConRetiradas) then
		frmConRetiradas:= TfrmConRetiradas.Create(Application);
    frmConRetiradas.Color:=frmPrincipal.Color;
    frmConRetiradas.Height:=575;
    frmConRetiradas.Width:=1252;
    frmConRetiradas.Show;
end;

procedure TFrmPrincipal.Action6Execute(Sender: TObject);
begin

  if not localizaForm(frmConsultaUtiizador) then
		frmConsultaUtiizador:= TfrmConsultaUtiizador.Create(Application);
    frmConsultaUtiizador.Color:=frmPrincipal.Color;
    frmConsultaUtiizador.Show;
end;

procedure TFrmPrincipal.Action7Execute(Sender: TObject);
begin
with TFrmGetSenha.Create(Self) do
  begin
    try
      if ShowModal = mrOk then
      begin
        qUsuarios.Close;
        qUsuarios.SQL.Clear;
        qUsuarios.SQL.Add('select * from USUARIOS '+
                          'where NOME = :LOG and SENHA =:SEN');
        qUsuarios.ParamByName('LOG').AsString:=edtLogin.Text;
        qUsuarios.ParamByName('SEN').AsString:=edtSenha.Text;
        qUsuarios.Prepare;
        qUsuarios.Open;

        if not qUsuarios.IsEmpty then
        begin
           Application.MessageBox('Digite o novo "Login" e a Nova "Senha"!', '.:: S.I.G.E ::. Alteração de Login e Senha ', 48);

          //Alterando a Senha do Usuario
          begin
  if qUsuarios.IsEmpty then
  begin
     Application.MessageBox('Nenhum Usuário cadastrado no Sistema!', '.:: S.I.G.E ::. Alteração de Login e Senha ', 48);
    exit;
  end;
  qVerificaSenha.Close;
  qVerificaSenha.ParamByName('cod').AsInteger := qUsuariosCOD_USU.AsInteger;
  qVerificaSenha.Prepare;
  qVerificaSenha.Open;
  with TfrmGetSenha.Create(self) do
  begin
    try
      Caption:= 'Informe os dados abaixo...';
      if ShowModal = mrOk then
      begin
        if qVerificaSenha.IsEmpty then
        begin
          qCadSenha.Close;
          qCadSenha.ParamByName('COD_USU').AsInteger:= qUsuariosCOD_USU.AsInteger;
          qCadSenha.ParamByName('NOME').AsString:=edtLogin.Text;
          qCadSenha.ParamByName('SENHA').AsString:=edtSenha.Text;
          qCadSenha.Prepare;
          qCadSenha.ExecSQL;
          dmBD.trBD_SIGE.CommitRetaining;
          ShowMessage('Senha Cadastrada com Sucesso!');

        end
        else
        begin
          qAlteraSenha.Close;;
          qAlteraSenha.ParamByName('COD_USU').AsInteger:=qUsuariosCOD_USU.AsInteger;
          qAlteraSenha.ParamByName('NOME').AsString:=edtLogin.Text;
          qAlteraSenha.ParamByName('SENHA').AsString:=edtSenha.Text;
          qAlteraSenha.Prepare;
          qAlteraSenha.ExecSQL;
          dmBD.trBD_SIGE.CommitRetaining;
          ShowMessage('Senha Alterada com Sucesso!');
       end;
       end
      else begin
        showmessage('Manutenção de senha cancelada.');
        exit;
      end;
    finally
      free;
    end;
  end;
end;
        end;
        end
  else
   Application.MessageBox('Login ou Senha Incorreto!', 'Atenção!!! .:: S.I.G.E ::.', 48);

    finally
      Free;
    end;

  end;



end;

//Alterando a Senha do Usuario


procedure TFrmPrincipal.Action8Execute(Sender: TObject);
begin
  if not localizaForm(frmAjuda) then
		frmAjuda:= TfrmAjuda.Create(Application);
    frmAjuda.Color:=frmPrincipal.Color;
    frmAjuda.Show;
end;

procedure TFrmPrincipal.Action9Execute(Sender: TObject);
begin

  if not localizaForm(frmAjuda) then
		frmAjuda:= TfrmAjuda.Create(Application);
    frmAjuda.Color:=frmPrincipal.Color;
    frmAjuda.Show;
end;

procedure TFrmPrincipal.actLigacoesExecute(Sender: TObject);
begin
  if not localizaForm(frmLigacoes) then
		frmLigacoes:= TfrmLigacoes.Create(Application);
    frmLigacoes.Color:=frmPrincipal.Color;;
    frmLigacoes.Width:=503;
    frmLigacoes.Height:=555;
    frmLigacoes.Show;
end;

procedure TFrmPrincipal.actMateriaisExecute(Sender: TObject);
begin

  if not localizaForm(frmCadMaterial) then
		frmCadMaterial:= TfrmCadMaterial.Create(Application);
    frmCadMaterial.Color:=frmPrincipal.Color;
    frmCadMaterial.Width:=503;
    frmCadMaterial.Height:=555;
    frmCadMaterial.Show;
    //frmCadMaterial.tabCadMateriais.Append;

end;

procedure TFrmPrincipal.actRelAgendamentosExecute(Sender: TObject);
begin
  if not localizaForm(frmRelatAgendamentos) then
		frmRelatAgendamentos:= TfrmRelatAgendamentos.Create(Application);
    frmRelatAgendamentos.Color:=frmPrincipal.Color;
    frmRelatAgendamentos.Show;
end;

procedure TFrmPrincipal.actRelContatoExecute(Sender: TObject);
begin
  if not localizaForm(  frmRelatContato) then
		frmRelatContato:= TfrmRelatContato.Create(Application);
    frmRelatContato.Color:=frmPrincipal.Color;
    frmRelatContato.Show;
end;

procedure TFrmPrincipal.actRelLigacoesExecute(Sender: TObject);
begin
  with TfrmRelatorioGeralLigacoes.Create (self) do
  begin
    try
      QuickRep1.PreviewModal;

    finally
      free;
    end;
end;
end;

procedure TFrmPrincipal.actRelRetiradasExecute(Sender: TObject);
begin
  if not localizaForm(frmRelatRetiradas) then
  frmRelatRetiradas:= TfrmRelatRetiradas.Create(Application);
  frmRelatRetiradas.Color:=frmPrincipal.Color;
  frmRelatRetiradas.Show;
end;

procedure TFrmPrincipal.actRetiradasExecute(Sender: TObject);
begin
if not localizaForm(frmRetiradas) then
  frmRetiradas:= TfrmRetiradas.Create(Application);
  frmRetiradas.Width:=503;
  frmRetiradas.Height:=582;
  frmRetiradas.show;

end;
procedure TFrmPrincipal.actSetorExecute(Sender: TObject);
begin
   if not localizaForm(frmCadSetor) then
   frmCadSetor:= TfrmCadSetor.Create(Application);
   frmCadSetor.Color:=frmPrincipal.Color;
  frmCadSetor.Show;
  frmCadSetor.edtSetor.SetFocus;
end;

procedure TFrmPrincipal.actTemaExecute(Sender: TObject);
begin
  if not localizaForm(frmTemas) then
  frmTemas:= TfrmTemas.Create(Application);
  frmTemas.Show;
end;

procedure TFrmPrincipal.actUtilizadorExecute(Sender: TObject);
begin
if not localizaForm(frmCadUtilizador) then
  frmCadUtilizador:= TfrmCadUtilizador.Create(Application);
  frmCadUtilizador.Width:=503;
  frmCadUtilizador.Height:=582;
  frmCadUtilizador.show;
  frmCadUtilizador.tabCadUtilizador.Append;
  frmCadUtilizador.Color:=frmPrincipal.Color;
  frmCadUtilizador.edtUtilizador.SetFocus;
end;

procedure TFrmPrincipal.FormClick(Sender: TObject);
begin
  if Ribbon1.Enabled=false then
     Application.MessageBox('Por Favor Digite o Nome do Usuário e Senha!', 'Acesso Restrito .:: S.I.G.E ::. ', 48);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Timer1.OnTimer(self);
  Ribbon1.Enabled:=false;
  qUsuarios.Open;
  qUsuarios.FetchAll;
end;



procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Timer1.OnTimer(self);
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Timer1.OnTimer(self);
end;

procedure TFrmPrincipal.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Ribbon1.Enabled=false then

  with TFrmGetSenha.Create(Self) do
  begin
    try
      if ShowModal = mrOk then
      begin
        qUsuarios.Close;
        qUsuarios.SQL.Clear;
        qUsuarios.SQL.Add('select * from USUARIOS '+
                          'where NOME = :LOG and SENHA =:SEN');
        qUsuarios.ParamByName('LOG').AsString:=edtLogin.Text;
        qUsuarios.ParamByName('SEN').AsString:=edtSenha.Text;
        qUsuarios.Prepare;
        qUsuarios.Open;

        if not qUsuarios.IsEmpty then
        begin
          Ribbon1.Enabled:=True;
        end;
        end
  else
  ShowMessage('Login ou Senha incorreto!!!');

    finally
      Free;
    end;

  end;



end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  if Ribbon1.Enabled=false then

  with TFrmGetSenha.Create(Self) do
  begin
    try
      if ShowModal = mrOk then
      begin
        qUsuarios.Close;
        qUsuarios.SQL.Clear;
        qUsuarios.SQL.Add('select * from USUARIOS '+
                          'where NOME = :LOG and SENHA =:SEN');
        qUsuarios.ParamByName('LOG').AsString:=edtLogin.Text;
        qUsuarios.ParamByName('SEN').AsString:=edtSenha.Text;
        qUsuarios.Prepare;
        qUsuarios.Open;

        if not qUsuarios.IsEmpty then
        begin
          Ribbon1.Enabled:=True;

         COD_USUARIO:=qUsuariosCOD_USU.AsInteger;

        end;
        end
  else
  ShowMessage('Login ou Senha incorreto!!!');

    finally
      Free;
    end;

  end;



end;



procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels[0].Text:=TimeToStr(Time);
   if GetKeyState(VK_NUMLOCK) = 1 then
      StatusBar1.Panels[2].Text:='Num Lock : ON'
   else
   StatusBar1.Panels[2].Text:='Num Lock : OFF';
   if GetKeyState(VK_CAPITAL)=1 then
      StatusBar1.Panels[3].Text:='Caps Lock : ON'
   else
   begin
     StatusBar1.Panels[3].Text:='Caps Lock : OFF';
   end;
   begin
     StatusBar1.Panels[1].Text:='Data: ' +FormatDateTime('dddd", "dd" de "mmmm" de "yyyy',now);
   end;
   begin
      StatusBar1.Panels[5].Text:='Usuario Logado no Sistema: ' + qUsuarios.FieldByName('NOME').AsString;
   end;

end;

end.

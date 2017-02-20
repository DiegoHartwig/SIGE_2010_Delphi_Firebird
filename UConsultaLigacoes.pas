//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UConsultaLigacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, StdCtrls, TeCanvas,
  TeeEdiGrad, ImgList, DBCtrls, ComCtrls;

type
  TfrmConsultaLigacoes = class(TForm)
    qConsultaLigacoes: TIBQuery;
    dsConsultaLigacoes: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    chkData: TCheckBox;
    chkResponsavel: TCheckBox;
    chkSolicitante: TCheckBox;
    Label1: TLabel;
    edtSolicitante: TDBLookupComboBox;
    ImageList1: TImageList;
    btnConsultar: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnFechar: TButtonGradient;
    btnImprimir: TButtonGradient;
    Label2: TLabel;
    edtResponsavel: TDBLookupComboBox;
    MonthCalendar1: TMonthCalendar;
    DBMemo1: TDBMemo;
    qConsultaLigacoesCOD_CID: TIntegerField;
    qConsultaLigacoesCOD_CONT: TIntegerField;
    qConsultaLigacoesCOD_LIG: TIntegerField;
    qConsultaLigacoesDATA: TDateField;
    qConsultaLigacoesHORA: TTimeField;
    qConsultaLigacoesLIG_COMP: TIBStringField;
    qConsultaLigacoesOBS: TMemoField;
    qConsultaLigacoesTELEFONE: TIBStringField;
    qConsultaLigacoesCOD_CID1: TIntegerField;
    qConsultaLigacoesNOME: TIBStringField;
    qConsultaLigacoesCOD_CONT1: TIntegerField;
    qConsultaLigacoesNOME1: TIBStringField;
    qSolicitante: TIBQuery;
    qSolicitanteCOD_CONT: TIntegerField;
    qSolicitanteNOME: TIBStringField;
    qSolicitanteCOD_CID: TIntegerField;
    qSolicitanteCOD_SET: TIntegerField;
    qSolicitanteCOD_CARG: TIntegerField;
    qSolicitanteEMAIL: TIBStringField;
    qSolicitanteTELEFONE_RESID: TIBStringField;
    qSolicitanteTELEFONE_CEL: TIBStringField;
    dsSolicitante: TDataSource;
    qResponsavel: TIBQuery;
    dsResponsavel: TDataSource;
    qConsultaLigacoesCOD_USU: TIntegerField;
    qConsultaLigacoesNOME2: TIBStringField;
    qExcluir: TIBQuery;
    qResponsavelCOD_USU: TIntegerField;
    qResponsavelNOME: TIBStringField;
    qResponsavelSENHA: TIBStringField;
    Label3: TLabel;
    chkHora: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtSolicitanteClick(Sender: TObject);
    procedure edtResponsavelClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaLigacoes: TfrmConsultaLigacoes;

implementation

uses UdmBD, UPrincipal, ULigacoes, UEditarLigacoes, URelatLigacoes,
  URelatorioLigacoes, URelatorioLigacoesXSolicitante;

{$R *.dfm}

procedure TfrmConsultaLigacoes.btnConsultarClick(Sender: TObject);
begin
  qConsultaLigacoes.Close;
  if qConsultaLigacoes.Prepared then
  qConsultaLigacoes.UnPrepare;
  qConsultaLigacoes.SQL.Clear;
  qConsultaLigacoes.SQL.Add('select a.COD_CID, a.COD_CONT, a.COD_LIG, a.DATA, a.HORA, '+
                            'a.LIG_COMP, a.OBS,a.COD_USU, a.TELEFONE, b.COD_CID, b.NOME, c.COD_CONT, c.NOME, d.COD_USU, d.NOME '+
                            'from TELEFONEMAS a, CIDADE b, CONTATOS c, USUARIOS d '+
                            'where a.COD_CID = b.COD_CID and a.COD_CONT = c.COD_CONT and a.COD_USU = d.COD_USU');


  if (chkSolicitante.Checked) then
  begin
    qConsultaLigacoes.SQL.Add(' and a.COD_CONT= :COD_CONT');
    qConsultaLigacoes.ParamByName('COD_CONT').AsInteger:=qSolicitanteCOD_CONT.AsInteger;
  end;

  if (chkResponsavel.Checked) then
  begin
    qConsultaLigacoes.SQL.Add(' and a.COD_USU= :COD_USU');
    qConsultaLigacoes.ParamByName('COD_USU').AsInteger:=qResponsavelCOD_USU.AsInteger;
  
     
    if (chkData.Checked) then
  begin
    qConsultaLigacoes.SQL.Add(' and a.DATA = :d1');
    qConsultaLigacoes.ParamByName('d1').AsDateTime := MonthCalendar1.Date;
    qConsultaLigacoes.SQL.Add(' order by a.COD_CONT, a.COD_USU, a.DATA');
    qConsultaLigacoes.Prepare;
    qConsultaLigacoes.Open;
    qConsultaLigacoes.FetchAll;
  end;

end;







end;

procedure TfrmConsultaLigacoes.btnEditarClick(Sender: TObject);
begin


if not localizaForm(frmEditarLigacoes) then
  frmEditarLigacoes:= TfrmEditarLigacoes.Create(Application);
  frmEditarLigacoes.Width:=360;
  frmEditarLigacoes.Height:=360;
  frmEditarLigacoes.Color:=frmPrincipal.Color;
  frmEditarLigacoes.edtCod_Lig.Text:=qConsultaLigacoesCOD_LIG.AsString;
  frmEditarLigacoes.edtData.date:=qConsultaLigacoesDATA.AsDateTime;
  frmEditarLigacoes.edtHora.Time:=qConsultaLigacoesHORA.AsDateTime;
  frmEditarLigacoes.dblSolicitante.KeyValue:=qConsultaLigacoesCOD_CONT.AsString;
  frmEditarLigacoes.dblCidade.KeyValue:=qConsultaLigacoesCOD_CID.AsString;
  frmEditarLigacoes.show;
end;

procedure TfrmConsultaLigacoes.btnExcluirClick(Sender: TObject);
begin
  qExcluir.Close;
  qExcluir.ParamByName('COD_LIG').AsString:=qConsultaLigacoesCOD_LIG.Text;
  qExcluir.Prepare;
  qExcluir.ExecSQL;
  dmBD.trBD_SIGE.CommitRetaining;
  qConsultaLigacoes.Close;
  qConsultaLigacoes.Open;
  ShowMessage('Registro excluído com sucesso!');
end;


procedure TfrmConsultaLigacoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaLigacoes.btnImprimirClick(Sender: TObject);
begin
  if (chkSolicitante.checked=false) then
  begin
  with TfrmRelatorioGeralLigacoes.Create (self) do
  begin
    try
      QuickRep1.PreviewModal;

    finally
      free;
    end;
end
end
else
if (chkResponsavel.Checked=true) then
begin
  with TfrmRelatorioLigacoesXSolicitante.create (self) do
  begin
    try
      QuickRep1.PreviewModal;
    finally
      free;
    end;
  end;
end


end;

procedure TfrmConsultaLigacoes.DBGrid1DblClick(Sender: TObject);
begin
  if not localizaForm(frmLigacoes) then
		frmLigacoes:= TfrmLigacoes.Create(Application);
    frmLigacoes.Color:=frmPrincipal.Color;
    frmLigacoes.Width:=503;
    frmLigacoes.Height:=582;
    frmLigacoes.Show;

end;

procedure TfrmConsultaLigacoes.edtResponsavelClick(Sender: TObject);
begin
  chkResponsavel.Checked:=true;
end;

procedure TfrmConsultaLigacoes.edtSolicitanteClick(Sender: TObject);
begin
  chkSolicitante.Checked:=true;
end;

procedure TfrmConsultaLigacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmConsultaLigacoes.FormCreate(Sender: TObject);
begin
  qSolicitante.Open;
  qSolicitante.FetchAll;
  qResponsavel.open;
  qResponsavel.FetchAll;
end;

procedure TfrmConsultaLigacoes.FormShow(Sender: TObject);
begin
  monthCalendar1.Date:=date;
  chkData.Checked:=true;
  edtResponsavel.keyvalue:=IntToStr(frmPrincipal.COD_USUARIO);
  chkResponsavel.Checked:=true;
end;

end.

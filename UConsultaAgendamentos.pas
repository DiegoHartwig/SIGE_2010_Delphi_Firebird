//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UConsultaAgendamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, TeCanvas, TeeEdiGrad, ImgList,
  DBCtrls, DB, IBCustomDataSet, IBQuery, pngimage, ExtCtrls, RpBase, RpSystem,
  RpRave, RpDefine, RpCon, RpConDS, RpRenderPDF, RpRender, RpRenderCanvas,
  RpRenderPrinter;

type
  TfrmConsultaAgendamentos = class(TForm)
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    btnConsultar: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnFechar: TButtonGradient;
    btnRelatorio: TButtonGradient;
    GroupBox1: TGroupBox;
    chkData: TCheckBox;
    chkUtilizador: TCheckBox;
    chkResponsavel: TCheckBox;
    edtUtilizador: TDBLookupComboBox;
    chkEquipamento: TCheckBox;
    edtEquipamento: TDBLookupComboBox;
    qConsultaAgendamento: TIBQuery;
    dsConsultaAgenda: TDataSource;
    qConsultaAgendamentoCOD_AG: TIntegerField;
    qConsultaAgendamentoDATA_AG: TDateField;
    qConsultaAgendamentoHORA_AG: TTimeField;
    qConsultaAgendamentoDATA_DV: TDateField;
    qConsultaAgendamentoHORA_DV: TTimeField;
    qConsultaAgendamentoCOD_UTI: TIntegerField;
    qConsultaAgendamentoCOD_USU: TIntegerField;
    qConsultaAgendamentoCOD_EQ: TIntegerField;
    qConsultaAgendamentoUTILIDADE: TIBStringField;
    qConsultaAgendamentoOBS: TWideMemoField;
    qEquipamentos: TIBQuery;
    qUtilizador: TIBQuery;
    dsUtilizador: TDataSource;
    dsEquipamento: TDataSource;
    qConsultaAgendamentoCOD_UTI1: TIntegerField;
    qConsultaAgendamentoNOME: TIBStringField;
    qConsultaAgendamentoCOD_EQ1: TIntegerField;
    qConsultaAgendamentoNOME1: TIBStringField;
    qConsultaAgendamentoCOD_USU1: TIntegerField;
    qConsultaAgendamentoNOME2: TIBStringField;
    qEquipamentosCOD_EQ: TIntegerField;
    qEquipamentosNOME: TIBStringField;
    qEquipamentosCOD_TIP_EQ: TIntegerField;
    qEquipamentosCOD_MARC: TIntegerField;
    qEquipamentosCOD_MOD: TIntegerField;
    qEquipamentosOBS: TMemoField;
    qUtilizadorCOD_UTI: TIntegerField;
    qUtilizadorNOME: TIBStringField;
    qUtilizadorCOD_SET: TIntegerField;
    qUtilizadorCOD_CARG: TIntegerField;
    qUtilizadorOBS: TMemoField;
    edtObs: TMemo;
    Label6: TLabel;
    MonthCalendar1: TMonthCalendar;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    qUsuarios: TIBQuery;
    edtUsuarios: TDBLookupComboBox;
    qUsuariosCOD_USU: TIntegerField;
    qUsuariosNOME: TIBStringField;
    qUsuariosSENHA: TIBStringField;
    dsUsuarios: TDataSource;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtEquipamentoClick(Sender: TObject);
    procedure edtUtilizadorClick(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure edtUsuariosClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaAgendamentos: TfrmConsultaAgendamentos;

implementation

uses UdmBD, UAgendamentos, UPrincipal, URetiradas, UEditarAgendamento,
  URelatorioAgendamentos, URelatAgendamentos, URelatAgendaXEquipamentos,
  URelatAgendaXUtilizador, URelatXUsuario, URelatorioGeralAgendamentos;

{$R *.dfm}

procedure TfrmConsultaAgendamentos.btnConsultarClick(Sender: TObject);
begin
  qConsultaAgendamento.Close;
  if qConsultaAgendamento.Prepared then
  qConsultaAgendamento.UnPrepare;
  qConsultaAgendamento.SQL.Clear;
  qConsultaAgendamento.SQL.Add(' select a.COD_AG, a.COD_EQ, a.COD_USU, a.COD_UTI, a.DATA_AG, a.DATA_DV, '+
                               ' a.HORA_AG, a.HORA_DV, a.OBS, a.UTILIDADE, b.COD_UTI, b.NOME, '+
                               ' c.COD_EQ, c.NOME, d.COD_USU, d.NOME '+
                               ' from AGENDAMENTO a, UTILIZADOR b, EQUIPAMENTOS c, USUARIOS d '+
                               ' Where a.COD_UTI = b.COD_UTI and a.COD_EQ = c.COD_EQ and a.COD_USU = d.COD_USU ');
  if (chkEquipamento.Checked) then
  begin
    qConsultaAgendamento.SQL.Add(' and a.COD_EQ = :COD_EQ');
    qConsultaAgendamento.ParamByName('COD_EQ').AsInteger := qEquipamentosCOD_EQ.AsInteger;
  end;

  if (chkUtilizador.Checked)then
  begin
    qConsultaAgendamento.SQL.Add(' and a.COD_UTI = :COD_UTI');
    qConsultaAgendamento.ParamByName('COD_UTI').AsInteger := qUtilizadorCOD_UTI.AsInteger;
  end;

    if (chkResponsavel.Checked) then
  begin
    qConsultaAgendamento.SQL.Add(' and a.COD_USU = :COD_USU');
    qConsultaAgendamento.ParamByName('COD_USU').AsInteger := qUsuariosCOD_USU.AsInteger;
  end;

    if (chkData.Checked) then
  begin
    if DateTimePicker2.Date < DateTimePicker1.Date then
      begin
        ShowMessage('Intervalo de datas Inválido! selecione uma data válida');
        DateTimePicker2.date:=DateTimePicker1.Date;
      end
      else
      begin
    qConsultaAgendamento.SQL.Add(' and a.DATA_AG between:d1 and :d2');
    qConsultaAgendamento.ParamByName('d1').AsDateTime:= DateTimePicker1.Date;
    qConsultaAgendamento.ParamByName('d2').AsDateTime:= DateTimePicker2.Date;
    qConsultaAgendamento.SQL.Add(' order by a.DATA_AG, a.COD_UTI, a.COD_USU, a.COD_EQ');
    qConsultaAgendamento.Prepare;
    qConsultaAgendamento.Open;
    qConsultaAgendamento.FetchAll;
  end;

  end;


end;

procedure TfrmConsultaAgendamentos.btnEditarClick(Sender: TObject);
begin

   if not localizaForm(frmEditarAgendamento) then
  frmEditarAgendamento:= TfrmEditarAgendamento.Create(Application);
  frmEditarAgendamento.Width:=360;
  frmEditarAgendamento.Height:=360;
  frmEditarAgendamento.Color:=frmPrincipal.Color;
  frmEditarAgendamento.edtCodAg.Text:=qConsultaAgendamentoCOD_AG.AsString;
  frmEditarAgendamento.edtDataAgenda.date:=qconsultaAgendamentoDATA_AG.AsDateTime;
  frmEditarAgendamento.edtHoraAgenda.Time:=qConsultaAgendamentoHORA_AG.AsDateTime;
  frmEditarAgendamento.edtDataDevol.date:=qConsultaAgendamentoDATA_DV.AsDateTime;
  frmEditarAgendamento.edtHoraDevol.Time:=qConsultaAgendamentoHORA_DV.AsDateTime;
  frmEditarAgendamento.cbxUtilizador.KeyValue:=qconsultaAgendamentoCOD_UTI.AsString;
  frmEditarAGendamento.cbxEquipamento.KeyValue:=qConsultaAgendamentoCOD_EQ.AsString;
  frmEditarAgendamento.show;
end;

procedure TfrmConsultaAgendamentos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaAgendamentos.btnRelatorioClick(Sender: TObject);
begin 
if (chkEquipamento.Checked=false) and (chkUtilizador.Checked=false) and (chkResponsavel.Checked=false) then
begin
  with TFrmRelatorioGeralAgendamentos.Create (self) do 
  begin
    try
      QuickRep1.PreviewModal;
      
    finally
      free;
    end;  
end
end
else

if chkEquipamento.Checked=true then
begin
  with TFrmRelatAgendaXEquipamentos.Create (self) do
    begin
      try
        QuickRep1.PreviewModal; //preview
      finally
        Free;
      end
    end
end
    else
    if chkUtilizador.Checked=true then
    begin
      with TFrmRelatAgendaXUtilizador.Create (self) do
      begin
      try
        QuickRep1.PreviewModal;

      finally
        free;
      end;
    end;

end
    else
    if chkResponsavel.Checked=true then
    begin
      with TFrmRelatAgendaXUsuario.Create (self) do
      begin
        try
          QuickRep1.PreviewModal;
        finally
          free;

        end;
      end;
    end
    
else
ShowMessage('Por Favor Selecione um filtro!');
end;


procedure TfrmConsultaAgendamentos.DBGrid1DblClick(Sender: TObject);
begin
   if not localizaForm(frmAgendamentos) then
  frmAgendamentos:= TfrmAgendamentos.Create(Application);
  frmAgendamentos.Width:=503;
  frmAgendamentos.Height:=582;
  frmAgendamentos.show;
  frmAgendamentos.tabAgendaEquip.Append;
  frmAgendamentos.Color:=frmPrincipal.Color;
  frmAgendamentos.edtDataAgenda.SetFocus;

end;

procedure TfrmConsultaAgendamentos.edtEquipamentoClick(Sender: TObject);
begin
  chkEquipamento.Checked:=true;
end;

procedure TfrmConsultaAgendamentos.edtUsuariosClick(Sender: TObject);
begin
  chkResponsavel.Checked:=true;
end;

procedure TfrmConsultaAgendamentos.edtUtilizadorClick(Sender: TObject);
begin
  chkUtilizador.Checked:=true;
end;

procedure TfrmConsultaAgendamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmConsultaAgendamentos.FormCreate(Sender: TObject);
begin
  qConsultaAgendamento.Open;
  qConsultaAgendamento.FetchAll;
  qEquipamentos.Open;
  qEquipamentos.FetchAll;
  qUtilizador.Open;
  qUtilizador.FetchAll;
  qUsuarios.Open;
  qUsuarios.FetchAll;
 
end;

procedure TfrmConsultaAgendamentos.FormShow(Sender: TObject);
begin

  qConsultaAgendamento.Close;
  if qConsultaAgendamento.Prepared then
  qConsultaAgendamento.UnPrepare;
  qConsultaAgendamento.SQL.Clear;
  qConsultaAgendamento.SQL.Add(' select a.COD_AG, a.COD_EQ, a.COD_USU, a.COD_UTI, a.DATA_AG, a.DATA_DV, '+
                               ' a.HORA_AG, a.HORA_DV, a.OBS, a.UTILIDADE, b.COD_UTI, b.NOME, '+
                               ' c.COD_EQ, c.NOME, d.COD_USU, d.NOME '+
                               ' from AGENDAMENTO a, UTILIZADOR b, EQUIPAMENTOS c, USUARIOS d '+
                               ' Where a.COD_UTI = b.COD_UTI and a.COD_EQ = c.COD_EQ and a.COD_USU = d.COD_USU ');



  begin
    monthCalendar1.Date:=Date;
    qConsultaAgendamento.SQL.Add(' and a.DATA_AG = :d1');
    qConsultaAgendamento.ParamByName('d1').AsDateTime := MonthCalendar1.Date;
    qConsultaAgendamento.SQL.Add(' order by a.COD_EQ, a.DATA_AG, a.COD_UTI');
    qConsultaAgendamento.Prepare;
    qConsultaAgendamento.Open;
    qConsultaAgendamento.FetchAll;
    chkData.Checked:=true;
  end;
end;

procedure TfrmConsultaAgendamentos.MonthCalendar1Click(Sender: TObject);
begin
  chkData.Checked:=true;
end;

end.

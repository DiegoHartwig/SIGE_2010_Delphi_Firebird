//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UEditarAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls, ImgList, TeCanvas,
  TeeEdiGrad, ComCtrls;

type
  TfrmEditarAgendamento = class(TForm)
    edtCodAg: TEdit;
    qVerifica: TIBQuery;
    qAlterar: TIBQuery;
    qEquipamentos: TIBQuery;
    qUtilizador: TIBQuery;
    cbxEquipamento: TDBLookupComboBox;
    cbxUtilizador: TDBLookupComboBox;
    qEquipamentosCOD_EQ: TIntegerField;
    qEquipamentosNOME: TIBStringField;
    qEquipamentosCOD_TIP_EQ: TIntegerField;
    qEquipamentosCOD_MARC: TIntegerField;
    qEquipamentosCOD_MOD: TIntegerField;
    qEquipamentosOBS: TMemoField;
    dsEquipamentos: TDataSource;
    qUtilizadorCOD_UTI: TIntegerField;
    qUtilizadorNOME: TIBStringField;
    qUtilizadorCOD_CID: TIntegerField;
    qUtilizadorCOD_SET: TIntegerField;
    qUtilizadorCOD_CARG: TIntegerField;
    qUtilizadorEMAIL: TIBStringField;
    qUtilizadorTELEFONE: TIBStringField;
    qUtilizadorOBS: TMemoField;
    dsUtilizador: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    edtDataDevol: TDateTimePicker;
    edtHoraDevol: TDateTimePicker;
    GroupBox1: TGroupBox;
    edtDataAgenda: TDateTimePicker;
    edtHoraAgenda: TDateTimePicker;
    ButtonGradient1: TButtonGradient;
    btnFechar: TButtonGradient;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGradient1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarAgendamento: TfrmEditarAgendamento;

implementation

uses UdmBD, UPrincipal, UConsultaAgendamentos;

{$R *.dfm}

procedure TfrmEditarAgendamento.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditarAgendamento.ButtonGradient1Click(Sender: TObject);
begin
  qVerifica.Close;
  qVerifica.ParamByName('DATA_AG').AsDateTime:= edtDataAgenda.DateTime;
  qVerifica.ParamByName('HORA_AG').AsDateTime:= edtHoraAgenda.DateTime;
  qVerifica.ParamByName('COD_EQ').AsString:= cbxEquipamento.KeyValue;
  qVerifica.Prepare;
  qVerifica.Open;
  if (qVerifica.IsEmpty) or (StrToInt(edtCodag.Text) = qVerifica.FieldByName('COD_AG').AsInteger) then
  begin
    try
      qAlterar.Close;
      qAlterar.ParamByName('DATA_AG').AsDateTime:=edtDataAgenda.DateTime;
      qAlterar.ParamByName('HORA_AG').AsDateTime:=edtHoraAgenda.DateTime;
      qAlterar.ParamByName('DATA_DV').AsDateTime:=edtDataDevol.DateTime;
      qAlterar.ParamByName('HORA_DV').AsDateTime:=edtHoraDevol.DateTime;
      qAlterar.ParamByName('COD_EQ').AsString:=cbxEquipamento.KeyValue;
      qAlterar.ParamByName('COD_UTI').AsString:=cbxUtilizador.KeyValue;
      qAlterar.ParamByName('COD_USU').Asstring:=IntToStr(frmPrincipal.COD_USUARIO);
      qAlterar.ParamByName('COD_AG').AsInteger:=StrToInt(edtCodAg.Text);
      qAlterar.Prepare;
      qAlterar.ExecSQL;
      dmBD.trBD_SIGE.CommitRetaining;
    finally
    Close;
    frmConsultaAgendamentos.qConsultaAgendamento.Close;
    frmConsultaAgendamentos.qConsultaAgendamento.Open;

    end;
  end;

end;

procedure TfrmEditarAgendamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmEditarAgendamento.FormCreate(Sender: TObject);
begin
  qEquipamentos.Open;
  qUtilizador.Open;
end;

end.

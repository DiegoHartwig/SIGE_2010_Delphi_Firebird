//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UEditarLigacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, TeCanvas, TeeEdiGrad, DBCtrls, ComCtrls, DB,
  IBCustomDataSet, IBQuery, Mask;

type
  TfrmEditarLigacoes = class(TForm)
    edtData: TDateTimePicker;
    edtHora: TDateTimePicker;
    dblSolicitante: TDBLookupComboBox;
    dblCidade: TDBLookupComboBox;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    ImageList1: TImageList;
    qAlterar: TIBQuery;
    qVerifica: TIBQuery;
    qSolicitante: TIBQuery;
    qCidade: TIBQuery;
    qSolicitanteCOD_CONT: TIntegerField;
    qSolicitanteNOME: TIBStringField;
    qSolicitanteCOD_CID: TIntegerField;
    qSolicitanteCOD_SET: TIntegerField;
    qSolicitanteCOD_CARG: TIntegerField;
    qSolicitanteEMAIL: TIBStringField;
    qSolicitanteTELEFONE_RESID: TIBStringField;
    qSolicitanteTELEFONE_CEL: TIBStringField;
    dsSolicitante: TDataSource;
    qCidadeCOD_CID: TIntegerField;
    qCidadeNOME: TIBStringField;
    qCidadeCEP: TIBStringField;
    qCidadeUF: TIBStringField;
    dsCidade: TDataSource;
    edtCOD_LIG: TEdit;
    qVerificaCOD_LIG: TIntegerField;
    qVerificaCOD_CONT: TIntegerField;
    qVerificaCOD_CID: TIntegerField;
    qVerificaDATA: TDateField;
    qVerificaHORA: TTimeField;
    qVerificaLIG_COMP: TIBStringField;
    qVerificaTELEFONE: TIBStringField;
    qVerificaOBS: TMemoField;
    qVerificaCOD_USU: TIntegerField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarLigacoes: TfrmEditarLigacoes;

implementation

uses UdmBD, UPrincipal, UConsultaLigacoes;

{$R *.dfm}

procedure TfrmEditarLigacoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditarLigacoes.btnSalvarClick(Sender: TObject);
begin
   qVerifica.Close;
   qVerifica.ParamByName('DATA').AsDateTime:=edtData.DateTime;
   qVerifica.ParamByName('HORA').AsDateTime:=edtHora.DateTime;
   qVerifica.ParamByName('COD_CONT').AsString:=dblSolicitante.Keyvalue;
   qVerifica.Prepare;
   qVerifica.Open;
   if qVerifica.IsEmpty or (StrToInt(edtCod_Lig.text) = qVerifica.FieldByName ('COD_LIG').ASInteger) then
   begin
   try
    qAlterar.Close;
    qAlterar.ParamByName('DATA').AsDateTime:=edtData.DateTime;
    qAlterar.ParamByName('HORA').AsDateTime:=edtHora.DateTime;
    qAlterar.ParamByName('COD_CONT').AsString:=dblSolicitante.KeyValue;
    qAlterar.ParamByName('COD_CID').AsString:=dblCidade.KeyValue;
    qAlterar.ParamByName('COD_USU').AsString:=IntToStr(frmPrincipal.COD_USUARIO);
    qAlterar.ParamByName('COD_LIG').AsInteger:=StrToInt(edtCod_Lig.Text);
    qAlterar.Prepare;
    qAlterar.ExecSQL;
    dmBD.trBD_SIGE.CommitRetaining;
    finally
      close;
      frmConsultaLigacoes.qConsultaLigacoes.Close;
      frmConsultaLigacoes.qConsultaLigacoes.Open;
    end;
  end
  else
    showmessage('Horário já cadastrado');
end;
procedure TfrmEditarLigacoes.FormCreate(Sender: TObject);
begin
  qSolicitante.Open;
  qSolicitante.FetchAll;
  qCidade.Open;
  qCidade.FetchAll;
end;

end.

//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UEditarRetiradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, DB, IBCustomDataSet, IBQuery, StdCtrls, TeCanvas,
  TeeEdiGrad, ImgList;

type
  TfrmEditarRetiradas = class(TForm)
    qAlterar: TIBQuery;
    qVerifica: TIBQuery;
    edtData: TDateTimePicker;
    edtHora: TDateTimePicker;
    dblUtilizador: TDBLookupComboBox;
    dblMaterial: TDBLookupComboBox;
    qUtilizador: TIBQuery;
    qMaterial: TIBQuery;
    ImageList1: TImageList;
    btnSalvar: TButtonGradient;
    btnFechar: TButtonGradient;
    qUtilizadorCOD_UTI: TIntegerField;
    qUtilizadorNOME: TIBStringField;
    qUtilizadorCOD_CID: TIntegerField;
    qUtilizadorCOD_SET: TIntegerField;
    qUtilizadorCOD_CARG: TIntegerField;
    qUtilizadorEMAIL: TIBStringField;
    qUtilizadorTELEFONE: TIBStringField;
    qUtilizadorOBS: TMemoField;
    dsUtilizador: TDataSource;
    qMaterialCOD_MAT: TIntegerField;
    qMaterialNOME: TIBStringField;
    qMaterialCOD_TIP_MT: TIntegerField;
    qMaterialQUANTIDADE: TIBBCDField;
    qMaterialOBSERVACOES: TIBStringField;
    dsMaterial: TDataSource;
    edtCod_Ret: TEdit;
    edtQuantidade: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditarRetiradas: TfrmEditarRetiradas;

implementation

uses UdmBD, UPrincipal, UConRetiradas;

{$R *.dfm}

procedure TfrmEditarRetiradas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEditarRetiradas.btnSalvarClick(Sender: TObject);
begin
   qVerifica.Close;
   qVerifica.ParamByName('DATA').AsDateTime:=edtData.DateTime;
   qVerifica.ParamByName('HORA').AsDateTime:=edtHora.DateTime;
   qVerifica.ParamByName('COD_UTI').AsString:=dblUtilizador.Keyvalue;
   qVerifica.Prepare;
   qVerifica.Open;
   if qVerifica.IsEmpty or (StrToInt(edtCod_Ret.text) = qVerifica.FieldByName ('COD_RET').ASInteger) then
   begin
   try
    qAlterar.Close;
    qAlterar.ParamByName('DATA').AsDateTime:=edtData.DateTime;
    qAlterar.ParamByName('HORA').AsDateTime:=edtHora.DateTime;
    qAlterar.ParamByName('COD_UTI').AsString:=dblUtilizador.KeyValue;
    qAlterar.ParamByName('COD_MAT').AsString:=dblMaterial.KeyValue;
    qAlterar.ParamByName('COD_USU').AsString:=IntToStr(frmPrincipal.COD_USUARIO);
    qAlterar.ParamByName('QUANTIDADE').AsString:=edtQuantidade.Text;

    qAlterar.ParamByName('COD_RET').AsInteger:=StrToInt(edtCod_Ret.Text);
    qAlterar.Prepare;
    qAlterar.ExecSQL;
    dmBD.trBD_SIGE.CommitRetaining;
    finally
      close;
      frmConRetiradas.qConsultaRetiradas.Close;
      frmConRetiradas.qConsultaRetiradas.Open;
    end;
  end
  else
    showmessage('Horário já cadastrado');
end;


procedure TfrmEditarRetiradas.FormCreate(Sender: TObject);
begin
  qUtilizador.Open;
  qMaterial.Open;
end;

end.

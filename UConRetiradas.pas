//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UConRetiradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, StdCtrls, TeCanvas,
  TeeEdiGrad, ImgList, ComCtrls, DBCtrls, ExtCtrls, pngimage, RpCon, RpConDS,
  RpBase, RpSystem, RpDefine, RpRave, Printers, RpRender, RpRenderCanvas,
  RpRenderPreview;

type
  TfrmConRetiradas = class(TForm)
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edtUsuarios: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    btnConsultar: TButtonGradient;
    btnEditar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnFechar: TButtonGradient;
    btnRelatorio: TButtonGradient;
    GroupBox1: TGroupBox;
    chkData: TCheckBox;
    chkUtilizador: TCheckBox;
    chkResponsavel: TCheckBox;
    chkMaterial: TCheckBox;
    edtUtilizador: TDBLookupComboBox;
    edtMaterial: TDBLookupComboBox;
    MonthCalendar1: TMonthCalendar;
    ImageList1: TImageList;
    qMaterial: TIBQuery;
    qUtilizador: TIBQuery;
    qUsuario: TIBQuery;
    qMaterialCOD_MAT: TIntegerField;
    qMaterialNOME: TIBStringField;
    qMaterialCOD_TIP_MT: TIntegerField;
    qMaterialQUANTIDADE: TIBBCDField;
    qMaterialOBSERVACOES: TIBStringField;
    dsMateriais: TDataSource;
    dsUtilizador: TDataSource;
    qUsuarioCOD_USU: TIntegerField;
    qUsuarioNOME: TIBStringField;
    qUsuarioSENHA: TIBStringField;
    dsUsuarios: TDataSource;
    qConsultaRetiradas: TIBQuery;
    dsConsultaRetiradas: TDataSource;
    qConsultaRetiradasCOD_MAT: TIntegerField;
    qConsultaRetiradasCOD_RET: TIntegerField;
    qConsultaRetiradasCOD_USU: TIntegerField;
    qConsultaRetiradasCOD_UTI: TIntegerField;
    qConsultaRetiradasDATA: TDateField;
    qConsultaRetiradasHORA: TTimeField;
    qConsultaRetiradasOBSERVACOES: TIBStringField;
    qConsultaRetiradasQUANTIDADE: TIBBCDField;
    qConsultaRetiradasCOD_MAT1: TIntegerField;
    qConsultaRetiradasNOME: TIBStringField;
    qConsultaRetiradasCOD_USU1: TIntegerField;
    qConsultaRetiradasNOME1: TIBStringField;
    qConsultaRetiradasCOD_UTI1: TIntegerField;
    qConsultaRetiradasNOME2: TIBStringField;
    qUtilizadorCOD_UTI: TIntegerField;
    qUtilizadorNOME: TIBStringField;
    qUtilizadorCOD_CID: TIntegerField;
    qUtilizadorCOD_SET: TIntegerField;
    qUtilizadorCOD_CARG: TIntegerField;
    qUtilizadorEMAIL: TIBStringField;
    qUtilizadorTELEFONE: TIBStringField;
    qUtilizadorOBS: TMemoField;
    DBMemo1: TDBMemo;
    qExcluir: TIBQuery;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure edtMaterialClick(Sender: TObject);
    procedure edtUtilizadorClick(Sender: TObject);
    procedure edtUsuariosClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConRetiradas: TfrmConRetiradas;

implementation

uses UdmBD, UPrincipal, UConsultaRetiradas, URetiradas, UEditarRetiradas,
  URelatorioGeralRetiradas, URelatorioRetiradasXMaterial,
  URelatorioRetiradasXUtilizador;

{$R *.dfm}

procedure TfrmConRetiradas.btnConsultarClick(Sender: TObject);
begin
  qConsultaRetiradas.Close;
  if qConsultaRetiradas.Prepared then
  qConsultaRetiradas.UnPrepare;
  qConsultaRetiradas.SQL.Clear;
  qConsultaRetiradas.SQL.Add(' select a.COD_MAT, a.COD_RET, a.COD_USU, a.COD_UTI, a.DATA, a.HORA, a.OBSERVACOES, '+
                     ' a.QUANTIDADE, b.COD_MAT, b.NOME, c.COD_USU, c.NOME, d.COD_UTI, d.NOME '+
                     ' from RETIRADA a, MATERIAIS b,USUARIOS c, UTILIZADOR d '+
                     ' Where a.COD_MAT = b.COD_MAT and a.COD_USU = c.COD_USU and a.COD_UTI = d.COD_UTI ');


  if (chkMaterial.Checked) then
  begin
    qConsultaRetiradas.SQL.Add(' and a.COD_MAT= :COD_MAT');
    qConsultaRetiradas.ParamByName('COD_MAT').AsInteger := qMaterialCOD_MAT.AsInteger;
  end;

  if (chkUtilizador.Checked)then
  begin
    qConsultaRetiradas.SQL.Add(' and a.COD_UTI = :COD_UTI');
    qConsultaRetiradas.ParamByName('COD_UTI').AsInteger := qUtilizadorCOD_UTI.AsInteger;
  end;

    if (chkResponsavel.Checked) then
  begin
    qConsultaRetiradas.SQL.Add(' and a.COD_USU = :COD_USU');
    qConsultaRetiradas.ParamByName('COD_USU').AsInteger := qUsuarioCOD_USU.AsInteger;
  end;

    if (chkData.Checked) then
    begin
      if DateTimePicker2.Date < DateTimePicker1.Date then
      begin
        ShowMessage('Período de Datas Inválido!!!, Selecione um intervalo de data válido!');
        DateTimePicker2.Date:=DateTimePicker1.Date;
      end
      else
     begin
    qConsultaRetiradas.SQL.Add(' and a.DATA between:d1 and :d2');
    qConsultaRetiradas.ParamByName('d1').AsDateTime:= DateTimePicker1.Date;
    qConsultaRetiradas.ParamByName('d2').AsDateTime:= DateTimePicker2.Date;
    qConsultaRetiradas.SQL.Add(' order by a.DATA, a.COD_MAT, a.COD_UTI, a.COD_USU');
    qConsultaRetiradas.Prepare;
    qConsultaRetiradas.Open;
    qConsultaRetiradas.FetchAll;
  end;
    end;

end;

procedure TfrmConRetiradas.btnEditarClick(Sender: TObject);
begin
  if not LocalizaForm(frmEditarRetiradas) then
  frmEditarRetiradas:=TfrmEditarRetiradas.Create(Application);
  frmEditarRetiradas.Width:=360;
  frmEditarRetiradas.Height:=360;
  frmEditarRetiradas.Color:=FrmPrincipal.Color;
  frmEditarRetiradas.edtCod_Ret.text:=qConsultaREtiradasCOD_RET.AsString;
  frmEditarRetiradas.edtHora.DateTime:=qConsultaRetiradasHORA.AsDateTime;
  frmEditarRetiradas.edtData.DateTime:=qConsultaRetiradasDATA.AsDateTime;
  frmEditarRetiradas.dblUtilizador.keyvalue:=qConsultaRetiradasCOD_UTI.AsString;
  frmEditarRetiradas.dblMaterial.keyvalue:=qConsultaRetiradasCOD_MAT.AsString;
  frmEditarRetiradas.edtQuantidade.Text:=qConsultaRetiradasQUANTIDADE.AsString;
  frmEditarRetiradas.Show;

end;

procedure TfrmConRetiradas.btnExcluirClick(Sender: TObject);
begin
  qExcluir.Close;
  qExcluir.ParamByName('COD_RET').AsString:=qConsultaRetiradasCOD_RET.Text;
  qExcluir.Prepare;
  qExcluir.ExecSQL;
  dmBD.trBD_SIGE.CommitRetaining;
  qConsultaRetiradas.Close;
  qConsultaRetiradas.Open;
end;

procedure TfrmConRetiradas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConRetiradas.btnRelatorioClick(Sender: TObject);
begin
  if (chkMaterial.Checked=false)and (chkUtilizador.Checked=false) and (chkResponsavel.Checked=false) then
  begin
  with TfrmRelatorioGeralRetiradas.Create (self) do
  begin
    try
      QuickRep1.PreviewModal;
    finally
      free;
    end;
end
end
else
  if (chkMaterial.Checked=true) then
  begin
    with TfrmRelatorioRetiradasXMaterial.Create(self) do
    begin
      try
        QuickRep1.PreviewModal;
      finally
         Free;
      end;
    end;
  end
  else
ShowMessage('Escolha um filtro!');



  end;





procedure TfrmConRetiradas.DBGrid1DblClick(Sender: TObject);
begin
if not localizaForm(frmRetiradas) then
  frmRetiradas:= TfrmRetiradas.Create(Application);
  frmRetiradas.Width:=503;
  frmRetiradas.Height:=582;
  frmRetiradas.show;
 
end;

procedure TfrmConRetiradas.edtMaterialClick(Sender: TObject);
begin
  chkMaterial.Checked:=true;
end;

procedure TfrmConRetiradas.edtUsuariosClick(Sender: TObject);
begin
  chkResponsavel.Checked:=true;
end;

procedure TfrmConRetiradas.edtUtilizadorClick(Sender: TObject);
begin
  chkUtilizador.Checked:=true;
end;

procedure TfrmConRetiradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfrmConRetiradas.FormCreate(Sender: TObject);
begin
  qMaterial.Open;
  qMaterial.FetchAll;
  qUtilizador.Open;
  qUtilizador.FetchAll;
  qUsuario.Open;
  qUsuario.FetchAll;
  qConsultaRetiradas.Open;
  qConsultaRetiradas.FetchAll;
  monthCalendar1.Date:=Date;

end;

procedure TfrmConRetiradas.FormShow(Sender: TObject);
begin
  chkData.Checked:=true;
end;

procedure TfrmConRetiradas.MonthCalendar1Click(Sender: TObject);
begin
  chkData.Checked:=true;
end;

end.

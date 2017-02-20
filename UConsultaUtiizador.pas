//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UConsultaUtiizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, TeCanvas, TeeEdiGrad,
  ImgList, Grids, DBGrids, DBCtrls;

type
  TfrmConsultaUtiizador = class(TForm)
    qConsultaUtilizadores: TIBQuery;
    qConsultaUtilizadoresCOD_UTI: TIntegerField;
    qConsultaUtilizadoresNOME: TIBStringField;
    qConsultaUtilizadoresCOD_SET: TIntegerField;
    qConsultaUtilizadoresCOD_CARG: TIntegerField;
    qConsultaUtilizadoresOBS: TMemoField;
    dsConsultaUtilizadores: TDataSource;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    btnConsultar: TButtonGradient;
    btnEditar: TButtonGradient;
    btnCancelar: TButtonGradient;
    btnExcluir: TButtonGradient;
    btnFechar: TButtonGradient;
    btnRelatorio: TButtonGradient;
    Label1: TLabel;
    edtUtilizador: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaUtiizador: TfrmConsultaUtiizador;

implementation

uses UdmBD, UPrincipal, UCadUtilizador;

{$R *.dfm}

procedure TfrmConsultaUtiizador.DBGrid1DblClick(Sender: TObject);
begin
  if not LocalizaForm (frmCadUtilizador) then
  frmCadUtilizador:=TfrmCadUtilizador.Create(Application);
  frmCadUtilizador.Show;

end;

procedure TfrmConsultaUtiizador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.

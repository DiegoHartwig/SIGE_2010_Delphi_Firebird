// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit URelatAgendaXUtilizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, jpeg;

type
  TfrmRelatAgendaXUtilizador = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRSysData5: TQRSysData;
    QRShape1: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRSysData6: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAgendaXUtilizador: TfrmRelatAgendaXUtilizador;

implementation

uses UdmBD, UConsultaAgendamentos, UConRetiradas,
  URelatorioRetiradasXUtilizador;

{$R *.dfm}

end.

// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit URelatorioRetiradasXMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, jpeg;

type
  TfrmRelatorioRetiradasXMaterial = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRBand5: TQRBand;
    QRSysData5: TQRSysData;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRSysData6: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioRetiradasXMaterial: TfrmRelatorioRetiradasXMaterial;

implementation

uses UdmBD, UConRetiradas;

{$R *.dfm}

end.

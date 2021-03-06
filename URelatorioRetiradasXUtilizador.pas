// ## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit URelatorioRetiradasXUtilizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TRelatorioRetiradasXUtilizador = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioRetiradasXUtilizador: TRelatorioRetiradasXUtilizador;

implementation

{$R *.dfm}

procedure TRelatorioRetiradasXUtilizador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRelatorioRetiradasXUtilizador.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Verifica se a tecla pressionada � a tecla enter, conhecida pelo delphi como #13
  if key = #13 then
  begin
    //Se for, passa o foco para o proximo campo, zerando o valor da variavel key
    key := #0;
    perform(Wm_Nextdlgctl,0,0);
    end;
end;

end.

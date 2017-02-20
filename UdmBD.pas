//## S.I.G.E ##
// ## Sistema Informatizado de Gerenciamento Escolar ##
// ## Desenvolvido por Diego Hartwig e Jandir Rhoden - 2010 ##
unit UdmBD;

interface

uses
  SysUtils, Classes, IBDatabase, forms, dialogs,DB;

type
  TdmBD = class(TDataModule)
    BD_SIGE: TIBDatabase;
    trBD_SIGE: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBD: TdmBD;

implementation

{$R *.dfm}

procedure TdmBD.DataModuleCreate(Sender: TObject);
var StrConnect, fileName:String;
     F:TextFile;
   begin
   try
        {$I-}
      FileName:= ExtractFilePath(Application.ExeName)+'Connect.txt';
        AssignFile(f, FileName);   reset(f);
        if (IOResult=0) and (filename<>'') then
        begin
		Readln(f,strConnect);
		try
		trBD_SIGE.Active:=false;
		BD_SIGE.Close;
		BD_SIGE.DataBaseName:=strConnect;
         	BD_SIGE.Params.Clear;
		BD_SIGE.Params.Add(Format('USER_NAME=%s',['sysdba']));

		BD_SIGE.Params.Add(Format('Password=%s',['masterkey']));
		BD_SIGE.Params.Add('lc_ctype=WIN_1252');
		BD_SIGE.Connected:=True;
		BD_SIGE.Open;
	except
		On E:Exception Do
			ShowMessage('Erro de Conexão:'+E.Message);
 	end;
	end  else  begin
		ShowMessage('Arquivo de Conexão não encontrado!');
	Application.Terminate;
  end;
	finally
	Closefile(f);
	{$I+}
end;
end;


end.

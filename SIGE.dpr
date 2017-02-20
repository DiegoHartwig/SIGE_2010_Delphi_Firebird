program SIGE;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCadContatos in 'UCadContatos.pas' {frmCadContatos},
  UCadSetor in 'UCadSetor.pas' {frmCadSetor},
  UCadEquipamento in 'UCadEquipamento.pas' {frmCadEquipamento},
  UConsultaLigacoes in 'UConsultaLigacoes.pas' {frmConsultaLigacoes},
  URetiradas in 'URetiradas.pas' {frmRetiradas},
  UConsultaUtiizador in 'UConsultaUtiizador.pas' {frmConsultaUtiizador},
  UConsultaAgendamentos in 'UConsultaAgendamentos.pas' {frmConsultaAgendamentos},
  UAgendamentos in 'UAgendamentos.pas' {frmAgendamentos},
  ULigacoes in 'ULigacoes.pas' {frmLigacoes},
  UConRetiradas in 'UConRetiradas.pas' {frmConRetiradas},
  USenha in 'USenha.pas' {frmSenhas},
  UTema in 'UTema.pas' {frmTemas},
  URelatLigacoes in 'URelatLigacoes.pas' {frmRelatLigacoes},
  URelatContato in 'URelatContato.pas' {frmRelatContato},
  URelatAgendaXEquipamentos in 'URelatAgendaXEquipamentos.pas' {frmRelatAgendaXEquipamentos},
  URelatorioRetiradasXUtilizador in 'URelatorioRetiradasXUtilizador.pas' {RelatorioRetiradasXUtilizador},
  UBackup in 'UBackup.pas' {frmBackup},
  UAgendarBackup in 'UAgendarBackup.pas' {frmAgendarBackup},
  UAjuda in 'UAjuda.pas' {frmAjuda},
  USobre in 'USobre.pas' {frmSobre},
  UdmBD in 'UdmBD.pas' {dmBD: TDataModule},
  UCadCargo in 'UCadCargo.pas' {frmCadCargo},
  UGerarBackup in 'UGerarBackup.pas' {frmGerarBackup},
  URestaurarBackup in 'URestaurarBackup.pas' {frmRestaurarBackup},
  UCadTipoEquip in 'UCadTipoEquip.pas' {frmCadTipoEquip},
  UCadMarca in 'UCadMarca.pas' {frmCadMarca},
  UCadModelo in 'UCadModelo.pas' {frmCadModelo},
  UCadCidade in 'UCadCidade.pas' {frmCadCidade},
  UCadInstituicao in 'UCadInstituicao.pas' {frmCadInstituicao},
  UCadUtilizador in 'UCadUtilizador.pas' {frmCadUtilizador},
  UCadTipoMaterial in 'UCadTipoMaterial.pas' {frmCadTipoMaterial},
  UCadMaterial in 'UCadMaterial.pas' {frmCadMaterial},
  UGetSenha in 'UGetSenha.pas' {frmGetSenha},
  UEditarRetiradas in 'UEditarRetiradas.pas' {frmEditarRetiradas},
  UEditarAgendamento in 'UEditarAgendamento.pas' {frmEditarAgendamento},
  UEditarLigacoes in 'UEditarLigacoes.pas' {frmEditarLigacoes},
  URelatorioLigacoes in 'URelatorioLigacoes.pas' {frmRelatorioGeralLigacoes},
  URelatAgendaXUtilizador in 'URelatAgendaXUtilizador.pas' {frmRelatAgendaXUtilizador},
  URelatXUsuario in 'URelatXUsuario.pas' {frmRelatAgendaXUsuario},
  URelatorioGeralAgendamentos in 'URelatorioGeralAgendamentos.pas' {FrmRelatorioGeralAgendamentos},
  URelatorioLigacoesXSolicitante in 'URelatorioLigacoesXSolicitante.pas' {frmRelatorioLigacoesXSolicitante},
  URelatorioGeralRetiradas in 'URelatorioGeralRetiradas.pas' {frmRelatorioGeralRetiradas},
  URelatorioRetiradasXMaterial in 'URelatorioRetiradasXMaterial.pas' {frmRelatorioRetiradasXMaterial};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SIGE';
  Application.CreateForm(TdmBD, dmBD);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

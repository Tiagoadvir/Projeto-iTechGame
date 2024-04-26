program iTechEstatistica;

uses
  Vcl.Forms,
  View.itechEstatistica in 'View\View.itechEstatistica.pas' {FrmPrincipal},
  DmGlobal in 'DAO\DmGlobal.pas' {DmGloball: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDmGloball, DmGloball);
  Application.Run;
end.

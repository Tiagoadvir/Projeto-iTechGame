program APIITecGame;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  controlles.Console in 'controllers\controlles.Console.pas',
  DMGlobal in 'DAO\DMGlobal.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.

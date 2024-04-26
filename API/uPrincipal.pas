unit uPrincipal;

interface

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.OctetStream,
  Horse.Upload,
  DMGlobal,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Forms,
  Vcl.Graphics,
  controlles.Console,

  Winapi.Messages,
  Winapi.Windows, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ToggleSwitch1: TToggleSwitch;
    procedure FormShow(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DmGlobal : TDm;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
     DmGlobal := TDm.Create(nil);

     THorse.Use(Jhonson); // Informo ao horse para usar esse middware
     THorse.Use(CORS);   // Informo ao horse para usar esse middware
     THorse.Use(OctetStream);  // Informo ao horse para usar esse middware
     THorse.Use(Upload);  // Informo ao horse para usar esse middware

     //registrar rotas...
     controlles.Console.RegistrarRotas;


end;

procedure TForm1.ToggleSwitch1Click(Sender: TObject);
begin
   if ToggleSwitch1.IsOn then
      begin
        THorse.Listen(9001);
        Label1.Caption := 'Servidor iTechGamer online na porta : ' + THorse.Port.ToString;
      end
   else
   begin
      THorse.StopListen;
      Label1.Caption := 'Servidor iTechGamer';
   end;
end;

end.

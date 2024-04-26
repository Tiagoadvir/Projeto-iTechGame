unit View.Teste;

interface

uses
  uFancyDialog,
  controllers.iTechGame.Console,
  FMX.ActnList,
  FMX.Ani,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Edit,
  FMX.Forms,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Objects,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Types,

  System.Actions,
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Variants;

type
  TfrmPrincipal = class(TForm)
    rectbase: TRectangle;
    AniColor: TGradientAnimation;
    lobase: TLayout;
    Rectangle1: TRectangle;
    edtname: TEdit;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    TabControl: TTabControl;
    TabItem4: TTabItem;
    Layout2: TLayout;
    TabItem5: TTabItem;
    Layout3: TLayout;
    Image2: TImage;
    Label4: TLabel;
    TabItem6: TTabItem;
    Layout4: TLayout;
    Image3: TImage;
    Label6: TLabel;
    TabItem7: TTabItem;
    Layout5: TLayout;
    Image4: TImage;
    Label8: TLabel;
    ActionList1: TActionList;
    ActTab1: TChangeTabAction;
    ActTab2: TChangeTabAction;
    ActTab3: TChangeTabAction;
    ActTab4: TChangeTabAction;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    CornerButton3: TCornerButton;
    layout_proximo: TLayout;
    btn_voltar: TSpeedButton;
    btn_proximo: TSpeedButton;
    labelConsole: TLabel;
    Timer1: TTimer;
    labelCategoria: TLabel;
    labeljogo: TLabel;
    procedure CornerButton1Click(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_voltarClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CornerButton3Click(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
  private
    { Private declarations }
    Consoles : TControllerConsole;
    Fancys : TFancyDialog;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.fmx}

procedure TfrmPrincipal.btn_proximoClick(Sender: TObject);
begin
  if edtname.Text = '' then
  begin
      Fancys.Show(TIconDialog.Warning, 'Atenção', 'O campo nome é obrigatório', 'Ok');
      Exit
  end;

  if TabControl.ActiveTab.Index = 3 then
  begin
   try
     Consoles.Gravarresposta;
     Fancys.Show(TIconDialog.Success, 'Tudo Certo', 'Dados gravados', 'Ok');
     exit;
   except
     Exit;
   end;
  end
  else
  begin
    TabControl.GotoVisibleTab(TabControl.ActiveTab.Tag + 1);
    if TabControl.ActiveTab.Index = 3 then
     btn_proximo.Text := 'Salvar';
  end;

end;

procedure TfrmPrincipal.btn_voltarClick(Sender: TObject);
begin
   if TabControl.ActiveTab.Index = 0 then
   Exit
   else
   begin
   TabControl.GotoVisibleTab(TabControl.ActiveTab.Tag - 1);
    if TabControl.ActiveTab.Index <> 3 then
     btn_proximo.Text := 'Próximo';
   end;
end;

procedure TfrmPrincipal.CornerButton1Click(Sender: TObject);
begin
   if not Assigned(Consoles) then
      Consoles := TControllerConsole.create;
      Consoles.MontaTipoConsole(self);
end;

procedure TfrmPrincipal.CornerButton2Click(Sender: TObject);
begin
   if not Assigned(Consoles) then
      Consoles := TControllerConsole.create;
      Consoles.MontaTipoCategoria(self);
end;

procedure TfrmPrincipal.CornerButton3Click(Sender: TObject);
begin
   if not Assigned(Consoles) then
     Consoles := TControllerConsole.create;
     Consoles.MontaTitulo(self);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fancys.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Fancys := TFancyDialog.Create(self);
end;


procedure TfrmPrincipal.TabControlChange(Sender: TObject);
begin
  if not Assigned(Consoles) then
  Consoles := TControllerConsole.create;
   Consoles.name := edtname.Text;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   if Assigned(Consoles) then
   begin
    labelConsole.Text := consoles._console;
    labelCategoria.Text := Consoles.Categoria;
    labeljogo.Text := consoles.titulo;
   end;

end;

end.

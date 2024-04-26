unit controllers.iTechGame.Console;

interface

uses
  uCombobox,

  DAO.iTechGame,
  System.SysUtils,
  FMX.Forms,
  FMX.dialogs;

type
TControllerConsole = class
  private
    console : TCustomCombo;
    Fname: string;
    F_console: string;
    FCategoria: string;
    Ftitulo: string;
    ConsultaAPI : TDmGlobal;
    Fid_console: integer;
    Fid_categoria: integer;
    Fid_titulo: integer;
  public
     constructor create;
     destructor destroy; override;

     procedure MontaTipoConsole(AForm : Tform);
     procedure MontaTipoCategoria(AForm: Tform);
     procedure MontaTitulo(AForm: Tform);
     procedure Gravarresposta;

   {Controla as chamadas dos menus suspensos}
    {$IFDEF  MSWINDOWS}
    procedure onConsoleOnClick(Sender : TObject);
    procedure onMontaTipoCategoriaClick(Sender : TObject);
    procedure onMontaTituloClick(Sender : TObject);
    {$ELSE}
    procedure onConsoleOnClick(Sender : TObject; const Point : TPointF);
    procedure onMontaTipoCategoria(Sender : TObject; const Point : TPointF);
    procedure onMontaTituloClick(Sender : TObject; const Point : TPointF);
    {$ENDIF}

    property name: string read Fname write Fname;
    property _console: string read F_console write F_console;
    property id_console: integer read Fid_console write Fid_console;
    property Categoria: string read FCategoria write FCategoria;
    property id_categoria: integer read Fid_categoria write Fid_categoria;
    property titulo: string read Ftitulo write Ftitulo;
    property id_titulo: integer read Fid_titulo write Fid_titulo;

end;

implementation

 uses
  View.Teste;
constructor TControllerConsole.create;
begin
   ConsultaAPI := TDmGlobal.Create(nil);
end;

destructor TControllerConsole.destroy;
begin
  ConsultaAPI.Free;
  inherited;
end;

procedure TControllerConsole.MontaTipoConsole(AForm : Tform);
begin
  console := TCustomCombo.Create(AForm);
  console.TitleMenuText := 'Escolha seu console';
  console.BackgroundColor := $FFF2F2F8;
  console.ItemBackgroundColor := $FFFFFFFF;

  // get na API
  ConsultaAPI.BuscaConsole;

  while not ConsultaAPI.TabTemp.Eof do
  begin
      console.AddItem(ConsultaAPI.TabTemp.FieldByName('id').AsString, ConsultaAPI.TabTemp.FieldByName('nome').AsString);
      ConsultaAPI.TabTemp.Next;
  end;

  console.OnClick := onConsoleOnClick;

  console.ShowMenu;
end;

{$IFDEF  MSWINDOWS}
procedure TControllerConsole.onConsoleOnClick(Sender: TObject);
begin
  console.hideMenu;
  F_console := console.DescrItem;
  Fid_console := StrtoInt(console.CodItem);
end;

procedure TControllerConsole.onMontatipocategoriaClick(Sender: TObject);
begin
  console.hideMenu;
  FCategoria := console.DescrItem;
  Fid_categoria := StrToInt(console.CodItem);
end;

procedure TControllerConsole.onMontaTituloClick(Sender: TObject);
begin
  console.hideMenu;
  Ftitulo := console.DescrItem;
  Fid_titulo := StrToInt(console.CodItem);
end;

{$ELSE}
procedure TControllerConsole.onConsoleOnClick(Sender: TObject);
begin
  console.hideMenu;
  FCategoria := console.DescrItem;
  Fid_categoria := StrToInt(console.CodItem);
end;

procedure TControllerConsole.onMontatipocategoriaOnClick(Sender: TObject);
begin
  console.hideMenu;
  F_console := console.DescrItem;
  Fid_console := StrtoInt(console.CodItem);
end;

procedure TControllerConsole.onMontaTituloClick(Sender: TObject;
Const Point: TPointF);
begin
  console.hideMenu;
  Ftitulo := console.DescrItem;
  Fid_titulo := StrToInt(console.CodItem);
end;

procedure TControllerConsole.onConsoleOnClick(Sender: TObject;
const Point: TPointF);
begin

end;

{$ENDIF}

procedure TControllerConsole.MontaTipoCategoria(AForm : Tform);
begin
  console := TCustomCombo.Create(AForm);
  console.TitleMenuText := 'Escolha a categoria';
  console.BackgroundColor := $FFF2F2F8;
  console.ItemBackgroundColor := $FFFFFFFF;

  // get na API
  ConsultaAPI.BuscaCategoria;

  while not ConsultaAPI.TabTemp.Eof do
  begin
      console.AddItem(ConsultaAPI.TabTemp.FieldByName('id').AsString, ConsultaAPI.TabTemp.FieldByName('nome').AsString);
      ConsultaAPI.TabTemp.Next;
  end;

  console.OnClick := onMontatipocategoriaClick;

  console.ShowMenu;
end;

procedure TControllerConsole.MontaTitulo(AForm : Tform);
begin
  console := TCustomCombo.Create(AForm);
  console.TitleMenuText := 'Escolha o T�tulo';
  console.BackgroundColor := $FFF2F2F8;
  console.ItemBackgroundColor := $FFFFFFFF;

 // get na API
  ConsultaAPI.BuscaTitulos;

  while not ConsultaAPI.TabTemp.Eof do
  begin
      console.AddItem(ConsultaAPI.TabTemp.FieldByName('id').AsString, ConsultaAPI.TabTemp.FieldByName('nome').AsString);
      ConsultaAPI.TabTemp.Next;
  end;

  console.OnClick := onMontaTituloClick;

  console.ShowMenu;
end;

procedure TControllerConsole.Gravarresposta;
begin
  ConsultaAPI.GravadadosAPI(name, id_console, id_categoria, id_titulo);
end;

end.

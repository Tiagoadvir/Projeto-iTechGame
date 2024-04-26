unit View.itechEstatistica;

interface

uses
  Data.DB,
  DmGlobal,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Controls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,

  Winapi.Messages,
  Winapi.Windows, Vcl.StdCtrls;

type
  TFrmPrincipal = class(TForm)
    pBase: TPanel;
    pGrid: TPanel;
    Button1: TButton;
    Ds: TDataSource;
    Grid: TDBGrid;
    Panel1: TPanel;
    lbDesc: TLabel;
    Label1: TLabel;
    lblTitulos: TLabel;
    Label3: TLabel;
    lbltotCategoria: TLabel;
    lbltotResposta: TLabel;
    lblTotTitulos: TLabel;
    FiltroCategoria: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FiltroCategoriaChange(Sender: TObject);
  private
    { Private declarations }
    DmGlobal : TDmGloball;
    procedure AjustarLarguraColunas(Grid: TDBGrid);
    procedure totalizador;
  public
    { Public declarations }
    procedure MontarDadosGrid;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  MontarDadosGrid;
end;

procedure TFrmPrincipal.FiltroCategoriaChange(Sender: TObject);
var
  CategoriaSelecionada: string;
begin
  // Obter a categoria selecionada no combobox
  CategoriaSelecionada := FrmPrincipal.FiltroCategoria.Text;

  if CategoriaSelecionada = 'Todos' then
  begin
    // Remover o filtro para exibir todos os registros
    DmGlobal.TabTemp.Filtered := False;
  end
  else
  begin
    // Aplicar o filtro ao TFDMemTable
    DmGlobal.TabTemp.Filter := 'categoria = ' + QuotedStr(CategoriaSelecionada);
    DmGlobal.TabTemp.Filtered := True;
  end;

   totalizador;

  // Atualizar a DBGrid para refletir o filtro
  Grid.Refresh;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DmGlobal.Free;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  if not Assigned(DmGlobal) then
     DmGlobal := TDmGloball.Create(nil);
end;

procedure TFrmPrincipal.MontarDadosGrid;
begin
    DmGlobal.ListarResultados;
    Grid.DataSource.DataSet := DmGlobal.TabTemp;
   AjustarLarguraColunas(Grid);
   totalizador; 
end;

procedure TFrmPrincipal.AjustarLarguraColunas(Grid: TDBGrid);
var
  i: Integer;
begin
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption) + 50; // Adicione um espa�o extra para margem
    Grid.Columns[3].Width := 300;
  end;
end;

procedure TFrmPrincipal.totalizador;
var
  UniqueTitulos, UniqueConsole, UniqueCategoria: TStringList;
  Titulo, Console, Categoria: string;
begin

  // total de registros
  lbltotResposta.Caption := Grid.DataSource.DataSet.RecordCount.ToString;


  UniqueTitulos := TStringList.Create;
  UniqueConsole := TStringList.Create;
  UniqueCategoria := TStringList.Create;
  
  try
    // Iterar sobre os registros no DataSource do TDBGrid
    Grid.DataSource.DataSet.First;
    while not Grid.DataSource.DataSet.Eof do
    begin
      // Obter os valores das colunas "titulo", "console" e "categoria"
      Titulo := Grid.DataSource.DataSet.FieldByName('titulo').AsString;
      Console := Grid.DataSource.DataSet.FieldByName('console').AsString;
      Categoria := Grid.DataSource.DataSet.FieldByName('categoria').AsString;
      
      // Adicionar os valores �nicos �s listas apropriadas, se ainda n�o estiverem presentes
      if UniqueTitulos.IndexOf(Titulo) = -1 then
        UniqueTitulos.Add(Titulo);
      
      if UniqueConsole.IndexOf(Console) = -1 then
        UniqueConsole.Add(Console);
        
      if UniqueCategoria.IndexOf(Categoria) = -1 then
        UniqueCategoria.Add(Categoria);
      
      // Avan�ar para o pr�ximo registro
      Grid.DataSource.DataSet.Next;
    end;

    // Atribuir os resultados �s labels
    lblTotTitulos.Caption := IntToStr(UniqueTitulos.Count);
  //  lbltotCategoria.Caption := IntToStr(UniqueConsole.Count);
    lblTotCategoria.Caption := IntToStr(UniqueCategoria.Count);
    FiltroCategoria.Items.AddStrings(UniqueCategoria);
  finally
    // Liberar mem�ria alocada para as listas
    UniqueTitulos.Free;
    UniqueConsole.Free;
    UniqueCategoria.Free;
  end;
end;


end.

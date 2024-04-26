unit DMGlobal;

interface

uses
  Data.DB,

  DataSet.Serialize,
  DataSet.Serialize.Config,

  FireDAC.Comp.Client,
  FireDAC.Phys,
  FireDAC.DApt,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,

  System.JSON,
  System.Classes,
  System.IOUtils,
  System.SysUtils, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TDm = class(TDataModule)
    Conn: TFDConnection;
    qry: TFDQuery;
    procedure ConnBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure ConnAfterConnect(Sender: TObject);
  private
    procedure CreateUpdateDataDB;
    function GetTables: TDataSet;
    { Private declarations }
  public
    { Public declarations }
    Function ListarConsole : TJsonArray;
    Function ListarCategoria : TJsonArray;
    Function ListarTitulo : TJsonArray;
    Function ListarResultados : TJsonArray;
    procedure GravarPesquisa(nome : string; id_console, id_categoria, id_titulo : Integer);
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDm.ConnAfterConnect(Sender: TObject);
begin
   CreateUpdateDataDB;

   // console
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (1, ''PlayStation'') ');
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (2, ''Xbox'')');
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (3, ''Nintendo'')');
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (4, ''PC'')');
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (5, ''Sega'')');
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (6, ''Atari'')');
   conn.ExecSQL('  INSERT OR REPLACE INTO tab_console (id, nome) VALUES (7, ''SNK'')');

   // categoria
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (1, ''A��o'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (2, ''RPG'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (3, ''MMORPG'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (4, ''Estrat�gia'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (5, ''Mundo aberto'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (6, ''Esportes'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (7, ''Puzzle e Party Games'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (8, ''A��o e Aventura'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (9, ''MOBA'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO TAB_CATEGORIA (ID, NOME) VALUES (10, ''Battle Royale'')');

   //titulos
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (1, ''The Legend of Zelda: Ocarina of Time'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (2, ''Tony Hawk�s Pro Skater 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (3, ''Grand Theft Auto IV'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (4, ''SoulCalibur'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (5, ''Super Mario Galaxy'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (6, ''Super Mario Galaxy 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (7, ''Red Dead Redemption 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (8, ''The Legend of Zelda: Breath of the Wild'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (9, ''Perfect Dark'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (10, ''Metroid Prime'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (11, ''Grand Theft Auto V'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (12, ''Grand Theft Auto III'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (13, ''Tony Hawk�s Pro Skater 3'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (14, ''Halo: Combat Evolved'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (15, ''Half-Life 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (16, ''GoldenEye 007'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (17, ''Uncharted 2: Among Thieves'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (18, ''Resident Evil 4'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (19, ''Super Mario Odyssey'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (20, ''Spider-Man 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (21, ''Bioshock'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (22, ''NFL 2K1'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (23, ''Batman: Arkham City'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (24, ''Tekken 3'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (25, ''Mass Effect 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (26, ''The Legend of Zelda: Twilight Princess'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (27, ''Half-Life'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (28, ''The Legend of Zelda: The Wind Waker'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (29, ''The Orange Box'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (30, ''Grand Theft Auto: San Andreas'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (31, ''Gran Turismo 3: A-Spec'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (32, ''Halo 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (33, ''The Legend of Zelda: Majora�s Mask'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (34, ''The Last of Us'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (35, ''Madden NFL 2003'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (36, ''Portal 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (37, ''Metal Gear Solid V: The Phantom Pain'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (38, ''Final Fantasy IX'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (39, ''Call of Duty: Modern Warfare 2'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (40, ''The Elder Scrolls V: Skyrim'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (41, ''Gran Turismo'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (42, ''Metal Gear Solid 2: Sons of Liberty'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (43, ''Baldur�s Gate II: Shadows of Amn'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (44, ''LittleBigPlanet'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (45, ''Red Dead Redemption'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (46, ''Grand Theft Auto: Vice City'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (47, ''The Legend of Zelda: Collector�s Edition'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (48, ''The Legend of Zelda: A Link to the Past'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (49, ''Persona 5 Royal'')');
   Conn.ExecSQL('INSERT OR REPLACE INTO tab_titulo (ID, NOME) VALUES (50, ''World of Goo'')');

end;

procedure TDm.ConnBeforeConnect(Sender: TObject);
var
 LPath : string;
 LFile : Textfile;
begin

     Conn.DriverName := 'SQLite';
     Conn.UpdateOptions.LockWait := True;
     conn.TxOptions.Isolation := xiSnapshot;

     {$IFDEF MSWINDOWS}
      LPath := System.SysUtils.GetCurrentDir;
   //   conn.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\fastped.db';
     {$ELSE}
      LPath := System.IOUtils.TPath.GetDocumentsPath;
  //    conn.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'fastped.db');
     {$ENDIF}
     LPath := System.IOUtils.TPath.Combine(LPath, 'Database');
     ForceDirectories(LPath);
     LPath := System.IOUtils.TPath.Combine(LPath, 'Fastped.db');

     if not (FileExists(LPath)) then
     begin
       try
         AssignFile(LFile, LPath);
         Rewrite(LFile);
       finally
         CloseFile(LFile);
       end;
     end;

     Conn.Params.Values['Database'] := LPath;
end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin
   TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
   TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';

   Conn.Connected := true;
end;

function TDm.GetTables: TDataSet;
begin
  Result := TFDQuery.Create(nil);
  try
    TFDQuery(Result).Connection := Conn;
    TFDQuery(Result).SQL.Add('select name from sqlite_master where type = "table" ');
    TFDQuery(Result).Open;
  except
    Result.Free; // Liberar o TFDQuery apenas se ocorrer uma exce��o
    raise;
  end;
end;

procedure TDm.CreateUpdateDataDB;
var
  LDSTable: TDataSet;
  LDSTableInfo: TDataSet;
  lTable : String;
begin

  LDSTable    := nil;
  LDSTableInfo:= nil;
  LDSTable := GetTables;
  try

   // CRIA��O DE TABELAS

    if not LDSTable.Locate('name', 'tab_console', []) or LDSTable.IsEmpty then
    begin
      Conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_CONSOLE ( '+
                    ' ID INTEGER PRIMARY KEY, '+
                    ' NOME TEXT)');
    end;

    if not LDSTable.Locate('name', 'tab_categoria', []) or LDSTable.IsEmpty then
    begin
      Conn.ExecSQL('CREATE TABLE IF NOT EXISTS TAB_CATEGORIA (' +
                    'ID INTEGER PRIMARY KEY, ' +
                    'NOME TEXT)');
    end;

    if not LDSTable.Locate('name', 'tab_titulo', []) or LDSTable.IsEmpty then
    begin
      Conn.ExecSQL('CREATE TABLE IF NOT EXISTS tab_titulo (' +
                          'ID INTEGER PRIMARY KEY, ' +
                          'NOME TEXT)');
    end;

    if not LDSTable.Locate('name', 'tab_escolha', []) or LDSTable.IsEmpty then
    begin
      Conn.ExecSQL('CREATE TABLE IF NOT EXISTS tab_escolha (' +
                    'ID INTEGER PRIMARY KEY, ' +
                    'NOME_PESSOA VARCHAR (300),' +
                    'ID_TITULO INTEGER, ' +
                    'ID_CONSOLE INTEGER, ' +
                    'ID_CATEGORIA INTEGER, ' +
                    'FOREIGN KEY (ID_TITULO) REFERENCES tab_titulo(ID), ' +
                    'FOREIGN KEY (ID_CONSOLE) REFERENCES tab_console(ID), ' +
                    'FOREIGN KEY (ID_CATEGORIA) REFERENCES tab_categoria(ID))');
    end;

  finally
    LDSTable.Free; // Liberar o TDataSet ao final
  end;
end;

Function TDm.ListarConsole : TJsonArray;
begin
   qry.Active := false;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT * FROM TAB_CONSOLE');
   qry.Active := True;

   Result := qry.ToJSONArray();
end;

Function TDm.ListarCategoria : TJsonArray;
begin
   qry.Active := false;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT * FROM TAB_CATEGORIA');
   qry.Active := True;

   Result := qry.ToJSONArray();
end;

Function TDm.ListarTitulo : TJsonArray;
begin
   qry.Active := false;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT * FROM TAB_TITULO');
   qry.Active := True;

   Result := qry.ToJSONArray();
end;

procedure TDm.GravarPesquisa(nome : string; id_console, id_categoria, id_titulo : Integer);
begin
   qry.Active := False;
   qry.SQL.Clear;
   qry.SQL.Add('INSERT INTO TAB_ESCOLHA (NOME_PESSOA, ID_TITULO, ID_CONSOLE, ID_CATEGORIA)');
   qry.SQL.Add('VALUES (:NOME_PESSOA, :ID_TITULO, :ID_CONSOLE, :ID_CATEGORIA);');

   qry.ParamByName('NOME_PESSOA').AsString   :=  nome;
   qry.ParamByName('ID_CONSOLE').AsInteger  :=  id_console ;
   qry.ParamByName('ID_CATEGORIA').AsInteger  :=  id_categoria;
   qry.ParamByName('ID_TITULO').AsInteger  :=  id_titulo ;

   qry.ExecSQL;

end;

Function TDm.ListarResultados : TJsonArray;
begin
   qry.Active := false;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT');
   qry.SQL.Add('esc.NOME_PESSOA NOME,');
   qry.SQL.Add('cons.NOME CONSOLE,');
   qry.SQL.Add('cat.NOME CATEGORIA,');
   qry.SQL.Add('tit.NOME TITULO');
   qry.SQL.Add('FROM TAB_ESCOLHA esc');
   qry.SQL.Add('JOIN TAB_CATEGORIA cat ON cat.ID = esc.ID_CATEGORIA');
   qry.SQL.Add('JOIN TAB_TITULO tit ON tit.ID = esc.ID_TITULO');
   qry.SQL.Add('JOIN TAB_CONSOLE cons ON cons.ID = esc.ID_CONSOLE');
   qry.Active := True;

   Result := qry.ToJSONArray();
end;
end.

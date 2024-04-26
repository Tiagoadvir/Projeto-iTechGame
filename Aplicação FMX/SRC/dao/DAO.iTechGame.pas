unit DAO.iTechGame;

interface

uses
  RESTRequest4D,
  DataSet.Serialize,
  Data.DB,

  DataSet.Serialize.Adapter.RESTRequest4D,
  DataSet.Serialize.Config,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,

  System.Classes,
  System.JSON,
  System.IOUtils,
  System.SysUtils;

type
  TDmGlobal = class(TDataModule)
    TabTemp: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravadadosAPI(nome : string; id_console, id_cat, id_titulo : Integer);
    procedure BuscaConsole;
    procedure BuscaCategoria;
    procedure BuscaTitulos;
  end;

implementation
  const
   BASE_URL = 'http://localhost:9001';

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDmGlobal.BuscaConsole;
var
 lResp : IResponse;
begin
   TabTemp.FieldDefs.Clear;

   lResp := TRequest.New.BaseURL(BASE_URL)
            .Resource('/console')
            .ContentType('application/json')
            .Adapters(TDataSetSerializeAdapter.New(TabTemp))
            .Get;

   if lResp.StatusCode <> 200 then
      raise Exception.Create(lResp.Content);
end;

procedure TDmGlobal.BuscaCategoria;
var
 lResp : IResponse;
begin
   TabTemp.FieldDefs.Clear;

   lResp := TRequest.New.BaseURL(BASE_URL)
            .Resource('/categoria')
            .ContentType('application/json')
            .Adapters(TDataSetSerializeAdapter.New(TabTemp))
            .Get;

   if lResp.StatusCode <> 200 then
      raise Exception.Create(lResp.Content);
end;

procedure TDmGlobal.BuscaTitulos;
var
 lResp : IResponse;
begin
   TabTemp.FieldDefs.Clear;

   lResp := TRequest.New.BaseURL(BASE_URL)
            .Resource('/titulo')
            .ContentType('application/json')
            .Adapters(TDataSetSerializeAdapter.New(TabTemp))
            .Get;

   if lResp.StatusCode <> 200 then
      raise Exception.Create(lResp.Content);

end;

procedure TDmGlobal.DataModuleCreate(Sender: TObject);
begin
     TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
     TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator := '.';
end;

procedure TDmGlobal.GravadadosAPI(nome : string; id_console, id_cat, id_titulo : Integer);
var
 json : TJsonObject;
 lResp : IResponse;
begin
    json := TJSONObject.Create;

    json.AddPair('nome', nome);
    json.AddPair('id_console', TJSONNumber.Create(id_console));
    json.AddPair('id_categoria', TJSONNumber.Create(id_cat));
    json.AddPair('id_titulo', TJSONNumber.Create(id_titulo));

    lResp := TRequest.New.BaseURL(BASE_URL)
             .Resource('/gravar_pesquisa')
             .AddBody(json.ToJSON)
             .ContentType('application/json')
             .Post;

    if lResp.StatusCode <> 201 then
       raise Exception.Create('Erro ao gravar dados' + lResp.Content);

end;

end.

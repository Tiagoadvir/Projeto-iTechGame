unit DmGlobal;

interface

uses
  RESTRequest4D,

  Data.DB,

  DataSet.Serialize.Adapter.RESTRequest4D,

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
  System.SysUtils;

type
  TDmGloball = class(TDataModule)
    TabTemp: TFDMemTable;
    TabTempnome: TStringField;
    TabTempconsole: TStringField;
    TabTempcategoria: TStringField;
    TabTemptitulo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ListarResultados;
  end;

var
  DmGloball: TDmGloball;

implementation
  uses
  View.itechEstatistica;

  const
    BASE_URL = 'http://localhost:9001';

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmGloball }

procedure TDmGloball.ListarResultados;
var
  lRes: IResponse;
  lJSONValue: TJSONValue;
  lJSONArray: TJSONArray;
  lJSONObject: TJSONObject;
begin
  lRes := TRequest.New.BaseURL(BASE_URL)
          .Resource('/resultados')
          .Adapters(TDataSetSerializeAdapter.New(tabtemp))
          .Get;

  if lRes.StatusCode <> 200 then
    raise Exception.Create('Erro ao listar dados: ' + lRes.Content);

{$REGION ' OUTRA MANEIRA DE POPULAR O DBGRID'}
//  lJSONValue := TJSONObject.ParseJSONValue(lRes.Content);
//  if Assigned(lJSONValue) and (lJSONValue is TJSONArray) then
//  begin
//    lJSONArray := TJSONArray(lJSONValue);
//    TabTemp.Close;
//    TabTemp.Open;
//    try
//      for lJSONValue in lJSONArray do
//      begin
//        if lJSONValue is TJSONObject then
//        begin
//          lJSONObject := TJSONObject(lJSONValue);
//          TabTemp.Append;
//          try
//            TabTempnome.AsString       := lJSONObject.GetValue<string>('nome');
//            TabTempconsole.AsString    := lJSONObject.GetValue<string>('console');
//            TabTempcategoria.AsString  := lJSONObject.GetValue<string>('categoria');
//            TabTemptitulo.AsString     := lJSONObject.GetValue<string>('titulo');
//            TabTemp.Post;
//          except
//            TabTemp.Cancel;
//            raise;
//          end;
//        end;
//      end;
//    finally
//      TabTemp.First;
//    end;
//  end
//  else
//    raise Exception.Create('Resposta inválida do servidor');
{$ENDREGION}
end;

end.

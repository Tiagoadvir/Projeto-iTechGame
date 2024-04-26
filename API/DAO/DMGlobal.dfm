object Dm: TDm
  OnCreate = DataModuleCreate
  Height = 218
  Width = 342
  object Conn: TFDConnection
    AfterConnect = ConnAfterConnect
    BeforeConnect = ConnBeforeConnect
    Left = 48
    Top = 40
  end
  object qry: TFDQuery
    Connection = Conn
    Left = 152
    Top = 48
  end
end

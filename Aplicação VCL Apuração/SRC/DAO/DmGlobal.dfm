object DmGloball: TDmGloball
  Height = 239
  Width = 443
  object TabTemp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 40
    object TabTempnome: TStringField
      FieldName = 'nome'
      Size = 300
    end
    object TabTempconsole: TStringField
      FieldName = 'console'
      Size = 300
    end
    object TabTempcategoria: TStringField
      FieldName = 'categoria'
      Size = 300
    end
    object TabTemptitulo: TStringField
      FieldName = 'titulo'
      Size = 300
    end
  end
end

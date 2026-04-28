object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 149
  Width = 394
  object ConexaoDB: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Database=vendas'
      'User_Name=VM-TreinoDomTec\Leonardo'
      'Server=VM-TREINODOMTEC'
      'OSAuthent=Yes')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 40
  end
end

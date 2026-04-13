object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 149
  Width = 394
  object ConexaoDB: TFDConnection
    Params.Strings = (
      'Server=DC-TR-05-VM\SERVERCURSO'
      'Database=vendas'
      'User_Name=sa'
      'Password=domtec@10'
      'DriverID=mssql'
      ''
      '')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 40
  end
end

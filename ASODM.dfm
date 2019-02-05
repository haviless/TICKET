object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 601
  Top = 264
  Height = 285
  Width = 730
  object CDSQRY1: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY1'
    RemoteServer = Socket1
    Left = 64
    Top = 16
  end
  object DSQRY1: TDataSource
    DataSet = CDSQRY1
    Left = 64
    Top = 64
  end
  object CDSQRY2: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY2'
    RemoteServer = Socket1
    Left = 128
    Top = 16
  end
  object DSQRY2: TDataSource
    DataSet = CDSQRY2
    Left = 128
    Top = 64
  end
  object CDSQRY3: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY3'
    RemoteServer = Socket1
    Left = 192
    Top = 16
  end
  object DSQRY3: TDataSource
    DataSet = CDSQRY3
    Left = 192
    Top = 64
  end
  object CDSPANTALLA: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY4'
    RemoteServer = Socket1
    Left = 336
    Top = 16
  end
  object DSPANTALLA: TDataSource
    DataSet = CDSPANTALLA
    Left = 336
    Top = 64
  end
  object CDSQRYDISPENSA: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY5'
    RemoteServer = Socket1
    Left = 423
    Top = 16
  end
  object DSDISPENSA: TDataSource
    DataSet = CDSQRYDISPENSA
    Left = 423
    Top = 56
  end
  object CDSUSUARIO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPQRY6'
    RemoteServer = Socket1
    Left = 256
    Top = 16
  end
  object DSUSUARIO: TDataSource
    DataSet = CDSUSUARIO
    Left = 256
    Top = 64
  end
  object CDSRUTA: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY7'
    RemoteServer = Socket1
    Left = 64
    Top = 128
  end
  object DSRUTA: TDataSource
    DataSet = CDSRUTA
    Left = 64
    Top = 176
  end
  object CDSFINALIZA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPQRY3'
    RemoteServer = Socket1
    Left = 144
    Top = 128
  end
  object DSFINALIZA: TDataSource
    DataSet = CDSFINALIZA
    Left = 136
    Top = 176
  end
  object CDSRESAGADOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPQRY3'
    RemoteServer = Socket1
    Left = 232
    Top = 128
  end
  object DSRESAGADOS: TDataSource
    DataSet = CDSRESAGADOS
    Left = 232
    Top = 176
  end
  object TcpClient1: TTcpClient
    Left = 392
    Top = 128
  end
  object CDSESPERA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPQRY2'
    RemoteServer = Socket1
    Left = 320
    Top = 128
  end
  object DSESPERA: TDataSource
    DataSet = CDSESPERA
    Left = 320
    Top = 176
  end
  object Socket1: TSocketConnection
    ServerGUID = '{AB791A78-9C26-4766-976A-19ED8FEAE88C}'
    ServerName = 'SrvTickets.SrvTickets1'
    Left = 16
    Top = 16
  end
  object dsOperaciones: TDataSource
    DataSet = cdsOperaciones
    Left = 464
    Top = 176
  end
  object cdsOperaciones: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY1'
    RemoteServer = Socket1
    Left = 464
    Top = 128
  end
  object CDSQRY4: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'DSPQRY2'
    RemoteServer = Socket1
    Left = 8
    Top = 136
  end
  object DSQRY4: TDataSource
    DataSet = CDSQRY4
    Left = 8
    Top = 184
  end
  object ExcelBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 498
    Top = 56
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 248
    Top = 24
  end
  object WS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 502
    Top = 112
  end
end

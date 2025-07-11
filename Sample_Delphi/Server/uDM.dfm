object DM: TDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 308
  Width = 433
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      
        'Database=D:\Magno_Componentes\McComponentes_4.0.0\McComponents_L' +
        'iberado\Sample_Delphi\Database\DB_SAMPLE.FDB'
      'DriverID=FB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 64
    Top = 48
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Windows\SysWOW64\FBCLIENT.DLL'
    Left = 224
    Top = 48
  end
  object McDriverFireDAC: TMcDriverFireDAC
    Connection = FDConnection
    FreeConnection = False
    Left = 64
    Top = 128
  end
  object McServer: TMcServer
    Driver = McDriverFireDAC
    Left = 224
    Top = 128
  end
end

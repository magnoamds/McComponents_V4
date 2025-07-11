object F_Main: TF_Main
  Left = 0
  Top = 0
  Caption = 'McCliente'
  ClientHeight = 675
  ClientWidth = 987
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 987
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 840
      Top = 8
      Width = 30
      Height = 30
      Caption = '+'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      Font.Quality = fqDraft
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 840
      Top = 41
      Width = 30
      Height = 30
      Caption = '-'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Pitch = fpVariable
      Font.Style = [fsBold]
      Font.Quality = fqDraft
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object lbl_Tempo: TLabel
      Left = 508
      Top = 53
      Width = 104
      Height = 25
      Caption = 'Tempo: 0 ms'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btn_Open: TButton
      Left = 11
      Top = 9
      Width = 100
      Height = 34
      Caption = 'Open'
      TabOrder = 0
      OnClick = btn_OpenClick
    end
    object DBNavigator1: TDBNavigator
      Left = 11
      Top = 100
      Width = 240
      Height = 30
      DataSource = DataSource
      TabOrder = 1
    end
    object edt_BaseUrl: TEdit
      Left = 245
      Top = 9
      Width = 489
      Height = 23
      TabOrder = 2
      Text = 'http://127.0.0.1:9095'
    end
    object edt_Resource: TEdit
      Left = 245
      Top = 38
      Width = 201
      Height = 23
      TabOrder = 3
      Text = 'resource'
    end
    object cbx_McCached: TCheckBox
      Left = 121
      Top = 14
      Width = 97
      Height = 17
      Caption = 'Use McCache'
      TabOrder = 4
    end
    object btn_CancelCommit: TButton
      Left = 245
      Top = 67
      Width = 100
      Height = 30
      Caption = 'Cancel Commit'
      TabOrder = 5
      OnClick = btn_CancelCommitClick
    end
    object btn_CommitUpd: TButton
      Left = 351
      Top = 67
      Width = 100
      Height = 30
      Caption = 'Commit Updates'
      TabOrder = 6
      OnClick = btn_CommitUpdClick
    end
    object DBImage: TDBImage
      Left = 744
      Top = 9
      Width = 90
      Height = 90
      DataSource = DataSource
      Proportional = True
      TabOrder = 7
    end
    object cbx_Compression: TCheckBox
      Left = 121
      Top = 39
      Width = 117
      Height = 17
      Caption = 'Use Compression'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbx_Binary: TCheckBox
      Left = 122
      Top = 64
      Width = 117
      Height = 17
      Caption = 'Use Binary'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object btn_Close: TButton
      Left = 11
      Top = 49
      Width = 100
      Height = 34
      Caption = 'Close'
      TabOrder = 10
      OnClick = btn_CloseClick
    end
  end
  object dbgBase: TDBGrid
    Left = 0
    Top = 137
    Width = 987
    Height = 538
    Align = alClient
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DataSource: TDataSource
    DataSet = McMemTable
    Left = 88
    Top = 192
  end
  object McConnection: TMcConnection
    BaseURL = 'http://localhost:9095'
    Resource = 'resource'
    ParamsDB.Port = 0
    OnBeforeConnect = McConnectionBeforeConnect
    Left = 544
    Top = 192
  end
  object McMemTable: TMcMemTable
    ActiveStoredUsage = []
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_UF'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DDD'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    McBaseActive = True
    Cache.McCache = McCache
    Connection = McConnection
    PrimaryKeys = <
      item
        AutoInc = False
        DataType = ftInteger
        Name = 'ID'
      end>
    Params = <>
    SQL.Strings = (
      'SELECT * FROM produto ORDER BY id')
    Left = 224
    Top = 192
  end
  object McCache: TMcCache
    Connection = McConnection
    Left = 384
    Top = 192
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 672
    Top = 192
  end
end

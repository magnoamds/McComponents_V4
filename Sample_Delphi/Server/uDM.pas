unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, System.IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.ConsoleUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, uMcServer, uMcDriverBase, uMcDriverFireDAC;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    McDriverFireDAC: TMcDriverFireDAC;
    McServer: TMcServer;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure WriteIni();
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

const
   KEY_SEC_DB = 'config';
   KEY_DRIVER = 'driver';
     KEY_HOST = 'host';
     KEY_PORT = 'port';
       KEY_DB = 'database';
     KEY_USER = 'user';
     KEY_PASS = 'pass';
  KEY_CHARSET = 'charset';
      KEY_LIB = 'lib';

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if not FileExists(ChangeFileExt(ParamStr(0), '.ini')) then
    WriteIni();
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.Close;
end;

procedure TDM.FDConnectionBeforeConnect(Sender: TObject);
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  begin
    FDPhysFBDriverLink.VendorLib := ReadString(KEY_SEC_DB, KEY_LIB, '');

    FDConnection.Params.Values['Server'] := ReadString(KEY_SEC_DB, KEY_HOST, '127.0.0.1');
    FDConnection.Params.Values['Port'] := ReadInteger(KEY_SEC_DB, KEY_PORT, 0).ToString;
    FDConnection.Params.Database := ReadString(KEY_SEC_DB, KEY_DB, '');
    FDConnection.Params.UserName := ReadString(KEY_SEC_DB, KEY_USER, '');
    FDConnection.Params.Password := ReadString(KEY_SEC_DB, KEY_PASS, '');
    FDConnection.Params.Values['CharacterSet'] := ReadString(KEY_SEC_DB, KEY_CHARSET, 'NONE');
    Free;
  end;
end;

procedure TDM.WriteIni;
begin
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  begin
    WriteString(KEY_SEC_DB, KEY_DRIVER, 'FB');
    WriteString(KEY_SEC_DB, KEY_HOST, '127.0.0.1');
    WriteInteger(KEY_SEC_DB, KEY_PORT, 3050);
    WriteString(KEY_SEC_DB, KEY_DB, '');
    WriteString(KEY_SEC_DB, KEY_USER, 'SYSDBA');
    WriteString(KEY_SEC_DB, KEY_PASS, 'masterkey');
    WriteString(KEY_SEC_DB, KEY_CHARSET, 'NONE');
    WriteString(KEY_SEC_DB, KEY_LIB, '');
    Free;
  end;
end;

end.

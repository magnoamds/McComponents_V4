program Server;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Classes,
  System.SysUtils,
  Horse,  // https://github.com/HashLoad/horse
  Horse.CORS,  // https://github.com/HashLoad/horse
  Horse.Compression,  // https://github.com/HashLoad/horse
  App.Router in 'App.Router.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

begin
  DM := TDM.Create(nil);
  try
    THorse.Use(CORS);
    THorse.Use(Compression());

    TAppRouter.Load();

    THorse.Listen(9095,
      procedure
      begin
        WriteLn(Format('Server active on port %d', [THorse.Port]));
      end);
  finally
    FreeAndNil(DM);
  end;
end.

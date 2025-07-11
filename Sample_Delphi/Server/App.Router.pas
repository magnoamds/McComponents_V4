unit App.Router;

interface

uses
  System.Classes,
  System.SysUtils,
  Horse;

type
  TAppRouter = class
  public
    class procedure Load();
  end;

implementation

uses uDM;

class procedure TAppRouter.Load;
begin
  THorse.Get('/',
    procedure(AReq: THorseRequest; ARes: THorseResponse)
    begin
      ARes.ContentType('text/html')
          .Send(Format('<h1>McServer On-Line - Horse version %s</h1>', [THorse.Version]));
    end);

  THorse.Post('/resource',
    procedure(AReq: THorseRequest; ARes: THorseResponse)
    begin
      try
        ARes.SendFile(DM.McServer.Resource(AReq.ContentFields.Field('mcdata').AsStream));
      except
        on E: exception do
          ARes.Send(E.Message);
      end;
    end);
end;

end.

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
    var
      lStream: TStream;
    begin
      try
        if AReq.ContentType.ToLower.Contains('application/json') then
          ARes.ContentType('application/json')
              .Send(DM.McServer.Resource(AReq.Body()))
        else
        begin
          lStream := DM.McServer.Resource(AReq.ContentFields.Field('mcdata').AsStream);
          try
            ARes.SendFile(lStream, 'application/octet-stream');
          finally
            FreeAndNil(lStream);
          end;
        end;
      except
        on E: exception do
          ARes.Send(E.Message);
      end;
    end);
end;

end.

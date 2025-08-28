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
        // Usado para McComponents V4.1.0
		lStream := DM.McServer.ProcessRequest(AReq.RawWebRequest.RawContent);
        try
          ARes.SendFile(lStream);
        finally
          FreeAndNil(lStream);
        end;

        // Usado para McComponents V4.0.6 a baixo
		//ARes.Send(DM.McServer.Resource(AReq.Body));
      except
        on E: exception do
          ARes.Send(E.Message);
      end;
    end);
end;

end.

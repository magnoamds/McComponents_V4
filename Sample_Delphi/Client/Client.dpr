﻿program Client;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {F_Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Main, F_Main);
  Application.Run;
end.

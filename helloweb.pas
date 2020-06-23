program StaticServer;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}cthreads, cmem,{$ENDIF}
  SysUtils, fphttpapp, httpdefs, httproute;
  
  const  port = 8080;
  
procedure endpoint(req: TRequest; res: TResponse);
begin
    res.Content := '{"Hello": "World"}';
    res.Code := 200;
    res.ContentType := 'application/json';
    res.ContentLength := length(res.Content);
    res.SendContent;
end;  
 

begin
  Application.Port := port;
  HTTPRouter.RegisterRoute('/', @endpoint, true);
  Application.Threaded := false;
  Application.Initialize;
  Application.Run;
end.

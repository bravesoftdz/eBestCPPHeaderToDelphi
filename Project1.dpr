program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 's eBest C++ to Delphi Header Converter';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

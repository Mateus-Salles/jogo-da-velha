program JogoDaVelha;

uses
  Vcl.Forms,
  U_jogodavelha in 'U_jogodavelha.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program ArlanPG;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  DBUnit in 'DBUnit.pas' {DataModuleDB: TDataModule},
  Login in 'Login.pas' {FormLogin},
  Settings in 'Settings.pas' {FormSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDataModuleDB, DataModuleDB);
  Application.Run;
end.

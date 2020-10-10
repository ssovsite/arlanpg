program ArlanPG;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  DBUnit in 'DBUnit.pas' {DataModuleDB: TDataModule},
  Login in 'Login.pas' {FormLogin},
  Settings in 'Settings.pas' {FormSettings},
  Vcl.Themes,
  Vcl.Styles,
  EditBlock in 'EditBlock.pas' {FormEditBlock};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ar-lan - система хранения документов';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDataModuleDB, DataModuleDB);
  Application.Run;
end.

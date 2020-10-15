unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.inifiles;

type
  TFormMain = class(TForm)
    MainMenuBase: TMainMenu;
    Arlan1: TMenuItem;
    MainMenuAppSettings: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    MainMenuAppLogin: TMenuItem;
    MainMenuItemDir: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MainMenuAppLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MainMenuAppSettingsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  LoginOk, DBOnline: Integer;
  DBType, AppDir: String;
  CfgINI: TIniFile;

implementation

{$R *.dfm}

uses Login, DBUnit, Settings;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
WND : HWND;
lpText,lpCaption : PChar;
Tip : Integer;
wLanguageId : Word;
begin
WND:=FormMain.Handle;
lpCaption:='������� ���������?';
lpText:='��� �� ����������� ������ '+#13#10+' ����� �������!';
Tip:=MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON1;
wLanguageId:=$0419;
case MessageBoxEx(Wnd,lpText,lpCaption,Tip, wLanguageId) of
IDNO: Action := caNone;
end;

  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');
  CfgINI.WriteInteger('FormPosition', 'fTop', FormMain.Top);
  CfgINI.WriteInteger('FormPosition', 'fLeft', FormMain.Left);
  CfgINI.Free;

end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  MainMenuItemDir.Visible := False;
  LoginOk := 0;
  DBOnline := 0;
  DBType := 'PG';
  AppDir := ExtractFileDir(Application.ExeName);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');
  FormMain.Top := CfgINI.ReadInteger('FormPosition', 'fTop', FormMain.Top);
  FormMain.Left := CfgINI.ReadInteger('FormPosition', 'fLeft', FormMain.Left);
  CfgINI.Free;
end;

procedure TFormMain.MainMenuAppSettingsClick(Sender: TObject);
begin
  try
    FormSettings := TFormSettings.Create(Self);
    FormSettings.ShowModal;
  finally
    FormSettings.Free;
  end;
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormMain.MainMenuAppLoginClick(Sender: TObject);
begin

  try
    DataModuleDB.FDConnectionPG.Connected := True;
    DBOnline := 1;
  except
    DataModuleDB.FDConnectionPG.Connected := False;
    DBOnline := 0;
  end;

  if (DBOnline = 1) then
  begin

    try
      FormLogin := TFormLogin.Create(Self);
      FormLogin.ShowModal;
    finally
      FormLogin.Free;
    end;
    if (LoginOk = 1) then
    begin
      MainMenuItemDir.Visible := True;
      MainMenuAppSettings.Enabled := False;
      MainMenuAppLogin.Enabled := False;
    end;


  end
  else
  begin
    if (MessageBoxEx(Self.Handle,'���� ������ �� ��������'+#13#10+'��������� ���������','������ ����������� ��',MB_OK+MB_ICONERROR, $0419)) = 1 then
    begin

    end;
  end;


end;

end.
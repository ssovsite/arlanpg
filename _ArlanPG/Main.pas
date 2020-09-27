unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormMain = class(TForm)
    MainMenuBase: TMainMenu;
    Arlan1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    MainMenuItemDir: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  LoginOk, DBOnline: Integer;
  DBType: String;

implementation

{$R *.dfm}

uses Login, DBUnit;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
WND : HWND;
lpText,lpCaption : PChar;
Tip : Integer;
wLanguageId : Word;
begin
WND:=FormMain.Handle;
lpCaption:='Закрыть программу?';
lpText:='Все не сохраненные данные '+#13#10+' будут утеряны!';
Tip:=MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON1;
wLanguageId:=$0419;
case MessageBoxEx(Wnd,lpText,lpCaption,Tip, wLanguageId) of
IDNO: Action := caNone;
end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  MainMenuItemDir.Visible := False;
  LoginOk := 0;
  DBOnline := 0;
  DBType := 'PG';
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormMain.N7Click(Sender: TObject);
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
    end;


  end
  else
  begin
    if (MessageBoxEx(Self.Handle,'База данных не доступна'+#13#10+'проверьте настройки','Ошибка подключения БД',MB_OK+MB_ICONERROR, $0419)) = 1 then
    begin

    end;
  end;


end;

end.

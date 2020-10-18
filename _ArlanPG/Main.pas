unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.inifiles, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    MainMenuKatalog: TMenuItem;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable2: TFDMemTable;
    MainMenuDocuments: TMenuItem;
    N1: TMenuItem;
    N7: TMenuItem;
    N12: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MainMenuAppLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MainMenuAppSettingsClick(Sender: TObject);
    procedure MainMenuKatalogClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ResetBaseWindows(typeWindows: String);
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  LoginOk, DBOnline, CatalogID: Integer;
  DBType, AppDir, SubAction: String;
  CfgINI: TIniFile;

implementation

{$R *.dfm}

uses Login, DBUnit, Settings;

procedure TFormMain.DBGrid1DblClick(Sender: TObject);
begin
  CatalogID := FDMemTable1.FieldByName('catalogid').AsInteger;
  ResetBaseWindows('document');
end;

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
  Panel2.Visible := False;
  MainMenuKatalog.Visible := False;
  MainMenuDocuments.Visible := False;
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

procedure TFormMain.MainMenuKatalogClick(Sender: TObject);
begin
  ResetBaseWindows('catalog');
end;

procedure TFormMain.N1Click(Sender: TObject);
var   s_1, s_2: string;
begin
  if (SubAction = 'bank') then
  begin

    if not InputQuery('Наименование кредитной организации',
    'Введите, пожалуйста, наименование организации:', s_1)
        then s_1 := '';

    if (trim(s_1) <> '') then
    begin
      if not InputQuery('Адрес кредитной организации',
      'Введите, пожалуйста, адрес организации:', s_2)
        then s_2 := '';

        if (trim(s_2) <> '') then
        begin

          with DataModuleDB.FDQueryDef do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into banklist (bankname, bankadres, catalogid) values (:p1, :p2, :p3)');
            Params[0].Value := trim(s_1);
            Params[1].Value := trim(s_2);
            Params[2].Value := CatalogID;
            Execute;
            Close;
          end;

        end;

    end;

    ResetBaseWindows('banklist');

  end;
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormMain.N8Click(Sender: TObject);
begin
  MainMenuDocuments.Caption := (Sender as TMenuItem).Caption;
  ResetBaseWindows('banklist');
end;

procedure TFormMain.ResetBaseWindows(typeWindows: String);
begin


  if (typeWindows = 'catalog') then
  begin

  DataSource1.Enabled := False;
  DataSource2.Enabled := False;

  FDMemTable1.Close;
  FDMemTable2.Close;

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from cataloglist order by catalogname');
      Open;
        FetchAll;
        FDMemTable1.Data := Data;
        FDMemTable1.First;
      Close;
      CatalogID := FDMemTable1.FieldByName('catalogid').AsInteger;
      SubAction := 'document';
      SQL.Clear;
      SQL.Add('select * from documentlist where catalogid=:p1 order by documentid');
      Params[0].Value := CatalogID;
      Open;
        FetchAll;
        FDMemTable2.Data := Data;
        FDMemTable2.First;
      Close;
    end;

    DBGrid1.Columns.Clear;
    DBGrid1.Columns.Add;
    DBGrid1.Columns[0].FieldName := 'catalogname';
    DBGrid1.Columns[0].Title.Caption := 'Каталог';
    DBGrid1.Columns[0].Title.Alignment := taCenter;

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'documentname';
    DBGrid2.Columns[0].Title.Caption := 'Имя документа';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'createpoint';
    DBGrid2.Columns[1].Title.Caption := 'Дата создания';
    DBGrid2.Columns[1].Title.Alignment := taCenter;

  DataSource1.Enabled := True;
  DataSource2.Enabled := True;

  end;

  if (typeWindows = 'document') then
  begin

  DataSource2.Enabled := False;

  FDMemTable2.Close;
  SubAction := 'document';
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from documentlist where catalogid=:p1 order by documentid');
      Params[0].Value := CatalogID;
      Open;
        FetchAll;
        FDMemTable2.Data := Data;
        FDMemTable2.First;
      Close;
    end;

  DataSource2.Enabled := True;

  end;

  if (typeWindows = 'banklist') then
  begin

  DataSource2.Enabled := False;

  FDMemTable2.Close;
  SubAction := 'bank';

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from banklist where catalogid=:p1 order by bankname');
      Params[0].Value := CatalogID;
      Open;
        FetchAll;
        FDMemTable2.Data := Data;
        FDMemTable2.First;
      Close;
    end;

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'bankname';
    DBGrid2.Columns[0].Title.Caption := 'Наименование кредит.орг';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'bankadres';
    DBGrid2.Columns[1].Title.Caption := 'Адрес кредит.орг';
    DBGrid2.Columns[1].Title.Alignment := taCenter;

  DataSource2.Enabled := True;

  end;

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
      MainMenuKatalog.Visible := True;
      MainMenuDocuments.Visible := True;
      Panel2.Visible := True;
      ResetBaseWindows('catalog');
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

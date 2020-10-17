unit Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,System.inifiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormSettings = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    MTSettings: TFDMemTable;
    MTSettingsLevel0: TStringField;
    MTSettingsLevel1: TStringField;
    MTSettingsValue: TStringField;
    MTSettingsLevelOCaption: TStringField;
    MTSettingsLevel1Caption: TStringField;
    DataSourceSettings: TDataSource;
    MTSettingsValueType: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    SaveSettings: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;

implementation

uses Main, EditBlock;

{$R *.dfm}


procedure TFormSettings.Button1Click(Sender: TObject);
begin

  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');

  MTSettings.First;
  while not MTSettings.Eof do
  begin
    CfgINI.WriteString(MTSettings.FieldByName('Level0').AsString,MTSettings.FieldByName('Level1').AsString,MTSettings.FieldByName('Value').AsString);
    MTSettings.Next;
  end;

  CfgINI.Free;

  SaveSettings := 0;
  Self.Close;
end;

procedure TFormSettings.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormSettings.DBGrid1DblClick(Sender: TObject);
begin
  try
    FormEditBlock := TFormEditBlock.Create(Self);
    FormEditBlock.EditBlockTypeCom := MTSettings.FieldByName('ValueType').AsString;
    FormEditBlock.EditBlockLabelCaption := MTSettings.FieldByName('Level1Caption').AsString;
    FormEditBlock.ShowModal;
  finally
    SaveSettings := SaveSettings + FormEditBlock.EditBlockValueOk;

    if (FormEditBlock.EditBlockValueOk = 1) then
    begin
      if (MTSettings.FieldByName('ValueType').AsString = 'edit')
        or (MTSettings.FieldByName('ValueType').AsString = 'editDD')
        or (MTSettings.FieldByName('ValueType').AsString = 'editDF') then
      begin
        MTSettings.Edit;
          MTSettings.FieldByName('Value').Value := trim(FormEditBlock.Edit1.Text);
        MTSettings.Post;
      end;

    end;

    FormEditBlock.Free;
  end;
end;

procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
var
WND : HWND;
lpText,lpCaption : PChar;
Tip : Integer;
wLanguageId : Word;
begin
  if (SaveSettings > 0) then
  begin
    WND:=FormMain.Handle;
    lpCaption:='Закрыть настройки?';
    lpText:='Все не сохраненные данные '+#13#10+' будут утеряны!';
    Tip:=MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON1;
    wLanguageId:=$0419;
    case MessageBoxEx(Wnd,lpText,lpCaption,Tip, wLanguageId) of
      IDNO: Action := caNone;
    end;
  end;

end;

procedure TFormSettings.FormShow(Sender: TObject);
var
  CfgSL: TStringList;
begin
  SaveSettings := 0;
  DataSourceSettings.Enabled := False;
  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');
    MTSettings.Close;
    MTSettings.Active := False;
    MTSettings.Open;
    MTSettings.Append;
      MTSettings.FieldByName('Level0').Value := 'DBSetting';
      MTSettings.FieldByName('Level1').Value := 'DBLinkValue';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting', 'DBLinkCaption', 'Адрес сервера');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('DBSetting', 'DBLinkType', 'edit');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('DBSetting', 'DBLinkValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level0').Value := 'DBSetting';
      MTSettings.FieldByName('Level1').Value := 'DBLinkDBNameValue';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBNameCaption', 'Имя БД');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBNameType', 'edit');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBNameValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level0').Value := 'DBSetting';
      MTSettings.FieldByName('Level1').Value := 'DBLinkDBUserValue';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBUserCaption', 'Имя пользователя');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBUserType', 'edit');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBUserValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level0').Value := 'DBSetting';
      MTSettings.FieldByName('Level1').Value := 'DBLinkDBUserPassValue';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBUserPassCaption', 'Пароль');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBUserPassType', 'edit');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('DBSetting', 'DBLinkDBUserPassValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level0').Value := 'FilesSetting';
      MTSettings.FieldByName('Level1').Value := 'FilesLinkValue';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkCaption', 'Путь к архиву');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkValueType', 'editDD');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level0').Value := 'FilesSetting';
      MTSettings.FieldByName('Level1').Value := 'TemplateLinkValue';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('FilesSetting', 'TemplateLinkCaption', 'Путь к шаблонам');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('FilesSetting', 'TemplateLinkValueType', 'editDD');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('FilesSetting', 'TemplateLinkValue', '');
    MTSettings.Post;


    MTSettings.Active := True;
  CfgINI.Free;
  MTSettings.First;
  DataSourceSettings.Enabled := True;
end;

end.

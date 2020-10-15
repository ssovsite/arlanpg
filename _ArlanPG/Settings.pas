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
    SaveSettings := FormEditBlock.EditBlockValueOk;
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
  if (SaveSettings = 1) then
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
begin
  SaveSettings := 0;
  DataSourceSettings.Enabled := False;
  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');
    MTSettings.Close;
    MTSettings.Active := False;
    MTSettings.Open;
    MTSettings.Append;
      //MTSettings.FieldByName('Level0').Value := 'DBSetting';
      //MTSettings.FieldByName('Level1').Value := 'DBTypeCaption';
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting/', 'DBTypeCaption', 'Тип базы данных');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('DBSetting', 'DBTypeValueType', 'combobox');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('DBSetting', 'DBTypeValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkCaption', 'Путь к архиву');
      MTSettings.FieldByName('ValueType').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkValueType', 'editDD');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkValue', '');
    MTSettings.Post;
    MTSettings.Append;
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

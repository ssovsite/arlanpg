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
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;

implementation

uses Main;

{$R *.dfm}

procedure TFormSettings.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormSettings.FormShow(Sender: TObject);
begin
  DataSourceSettings.Enabled := False;
  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');
    MTSettings.Close;
    MTSettings.Active := False;
    MTSettings.Open;
    MTSettings.Append;
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting', 'DBTypeCaption', 'Тип базы данных');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('DBSetting', 'DBTypeValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkCaption', 'Путь к архиву');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('FilesSetting', 'FilesLinkValue', '');
    MTSettings.Post;
    MTSettings.Append;
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('FilesSetting', 'TemplateLinkCaption', 'Путь к шаблонам');
      MTSettings.FieldByName('Value').Value := CfgINI.ReadString('FilesSetting', 'TemplateLinkValue', '');
    MTSettings.Post;
    MTSettings.Active := True;
  CfgINI.Free;
  DataSourceSettings.Enabled := True;
end;

end.

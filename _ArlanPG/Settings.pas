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
    FormEditBlock.Free;
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
      MTSettings.FieldByName('Level1Caption').Value := CfgINI.ReadString('DBSetting', 'DBTypeCaption', 'Тип базы данных');
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

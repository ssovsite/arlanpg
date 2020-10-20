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
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    N13: TMenuItem;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    FDMemTable3: TFDMemTable;
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
    procedure FormResize(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    procedure ResetBaseWindows(typeWindows: String);
    procedure MyGridSize(Grid: Tdbgrid);
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  LoginOk, DBOnline, CatalogID, PersonID: Integer;
  DBType, AppDir, SubAction, TemplateDir, ArhivDir: String;
  CfgINI: TIniFile;

implementation

{$R *.dfm}

uses Login, DBUnit, Settings, EditBlock;

{$R *.dfm}
procedure TFormMain.MyGridSize(Grid: Tdbgrid);
const
  DEFBORDER = 10;
var
  temp, n, k: Integer;
  lmax: array of Integer;
begin
  with Grid do
  begin
    Canvas.Font := Font;
    setlength(lmax,(Columns.Count)); //задаем размер массива в зависимости от количества полей
    for n := 0 to Columns.Count - 1 do                        //
      lmax[n] := Canvas.TextWidth(Columns[n].Title.Caption);  //заносим в массив размеры имен полей
    grid.DataSource.DataSet.First;
    while not grid.DataSource.DataSet.EOF do
    begin
      for n := 0 to Columns.Count - 1 do                                   //
      begin                                                                //Сравниваем, если длина текста в ячейках поля
        if (trim(grid.DataSource.DataSet.Fields[n].AsString) <> '') then
        begin
          temp := Canvas.TextWidth(trim(Columns[n].Field.DisplayText));      // больше чем длина имени поля
        end
        else
        begin
          temp := 0;
        end;

        if temp > lmax[n] then lmax[n] := temp;                            // Тогда перезаписываем значение в массиве на большее
      end; {for}
      grid.DataSource.DataSet.Next;
    end;
    grid.DataSource.DataSet.First;
    for n := 0 to Columns.Count - 1 do
    begin

       if lmax[n] >0  then                              //Собственно еняем размер колонок
        Columns[n].Width := round((lmax[n] + DEFBORDER)*1.1)
        else
        Columns[n].Width := DEFBORDER
       end;
    end;

end;

procedure TFormMain.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  if (Panel7.Visible = True) then
  begin
    Panel7.Visible := False;
  end;
end;

procedure TFormMain.DBGrid1DblClick(Sender: TObject);
begin
  CatalogID := FDMemTable1.FieldByName('catalogid').AsInteger;
  ResetBaseWindows('document');
end;

procedure TFormMain.DBGrid2CellClick(Column: TColumn);
begin
  if (DBGrid2.DataSource.DataSet.RecordCount > 0) then
  begin
    Panel7.Visible := True;
  end
  else
  begin
    Panel7.Visible := False;
  end;

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
  DataSource1.Enabled := False;
  DataSource2.Enabled := False;
  DataSource3.Enabled := False;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  if (DataSource2.Enabled = True) then
  begin
    MyGridSize(DBGrid2);
  end;

end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  CfgINI := TIniFile.Create(AppDir+'\arlanPG.cfg');
  FormMain.Top := CfgINI.ReadInteger('FormPosition', 'fTop', FormMain.Top);
  FormMain.Left := CfgINI.ReadInteger('FormPosition', 'fLeft', FormMain.Left);
  TemplateDir := CfgINI.ReadString('FilesSetting', 'TemplateLinkValue', '');
  ArhivDir := CfgINI.ReadString('FilesSetting', 'FilesLinkValue', '');
  CfgINI.Free;
  Panel2.Visible := False;
  Panel7.Visible :=False;
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

procedure TFormMain.N13Click(Sender: TObject);
begin
  MainMenuDocuments.Caption := (Sender as TMenuItem).Caption;
  ResetBaseWindows('templatelist');
end;

procedure TFormMain.N1Click(Sender: TObject);
var   s_1, s_2, tmpfilename: string;
      FileGUID : TGUID;
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

  if (SubAction = 'template') then
  begin
    s_1 := '';
    s_2 := '';

    try
      FormEditBlock := TFormEditBlock.Create(Self);
      FormEditBlock.EditBlockTypeCom := 'editDF';
      FormEditBlock.EditBlockLabelCaption := 'Выбрать файл шаблона';
      FormEditBlock.ShowModal;
    finally
      if (FormEditBlock.EditBlockValueOk = 1) then
      begin
        s_1 := trim(FormEditBlock.Edit1.Text);
      end;

      FormEditBlock.Free;
    end;

    if (trim(s_1) <> '') then
    begin

      try
        FormEditBlock := TFormEditBlock.Create(Self);
        FormEditBlock.EditBlockTypeCom := 'edit';
        FormEditBlock.EditBlockLabelCaption := 'Введите наименование шаблона';
        FormEditBlock.ShowModal;
      finally
        if (FormEditBlock.EditBlockValueOk = 1) then
        begin
          s_2 := trim(FormEditBlock.Edit1.Text);
        end;

        FormEditBlock.Free;
      end;

    end;


    if (trim(s_1) <> '') and (trim(s_2) <> '') then
    begin
      tmpfilename := TemplateDir + '\' +ExtractFileName(trim(s_1));
      CopyFile(Pchar(s_1), Pchar(tmpfilename), false);

          with DataModuleDB.FDQueryDef do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into templatelist (templatename, templatelink, catalogid, personid) values (:p1, :p2, :p3, :p4)');
            Params[0].Value := trim(s_2);
            Params[1].Value := trim(tmpfilename);
            Params[2].Value := CatalogID;
            Params[3].Value := PersonID;

            Execute;
            Close;
          end;



    end;

    ResetBaseWindows('templatelist');

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
  MainMenuDocuments.Caption := 'Документы';
  Panel5.Caption := 'Документы';
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
    DBGrid2.Columns[0].Title.Caption := 'Тип документа';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'casedate';
    DBGrid2.Columns[1].Title.Caption := 'Дата';
    DBGrid2.Columns[1].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[2].FieldName := 'clientid';
    DBGrid2.Columns[2].Title.Caption := 'Клиент';
    DBGrid2.Columns[2].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[3].FieldName := 'casenumber';
    DBGrid2.Columns[3].Title.Caption := 'Номер дела';
    DBGrid2.Columns[3].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[4].FieldName := 'agentid';
    DBGrid2.Columns[4].Title.Caption := 'Представитель';
    DBGrid2.Columns[4].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[5].FieldName := 'createpoint';
    DBGrid2.Columns[5].Title.Caption := 'Дата создания';
    DBGrid2.Columns[5].Title.Alignment := taCenter;

  DataSource1.Enabled := True;
  DataSource2.Enabled := True;

  MyGridSize(DBGrid1);
  MyGridSize(DBGrid2);

  end;

  if (typeWindows = 'document') then
  begin
  MainMenuDocuments.Caption := 'Документы';
  Panel5.Caption := 'Документы';
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

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'documentname';
    DBGrid2.Columns[0].Title.Caption := 'Тип документа';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'casedate';
    DBGrid2.Columns[1].Title.Caption := 'Дата';
    DBGrid2.Columns[1].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[2].FieldName := 'clientid';
    DBGrid2.Columns[2].Title.Caption := 'Клиент';
    DBGrid2.Columns[2].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[3].FieldName := 'casenumber';
    DBGrid2.Columns[3].Title.Caption := 'Номер дела';
    DBGrid2.Columns[3].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[4].FieldName := 'agentid';
    DBGrid2.Columns[4].Title.Caption := 'Представитель';
    DBGrid2.Columns[4].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[5].FieldName := 'createpoint';
    DBGrid2.Columns[5].Title.Caption := 'Дата создания';
    DBGrid2.Columns[5].Title.Alignment := taCenter;

  DataSource2.Enabled := True;
  MyGridSize(DBGrid2);

  end;

  if (typeWindows = 'banklist') then
  begin

  DataSource2.Enabled := False;
  Panel5.Caption := 'Кредитные организации';
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
  MyGridSize(DBGrid2);

  end;

 if (typeWindows = 'templatelist') then
  begin

  DataSource2.Enabled := False;
  Panel5.Caption := 'Шаблоны документов';
  FDMemTable2.Close;
  SubAction := 'template';

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from templatelist where catalogid=:p1 order by templatename');
      Params[0].Value := CatalogID;
      Open;
        FetchAll;
        FDMemTable2.Data := Data;
        FDMemTable2.First;
      Close;
    end;

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'templatename';
    DBGrid2.Columns[0].Title.Caption := 'Наименование шаблона';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'templatelink';
    DBGrid2.Columns[1].Title.Caption := 'Путь к шаблону';
    DBGrid2.Columns[1].Title.Alignment := taCenter;

  DataSource2.Enabled := True;
  MyGridSize(DBGrid2);
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

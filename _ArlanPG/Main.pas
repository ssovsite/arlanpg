unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.inifiles, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

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
    MainMenuItemReport: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    Panel8: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    MTParams: TFDMemTable;
    MTParamsparamid: TIntegerField;
    MTParamsparamcaption: TStringField;
    MTParamsparamvalue: TStringField;
    MTParamsparamname: TStringField;
    MTParamsparamtype: TStringField;
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
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ResetBaseWindows(typeWindows: String);
    procedure ResetSubWindows(typeWindows: String);
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

uses Login, DBUnit, Settings, EditBlock, AddDocument;

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

procedure TFormMain.Button1Click(Sender: TObject);
begin
  if (SubAction = 'client') then
  begin
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update clientlist set clientname=:p1, clientadres=:p2, clientogrn=:p3, clientinn=:p4  where clientid=:p0');
      ParamByName('p0').Value := FDMemTable2.FieldByName('clientid').AsInteger;
      MTParams.First;
      while not MTParams.Eof do
      begin
        if (MTParams.FieldByName('paramname').AsString = 'clientname') then
        begin
          ParamByName('p1').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        if (MTParams.FieldByName('paramname').AsString = 'clientadres') then
        begin
          ParamByName('p2').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        if (MTParams.FieldByName('paramname').AsString = 'clientogrn') then
        begin
          ParamByName('p3').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        if (MTParams.FieldByName('paramname').AsString = 'clientinn') then
        begin
          ParamByName('p4').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        MTParams.Next;
      end;

      Execute;
      Close;
    end;

    ResetBaseWindows('clientlist');
    ResetSubWindows('');
    Button2Click(nil);
  end;

  if (SubAction = 'bank') then
  begin
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update banklist set bankname=:p1, bankadres=:p2 where bankid=:p0');
      ParamByName('p0').Value := FDMemTable2.FieldByName('bankid').AsInteger;
      MTParams.First;
      while not MTParams.Eof do
      begin
        if (MTParams.FieldByName('paramname').AsString = 'bankname') then
        begin
          ParamByName('p1').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        if (MTParams.FieldByName('paramname').AsString = 'bankadres') then
        begin
          ParamByName('p2').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        MTParams.Next;
      end;

      Execute;
      Close;
    end;

    ResetBaseWindows('banklist');
    ResetSubWindows('');
    Button2Click(nil);
  end;

  if (SubAction = 'delegate') then
  begin
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update delegatelist set delegatename=:p1, delegatephone=:p2, delegateorder=:p3 where delegateid=:p0');
      ParamByName('p0').Value := FDMemTable2.FieldByName('delegateid').AsInteger;
      MTParams.First;
      while not MTParams.Eof do
      begin
        if (MTParams.FieldByName('paramname').AsString = 'delegatename') then
        begin
          ParamByName('p1').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        if (MTParams.FieldByName('paramname').AsString = 'delegatephone') then
        begin
          ParamByName('p2').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        if (MTParams.FieldByName('paramname').AsString = 'delegateorder') then
        begin
          ParamByName('p3').Value := MTParams.FieldByName('paramvalue').AsString;
        end;
        MTParams.Next;
      end;

      Execute;
      Close;
    end;

    ResetBaseWindows('delegatelist');
    ResetSubWindows('');
    Button2Click(nil);
  end;

end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  Panel8.Visible := False;
  DBGrid2.Enabled := True;
  DBGrid2.Refresh;
  DBGrid1.Enabled := True;
  DBGrid1.Refresh;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  try
    FormEditBlock := TFormEditBlock.Create(Self);
    FormEditBlock.EditBlockTypeCom := MTParams.FieldByName('paramtype').AsString;
    FormEditBlock.EditBlockLabelCaption := MTParams.FieldByName('paramcaption').AsString;
    FormEditBlock.EditBlockValueDef := MTParams.FieldByName('paramvalue').AsString;
    FormEditBlock.ShowModal;
  finally
    if (FormEditBlock.EditBlockValueOk = 1) then
    begin
      MTParams.Edit;
        if (MTParams.FieldByName('paramtype').AsString = 'memo') then
        begin
          MTParams.FieldByName('paramvalue').Value := trim(FormEditBlock.Memo1.Text);
        end
        else
        begin
          MTParams.FieldByName('paramvalue').Value := trim(FormEditBlock.Edit1.Text);
        end;


      MTParams.Post;
    end;

    FormEditBlock.Free;
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
  ResetBaseWindows('documentlist');
end;

procedure TFormMain.DBGrid2CellClick(Column: TColumn);
begin
  if (DBGrid2.DataSource.DataSet.RecordCount > 0) then
  begin
    ResetSubWindows('');
    Panel7.Visible := True;
    if (SubAction = 'client') then
    begin
      ResetSubWindows('clientlist');
    end;
    if (SubAction = 'bank') then
    begin
      ResetSubWindows('banklist');
    end;
    if (SubAction = 'delegate') then
    begin
      ResetSubWindows('delegatelist');
    end;
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
  Panel7.Visible := False;
  Panel8.Visible := False;
  MainMenuKatalog.Visible := False;
  MainMenuDocuments.Visible := False;
  MainMenuItemReport.Visible := False;
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

procedure TFormMain.N10Click(Sender: TObject);
begin
  MainMenuDocuments.Caption := (Sender as TMenuItem).Caption;
  ResetBaseWindows('delegatelist');
end;

procedure TFormMain.N13Click(Sender: TObject);
begin
  MainMenuDocuments.Caption := (Sender as TMenuItem).Caption;
  ResetBaseWindows('templatelist');
end;

procedure TFormMain.N1Click(Sender: TObject);
var   s_1, s_2, s_3, s_4, s_5, s_6, tmpfilename: string;
      FileGUID : TGUID;
begin

  if (SubAction = 'document') then
  begin
    try
      FormAddDocument := TFormAddDocument.Create(Self);
      FormAddDocument.ShowModal;
    finally
      FormAddDocument.Free;
    end;

    ResetBaseWindows('documentlist');

  end;

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

  if (SubAction = 'client') then
  begin

    s_1 := '';
    s_2 := '';
    s_3 := '';
    s_4 := '';
    s_5 := '';
    s_6 := '';

    try
      FormEditBlock := TFormEditBlock.Create(Self);
      FormEditBlock.EditBlockTypeCom := 'edit';
      FormEditBlock.EditBlockLabelCaption := 'Наименование / ФИО клиента';
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
        FormEditBlock.EditBlockTypeCom := 'memo';
        FormEditBlock.EditBlockLabelCaption := 'Введите адрес клиента';
        FormEditBlock.ShowModal;
      finally
        if (FormEditBlock.EditBlockValueOk = 1) then
        begin
          s_2 := trim(FormEditBlock.Memo1.Text);
        end;

        FormEditBlock.Free;
      end;

    end;

    if (trim(s_1) <> '') and (trim(s_2) <> '') then
    begin

      try
        FormEditBlock := TFormEditBlock.Create(Self);
        FormEditBlock.EditBlockTypeCom := 'edit';
        FormEditBlock.EditBlockLabelCaption := 'Введите ИНН клиента';
        FormEditBlock.ShowModal;
      finally
        if (FormEditBlock.EditBlockValueOk = 1) then
        begin
          s_3 := trim(FormEditBlock.Edit1.Text);
        end;

        FormEditBlock.Free;
      end;

    end;

    if (trim(s_1) <> '') and (trim(s_2) <> '') then
    begin

      try
        FormEditBlock := TFormEditBlock.Create(Self);
        FormEditBlock.EditBlockTypeCom := 'edit';
        FormEditBlock.EditBlockLabelCaption := 'Введите ОГРН клиента';
        FormEditBlock.ShowModal;
      finally
        if (FormEditBlock.EditBlockValueOk = 1) then
        begin
          s_4 := trim(FormEditBlock.Edit1.Text);
        end;

        FormEditBlock.Free;
      end;

    end;

    if (trim(s_1) <> '') and (trim(s_2) <> '') then
    begin

          with DataModuleDB.FDQueryDef do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into clientlist (clientname, clientadres, catalogid, personid, clientinn, clientogrn) values (:p1, :p2, :p3, :p4, :p5, :p6)');
            Params[0].Value := trim(s_1);
            Params[1].Value := trim(s_2);
            Params[2].Value := CatalogID;
            Params[3].Value := PersonID;
            Params[4].Value := trim(s_3);
            Params[5].Value := trim(s_4);

            Execute;
            Close;
          end;



    end;

    ResetBaseWindows('clientlist');

  end;

  if (SubAction = 'delegate') then
  begin

    s_1 := '';
    s_2 := '';
    s_3 := '';
    s_4 := '';
    s_5 := '';
    s_6 := '';

    try
      FormEditBlock := TFormEditBlock.Create(Self);
      FormEditBlock.EditBlockTypeCom := 'edit';
      FormEditBlock.EditBlockLabelCaption := 'ФИО представителя';
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
        FormEditBlock.EditBlockLabelCaption := 'Телефон представителя';
        FormEditBlock.ShowModal;
      finally
        if (FormEditBlock.EditBlockValueOk = 1) then
        begin
          s_2 := trim(FormEditBlock.Edit1.Text);
        end;

        FormEditBlock.Free;
      end;

    end;

    if (trim(s_1) <> '') then
    begin

      try
        FormEditBlock := TFormEditBlock.Create(Self);
        FormEditBlock.EditBlockTypeCom := 'edit';
        FormEditBlock.EditBlockLabelCaption := 'Номер и дата доверенности';
        FormEditBlock.ShowModal;
      finally
        if (FormEditBlock.EditBlockValueOk = 1) then
        begin
          s_3 := trim(FormEditBlock.Edit1.Text);
        end;

        FormEditBlock.Free;
      end;

    end;

    if (trim(s_1) <> '') then
    begin

          with DataModuleDB.FDQueryDef do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into delegatelist (delegatename, delegatephone, catalogid, personid, delegateorder) values (:p1, :p2, :p3, :p4, :p5)');
            Params[0].Value := trim(s_1);
            Params[1].Value := trim(s_2);
            Params[2].Value := CatalogID;
            Params[3].Value := PersonID;
            Params[4].Value := trim(s_3);
            Execute;
            Close;
          end;

    end;

    ResetBaseWindows('delegatelist');

  end;

end;

procedure TFormMain.N3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
  if (Panel7.Visible = False) then
  begin
    if (DBGrid2.DataSource.DataSet.RecordCount > 0) then
    begin
      Panel7.Visible := True;
    end
  end;

  if (DBGrid2.DataSource.DataSet.RecordCount > 0) then
  begin
    DBGrid1.Enabled := False;
    DBGrid1.Refresh;
    DBGrid2.Enabled := False;
    DBGrid2.Refresh;
    Panel8.Visible := True;
  end

end;

procedure TFormMain.N8Click(Sender: TObject);
begin
  MainMenuDocuments.Caption := (Sender as TMenuItem).Caption;
  ResetBaseWindows('banklist');
end;

procedure TFormMain.N9Click(Sender: TObject);
begin
  MainMenuDocuments.Caption := (Sender as TMenuItem).Caption;
  ResetBaseWindows('clientlist');
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

  if (typeWindows = 'documentlist') then
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


  if (typeWindows = 'clientlist') then
  begin

  DataSource2.Enabled := False;
  Panel5.Caption := 'Клиенты';
  FDMemTable2.Close;
  SubAction := 'client';

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from clientlist order by clientname');
      Open;
        FetchAll;
        FDMemTable2.Data := Data;
        FDMemTable2.First;
      Close;
    end;

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'clientname';
    DBGrid2.Columns[0].Title.Caption := 'Наименование клиента';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'clientadres';
    DBGrid2.Columns[1].Title.Caption := 'Адрес клиента';
    DBGrid2.Columns[1].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[2].FieldName := 'clientogrn';
    DBGrid2.Columns[2].Title.Caption := 'ОГРН клиента';
    DBGrid2.Columns[2].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[3].FieldName := 'clientinn';
    DBGrid2.Columns[3].Title.Caption := 'ИНН клиента';
    DBGrid2.Columns[3].Title.Alignment := taCenter;

  DataSource2.Enabled := True;
  MyGridSize(DBGrid2);

  end;


  if (typeWindows = 'delegatelist') then
  begin

  DataSource2.Enabled := False;
  Panel5.Caption := 'Представители';
  FDMemTable2.Close;
  SubAction := 'delegate';

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from delegatelist where catalogid=:p1 order by delegatename');
      Params[0].Value := CatalogID;
      Open;
        FetchAll;
        FDMemTable2.Data := Data;
        FDMemTable2.First;
      Close;
    end;

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'delegatename';
    DBGrid2.Columns[0].Title.Caption := 'ФИО представителя';
    DBGrid2.Columns[0].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[1].FieldName := 'delegatephone';
    DBGrid2.Columns[1].Title.Caption := 'Телефон представителя';
    DBGrid2.Columns[1].Title.Alignment := taCenter;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[2].FieldName := 'delegateorder';
    DBGrid2.Columns[2].Title.Caption := 'Доверенность';
    DBGrid2.Columns[2].Title.Alignment := taCenter;

  DataSource2.Enabled := True;
  MyGridSize(DBGrid2);

  end;

end;

procedure TFormMain.ResetSubWindows(typeWindows: String);
begin
  if (typeWindows = '') then
  begin
    DataSource3.Enabled := False;
    FDMemTable3.Close;
    MTParams.Close;
    MTParams.Active := False;
  end;

  if (typeWindows = 'clientlist') then
  begin

  DataSource3.Enabled := False;
  FDMemTable3.Close;

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from clientlist where clientid=:p1');
      Params[0].Value := FDMemTable2.FieldByName('clientid').AsInteger;
      Open;
        FetchAll;
        FDMemTable3.Data := Data;
        FDMemTable3.First;
      Close;

      Close;
      SQL.Clear;
      SQL.Add('select * from paramlist where paramtable=:p1 order by paramid');
      Params[0].Value := 'clientlist';

      MTParams.Close;
      MTParams.Active := False;
      MTParams.Open;

      Open;
      while not Eof do
      begin
        MTParams.Append;
          MTParams.FieldByName('paramid').Value := FieldByName('paramid').AsInteger;
          MTParams.FieldByName('paramcaption').Value := FieldByName('paramcaption').AsString;
          MTParams.FieldByName('paramname').Value := FieldByName('paramname').AsString;
          MTParams.FieldByName('paramvalue').Value := FDMemTable3.FieldByName(FieldByName('paramname').AsString).AsString;
          MTParams.FieldByName('paramtype').Value := FieldByName('paramtype').AsString;
        MTParams.Post;
        Next;
      end;
      Close;

      MTParams.Active := True;

    end;

  DataSource3.Enabled := True;
  MyGridSize(DBGrid3);

  end;


  if (typeWindows = 'banklist') then
  begin

  DataSource3.Enabled := False;
  FDMemTable3.Close;

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from banklist where bankid=:p1');
      Params[0].Value := FDMemTable2.FieldByName('bankid').AsInteger;
      Open;
        FetchAll;
        FDMemTable3.Data := Data;
        FDMemTable3.First;
      Close;

      Close;
      SQL.Clear;
      SQL.Add('select * from paramlist where paramtable=:p1 order by paramid');
      Params[0].Value := 'banklist';

      MTParams.Close;
      MTParams.Active := False;
      MTParams.Open;

      Open;
      while not Eof do
      begin
        MTParams.Append;
          MTParams.FieldByName('paramid').Value := FieldByName('paramid').AsInteger;
          MTParams.FieldByName('paramcaption').Value := FieldByName('paramcaption').AsString;
          MTParams.FieldByName('paramname').Value := FieldByName('paramname').AsString;
          MTParams.FieldByName('paramvalue').Value := FDMemTable3.FieldByName(FieldByName('paramname').AsString).AsString;
          MTParams.FieldByName('paramtype').Value := FieldByName('paramtype').AsString;
        MTParams.Post;
        Next;
      end;
      Close;

      MTParams.Active := True;

    end;

  DataSource3.Enabled := True;
  MyGridSize(DBGrid3);

  end;

  if (typeWindows = 'delegatelist') then
  begin

  DataSource3.Enabled := False;
  FDMemTable3.Close;

    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from delegatelist where delegateid=:p1');
      Params[0].Value := FDMemTable2.FieldByName('delegateid').AsInteger;
      Open;
        FetchAll;
        FDMemTable3.Data := Data;
        FDMemTable3.First;
      Close;

      Close;
      SQL.Clear;
      SQL.Add('select * from paramlist where paramtable=:p1 order by paramid');
      Params[0].Value := 'delegatelist';

      MTParams.Close;
      MTParams.Active := False;
      MTParams.Open;

      Open;
      while not Eof do
      begin
        MTParams.Append;
          MTParams.FieldByName('paramid').Value := FieldByName('paramid').AsInteger;
          MTParams.FieldByName('paramcaption').Value := FieldByName('paramcaption').AsString;
          MTParams.FieldByName('paramname').Value := FieldByName('paramname').AsString;
          MTParams.FieldByName('paramvalue').Value := FDMemTable3.FieldByName(FieldByName('paramname').AsString).AsString;
          MTParams.FieldByName('paramtype').Value := FieldByName('paramtype').AsString;
        MTParams.Post;
        Next;
      end;
      Close;

      MTParams.Active := True;

    end;

  DataSource3.Enabled := True;
  MyGridSize(DBGrid3);

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
      MainMenuItemReport.Visible := True;
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

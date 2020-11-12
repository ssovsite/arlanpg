unit AddDocument;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, ComObj,
  Vcl.Buttons;

type
  TFormAddDocument = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSourceParamDoc: TDataSource;
    MTParamsDoc: TFDMemTable;
    MTParamsDocparamname: TStringField;
    MTParamsDocparancaption: TStringField;
    MTParamsDocparamtype: TStringField;
    MTParamsDocparamvalue: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Label4: TLabel;
    ComboBox3: TComboBox;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    ComboBox4: TComboBox;
    SpeedButton4: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    function FindAndReplace(FindText,ReplaceText:string):boolean;
    { Public declarations }
  end;

var
  FormAddDocument: TFormAddDocument;

implementation

{$R *.dfm}

uses Main, DBUnit, EditBlock;

var Word, Excel, WorkSheet: variant;
DocumentShablon, tmpfilename, document_date, document_delo, document_client, document_person, CaseNumber, CaseDate: String;
CancelButtonEnter, CaseClient, CaseAgent: Integer;


function TFormAddDocument.FindAndReplace(FindText,ReplaceText:string):boolean;
  const wdReplaceAll = 2;
begin

  if FindText = '%doc_date%' then CaseDate := ReplaceText;
  if FindText = '%doc_number%' then CaseNumber := ReplaceText;
  //if FindText = '%doc_dolgnik%' then document_client := ReplaceText;
  //if FindText = '%doc_predstavitel%' then document_person := ReplaceText;


  Word.Selection.Find.MatchSoundsLike := False;
  Word.Selection.Find.MatchAllWordForms := False;
  Word.Selection.Find.MatchWholeWord := False;
  Word.Selection.Find.Format := False;
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.ClearFormatting;
  Word.Selection.Find.Text:=FindText;
  Word.Selection.Find.Replacement.Text:=ReplaceText;
  FindAndReplace:=Word.Selection.Find.Execute(Replace:=wdReplaceAll);
end;

procedure TFormAddDocument.Button1Click(Sender: TObject);
var FileGUID : TGUID;
begin
  if (FileExists(DocumentShablon)) then
  begin
      CreateGUID(FileGUID);
      tmpfilename := ArhivDir+'\'+GUIDToString(FileGUID)+'.docx';
      CopyFile(Pchar(DocumentShablon), Pchar(tmpfilename), false) ;

      try
        Word := CreateOleObject('Word.Application');
        Word.Documents.Open(tmpfilename);
        Word.Visible := False;
        Label2.Font.Color := clGreen;
        Label2.Caption := 'шаблон загружен';
        Label2.Visible := True;
        Application.ProcessMessages;
      except
        ShowMessage('Не могу запустить Microsoft Word');
      end;

      if (VarIsNull(Word) = False) then
      begin

        MTParamsDoc.First;
        while not MTParamsDoc.Eof do
        begin
          FindAndReplace('%'+MTParamsDoc.FieldByName('paramname').AsString+'%',trim(MTParamsDoc.FieldByName('paramvalue').AsString));
          MTParamsDoc.Next;
        end;



        Word.ActiveDocument.Save;
        Word.Quit;

        if (FileExists(tmpfilename)) then
        begin

          with DataModuleDB.FDQueryDef do
          begin
            Close;
            SQL.Clear;
            SQL.Add('insert into documentlist (documentname, catalogid, documentlink, personid, documenttypeid, casedate, casenumber, agentid, clientid) ');
            SQL.Add(' values (:p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9)');
            ParamByName('p1').Value := ExtractFileName(tmpfilename);
            ParamByName('p2').Value := CatalogID;
            ParamByName('p3').Value := tmpfilename;
            ParamByName('p4').Value := PersonID;
            ParamByName('p5').Value := integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
            ParamByName('p6').Value := CaseDate;
            ParamByName('p7').Value := CaseNumber;

            Open;
              while not Eof do
              begin
                ComboBox1.Items.AddObject(FieldByName('templatename').AsString,TObject(FieldByName('templateid').AsInteger));
                Next;
              end;
            Close;
          end;

        end;



      end;

  end
  else
  begin
    Label2.Font.Color := clRed;
    Label2.Caption := 'шаблон не найден!!!';
    Label2.Visible := True;
  end;
  Application.ProcessMessages;
end;

procedure TFormAddDocument.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormAddDocument.ComboBox1Select(Sender: TObject);
begin
  if (ComboBox1.ItemIndex <> 0) then
  begin
    with DataModuleDB.FDQueryDef do
    begin

      Close;
      SQL.Clear;
      SQL.Add('select * from templatelist where templateid=:p1');
      Params[0].Value := integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      Open;
        DocumentShablon := FieldByName('templatelink').AsString;
      Close;

      SQL.Clear;
      SQL.Add('select * from templateparamlist where templateid=:p1 order by criticallparam desc, templateparamcaption asc');
      Params[0].Value := integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);

      MTParamsDoc.Close;
      MTParamsDoc.Active := False;
      MTParamsDoc.Open;

      Open;
      while not Eof do
      begin
        MTParamsDoc.Append;
          //MTParamsDoc.FieldByName('paramid').Value := FieldByName('paramid').AsInteger;
          MTParamsDoc.FieldByName('paramcaption').Value := FieldByName('templateparamcaption').AsString;
          MTParamsDoc.FieldByName('paramname').Value := FieldByName('templateparamname').AsString;
          MTParamsDoc.FieldByName('paramvalue').Value := '';
          MTParamsDoc.FieldByName('paramtype').Value := FieldByName('templateparamtype').AsString;
        MTParamsDoc.Post;
        Next;
      end;
      Close;

      MTParamsDoc.Active := True;
      MTParamsDoc.First;
    end;
  end;

end;

procedure TFormAddDocument.DBGrid1DblClick(Sender: TObject);
begin
  try
    FormEditBlock := TFormEditBlock.Create(Self);
    FormEditBlock.EditBlockTypeCom := MTParamsDoc.FieldByName('paramtype').AsString;
    FormEditBlock.EditBlockLabelCaption := MTParamsDoc.FieldByName('paramcaption').AsString;
    FormEditBlock.ShowModal;
  finally
    //SaveSettings := SaveSettings + FormEditBlock.EditBlockValueOk;

    if (FormEditBlock.EditBlockValueOk = 1) then
    begin
      if (MTParamsDoc.FieldByName('paramtype').AsString = 'memo') then
      begin
        MTParamsDoc.Edit;
          MTParamsDoc.FieldByName('paramvalue').Value := trim(FormEditBlock.Memo1.Text);
        MTParamsDoc.Post;
      end
      else
      begin
        MTParamsDoc.Edit;
          MTParamsDoc.FieldByName('paramvalue').Value := trim(FormEditBlock.Edit1.Text);
        MTParamsDoc.Post;
      end;

    end;

    FormEditBlock.Free;
  end;
end;

procedure TFormAddDocument.Edit1Change(Sender: TObject);
begin
  if (trim(Edit1.Text) <> '') then
  begin
    ComboBox2.Clear;
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from clientlist where clientinn like '''+trim(Edit1.Text)+'%'+''' order by clientname');
      Open;
        while not Eof do
        begin
          ComboBox2.Items.AddObject(FieldByName('clientname').AsString,TObject(FieldByName('clientid').AsInteger));
          Next;
        end;
      Close;
    end;
    ComboBox2.ItemIndex := 0;
  end
  else
  begin
    ComboBox2.Clear;
    ComboBox2.Items.AddObject('<-- выбрать клиента -->',TObject(0));
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from clientlist order by clientname');
      Open;
        while not Eof do
        begin
          ComboBox2.Items.AddObject(FieldByName('clientname').AsString,TObject(FieldByName('clientid').AsInteger));
          Next;
        end;
      Close;
    end;
    ComboBox2.ItemIndex := 0;
  end;
end;

procedure TFormAddDocument.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  ComboBox1.Items.AddObject('<-- выбрать шаблон -->',TObject(0));
  ComboBox2.Clear;
  ComboBox2.Items.AddObject('<-- выбрать клиента -->',TObject(0));
  ComboBox3.Clear;
  ComboBox3.Items.AddObject('<-- выбрать представителя -->',TObject(0));
  ComboBox4.Clear;
  ComboBox4.Items.AddObject('<-- выбрать получателя -->',TObject(0));
  with DataModuleDB.FDQueryDef do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from templatelist where catalogid=:p0 order by templatename');
    ParamByName('p0').Value := CatalogID;
    Open;
      while not Eof do
      begin
        ComboBox1.Items.AddObject(FieldByName('templatename').AsString,TObject(FieldByName('templateid').AsInteger));
        Next;
      end;
    Close;

    Close;
    SQL.Clear;
    SQL.Add('select * from clientlist order by clientname');
    Open;
      while not Eof do
      begin
        ComboBox2.Items.AddObject(FieldByName('clientname').AsString,TObject(FieldByName('clientid').AsInteger));
        Next;
      end;
    Close;

    Close;
    SQL.Clear;
    SQL.Add('select * from delegatelist order by delegatename');
    Open;
      while not Eof do
      begin
        ComboBox3.Items.AddObject(FieldByName('delegatename').AsString,TObject(FieldByName('delegateid').AsInteger));
        Next;
      end;
    Close;

    Close;
    SQL.Clear;
    SQL.Add('select * from banklist order by bankname');
    Open;
      while not Eof do
      begin
        ComboBox4.Items.AddObject(FieldByName('bankname').AsString,TObject(FieldByName('bankid').AsInteger));
        Next;
      end;
    Close;

  end;

  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  ComboBox3.ItemIndex := 0;
  ComboBox4.ItemIndex := 0;
  Edit1.Clear;
end;

procedure TFormAddDocument.SpeedButton2Click(Sender: TObject);
begin
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from clientlist where clientid=:p1');
      ParamByName('p1').Value := integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
      Open;
        MTParamsDoc.First;
        while not MTParamsDoc.Eof do
        begin
          if (MTParamsDoc.FieldByName('paramname').AsString = 'doc_dolgnik') then
          begin
            MTParamsDoc.Edit;
              MTParamsDoc.FieldByName('paramvalue').Value := trim(FieldByName('clientname').AsString);
            MTParamsDoc.Post;
          end;
          if (MTParamsDoc.FieldByName('paramname').AsString = 'doc_dolgnik_adres') then
          begin
            MTParamsDoc.Edit;
              MTParamsDoc.FieldByName('paramvalue').Value := trim(FieldByName('clientadres').AsString);
            MTParamsDoc.Post;
          end;
          if (MTParamsDoc.FieldByName('paramname').AsString = 'doc_dolgnik_ogrn') then
          begin
            MTParamsDoc.Edit;
              MTParamsDoc.FieldByName('paramvalue').Value := trim(FieldByName('clientogrn').AsString);
            MTParamsDoc.Post;
          end;
          if (MTParamsDoc.FieldByName('paramname').AsString = 'doc_dolgnik_inn') then
          begin
            MTParamsDoc.Edit;
              MTParamsDoc.FieldByName('paramvalue').Value := trim(FieldByName('clientinn').AsString);
            MTParamsDoc.Post;
          end;
          MTParamsDoc.Next;
        end;
        MTParamsDoc.First;
      Close;
    end;
end;

procedure TFormAddDocument.SpeedButton4Click(Sender: TObject);
begin
    with DataModuleDB.FDQueryDef do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from banklist where bankid=:p1');
      ParamByName('p1').Value := integer(ComboBox4.Items.Objects[ComboBox4.ItemIndex]);
      Open;
        MTParamsDoc.First;
        while not MTParamsDoc.Eof do
        begin
          if (MTParamsDoc.FieldByName('paramname').AsString = 'doc_to') then
          begin
            MTParamsDoc.Edit;
              MTParamsDoc.FieldByName('paramvalue').Value := trim(FieldByName('bankname').AsString);
            MTParamsDoc.Post;
          end;
          if (MTParamsDoc.FieldByName('paramname').AsString = 'doc_to_adres') then
          begin
            MTParamsDoc.Edit;
              MTParamsDoc.FieldByName('paramvalue').Value := trim(FieldByName('bankadres').AsString);
            MTParamsDoc.Post;
          end;
          MTParamsDoc.Next;
        end;
        MTParamsDoc.First;
      Close;
    end;
end;

end.

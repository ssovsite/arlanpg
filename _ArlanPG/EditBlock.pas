unit EditBlock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TypInfo, FileCtrl;

type
  TFormEditBlock = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    EditBlockValueOk: Integer;
    EditBlockTypeCom: String;
    EditBlockLabelCaption: String;
    { Public declarations }
  end;

var
  FormEditBlock: TFormEditBlock;

implementation

{$R *.dfm}

type
      TStringSet = (edit, editDD, editDF, combobox, memo);

procedure TFormEditBlock.Button1Click(Sender: TObject);
begin
  EditBlockValueOk := 1;
  Self.Close;
end;

procedure TFormEditBlock.Button2Click(Sender: TObject);
begin
  EditBlockValueOk := 0;
  Self.Close;
end;

procedure TFormEditBlock.Button3Click(Sender: TObject);
var   newFileDir: String;
begin
  if (EditBlockTypeCom = 'editDD') then
  begin
    if SelectDirectory('Выберите папку:', '', newFileDir,  [sdNewFolder, sdNewUI, sdShowEdit, sdShowShares]) then
    begin
      Edit1.Text := newFileDir;
    end;
  end;

  if (EditBlockTypeCom = 'editDF') then
  begin
    if OpenDialog1.Execute then
    begin
      Edit1.Text := OpenDialog1.FileName;
    end;
  end;
end;

procedure TFormEditBlock.FormShow(Sender: TObject);
var
  StrVal : TStringSet;
begin
  Self.Height := 128;
  Edit1.Clear;
  ComboBox1.Clear;
  Memo1.Clear;

  ComboBox1.Top := Edit1.Top;
  ComboBox1.Left := Edit1.Left;
  Memo1.Top := Edit1.Top;
  Memo1.Left := Edit1.Left;

  EditBlockValueOk := 0;

  StrVal := TStringSet(GetEnumValue(TypeInfo(TStringSet), EditBlockTypeCom));
  case StrVal of
    edit : Edit1.Visible := True;
    editDD, editDF : begin Edit1.Visible := True; Button3.Visible := True; end;
    combobox : ComboBox1.Visible := True;
    memo : begin Memo1.Visible := True;  Self.Height := 128; end;
  end;

  Label1.Caption := EditBlockLabelCaption;

end;

end.

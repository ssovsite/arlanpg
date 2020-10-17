unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.hash;

type
  TFormLogin = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;


implementation

{$R *.dfm}

uses Main, DBUnit;

procedure TFormLogin.Button1Click(Sender: TObject);
begin
  with DataModuleDB.FDQueryDef do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from personlist where personid=:p1');
    Params[0].Value := integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
    Open;
      if (System.Hash.THashMD5.GetHashString(Edit1.text) <> FieldByName('personpass').AsString ) then
      begin
        LoginOk :=0;
      end
      else
      begin
        LoginOk := 1;
      end;

    Close;
  end;

  Self.Close;
end;

procedure TFormLogin.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  Edit1.Clear;
  ComboBox1.Items.AddObject('<-- выбрать пользователя -->',TObject(0));
  with DataModuleDB.FDQueryDef do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from personlist order by personname');
    Open;
      while not Eof do
      begin
        ComboBox1.Items.AddObject(FieldByName('personname').AsString,TObject(FieldByName('personid').AsInteger));
        Next;
      end;
    Close;
  end;

  ComboBox1.ItemIndex := 0;

end;

end.

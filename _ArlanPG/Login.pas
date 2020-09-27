unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
  LoginOk :=1;
end;

procedure TFormLogin.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  Edit1.Clear;
end;

end.

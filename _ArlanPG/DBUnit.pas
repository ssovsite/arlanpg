unit DBUnit;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet;

type
  TDataModuleDB = class(TDataModule)
    FDConnectionPG: TFDConnection;
    FDQueryDef: TFDQuery;
    FDTransactionPG: TFDTransaction;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleDB: TDataModuleDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses Main;

procedure TDataModuleDB.DataModuleCreate(Sender: TObject);
begin
  if (DBType = 'PG') then
  begin
    //FDConnectionPG
  end;
end;

end.

unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, MemDS, DBAccess, MyAccess,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Xmlxform, DALoader, MyLoader,
  Vcl.StdCtrls, VirtualTable, Data.SqlExpr;

type
  TForm4 = class(TForm)
    XMLTransformProvider1: TXMLTransformProvider;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    MyConnection1: TMyConnection;
    MyLoader1: TMyLoader;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

function CreateAndOpenClientDataset(AOwner: TComponent;
  AConnection: TMyConnection; ACommand: string): TClientDataSet;
var
  MyQuery: TMyQuery;
  Dsp: TDataSetProvider;
begin
  Result := TClientDataSet.Create(AOwner);
  try
    MyQuery := TMyQuery.Create(Result);
    MyQuery.Connection := AConnection;
    MyQuery.SQL.Text := ACommand;

    Dsp := TDataSetProvider.Create(Result);
    Dsp.DataSet := MyQuery;

    Result.SetProvider(Dsp);
    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
var
   my1: TClientDataset;
begin
   my1 := CreateAndOpenClientDataset(nil,myconnection1,'select * from rfzo_osiguranicispisak');
   my1.SaveToFile('c:\djoka.cds');
   myloader1.lo
end;

end.

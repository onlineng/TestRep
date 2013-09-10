unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, nativexml, Vcl.StdCtrls, Data.DB, MemDS,
  VirtualTable, DBAccess, MyAccess, VCLUnZip, dateutils, Diagnostics;

type
  TForm6 = class(TForm)
    Button1: TButton;
    VirtualTable1: TVirtualTable;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    Label1: TLabel;
    Button2: TButton;
    VCLUnZip1: TVCLUnZip;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    myposition,TotalNodeCount:integer;
    procedure XmlProgress (Sender: Tobject; Position: int64);
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

function GetCPUTick: Int64;
asm
   DB $0F,$31 // this is RDTSC command. Assembler, built in Delphi,
              // does not support it,
              // that is why one needs to overcome this obstacle.
end;

procedure TForm6.Button1Click(Sender: TObject);
var
  i,b:integer;
  a:TNativeXML;
  s:string;
  Freq, StartCount, StopCount: Int64;
  TimingSeconds: real;
  sw: TStopWatch;
begin
sw := TStopWatch.StartNew;
  myquery1.SQL.Text := 'delete from opp.mylekari ';
  myquery1.Execute;

  a:=TNativeXml.Create(nil);
  try
    a.XmlFormat := xfReadable;
    a.IndentString := '';
    a.EolStyle := esCRLF;
    a.OnProgress := XmlProgress;
    a.LoadFromFile('c:\l.xml');
//    a.LoadFromFile('c:\m.xml');
    TotalNodeCount := a.Root.NodeCount;
    b  := 0;
  QueryPerformanceFrequency(Freq);
  QueryPerformanceCounter(StartCount);
    for i:=0 to a.Root.NodeCount -1 do
    begin
      if (a.Root.Nodes[i].Name='LekarIDBroj') then
      begin
         myquery1.SQL.Text := 'insert into opp.mylekari set tip='+a.Root.Nodes[i].NodeByName('ID_Lekar').Value+',naziv='''
                   +a.Root.Nodes[i].NodeByName('Ime').Value+' '+a.Root.Nodes[i].NodeByName('Prezime').Value+'''';
         myquery1.Execute;
      end;
  {    if (a.Root.Nodes[i].Name='Osiguranik') then
      begin
          b:= b + 1;
            s:=a.Root.Nodes[i].NodeFindOrCreate('Filijala').value;
      end;  }
    end;
    QueryPerformanceCounter(StopCount);
    showmessage('kraj - '+inttostr(b)+' - sekundi: '+inttostr((sw.ElapsedMilliseconds)));
  finally
    a.Free;
  end;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
   vclunzip1.UnZip;
end;

procedure TForm6.XmlProgress(Sender: TObject; Position: Int64);
begin
   if (position = myposition) then
   begin
      myposition := myposition + myposition;
      showmessage(inttostr(Position));
   end;
end;

end.

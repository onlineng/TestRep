unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MSXML2_TLB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, MemDS, VirtualTable, DALoader, MyLoader, DBAccess,
  MyAccess, MyServerControl, Datasnap.DBClient;

type
  TForm5 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
    doc: IXMLDOMDocument;
    node : IXMLDomNode;
    mm: TStringList;
    myfile:TextFile;
    a:widestring;
begin
   a:='';
    mm := TStringList.Create;
    mm.Sorted := false;
    mm.Capacity := 15000;
    doc :=  CoDOMDocument60.Create;
    doc.async := True;
    doc.resolveExternals := false;
  //  Doc.setProperty('SelectionLanguage', 'XPath');
    doc.validateOnParse := false;
    doc.load('c:\l.xml');
    if doc.parseError.errorCode <> 0 then
       raise Exception.Create('XML Load error:' + doc.parseError.reason);
    node := doc.documentElement.firstChild;
  //  myquery1.SQL.Text := 'delete from opp.mylekari';
  //  myquery1.Execute;
    clientdataset1.LoadFromFile('c:\l.xml');
    clientdataset1.Active := true;
    assignfile(myfile,'c:\peca.txt');
    rewrite(myfile);
    while node<>nil do begin
      if (node.nodeName='LekarIDBroj') then
      begin
{          virtualtable1.Append;
          VirtualTable1.Fields[0].Value := strtoint(node.childNodes.item[0].text);
          VirtualTable1.Fields[1].Value := node.childNodes.item[1].text;}

{          myquery1.SQL.Text := 'insert into opp.mylekari set tip='+node.childNodes.item[0].text+',naziv='''+node.childNodes.item[1].text+'''';
          myquery1.Execute;}

//          writeln(myfile,node.childNodes.item[0].text+','+node.childNodes.item[1].text);
         a:=node.text;
      end;
      node := node.nextSibling;
    end;
//    virtualtable1.Post;
//    datasource1.DataSet := VirtualTable1;
    closefile(myfile);
end;

end.

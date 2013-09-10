unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, dxLayoutContainer, cxGridLayoutView,
  cxGridCustomTableView, cxGridDBLayoutView, cxGridCustomLayoutView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxImage, dxmdaset;

type
  TForm3 = class(TForm)
    MyConnection1: TMyConnection;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1LayoutView1Group_Root: TdxLayoutGroup;
    cxGrid1LayoutView1: TcxGridLayoutView;
    cxGrid1DBLayoutView1Group_Root: TdxLayoutGroup;
    cxGrid1DBLayoutView1: TcxGridDBLayoutView;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxMemData1: TdxMemData;
    dxMemData1ime: TStringField;
    dxMemData1prezime: TStringField;
    cxGrid1DBLayoutView1LayoutItem1: TcxGridLayoutItem;
    cxGrid1DBLayoutView1RecId: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem2: TcxGridLayoutItem;
    cxGrid1DBLayoutView1ime: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem3: TcxGridLayoutItem;
    cxGrid1DBLayoutView1prezime: TcxGridDBLayoutViewItem;
    dxMemData1asd: TGraphicField;
    cxGrid1DBLayoutView1LayoutItem4: TcxGridLayoutItem;
    cxGrid1DBLayoutView1asd: TcxGridDBLayoutViewItem;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
   dxmemdata1.Open;
   dxmemdata1.Append;
   dxmemdata1ime.Value := '1peca';
   dxmemdata1prezime.Value := '1peca';
   dxmemdata1.Post;
   dxmemdata1.Append;
   dxmemdata1ime.Value := '2peca';
   dxmemdata1prezime.Value := '1peca';
   dxmemdata1.Post;
   dxmemdata1.Append;
   dxmemdata1ime.Value := '3peca';
   dxmemdata1prezime.Value := '1peca';
   dxmemdata1.Post;
end;

end.

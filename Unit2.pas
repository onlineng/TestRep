unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, shellapi, Vcl.StdCtrls;
  
  //Da vidimo kako radi edit ovoga

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
   ShellExecute(0, 'OPEN', 'http://stackoverflow.com/questions/7443264/how-to-open-an-url-with-the-default-browser-with-firemonkey-cross-platform-applic', '', '', SW_SHOWNORMAL);
end;

end.

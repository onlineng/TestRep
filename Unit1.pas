unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons;

type
  TForm1 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CMDialogKey(var Message: TCMDialogKey);message CM_DIALOGKEY;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CMDialogKey(var Message : TCMDialogKey);
var
  mycontrol : TWinControl;
  handled : boolean;
  jeshift:integer;
  State: TKeyboardState;
begin
  if Message.CharCode = VK_RETURN then
  begin
    jeshift := 0;
    GetKeyboardState(State);
    if ((State[vk_Shift] and 128)<>0) then
       jeshift := 1;
    handled := true;
    mycontrol := getparentform(self).ActiveControl;
    if ((mycontrol is tcxbutton) or (mycontrol is tbutton)) then
    begin
       Message.Result := 2;
    end;
    while (mycontrol.HasParent and handled) do
    begin
      if mycontrol.Parent=self then
      begin
         if self.HasParent then
            PostMessage(application.MainForm.Handle, WM_NEXTDLGCTL,  jeshift,0)
         else
            PostMessage(self.Handle, WM_NEXTDLGCTL, jeshift,0);
         Message.Result := 0;
         handled := false;
      end
      else
         mycontrol := mycontrol.Parent;
      end;
  end
  else
    inherited;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
  showmessage('pretisniuto');
end;

end.

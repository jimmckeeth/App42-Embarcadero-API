unit UserSample;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, IPPeerClient, REST.Backend.ServiceTypes, REST.Backend.MetaTypes,
  System.JSON, REST.Backend.App42Services, REST.Backend.Providers,
  REST.Backend.ServiceComponents, REST.Backend.App42Provider;

type
  TForm2 = class(TForm)
    SignUp: TButton;
    Edit1: TEdit;
    LogIn: TButton;
    Query: TButton;
    BackendUsers1: TBackendUsers;
    Button1: TButton;
    App42Provider1: TApp42Provider;

    procedure SignUpClick(Sender: TObject);
    procedure LogInClick(Sender: TObject);
    procedure QueryClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LUserName: string;
  end;

var
  Form2: TForm2;
 
implementation

{$R *.fmx}
    uses StorageForm;

procedure TForm2.SignUpClick(Sender: TObject);
var
  LUser: TBackendEntityValue;
 begin
  LUserName := 'Elmo --'+ TimeToStr(Time);
  BackendUsers1.Users.SignUpUser(LUserName, 'password', nil, LUser);
  Edit1.Text := LUser.UserName;
  ShowMessage('User ' + LUser.UserName + ' Is Created Successfully');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   Form2.Hide;
   Form1.Show;
end;

procedure TForm2.LogInClick(Sender: TObject);
var
  LLogin: TBackendEntityValue;
 begin
  BackendUsers1.Users.LoginUser(LUserName,'password', LLogin);
  Edit1.Text := 'UserName Logged in : ' + LLogin.UserName;
  ShowMessage('User ' + LLogin.UserName + ' Is LoggedIn Successfully');
end;


procedure TForm2.QueryClick(Sender: TObject);
var
LUser: TBackendEntityValue;
begin
 BackendUsers1.Users.QueryUserName(LUserName, LUser);
 ShowMessage('User ' + LUser.UserName + ' Found.');
end;

end.

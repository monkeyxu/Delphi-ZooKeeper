unit ZookeeperMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uZooKeeper;

var
  clientId: pclientid_t;
  zkconnection: pzhandle_t;
{$R *.dfm}

procedure watch(zh: pzhandle_t; &type: Integer; state: Integer; path: PAnsiChar; watcherCtx: Pointer); cdecl;
begin
  OutputDebugString('watch, adf;lj');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  New(clientId);
  clientId.client_id := 0;
  zkconnection := zookeeper_init(PAnsiChar('10.199.132.234:2181'), watch, 30000, clientId, 0, 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  zoo_set(zkconnection, '/dubbo', '1', 1, StrToInt(Edit1.Text));
end;

end.

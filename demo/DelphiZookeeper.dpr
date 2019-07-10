program DelphiZookeeper;

uses
  Vcl.Forms,
  ZookeeperMain in 'ZookeeperMain.pas' {Form1},
  uZooKeeper in '..\uZooKeeper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

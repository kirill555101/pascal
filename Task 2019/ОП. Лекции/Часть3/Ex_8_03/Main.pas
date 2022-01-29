unit Main;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    Image: TImage;
    BeginButton: TButton;
    EndButton: TButton;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure BeginButtonClick(Sender: TObject);
    procedure EndButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Figure;

{$R *.lfm}
Var
    t:single=0.0;
    L:TLine;
    S:TSquare;
    C:TCircle;

procedure TMainForm.FormActivate(Sender: TObject);
begin
   Image.Canvas.Brush.Color:=clWhite;
   Image.Canvas.FillRect(0,0,Width,Height);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
        L.Move(t);
        S.Move(-0.2*t);
        C.Move(0.5*t);
        t:=t+0.5;
end;

procedure TMainForm.BeginButtonClick(Sender: TObject);
begin
   L:=TLine.Create(60,100,50,Image);
   S:=TSquare.Create(180,100,50,Image);
   C:=TCircle.Create(300,100,50,10,Image);
   Timer1.Enabled:=true;
end;

procedure TMainForm.EndButtonClick(Sender: TObject);
begin
   Close;
end;

initialization

finalization
   L.Free;
   S.Free;
   C.Free;

end.

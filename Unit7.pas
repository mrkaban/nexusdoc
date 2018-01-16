unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ExtCtrls;

type
  TForm_Save_Dir = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    Panel3: TPanel;
    Button2: TButton;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Save_Dir: TForm_Save_Dir;

implementation

{$R *.dfm}

procedure TForm_Save_Dir.DriveComboBox1Change(Sender: TObject);
begin
 DirectoryListBox1.Drive := DriveComboBox1.Drive;
end;

procedure TForm_Save_Dir.Button2Click(Sender: TObject);
begin
 Form_Save_Dir.Close; // Закрыть форму
end;

procedure TForm_Save_Dir.FormResize(Sender: TObject);
begin
  button2.Left:=(panel3.Width-button2.Width) div 2;
end;

end.

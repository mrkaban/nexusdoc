unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FileCtrl, StdCtrls, ExtCtrls;

type
  TForm_Add_Shablon = class(TForm)
    Vibr_files: TListBox;
    Panel1: TPanel;
    Label3: TLabel;
    DriveComboBox1: TDriveComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    Panel4: TPanel;
    Button2: TButton;
    Button1: TButton;
    Panel5: TPanel;
    Button3: TButton;
    Label4: TLabel;
    MBEdit: TEdit;
    Vibr_MB: TListBox;
    Label5: TLabel;
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Add_Shablon: TForm_Add_Shablon;

implementation

{$R *.dfm}
uses unit1;

procedure TForm_Add_Shablon.DirectoryListBox1Change(Sender: TObject);
begin
 FileListBox1.Directory:=DirectoryListBox1.Directory;
end;

procedure TForm_Add_Shablon.Button2Click(Sender: TObject);
var
 full_path:string;
begin
 full_path:=FileListBox1.FileName;
 if MBedit.Text<>'' then
                     begin
                      Vibr_MB.Items.Add(MBEdit.Text);
                      Vibr_files.Items.Add(full_path);
                      MBEdit.Clear;
                     end
                    else showmessage ('������� ��') ;
end;

procedure TForm_Add_Shablon.Button1Click(Sender: TObject);
begin
 Vibr_MB.Items.Delete(Vibr_files.ItemIndex);
 Vibr_files.Items.Delete(Vibr_files.ItemIndex);
end;

procedure TForm_Add_Shablon.DriveComboBox1Change(Sender: TObject);
begin
 DirectoryListBox1.Drive := DriveComboBox1.Drive;
end;

procedure TForm_Add_Shablon.Button3Click(Sender: TObject);
var
 i:integer; // ���������� �����
begin
 Form_Add_Shablon.Close; // ������� �����
 Main_form.Vibr_files.Items.Clear;

end;

end.

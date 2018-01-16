unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_New_Key = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Key_Label: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Naim_Edit: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Button1: TButton;
    Primer: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_New_Key: TForm_New_Key;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm_New_Key.Button1Click(Sender: TObject);
begin
 Form_New_Key.Close;
end;

procedure TForm_New_Key.FormCreate(Sender: TObject);
begin
 label1.Width:=Form_New_Key.Width;
 Naim_Edit.Width:=Form_New_Key.Width-190; // Изменение ширины поля наименования ключа
 Primer.Width:=Form_New_Key.Width-190; // Изменение ширины поля примера ключа
 button1.Left:=(Form_New_Key.Width-button1.Width) div 2; // Левое положение кнопки Добавить
end;

procedure TForm_New_Key.FormResize(Sender: TObject);
begin
 label1.Width:=Form_New_Key.Width;
 Naim_Edit.Width:=Form_New_Key.Width-190; // Изменение ширины поля наименования ключа
 Primer.Width:=Form_New_Key.Width-190; // Изменение ширины поля примера ключа
 button1.Left:=(Form_New_Key.Width-button1.Width) div 2; // Левое положение кнопки Добавить
end;

end.

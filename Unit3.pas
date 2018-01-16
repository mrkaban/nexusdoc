unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm_Redakt_keys = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Keys: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    Key_Label: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Naim_Edit: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Primer: TMemo;
    Panel6: TPanel;
    Button1: TButton;
    procedure KeysChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Redakt_keys: TForm_Redakt_keys;
  i:integer;
//  section: string; // Наименование секции

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm_Redakt_keys.KeysChange(Sender: TObject);
var
 kol_variant: integer; // Количество вариантов
 kv: integer; // Переменная цикла;
begin
 // Form1.chenie_INI(Max_Nomer);

 for i:=1 to Max_Nomer do
   begin
    section:='$'+inttostr(i)+'$';
    if (Naim[i]=Keys.Text) then
                                      begin
                                       primer.Clear; // Очистка поля вариантов
                                       Key_Label.Caption:=Kod_param[i];
                                       Naim_Edit.Text:=Naim[i];
                                       kol_variant:=ini.ReadInteger(section,'Количество_вариантов',0);
                                       for kv:=1 to kol_variant do
                                        primer.Lines.Add(ini.ReadString(section,'Вариант'+inttostr(kv),''));
                                      end;
  end;
end;

procedure TForm_Redakt_keys.Button1Click(Sender: TObject);
begin
 Form_Redakt_keys.Close;
end;

procedure TForm_Redakt_keys.FormCreate(Sender: TObject);
begin
  keys.Width:=Form_Redakt_keys.Width-350; // Изменение ширины списка выбора ключа
  Naim_Edit.Width:=Form_Redakt_keys.Width-190; // Изменение ширины поля наименования ключа
//  Primer_Edit.Width:=Form_Redakt_keys.Width-190; // Изменение ширины поля примера ключа
  button1.Left:=(Form_Redakt_keys.Width-button1.Width) div 2; // Левое положение кнопки Заменить
end;

procedure TForm_Redakt_keys.FormResize(Sender: TObject);
begin
  keys.Width:=Form_Redakt_keys.Width-350; // Изменение ширины списка выбора ключа
  Naim_Edit.Width:=Form_Redakt_keys.Width-190; // Изменение ширины поля наименования ключа
//  Primer_Edit.Width:=Form_Redakt_keys.Width-190; // Изменение ширины поля примера ключа
  button1.Left:=(Form_Redakt_keys.Width-button1.Width) div 2; // Левое положение кнопки Заменить
end;

end.

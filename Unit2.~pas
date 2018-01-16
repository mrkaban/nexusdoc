unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls;

type
  TForm_Zamens = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Zamens: TForm_Zamens;
  Label_New: TLabel; // Создаваемая метка
  Combobox_New: TCombobox; // Создаваемый выпадающий список

implementation

{$R *.dfm}
uses unit1,unit3;

procedure TForm_Zamens.Button1Click(Sender: TObject);
begin
 Form_Zamens.close; // Закрыть форму замен
end;

procedure TForm_Zamens.FormCreate(Sender: TObject);
var
 np:integer;
 n_str: integer;
 kol: integer; // Переменная цикла по количеству вариантов
 kol_var: integer; // Количество вариантов
begin
 label1.Width:=Form_Zamens.Width-11; // Ширина метки Заполните параметры замен
{ sg.Width:=Form_Zamens.Width-10; // Ширина таблицы ввода замен
 sg.DefaultColWidth:=(sg.Width - 15) div 4; // Определение ширины столбца}
 button1.Left:=(Form_Zamens.Width-button1.Width) div 2; // Левое положение кнопки Выполнить замены

 n_str:=0;
 for np:=1 to Max_Nomer do // Цикл до максимального номера
  begin
   section:='$'+inttostr(np)+'$'; // Получение имени секции
   if (ini.SectionExists(section)) then // Если секция существует
    begin
     Label_New:=TLabel.Create(Self);
     n_str:=n_str+1;
     With Label_New do
      begin
       Parent:=ScrollBox1;
       Left:=10;
       Top:=n_str*30;
       width:=100;
       height:=20;
       font.Size:=10;
       font.Style:=[fsbold];
       Name:='Nazv'+inttostr(np);
       Caption:=ini.ReadString(section,'Наименование','');//Naim[np];
      end;

     Combobox_New:=TComboBox.Create(Self);
     With Combobox_New do
      begin
       Parent:=ScrollBox1;
       Left:=300;
       Top:=n_str*30;
       width:=400;
       height:=20;
       font.Size:=10;
       font.Style:=[fsbold];
       Name:='Vibor'+inttostr(np);
       Text:='';
       kol_var:=ini.ReadInteger(section,'Количество_вариантов',0);
       for kol:=1 to kol_var do
        begin
         Items.Add(ini.ReadString(section,'Вариант'+inttostr(kol),''));
        end;
      end;



     end;
 {  if (ini.SectionExists(section)) then // Если секция существует
                                    begin
                                     Kolvo_param:=Kolvo_param+1; // Увеличение счетчика параметров
                                     // Вывод параметров секции
                                     Kod_param[i]:=section;
                                     Naim[i]:=ini.ReadString(section,'Наименование','');
                                     Sort_Naim[Kolvo_param]:=Naim[i];
                                     Primer[i]:=ini.ReadString(section,'Пример','');
                                     Label_New:=TLabel.Create(Self);

                                    end; }
  end;

end;

procedure TForm_Zamens.FormResize(Sender: TObject);
begin
{ sg.DefaultColWidth:=(sg.Width) div 4;}
 Label1.Width:=Form_Zamens.Width;
 button1.Left:=(Form_Zamens.Width-button1.Width-10) div 2; // Левое положение кнопки Выполнить замены
end;

procedure TForm_Zamens.FormActivate(Sender: TObject);
{var
 np:integer;
 n_str: integer;
 kol: integer; // Переменная цикла по количеству вариантов
 kol_var: integer; // Количество вариантов}
begin
{ n_str:=0;
 for np:=1 to Max_Nomer do // Цикл до максимального номера
  begin
   section:='$'+inttostr(np)+'$'; // Получение имени секции
   if (ini.SectionExists(section)) then // Если секция существует
    begin
     Label_New:=TLabel.Create(Self);
     n_str:=n_str+1;
     With Label_New do
      begin
       Parent:=ScrollBox1;
       Left:=10;
       Top:=n_str*30;
       width:=100;
       height:=20;
       font.Size:=10;
       font.Style:=[fsbold];
       Name:='Nazv'+inttostr(np);
       Caption:=Naim[np];
      end;

     Combobox_New:=TComboBox.Create(Self);
     With Combobox_New do
      begin
       Parent:=ScrollBox1;
       Left:=300;
       Top:=n_str*30;
       width:=400;
       height:=20;
       font.Size:=10;
       font.Style:=[fsbold];
       Name:='Vibor'+inttostr(np);
       Text:='';
       kol_var:=ini.ReadInteger(section,'Количество_вариантов',0);
       for kol:=1 to kol_var do
        begin
         Items.Add(ini.ReadString(section,'Вариант'+inttostr(kol),''));
        end;
      end;



     end;
 {  if (ini.SectionExists(section)) then // Если секция существует
                                    begin
                                     Kolvo_param:=Kolvo_param+1; // Увеличение счетчика параметров
                                     // Вывод параметров секции
                                     Kod_param[i]:=section;
                                     Naim[i]:=ini.ReadString(section,'Наименование','');
                                     Sort_Naim[Kolvo_param]:=Naim[i];
                                     Primer[i]:=ini.ReadString(section,'Пример','');
                                     Label_New:=TLabel.Create(Self);

                                    end; 
  end;  }
end;

end.

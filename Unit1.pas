unit Unit1;

interface

uses                               
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ComCtrls, ImgList, ToolWin, ComObj, IniFiles,
  Menus, ExtCtrls, OleCtnrs;

type
  TMain_Form = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    OD: TOpenDialog;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    SD: TSaveDialog;
    PD: TPrintDialog;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    PoluchText: TOleContainer;
    ToolBar2: TToolBar;
    Label2: TLabel;
    Vibr_files: TComboBox;
    ToolBar4: TToolBar;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Vibr_filesChange(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N11Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }

   function poisk(var podstroka: string): boolean; // Поиск подстроки
   procedure search(S,S1:string);

  public
    { Public declarations }
    procedure chenie_INI(var Max_Nom: integer); // Чтение из INI файла
  end;

var
  Main_Form: TMain_Form;
  Path:String; // Переменная, где будет храниться путь к программе
  Ini: TIniFile; // Переменная инициализационного файла
  section: string; // Наименование секции
  Ish_Stroka: AnsiString; // Исходная строка
  Zam_slovo: AnsiString; // Заменяемое слово
  New_slovo: AnsiString; // Новое слово
  Poluch_Stroka: AnsiString; // Полученная строка
  Max_Nomer: integer; // Максимальный номер имеющихся параметров
  Kolvo_param: integer; // Количество параметров для заполнения
  Nomer_param: integer; // Номер выводимого параметра
  Kod_param: array[1..100] of string; // Коды параметров
  Naim: array[1..100] of string; // Наименования параметров
  Sort_Naim: array[1..100] of string; // Отсортированные наименования параметров
  Primer: array[1..100] of string; // Примеры параметров
  Znach: array[1..100] of string; //  Значения параметров
  Nomer_stroki: integer; // Переменная цикла по строкам
  Full_File_names: array[1..100] of string; // Полные пути и имена файлов открываемых шаблонов
  New_File_names: array[1..100] of string; // Имена файлов для сохранения
  Kol_files: integer; // Количество выбранных файлов-шаблонов
  MB: array[1..100] of string; // Номера МБ каждого документа

implementation

{$R *.dfm}
uses unit2,unit3, unit4, unit5, unit6, unit7, Unit8;

procedure TMain_Form.search(S,S1:string); // Процедура замены подстроки
var str:string;
    i,index:integer;
begin
{for i:=0 to Main_Form.PoluchText.Lines.Count-1 do // Цикл по количеству строк
 begin
 str:=Main_Form.PoluchText.Lines.Strings[i]; // Выделение очередной строки
 while pos(S,str)<>0 do // Проверка всех вхождений подстроки в строкку
  begin
  index:=pos(S,str); // Позиция начала вхождения искомого фрагмента в строку
  delete(str,index,length(S)); // Удаление заменяемой подстроки
  insert(S1,str,index); // Встаава новой подстроки
  end;
 Main_Form.PoluchText.Lines.Strings[i]:=str; // Вывод строки с заменами
 end;}
end;

procedure TMain_Form.chenie_INI(var Max_Nom: integer); // Чтение из INI-файла
var
 i,j: integer; // Переменные цикла
 k:string; // Временная переменная для сортировки
begin
 Kolvo_param:=0; // Обнуление количества используемых параметров
 Form_Redakt_keys.Keys.Clear; // Очистка выпадающего списка ключей
 for i:=1 to Max_Nom do // Цикл до максимального номера
  begin
   section:='$'+inttostr(i)+'$'; // Получение имени секции
   if (ini.SectionExists(section)) then // Если секция существует
                                    begin
                                     Kolvo_param:=Kolvo_param+1; // Увеличение счетчика параметров
                                     // Вывод параметров секции
                                     Kod_param[i]:=section;
                                     Naim[i]:=ini.ReadString(section,'Наименование','');
                                     Sort_Naim[Kolvo_param]:=Naim[i];
                                     Primer[i]:=ini.ReadString(section,'Пример','');
//                                     form3.Keys.Items.Add(Naim[i]);
                                    end;
  end;

  // Сортировка наименований ключей для вывода в выпадающем списке
  for i := 1 to Kolvo_param-1 do
        for j := 1 to Kolvo_param-i do
            if Sort_Naim[j] > Sort_Naim[j+1] then begin
                k := Sort_Naim[j];
                Sort_Naim[j] := Sort_Naim[j+1];
                Sort_Naim[j+1] := k
            end;
  // Вывод параметров в выпадающей список на форме редактирования ключей (Form3)
  Form_Redakt_keys.Keys.Clear; // Очистка выпадающего списка выбора реадктируемых параметров
  Form_New_Shablon.Parametrs.Clear;  // Очистка выпадающего списка выбора редактируемых параметров
  for i := 1 to Kolvo_param do
   begin
    Form_Redakt_keys.Keys.Items.Add(Sort_Naim[i]); // Вывод редактируемых параметров в выпадающий список
    Form_New_Shablon.Parametrs.Items.Add(Sort_Naim[i]); // Вывод редактируемых параметров в выпадающий список
   end;
end;

function TMain_Form.poisk(var podstroka: string): boolean; // Поиск подстроки
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
{   with IshText do
   begin
    StartPos := 0;
    ToEnd := Length(Text) - StartPos;
    FoundAt := FindText(podstroka, StartPos, ToEnd, [stWholeWord]);
    if FoundAt <> -1 then poisk:=true
                     else  poisk:=false;
    end;}
end;

procedure TMain_Form.ToolButton1Click(Sender: TObject); // Кнопка Открыть шаблон
var
 COM_Word: variant;
 i,n: integer; // Переменные циклов
 kolontitul: string; // Строка колонтитула
// section: string; // Наименование секции

begin

 Vibr_files.Clear;
 Form_Add_Shablon.Vibr_files.Clear;
 Form_Add_Shablon.Vibr_MB.Clear;
 Form_Add_Shablon.ShowModal; // Открытие формы выбора шаблонов
 Kol_files:=0; // Обнуление счетчика выбранных файлов-шаблонов
 for i:=0 to Form_Add_Shablon.Vibr_files.Items.Count-1 do // Цикл по количеству выбранных шаблонов
  begin
   Kol_files:=Kol_files+1;
   Full_File_Names[Kol_files]:=Form_Add_Shablon.Vibr_files.items.Strings[i];
   MB[Kol_files]:=Form_Add_Shablon.Vibr_MB.items.Strings[i];
   Vibr_files.Items.Add(Form_Add_Shablon.Vibr_files.items.Strings[i]);
 //  IshText.Lines.Add(File_Names[i+1]);
  end;

 Nomer_param:=0; // Обнуление счетчика параметров
 // Вывод заголовков столбцов таблицы
{ Form_Zamens.sg.Cells[0,0]:='Код';
 Form_Zamens.sg.Cells[1,0]:='Наименование';
 Form_Zamens.sg.Cells[2,0]:='Пример';
 Form_Zamens.sg.Cells[3,0]:='Введите значение';}

 Main_Form.chenie_INI(Max_Nomer); // Чтение параметров из инициализационного файла

 for i:=1 to Max_Nomer do // Цикл до максимального номера секции
   begin
    section:='$'+inttostr(i)+'$'; // Получение имени секции
    if (ini.SectionExists(section)) then // Проверка существования секции
                                      begin
                                       Nomer_param:=Nomer_param+1; // Увеличение счетчика испоьзуеых параметровв
{                                       Form_Zamens.sg.Cells[0,Nomer_param]:=Kod_param[i]; // Вывод кода очередного параметра
                                       Form_Zamens.sg.Cells[1,Nomer_param]:=Naim[i]; // Вывод наименования очередного параметра
                                       Form_Zamens.sg.Cells[2,Nomer_param]:=Primer[i]; // Вывод примера очередного параметра}
                                      end;
  end;
  Form_Zamens.ShowModal; // Открыть форму задания параметров замен
{ Form_Zamens.sg.RowCount:=Nomer_param+1; // Задание количества строк сетки вывода параметров}
{ Form_Zamens.ShowModal; // Открыть форму задания параметров замен
 for n:=1 to Max_Nomer do // Цикл по количеству используемых параметров
  for i:=0 to form_Zamens.ScrollBox1.ComponentCount-1 do
   if ((Form_Zamens.ScrollBox1.Components[i] As TComboBox).Name='Vibor'+inttostr(n)) then
           znach[n]:=((Form_Zamens.ScrollBox1.Components[i] As TComboBox).Text);//Form_Zamens.ScrollBox1.Components[i]}

 for n:=1 to Max_Nomer do
  begin
   znach[n]:=TComboBox(Form_Zamens.FindComponent('Vibor'+IntToStr(n))).Text;
//   IshText.Lines.Add(znach[n]);
  end;

{ for n:=1 to Nomer_param do // Цикл по количеству используемых параметров
  znach[n]:=Form_Zamens.sg.Cells[2,n]; // Чтение введенных значений замен}
 Form_Save_Dir.ShowModal; // Открыть форму выбора каталога для сохранения

  COM_Word:=CreateOleObject('Word.Application');

 for i:=1 to Kol_files do // Цикл по количеству выбранных шаблонов
  begin
 {  MB[i]:=Form_Add_Shablon.Vibr_MB.Items[i-1];
   progressbar1.Position:=Round(100*i/Kol_files); // Вывод ProgressBar
   IshText.Clear; // Очистка поля исходного шаблона
   PoluchText.Clear; // Очистка поля полученного документа
   COM_Word := CreateOLEObject('Word.Application'); // Создание объекта Word
    COM_Word.Visible := False; // Скрытие окна Word
    COM_Word.Documents.Open(Full_File_Names[i]); // Открытие выбранного файла-шаблона
    Com_Word.ActiveDocument.Select; // Выделение всего текста файла-шаблона
    COM_Word.Selection.Copy; // Копирование в буфер обмена выделенного шаблона
    IshText.PasteFromClipboard; // Вставка текста из буфера обмена как исходный текст

    PoluchText.PasteFromClipboard; // Вставка текста из буфера обмена как редактируемый текст

    COM_Word.DisplayAlerts := False; // Запрет вывода сообщений
    COM_Word.Quit; // Закрытие Word
  // PoluchText.Lines.Insert(0, MB[i]);// Вывод номера МБ
   for n:=1 to Max_Nomer do // Цикл по количеству используемых параметров
    Main_Form.search(Kod_param[n],znach[n]); // Выполнение всех замен ключей в исходном шаблоне
   // Получение имени файла для сохранения
   New_File_names[i]:=copy(ExtractFileName(Full_File_Names[i]),1,Length(Full_File_Names[i])-4);
   New_File_names[i]:=Form_Save_Dir.DirectoryListBox1.Directory+'\'+LeftStr(ExtractFileName(Full_File_Names[i]),length(ExtractFileName(Full_File_Names[i]))-4)+' '+DateToStr(Date)+'.doc';
//   New_File_names[i]:=copy(New_File_names[i],1,Length(New_File_names[i])-4)+'.rtf';
//   New_File_names[i]:=LeftStr(New_File_names[i],length(New_File_names[i])-4)+'.doc';
   PoluchText.Lines.SaveToFile(New_File_names[i]); // Сохранение полученного документа
   vrem.Lines.LoadFromFile(New_File_names[i]);
   kolontitul:='МБ: '+MB[i]+'                                                     \chpgn';
   vrem.Lines.Insert(vrem.Lines.Count-1,'\footer\pard\ql\brdrt\brdrs\brdrw10\brsp100\fs20'+kolontitul+'\par');
   vrem.Lines.SaveToFile(New_File_names[i]);}

     progressbar1.Position:=Round(100*i/Kol_files); // Вывод ProgressBar
     COM_Word.visible:=true;
//     COM_Word.Documents.Add;
     COM_Word.Documents.open(Full_File_Names[i]);
   for n:=1 to Max_Nomer do // Цикл по количеству используемых параметров
    begin
     COM_Word.Selection.Find.MatchSoundsLike := False;
     COM_Word.Selection.Find.MatchAllWordForms := False;
     COM_Word.Selection.Find.MatchWholeWord := False;
     COM_Word.Selection.Find.Format := False;
     COM_Word.Selection.Find.Forward := True;
     COM_Word.Selection.Find.ClearFormatting;
     COM_Word.Selection.Find.Text:=Kod_param[n];
     COM_Word.Selection.Find.Replacement.Text:=znach[n];
     COM_Word.Selection.Find.Execute(Replace:=2);
//  FindAndReplace:=
    end;

// Вставка МБ
//  COM_Word.ActiveDocument.Sections.Item(1).footers.Item(1).range.Text:='МБ: '+inttostr(i); // отккрываем нижний колонтитул
   COM_Word.ActiveDocument.Sections.Item(1).footers.Item(1).range.Text:='МБ: '+MB[i]; // отккрываем нижний колонтитул
//With WA.Selection.Find

 {                   .Text = FindText
                    .Replacement.Text = ReplaceText
                    .Forward = True
                    .Wrap = 1
                    .Format = False: .MatchCase = False
                    .MatchWholeWord = False
                    .MatchWildcards = False
                    .MatchSoundsLike = False
                    .MatchAllWordForms = False
                    .Execute Replace:=2

   COM_Word.ActiveWindow.ActivePane.View.SeekView = 0 ' вернуться в тело документа}
     New_File_names[i]:=copy(ExtractFileName(Full_File_Names[i]),1,Length(Full_File_Names[i])-4);
     New_File_names[i]:=Form_Save_Dir.DirectoryListBox1.Directory+'\'+LeftStr(ExtractFileName(Full_File_Names[i]),length(ExtractFileName(Full_File_Names[i]))-4)+' '+DateToStr(Date)+'.doc';

     COM_Word.ActiveDocument.SaveAs(New_File_names[i]);
     COM_Word.ActiveDocument.close;

  end;
{   IshText.DestroyObject();
 IshText.CreateObjectFromFile(Full_File_Names[Kol_files], False);
 IshText.Run();
 IshText.DoVerb(ovShow);}

 PoluchText.DestroyObject();
 PoluchText.CreateObjectFromFile(New_File_Names[Kol_files], False);
 PoluchText.Run();
 PoluchText.DoVerb(ovShow);

 COM_Word.quit;
end;

procedure TMain_Form.FormCreate(Sender: TObject);
 // При создании формы Form1
begin
 Path:=Application.ExeName; // полный путь и название запущенной программы
 Path:=ExtractFileDir(Path); // отбрасываем название программы. Остается путь.
 if Path[Length(Path)]<>'\' then Path:=Path+'\'; // если последний символ не \ то добавить его
 Ini:=TIniFile.Create(Path+'nastroik.ini'); // полный путь к программе и имя ini файла
 Max_Nomer:=Ini.ReadInteger('COMMON','Макс_номер',0);
// IshText.Width:=Main_Form.Width-50; // Изменение ширины поля вывода исходного текста
 PoluchText.Width:=Main_Form.Width-50; // Изменение ширины поля полученного текста
 Vibr_files.Width:=Main_Form.Width-345; // Изменение ширины списка выбора документа
 ProgressBar1.Width:=Main_Form.Width-384; // Изменение ширины ProgressBar

end;

procedure TMain_Form.ToolButton2Click(Sender: TObject); // Сохранение полученного текста
begin
  //   if sd.Execute then PoluchText.Lines.SaveToFile(SD.FileName);
  PoluchText.OleObject.SaveAs(New_File_Names[Vibr_files.ItemIndex+1], False)
end;

procedure TMain_Form.ToolButton3Click(Sender: TObject); // Распечатка полученного текста
begin
 if PD.Execute then PoluchText.OleObject.PrintOut;
end;

procedure TMain_Form.ToolButton5Click(Sender: TObject); // Редактирование файла настроек
var
 ks:integer; // Количество вариантов
 variant:string;
begin
 Main_Form.chenie_INI(Max_Nomer); // Чтение параметров из инициализационного файла
 Form_Redakt_keys.Key_Label.Caption:=''; //  Очистка ключа
 Form_Redakt_keys.Naim_Edit.Clear; // Очистка поля Наименование
 Form_Redakt_keys.Primer.Clear; // Очистка многострочного списка вариантов
 Form_Redakt_keys.ShowModal; // Открытие формы редактирования ключей замен
 section:=Form_Redakt_keys.Key_Label.Caption; // Имя секции
 if Form_Redakt_keys.Keys.Text<>'' then
   begin
    ini.EraseSection(section); // Удалить всю секцию   
    ini.WriteString(section,'Наименование',Form_Redakt_Keys.Naim_Edit.Text);
    ini.WriteInteger(section,'Количество_вариантов',Form_Redakt_Keys.Primer.Lines.Count);
    for ks:=1 to Form_Redakt_Keys.Primer.Lines.Count do
     begin
      variant:='Вариант'+inttostr(ks);
      ini.WriteString(section,variant,Form_Redakt_Keys.Primer.Lines[ks-1]);
     end;
    end;
// ini.WriteString(section,'Наименование',Form_Redakt_keys.Naim_Edit.Text); // Запись наименования нового ключа
// ini.WriteString(section,'Пример',Form_Redakt_keys.Primer_Edit.Text); // Запись примера нового ключа
end;

procedure TMain_Form.ToolButton6Click(Sender: TObject); // Добавление нового ключа
var
 ks: integer; // Количество добавляемых вариантов
 variant: string;
begin
 Form_New_Key.Naim_Edit.Clear; // Очистить поле Наименование
 Form_New_Key.Primer.Clear; // Очистить варианты
 Form_New_Key.Key_Label.Caption:='$'+inttostr(Max_Nomer+1)+'$'; // Вывод нового ключа
 Form_New_Key.ShowModal; // Открытие формы ввода параметров нового ключа
 section:='$'+inttostr(Max_Nomer+1)+'$'; // Получение имени секции
 // Если наименование и пример нового параметра не пусты
  if ((Form_New_Key.Naim_Edit.Text<>'') and (Form_New_Key.Primer.Text<>'')) then
   begin
    Max_Nomer:=Max_Nomer+1; // Увеличить максимальный номер
    ini.WriteInteger('COMMON','Макс_номер',Max_Nomer);
    ini.WriteString(section,'Наименование',Form_New_Key.Naim_Edit.Text);
    ini.WriteInteger(section,'Количество_вариантов',Form_New_Key.Primer.Lines.Count);
    for ks:=1 to Form_New_Key.Primer.Lines.Count do
     begin
      variant:='Вариант'+inttostr(ks);
      ini.WriteString(section,variant,Form_New_Key.Primer.Lines[ks-1]);
     end;
   end;
end;

procedure TMain_Form.FormResize(Sender: TObject);
begin
// IshText.Width:=Main_Form.Width-50; // Изменение ширины поля вывода исходного текста
 PoluchText.Width:=Main_Form.Width-50; // Изменение ширины поля полученного текста
 Vibr_files.Width:=Main_Form.Width-345; // Изменение ширины списка выбора документа
 ProgressBar1.Width:=Main_Form.Width-384; // Изменение ширины ProgressBar
end;

procedure TMain_Form.N10Click(Sender: TObject);
begin
 // Создать новый шаблон
 Form_New_Shablon.Show;
    Form_New_Shablon.re.DestroyObject();
    Form_New_Shablon.re.CreateObjectFromFile(path+'Пустой.doc', False);
    Form_New_Shablon.re.Run();
    Form_New_Shablon.re.DoVerb(ovShow);
end;

procedure TMain_Form.ToolButton7Click(Sender: TObject);
begin
  Form_Table.ShowModal;
end;

procedure TMain_Form.Vibr_filesChange(Sender: TObject);
begin
{ IshText.Lines.LoadFromFile(Full_File_Names[Vibr_files.ItemIndex+1]);
 PoluchText.Lines.LoadFromFile(New_File_names[Vibr_files.ItemIndex+1]);
 vrem.Lines.LoadFromFile(New_File_names[Vibr_files.ItemIndex+1]);}

{ IshText.DestroyObject();
 IshText.CreateObjectFromFile(Full_File_Names[Vibr_files.ItemIndex+1], False);
 IshText.Run();
 IshText.DoVerb(ovShow);}

 PoluchText.DestroyObject();
 PoluchText.CreateObjectFromFile(New_File_Names[Vibr_files.ItemIndex+1], False);
 PoluchText.Run();
 PoluchText.DoVerb(ovShow);
end;

procedure TMain_Form.N9Click(Sender: TObject);
var
 C_W: variant;
begin
 // Открыть шаблон
 Form_New_Shablon.Show;
 if Form_New_Shablon.od.Execute then //re.Lines.LoadFromFile(od.FileName); // Загрузка выбранного шаблона
   begin
    Form_New_Shablon.re.DestroyObject();
    Form_New_Shablon.re.CreateObjectFromFile(Form_New_Shablon.od.FileName, False);
    Form_New_Shablon.re.Run();
    Form_New_Shablon.re.DoVerb(ovShow);
   end;

end;

procedure TMain_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if MessageDlg('Вы действительно хотите завершить работу?', mtConfirmation,
    [mbOk, mbCancel], 0) = mrCancel then CanClose := False;
end;

procedure TMain_Form.N11Click(Sender: TObject);
begin
 close;
end;

procedure TMain_Form.FormActivate(Sender: TObject);
begin
// N2.Click;
end;

end.

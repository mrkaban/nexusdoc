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

   function poisk(var podstroka: string): boolean; // ����� ���������
   procedure search(S,S1:string);

  public
    { Public declarations }
    procedure chenie_INI(var Max_Nom: integer); // ������ �� INI �����
  end;

var
  Main_Form: TMain_Form;
  Path:String; // ����������, ��� ����� ��������� ���� � ���������
  Ini: TIniFile; // ���������� ������������������ �����
  section: string; // ������������ ������
  Ish_Stroka: AnsiString; // �������� ������
  Zam_slovo: AnsiString; // ���������� �����
  New_slovo: AnsiString; // ����� �����
  Poluch_Stroka: AnsiString; // ���������� ������
  Max_Nomer: integer; // ������������ ����� ��������� ����������
  Kolvo_param: integer; // ���������� ���������� ��� ����������
  Nomer_param: integer; // ����� ���������� ���������
  Kod_param: array[1..100] of string; // ���� ����������
  Naim: array[1..100] of string; // ������������ ����������
  Sort_Naim: array[1..100] of string; // ��������������� ������������ ����������
  Primer: array[1..100] of string; // ������� ����������
  Znach: array[1..100] of string; //  �������� ����������
  Nomer_stroki: integer; // ���������� ����� �� �������
  Full_File_names: array[1..100] of string; // ������ ���� � ����� ������ ����������� ��������
  New_File_names: array[1..100] of string; // ����� ������ ��� ����������
  Kol_files: integer; // ���������� ��������� ������-��������
  MB: array[1..100] of string; // ������ �� ������� ���������

implementation

{$R *.dfm}
uses unit2,unit3, unit4, unit5, unit6, unit7, Unit8;

procedure TMain_Form.search(S,S1:string); // ��������� ������ ���������
var str:string;
    i,index:integer;
begin
{for i:=0 to Main_Form.PoluchText.Lines.Count-1 do // ���� �� ���������� �����
 begin
 str:=Main_Form.PoluchText.Lines.Strings[i]; // ��������� ��������� ������
 while pos(S,str)<>0 do // �������� ���� ��������� ��������� � �������
  begin
  index:=pos(S,str); // ������� ������ ��������� �������� ��������� � ������
  delete(str,index,length(S)); // �������� ���������� ���������
  insert(S1,str,index); // ������� ����� ���������
  end;
 Main_Form.PoluchText.Lines.Strings[i]:=str; // ����� ������ � ��������
 end;}
end;

procedure TMain_Form.chenie_INI(var Max_Nom: integer); // ������ �� INI-�����
var
 i,j: integer; // ���������� �����
 k:string; // ��������� ���������� ��� ����������
begin
 Kolvo_param:=0; // ��������� ���������� ������������ ����������
 Form_Redakt_keys.Keys.Clear; // ������� ����������� ������ ������
 for i:=1 to Max_Nom do // ���� �� ������������� ������
  begin
   section:='$'+inttostr(i)+'$'; // ��������� ����� ������
   if (ini.SectionExists(section)) then // ���� ������ ����������
                                    begin
                                     Kolvo_param:=Kolvo_param+1; // ���������� �������� ����������
                                     // ����� ���������� ������
                                     Kod_param[i]:=section;
                                     Naim[i]:=ini.ReadString(section,'������������','');
                                     Sort_Naim[Kolvo_param]:=Naim[i];
                                     Primer[i]:=ini.ReadString(section,'������','');
//                                     form3.Keys.Items.Add(Naim[i]);
                                    end;
  end;

  // ���������� ������������ ������ ��� ������ � ���������� ������
  for i := 1 to Kolvo_param-1 do
        for j := 1 to Kolvo_param-i do
            if Sort_Naim[j] > Sort_Naim[j+1] then begin
                k := Sort_Naim[j];
                Sort_Naim[j] := Sort_Naim[j+1];
                Sort_Naim[j+1] := k
            end;
  // ����� ���������� � ���������� ������ �� ����� �������������� ������ (Form3)
  Form_Redakt_keys.Keys.Clear; // ������� ����������� ������ ������ ������������� ����������
  Form_New_Shablon.Parametrs.Clear;  // ������� ����������� ������ ������ ������������� ����������
  for i := 1 to Kolvo_param do
   begin
    Form_Redakt_keys.Keys.Items.Add(Sort_Naim[i]); // ����� ������������� ���������� � ���������� ������
    Form_New_Shablon.Parametrs.Items.Add(Sort_Naim[i]); // ����� ������������� ���������� � ���������� ������
   end;
end;

function TMain_Form.poisk(var podstroka: string): boolean; // ����� ���������
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

procedure TMain_Form.ToolButton1Click(Sender: TObject); // ������ ������� ������
var
 COM_Word: variant;
 i,n: integer; // ���������� ������
 kolontitul: string; // ������ �����������
// section: string; // ������������ ������

begin

 Vibr_files.Clear;
 Form_Add_Shablon.Vibr_files.Clear;
 Form_Add_Shablon.Vibr_MB.Clear;
 Form_Add_Shablon.ShowModal; // �������� ����� ������ ��������
 Kol_files:=0; // ��������� �������� ��������� ������-��������
 for i:=0 to Form_Add_Shablon.Vibr_files.Items.Count-1 do // ���� �� ���������� ��������� ��������
  begin
   Kol_files:=Kol_files+1;
   Full_File_Names[Kol_files]:=Form_Add_Shablon.Vibr_files.items.Strings[i];
   MB[Kol_files]:=Form_Add_Shablon.Vibr_MB.items.Strings[i];
   Vibr_files.Items.Add(Form_Add_Shablon.Vibr_files.items.Strings[i]);
 //  IshText.Lines.Add(File_Names[i+1]);
  end;

 Nomer_param:=0; // ��������� �������� ����������
 // ����� ���������� �������� �������
{ Form_Zamens.sg.Cells[0,0]:='���';
 Form_Zamens.sg.Cells[1,0]:='������������';
 Form_Zamens.sg.Cells[2,0]:='������';
 Form_Zamens.sg.Cells[3,0]:='������� ��������';}

 Main_Form.chenie_INI(Max_Nomer); // ������ ���������� �� ������������������ �����

 for i:=1 to Max_Nomer do // ���� �� ������������� ������ ������
   begin
    section:='$'+inttostr(i)+'$'; // ��������� ����� ������
    if (ini.SectionExists(section)) then // �������� ������������� ������
                                      begin
                                       Nomer_param:=Nomer_param+1; // ���������� �������� ���������� �����������
{                                       Form_Zamens.sg.Cells[0,Nomer_param]:=Kod_param[i]; // ����� ���� ���������� ���������
                                       Form_Zamens.sg.Cells[1,Nomer_param]:=Naim[i]; // ����� ������������ ���������� ���������
                                       Form_Zamens.sg.Cells[2,Nomer_param]:=Primer[i]; // ����� ������� ���������� ���������}
                                      end;
  end;
  Form_Zamens.ShowModal; // ������� ����� ������� ���������� �����
{ Form_Zamens.sg.RowCount:=Nomer_param+1; // ������� ���������� ����� ����� ������ ����������}
{ Form_Zamens.ShowModal; // ������� ����� ������� ���������� �����
 for n:=1 to Max_Nomer do // ���� �� ���������� ������������ ����������
  for i:=0 to form_Zamens.ScrollBox1.ComponentCount-1 do
   if ((Form_Zamens.ScrollBox1.Components[i] As TComboBox).Name='Vibor'+inttostr(n)) then
           znach[n]:=((Form_Zamens.ScrollBox1.Components[i] As TComboBox).Text);//Form_Zamens.ScrollBox1.Components[i]}

 for n:=1 to Max_Nomer do
  begin
   znach[n]:=TComboBox(Form_Zamens.FindComponent('Vibor'+IntToStr(n))).Text;
//   IshText.Lines.Add(znach[n]);
  end;

{ for n:=1 to Nomer_param do // ���� �� ���������� ������������ ����������
  znach[n]:=Form_Zamens.sg.Cells[2,n]; // ������ ��������� �������� �����}
 Form_Save_Dir.ShowModal; // ������� ����� ������ �������� ��� ����������

  COM_Word:=CreateOleObject('Word.Application');

 for i:=1 to Kol_files do // ���� �� ���������� ��������� ��������
  begin
 {  MB[i]:=Form_Add_Shablon.Vibr_MB.Items[i-1];
   progressbar1.Position:=Round(100*i/Kol_files); // ����� ProgressBar
   IshText.Clear; // ������� ���� ��������� �������
   PoluchText.Clear; // ������� ���� ����������� ���������
   COM_Word := CreateOLEObject('Word.Application'); // �������� ������� Word
    COM_Word.Visible := False; // ������� ���� Word
    COM_Word.Documents.Open(Full_File_Names[i]); // �������� ���������� �����-�������
    Com_Word.ActiveDocument.Select; // ��������� ����� ������ �����-�������
    COM_Word.Selection.Copy; // ����������� � ����� ������ ����������� �������
    IshText.PasteFromClipboard; // ������� ������ �� ������ ������ ��� �������� �����

    PoluchText.PasteFromClipboard; // ������� ������ �� ������ ������ ��� ������������� �����

    COM_Word.DisplayAlerts := False; // ������ ������ ���������
    COM_Word.Quit; // �������� Word
  // PoluchText.Lines.Insert(0, MB[i]);// ����� ������ ��
   for n:=1 to Max_Nomer do // ���� �� ���������� ������������ ����������
    Main_Form.search(Kod_param[n],znach[n]); // ���������� ���� ����� ������ � �������� �������
   // ��������� ����� ����� ��� ����������
   New_File_names[i]:=copy(ExtractFileName(Full_File_Names[i]),1,Length(Full_File_Names[i])-4);
   New_File_names[i]:=Form_Save_Dir.DirectoryListBox1.Directory+'\'+LeftStr(ExtractFileName(Full_File_Names[i]),length(ExtractFileName(Full_File_Names[i]))-4)+' '+DateToStr(Date)+'.doc';
//   New_File_names[i]:=copy(New_File_names[i],1,Length(New_File_names[i])-4)+'.rtf';
//   New_File_names[i]:=LeftStr(New_File_names[i],length(New_File_names[i])-4)+'.doc';
   PoluchText.Lines.SaveToFile(New_File_names[i]); // ���������� ����������� ���������
   vrem.Lines.LoadFromFile(New_File_names[i]);
   kolontitul:='��: '+MB[i]+'                                                     \chpgn';
   vrem.Lines.Insert(vrem.Lines.Count-1,'\footer\pard\ql\brdrt\brdrs\brdrw10\brsp100\fs20'+kolontitul+'\par');
   vrem.Lines.SaveToFile(New_File_names[i]);}

     progressbar1.Position:=Round(100*i/Kol_files); // ����� ProgressBar
     COM_Word.visible:=true;
//     COM_Word.Documents.Add;
     COM_Word.Documents.open(Full_File_Names[i]);
   for n:=1 to Max_Nomer do // ���� �� ���������� ������������ ����������
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

// ������� ��
//  COM_Word.ActiveDocument.Sections.Item(1).footers.Item(1).range.Text:='��: '+inttostr(i); // ���������� ������ ����������
   COM_Word.ActiveDocument.Sections.Item(1).footers.Item(1).range.Text:='��: '+MB[i]; // ���������� ������ ����������
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

   COM_Word.ActiveWindow.ActivePane.View.SeekView = 0 ' ��������� � ���� ���������}
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
 // ��� �������� ����� Form1
begin
 Path:=Application.ExeName; // ������ ���� � �������� ���������� ���������
 Path:=ExtractFileDir(Path); // ����������� �������� ���������. �������� ����.
 if Path[Length(Path)]<>'\' then Path:=Path+'\'; // ���� ��������� ������ �� \ �� �������� ���
 Ini:=TIniFile.Create(Path+'nastroik.ini'); // ������ ���� � ��������� � ��� ini �����
 Max_Nomer:=Ini.ReadInteger('COMMON','����_�����',0);
// IshText.Width:=Main_Form.Width-50; // ��������� ������ ���� ������ ��������� ������
 PoluchText.Width:=Main_Form.Width-50; // ��������� ������ ���� ����������� ������
 Vibr_files.Width:=Main_Form.Width-345; // ��������� ������ ������ ������ ���������
 ProgressBar1.Width:=Main_Form.Width-384; // ��������� ������ ProgressBar

end;

procedure TMain_Form.ToolButton2Click(Sender: TObject); // ���������� ����������� ������
begin
  //   if sd.Execute then PoluchText.Lines.SaveToFile(SD.FileName);
  PoluchText.OleObject.SaveAs(New_File_Names[Vibr_files.ItemIndex+1], False)
end;

procedure TMain_Form.ToolButton3Click(Sender: TObject); // ���������� ����������� ������
begin
 if PD.Execute then PoluchText.OleObject.PrintOut;
end;

procedure TMain_Form.ToolButton5Click(Sender: TObject); // �������������� ����� ��������
var
 ks:integer; // ���������� ���������
 variant:string;
begin
 Main_Form.chenie_INI(Max_Nomer); // ������ ���������� �� ������������������ �����
 Form_Redakt_keys.Key_Label.Caption:=''; //  ������� �����
 Form_Redakt_keys.Naim_Edit.Clear; // ������� ���� ������������
 Form_Redakt_keys.Primer.Clear; // ������� �������������� ������ ���������
 Form_Redakt_keys.ShowModal; // �������� ����� �������������� ������ �����
 section:=Form_Redakt_keys.Key_Label.Caption; // ��� ������
 if Form_Redakt_keys.Keys.Text<>'' then
   begin
    ini.EraseSection(section); // ������� ��� ������   
    ini.WriteString(section,'������������',Form_Redakt_Keys.Naim_Edit.Text);
    ini.WriteInteger(section,'����������_���������',Form_Redakt_Keys.Primer.Lines.Count);
    for ks:=1 to Form_Redakt_Keys.Primer.Lines.Count do
     begin
      variant:='�������'+inttostr(ks);
      ini.WriteString(section,variant,Form_Redakt_Keys.Primer.Lines[ks-1]);
     end;
    end;
// ini.WriteString(section,'������������',Form_Redakt_keys.Naim_Edit.Text); // ������ ������������ ������ �����
// ini.WriteString(section,'������',Form_Redakt_keys.Primer_Edit.Text); // ������ ������� ������ �����
end;

procedure TMain_Form.ToolButton6Click(Sender: TObject); // ���������� ������ �����
var
 ks: integer; // ���������� ����������� ���������
 variant: string;
begin
 Form_New_Key.Naim_Edit.Clear; // �������� ���� ������������
 Form_New_Key.Primer.Clear; // �������� ��������
 Form_New_Key.Key_Label.Caption:='$'+inttostr(Max_Nomer+1)+'$'; // ����� ������ �����
 Form_New_Key.ShowModal; // �������� ����� ����� ���������� ������ �����
 section:='$'+inttostr(Max_Nomer+1)+'$'; // ��������� ����� ������
 // ���� ������������ � ������ ������ ��������� �� �����
  if ((Form_New_Key.Naim_Edit.Text<>'') and (Form_New_Key.Primer.Text<>'')) then
   begin
    Max_Nomer:=Max_Nomer+1; // ��������� ������������ �����
    ini.WriteInteger('COMMON','����_�����',Max_Nomer);
    ini.WriteString(section,'������������',Form_New_Key.Naim_Edit.Text);
    ini.WriteInteger(section,'����������_���������',Form_New_Key.Primer.Lines.Count);
    for ks:=1 to Form_New_Key.Primer.Lines.Count do
     begin
      variant:='�������'+inttostr(ks);
      ini.WriteString(section,variant,Form_New_Key.Primer.Lines[ks-1]);
     end;
   end;
end;

procedure TMain_Form.FormResize(Sender: TObject);
begin
// IshText.Width:=Main_Form.Width-50; // ��������� ������ ���� ������ ��������� ������
 PoluchText.Width:=Main_Form.Width-50; // ��������� ������ ���� ����������� ������
 Vibr_files.Width:=Main_Form.Width-345; // ��������� ������ ������ ������ ���������
 ProgressBar1.Width:=Main_Form.Width-384; // ��������� ������ ProgressBar
end;

procedure TMain_Form.N10Click(Sender: TObject);
begin
 // ������� ����� ������
 Form_New_Shablon.Show;
    Form_New_Shablon.re.DestroyObject();
    Form_New_Shablon.re.CreateObjectFromFile(path+'������.doc', False);
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
 // ������� ������
 Form_New_Shablon.Show;
 if Form_New_Shablon.od.Execute then //re.Lines.LoadFromFile(od.FileName); // �������� ���������� �������
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
  if MessageDlg('�� ������������� ������ ��������� ������?', mtConfirmation,
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

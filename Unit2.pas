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
  Label_New: TLabel; // ����������� �����
  Combobox_New: TCombobox; // ����������� ���������� ������

implementation

{$R *.dfm}
uses unit1,unit3;

procedure TForm_Zamens.Button1Click(Sender: TObject);
begin
 Form_Zamens.close; // ������� ����� �����
end;

procedure TForm_Zamens.FormCreate(Sender: TObject);
var
 np:integer;
 n_str: integer;
 kol: integer; // ���������� ����� �� ���������� ���������
 kol_var: integer; // ���������� ���������
begin
 label1.Width:=Form_Zamens.Width-11; // ������ ����� ��������� ��������� �����
{ sg.Width:=Form_Zamens.Width-10; // ������ ������� ����� �����
 sg.DefaultColWidth:=(sg.Width - 15) div 4; // ����������� ������ �������}
 button1.Left:=(Form_Zamens.Width-button1.Width) div 2; // ����� ��������� ������ ��������� ������

 n_str:=0;
 for np:=1 to Max_Nomer do // ���� �� ������������� ������
  begin
   section:='$'+inttostr(np)+'$'; // ��������� ����� ������
   if (ini.SectionExists(section)) then // ���� ������ ����������
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
       Caption:=ini.ReadString(section,'������������','');//Naim[np];
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
       kol_var:=ini.ReadInteger(section,'����������_���������',0);
       for kol:=1 to kol_var do
        begin
         Items.Add(ini.ReadString(section,'�������'+inttostr(kol),''));
        end;
      end;



     end;
 {  if (ini.SectionExists(section)) then // ���� ������ ����������
                                    begin
                                     Kolvo_param:=Kolvo_param+1; // ���������� �������� ����������
                                     // ����� ���������� ������
                                     Kod_param[i]:=section;
                                     Naim[i]:=ini.ReadString(section,'������������','');
                                     Sort_Naim[Kolvo_param]:=Naim[i];
                                     Primer[i]:=ini.ReadString(section,'������','');
                                     Label_New:=TLabel.Create(Self);

                                    end; }
  end;

end;

procedure TForm_Zamens.FormResize(Sender: TObject);
begin
{ sg.DefaultColWidth:=(sg.Width) div 4;}
 Label1.Width:=Form_Zamens.Width;
 button1.Left:=(Form_Zamens.Width-button1.Width-10) div 2; // ����� ��������� ������ ��������� ������
end;

procedure TForm_Zamens.FormActivate(Sender: TObject);
{var
 np:integer;
 n_str: integer;
 kol: integer; // ���������� ����� �� ���������� ���������
 kol_var: integer; // ���������� ���������}
begin
{ n_str:=0;
 for np:=1 to Max_Nomer do // ���� �� ������������� ������
  begin
   section:='$'+inttostr(np)+'$'; // ��������� ����� ������
   if (ini.SectionExists(section)) then // ���� ������ ����������
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
       kol_var:=ini.ReadInteger(section,'����������_���������',0);
       for kol:=1 to kol_var do
        begin
         Items.Add(ini.ReadString(section,'�������'+inttostr(kol),''));
        end;
      end;



     end;
 {  if (ini.SectionExists(section)) then // ���� ������ ����������
                                    begin
                                     Kolvo_param:=Kolvo_param+1; // ���������� �������� ����������
                                     // ����� ���������� ������
                                     Kod_param[i]:=section;
                                     Naim[i]:=ini.ReadString(section,'������������','');
                                     Sort_Naim[Kolvo_param]:=Naim[i];
                                     Primer[i]:=ini.ReadString(section,'������','');
                                     Label_New:=TLabel.Create(Self);

                                    end; 
  end;  }
end;

end.

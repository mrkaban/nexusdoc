unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ExtCtrls;

type
  TForm_Table = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Kol_strok: TEdit;
    UpDown1: TUpDown;
    Kol_stolb: TEdit;
    UpDown2: TUpDown;
    StringGrid: TStringGrid;
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Button2: TButton;
    Table: TRichEdit;
    procedure Kol_strokChange(Sender: TObject);
    procedure Kol_stolbChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Table: TForm_Table;

implementation

{$R *.dfm}

procedure TForm_Table.Kol_strokChange(Sender: TObject);
begin
  StringGrid.RowCount:=StrToInt(Kol_strok.Text);
end;

procedure TForm_Table.Kol_stolbChange(Sender: TObject);
begin
  StringGrid.ColCount:=StrToInt(Kol_stolb.Text);
  StringGrid.DefaultColWidth:=(StringGrid.Width-20) div StrToInt(Kol_stolb.Text);
end;

procedure TForm_Table.Button1Click(Sender: TObject);
const
  //���� �������� ������.
  Cr                : String = Char(13) + Char(10);
  //������ ������ � RTF ������������� �������.
  CellWidth         : Integer = 3000;
  //����� ������ � ������� ���� � ������ RTF �������.
  CellIndent        : Integer = 50;
var
  //�������.
  Sg      : TStringGrid;
  //������ ������� �������.
  ColNum  : Integer;
  //������ ������ �������.
  RowNum  : Integer;
  //������ ���������� RTF �����.
  StrRtf  : String;
  //�������.
  i       : Integer;
begin
  Sg := StringGrid;

  //������ RTF ���������.
  StrRtf := '{\rtf1\ansi\ansicpg1251' + Cr;

  //��������� � RTF �������� ������ �������.
  for RowNum := 0 to Sg.RowCount - 1 do begin
    //������ ��������� ������ � RTF �������.
    StrRtf := StrRtf + '\trowd\trgaph' + IntToStr(CellIndent) + CR;

    //�������� ����� RTF ������.
    i := 0;
    for ColNum := 0 to Sg.ColCount - 1 do begin
      Inc(i);
      StrRtf :=
        StrRtf
        + '\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx'
        + IntToStr(i * CellWidth) + Cr
      ;
    end;

    //����� �������� ����� RTF ������.
    StrRtf := StrRtf + '\pard\intbl' + Cr;

    //������ ����� RTF ������.
    for ColNum := 0 to Sg.ColCount - 1 do begin
      StrRtf := StrRtf + Sg.Cells[ColNum, RowNum] + '\cell' + Cr;
    end;

    //���������� ������ RTF �������.
    StrRtf := StrRtf + '\row' + Cr;
  end;

  //����� RTF ���������.
  StrRtf := StrRtf + '}';

  //���������� ����� � RTF ���������.
  Table.Text := StrRtf;
 end;

procedure TForm_Table.Button2Click(Sender: TObject);
begin
 table.SelectAll;
 table.CopyToClipboard;
 Form_Table.Close;

end;

end.

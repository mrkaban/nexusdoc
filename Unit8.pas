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
  //Знак переноса строки.
  Cr                : String = Char(13) + Char(10);
  //Ширина ячейки в RTF представлении таблицы.
  CellWidth         : Integer = 3000;
  //Длина левого и правого поля в ячейке RTF таблицы.
  CellIndent        : Integer = 50;
var
  //Таблица.
  Sg      : TStringGrid;
  //Индекс столбца таблицы.
  ColNum  : Integer;
  //Индекс строки таблицы.
  RowNum  : Integer;
  //Строка содержащая RTF текст.
  StrRtf  : String;
  //Счётчик.
  i       : Integer;
begin
  Sg := StringGrid;

  //Начало RTF документа.
  StrRtf := '{\rtf1\ansi\ansicpg1251' + Cr;

  //Добавляем в RTF документ строки таблицы.
  for RowNum := 0 to Sg.RowCount - 1 do begin
    //Начало очередной строки в RTF таблице.
    StrRtf := StrRtf + '\trowd\trgaph' + IntToStr(CellIndent) + CR;

    //Описания ячеек RTF строки.
    i := 0;
    for ColNum := 0 to Sg.ColCount - 1 do begin
      Inc(i);
      StrRtf :=
        StrRtf
        + '\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx'
        + IntToStr(i * CellWidth) + Cr
      ;
    end;

    //Конец описания ячеек RTF строки.
    StrRtf := StrRtf + '\pard\intbl' + Cr;

    //Данные ячеек RTF строки.
    for ColNum := 0 to Sg.ColCount - 1 do begin
      StrRtf := StrRtf + Sg.Cells[ColNum, RowNum] + '\cell' + Cr;
    end;

    //Завершение строки RTF таблицы.
    StrRtf := StrRtf + '\row' + Cr;
  end;

  //Конец RTF документа.
  StrRtf := StrRtf + '}';

  //Показываем текст в RTF редакторе.
  Table.Text := StrRtf;
 end;

procedure TForm_Table.Button2Click(Sender: TObject);
begin
 table.SelectAll;
 table.CopyToClipboard;
 Form_Table.Close;

end;

end.

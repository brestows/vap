unit start;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, printers, ComCtrls, Menus; //, jwawingdi;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ODl1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SDD1: TSelectDirectoryDialog;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
     procedure Button3Click(Sender: TObject);
     procedure Button5Click(Sender: TObject);
     procedure Button6Click(Sender: TObject);
     procedure Button7Click(Sender: TObject);
     procedure CheckBox2Change(Sender: TObject);
     procedure ComboBox1Change(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure Image12Click(Sender: TObject);
     procedure Image1Click(Sender: TObject);
     procedure Image2Click(Sender: TObject);
     procedure Image3Click(Sender: TObject);
     procedure Image4Click(Sender: TObject);
     procedure Image5Click(Sender: TObject);
     procedure Image6Click(Sender: TObject);
     procedure Image7Click(Sender: TObject);
     procedure Image9Click(Sender: TObject);
     procedure Image10Click(Sender: TObject);
     procedure Panel3Click(Sender: TObject);
     procedure Panel4Click(Sender: TObject);
     function steplist(i: integer): integer; // шаг листания картинок в завис от компоновки
     procedure AddPict(p: string); // Загрузить картинку в буфер для компоновки p - путь к файлу
     procedure ShowPict(index: integer); // предпросмотр  начиная с картинки № index
     procedure CreateList; // создать лист в соответствии с вариантом компоновки
     procedure List1; // создать лист  с 1 картинкой  (далее процедуры аналогично по смыслу)
     procedure List2;
     procedure List3;
     procedure List4;
     procedure List6;
     procedure List8;
     procedure List9;
     procedure List15;
     procedure List20;
     procedure ShowPic(index: integer; cou: integer); // показать cou+1картинок начиная с картинки index
     procedure Button2Click(Sender: TObject);
     procedure Button1Click(Sender: TObject); // показать картинку по первому варианту компоновки
     procedure OpenFolder;
     procedure Button4Click(Sender: TObject); // Открыть папку (если вход без параметров)
     procedure SetSize(im: timage); // Подогнать размер image под картинку
     procedure SetPos(im: timage); // уточнить позицию image
     function GetmX: integer;
     function GetmY: integer;
     procedure DrawList(index: integer); // Нарисовать лист
     procedure Prn; // вывести лист на принтер
     procedure TrackBar1Change(Sender: TObject);
     procedure TrackBar2Change(Sender: TObject);
     procedure showlistnum; // показать номер текущего листа предпросмотра и сколько всего листов
     procedure EndClick(im: timage); // завершение перехода на новую компоновку (общее для всех)
     procedure EndStep(index: integer); // завершение перелистывания страниц (общее для всех)
     procedure EndList(i: integer);//завершение построения листа предпросмотра (общее для всех)
     procedure TrackBar3Change(Sender: TObject);
     procedure RefreshScreen; // обновить изображение (после игр с настройками)
     procedure TrackBar3MouseUp(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure SetListPrn; // Установить размер выходного image в соответствии с форматом листа
     //function Rotor(im: tImage; g: integer): tImage; // вращение pictute
                         // g = 1 - 90, 2 - 180, 3 - 270 градусов по часой стрелке

  private
    { private declarations }
  public
    { public declarations }
  end;

  tpict = record
    pict: string;
    rot: integer; // 0 - нормально, 1 - 90 гр, 2 - 180 гр, 3 - 270 гр вправо
  end;
  var
    Form1: TForm1;
    pol: integer; // Ширина полей
    orn: integer; // ориентация 0 - книжная, 1 - альбомная
    frm: integer; // формат листа 0 - А4, 1 - A6
    ver, gor: integer; // текущие размеры листа
    frms: array[0..1,0..3] of integer; // массив размеров: первый индекс - формат А4, А6 ... (frm)
                                       // второй индекс 0 - X, 1 - Y - размеры листа в мм 2 - scl
    scl: integer; // Масштаб на экране - чтобы красиво вписать в форму
    capt: array[0..1] of string; // массив заготовок надписей в центре листа предпросмотра
                  //листы разного формата в окно программы A4 - scl = 1;
    ScaleX, ScaleY: integer; // коэф масштабирования печати
            // точные значения зависят от конкретного принтера
    zg: tcolor;
    s: string;
    toprint: array of tpict; // массив картинок для печати
    buf: integer; // количество загруженных картинок
    comp: integer;// вариант компановки
    showp: array[0..19] of timage; // массив картинок предпросмотра
    ex: array[0..19] of boolean; // Массив существования картинок
    showindex: integer; // смещение картинок предпросмотра,
                        //т.е. с какой по номеру загруженной картинки
                        //начинать рисовать предпросмотр (чтобы листать страницы)
    getx, gety: integer; // максимальный размер image для текущей компоновки


implementation

{$R *.lfm}

uses ab;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject); // Начало
var
  i: integer;
begin
  form1.BorderStyle:=bsSingle;
  showindex := 0;
  ScaleX := 100;
  ScaleY := 100;
  scl := 1;
  pol := 10;
  orn := 0;
  frm := 0;
  ver := 594;
  gor := 420;
  image11.Visible:=false;
  combobox1.Text:='A4 21х29.7';
  combobox1.Items.Add('A4 21х29.7');
  combobox1.Items.Add('A6 10.5x14.8');
  label2.Caption := '1 в центре';
  label5.Caption:='Лист 1 из 1';
  buf := 0;
  // поддерживаемые размеры (книжная ориентация) (может быть потом будет смысл вынести во внешний файл)
  frms[0][0]:=210; frms[0][1]:=297; frms[0][2]:=2; // A4
  frms[1][0]:=105; frms[1][1]:=148; frms[1][2]:=4; // A6
  // Надписи
  capt[0]:='Лист А4 21 х 29.7';
  capt[1]:='Лист А6 10.5 х 14.8';
  if paramstr(1) <> '' then
    begin
      for i := 1 to ParamCount do addpict(paramstr(i));
      if buf = 0 then showmessage ('Файлов, пригодных для печати не обнаружено');
    end;
  label3.Caption:='X = ' + inttostr(scalex) + '%';
  trackbar1.Position := scalex;
  label4.Caption:='Y = ' + inttostr(scaley) + '%';
  trackbar2.Position := scaley;
  for i := 0 to 19 do ex[i] := false;
  image1click(image1);
end;

procedure tform1.RefreshScreen; // обновить изображение
begin
  endstep(0);
end;

procedure TForm1.TrackBar3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    RefreshScreen;
end;

procedure tform1.setlistprn;
// установить размер заготовки в соответствии с форматом листа и его ориентацией
var
  Prin: TPrinter;
begin
  prin := Printer;
  if orn=0 then
    begin
      image11.Width:=trunc(prin.XDPI * (frms[frm][0] / 25.3)); // точек по горизонтали
      image11.Height:=trunc(prin.YDPI * (frms[frm][1] / 25.3)); // точек по вертикали
    end else begin
      image11.Width:=trunc(prin.XDPI * (frms[frm][1] / 25.3)); // точек по горизонтали
      image11.Height:=trunc(prin.YDPI * (frms[frm][0] / 25.3)); // точек по вертикали
    end;
end;


procedure tform1.showlistnum;
// показать номер текущего листа предпросмотра и сколько всего листов
var
  lists, curlist, i: integer;
begin
  i := steplist(comp);
  lists := buf div i;
  if buf mod i > 0 then inc(lists);
  curlist := (showindex div i) + 1;
  if lists > 0 then
     label5.Caption:='Лист ' + inttostr(curlist) + ' из ' + inttostr(lists)
    else
     label5.Caption:= 'Файлы для печати не загружены';
end;

procedure tform1.SetPos(im: timage);
// уточнить позицию
begin
  im.Left:=im.left+((getx-im.Width) div 2);
  im.Top:=im.top+((gety-im.Height) div 2);
end;

procedure tform1.SetSize(im: timage);
// Точная подгонка размера timage под место
var
  a, b, w, h: extended;
  r: integer;
begin
  a := im.Picture.Width;
  b := im.Picture.Height;
  if a * b = 0 then exit;
  w := im.Width;
  h := im.Height;
  r := Trunc(b * w / a);
  if r < im.Height then im.Height := r else im.Width:= Trunc(a * h / b);
  if (im.Height > im.Picture.Height) and checkbox2.Checked then // не увеличивать картинку
    begin
      im.Height:= im.Picture.Height;
      im.Width:= im.Picture.Width;
    end;
end;

function tform1.GetmX: integer;
// получить макимальный размер Х для текущей компоновки
begin
  result := 0;
  case comp of
    1..4: result := gor - pol * 2;
    5..7: result := (gor - pol * 3) div 2;
    8,9: result := (gor - pol * 4) div 3;
    10: result := (gor - pol * 5) div 4;
  end;
end;

function tform1.GetmY: integer;
// получить макимальный размер Y для текущей компоновки
begin
  result := 0;
  case comp of
    1: result := ver - pol * 2;
    2,3,5: result := (ver - pol * 3) div 2;
    4,6,8: result := (ver - pol * 4) div 3;
    7: result := (ver - pol * 5) div 4;
    9, 10: result := (ver - pol * 6) div 5;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
// открыть файл
begin
  if odl1.Execute then
    begin
      buf := 0;
      AddPict(odl1.FileName);
      image1click(image1);
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  label3.Visible := not label3.Visible;
  label4.Visible := not label4.Visible;
  trackbar1.Visible := not trackbar1.Visible;
  trackbar2.Visible := not trackbar2.Visible;
  checkbox1.Visible := not checkbox1.Visible;
end;

procedure TForm1.Button7Click(Sender: TObject);
// О программе
begin
     form2.Show;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
    RefreshScreen;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
// Выбор нового формата листа
begin
   frm := combobox1.ItemIndex;
   if frm = -1 then frm := 0;
   scl:=frms[frm][2];
   gor:=frms[frm][0] * scl;
   panel1.Caption:=capt[frm];
   if orn = 0 then begin gor:=frms[frm][0] * scl; ver:=scl*frms[frm][1]; end
              else begin gor:=frms[frm][1] * scl; ver:=scl*frms[frm][0]; end;
   panel1.Width:=gor;
   panel1.Height:=ver;
   panel1.top:=(594 - ver) div 2 + 40;
   form1.Width := 770 + (gor - 420);
   label5.Width:=gor;
   label5.Top:= panel1.Top - 24;
   button7.Left:= 670 + (gor-420);
end;

procedure TForm1.Button3Click(Sender: TObject);
// печать
var
  i: integer;
begin
  setlistprn;
  showindex := 0;
  CreateList;
  showpict(showindex);
  repeat // перебор листов для их прорисовки
    case comp of
       1,2: drawlist(0);
       3: drawlist(1);
       4: drawlist(2);
       5: drawlist(3);
       6: drawlist(5);
       7: drawlist(7);
       8: drawlist(8);
       9: drawlist(14);
       10: drawlist(19);
     end;
     i := showindex;
     Button2Click(image11);
  until (i = showindex);
end;

procedure tform1.drawlist(index: integer);
// подготовка страницы к печати, т.е. рисование image, который пойдет на принтер
var
   i, x, x1, y, y1: integer;
   k: extended;
   ImageRect: TRect;
begin
   label6.visible:=true;
   self.Repaint;
   image11.Canvas.Brush.Color:=clWhite;
   image11.Canvas.FillRect(image11.ClientRect);
   k := image11.Height / panel1.Height; // масштаб между предпросмотром и листом
   for i := 0 to index do  // перебрать все задействованные showp[] и перерисовать их в один image
     begin
        x :=  trunc(k * showp[i].Left);
        y :=  trunc(k * showp[i].Top);
        x1 := x + trunc(k * showp[i].Width);
        y1 := y + trunc(k * showp[i].Height);
        ImageRect:=Rect(x, y, x1, y1);
        image11.Canvas.StretchDraw(ImageRect, showp[i].Picture.Bitmap);
       end;
   //prn;
   label6.visible:=false;
   image11.visible:=true;
   panel1.visible:=false;
   label11.Caption:=inttostr(image11.Width)+'-'+ inttostr(image11.Height);
   image11.Width:= image11.Width div 6;
   image11.Height:= image11.Height div 6;
end;

procedure TForm1.Prn;
// печать страницы
var
  Prin: TPrinter;
  Im: TRect;
  x, y: integer;
begin
  prin := Printer;
  if orn = 0 then prin.Orientation:=poPortrait else prin.Orientation:=poLandscape;
  x := trunc(image11.Picture.Width * scalex / 100);
  y := trunc(image11.Picture.Height * scaley / 100);
  // Начало печати
  prin.BeginDoc;
  Im:=Rect(0, 0, x, y);
  prin.Canvas.StretchDraw(Im, image11.Picture.Bitmap);
  // Конец печати
  prin.EndDoc;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  scalex := trackbar1.Position;
  label3.Caption:='X = ' + inttostr(scalex) + '%';
  if checkbox1.Checked then TrackBar2.Position:=TrackBar1.Position;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  scaley := trackbar2.Position;
  label4.Caption:='Y = ' + inttostr(scaley) + '%';
  if checkbox1.Checked then TrackBar1.Position:=TrackBar2.Position;
end;




procedure tform1.OpenFolder;
// открыть папку и загрузить из нее все картинки
var
  pt: string;
  sr: tsearchrec;
begin
  if sdd1.Execute then
    begin
      buf := 0;
      pt := sdd1.FileName + '/*.*';
      label6.visible:=true;
      if findfirst(pt, faAnyFile, sr) = 0 then
         repeat
               addpict(sdd1.FileName+'/'+sr.Name);
          until findnext(sr) <> 0;
      findclose(sr);
      if buf = 0 then showmessage ('В этой папке допустимых файлов изображений нет.')
         else begin
           label2.Caption := '1 в центре';
           comp := 1;
           endclick(image1);
         end;
      label6.Visible:=false;
      exit;
    end;
  showmessage ('Вы отказались открыть папку.');

end;

procedure tform1.ShowPict(index: Integer);
begin
  case comp of
    1, 2: showpic(index, 0);
    3: showpic(index, 1);
    4: showpic(index, 2);
    5: showpic(index, 3);
    6: showpic(index, 5);
    7: showpic(index, 7);
    8: showpic(index, 8);
    9: showpic(index, 14);
    10: showpic(index, 19);
  end;
end;

procedure tform1.ShowPic(index: Integer; cou: integer);
var
  i: integer;
begin
  for i := 0 to cou do
    begin
      if i+index = buf then break;
      showp[i].Center := true;

        showp[i].Picture.loadfromfile(toprint[i+index].pict); //else
        //showp[i].Picture := nil;
        // подогнать размер
        setsize(showp[i]);
        // уточнить позицию
        setpos(showp[i]);
    end
end;

procedure TForm1.Button1Click(Sender: TObject);
// листать назад
var
  i: integer;
begin
  label6.visible:=true;
  self.Repaint;
  i := 0 - steplist(comp);
  if showindex  > 0  then endstep(i);
  label6.visible:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
// листать вперёд
var
  i: integer;
begin
  label6.visible:=true;
  self.Repaint;
  i := steplist(comp);
  if showindex + i < buf   then endstep(i);
  label6.visible:=false;
end;

procedure tform1.endstep(index: integer);
begin
  showindex := showindex + index;
  createlist;
  showpict(showindex);
  showlistnum;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  openfolder;
end;

function tform1.steplist(i: integer): integer;
begin
   result := 0;
   case i of
      1,2: result := 1;
      3: result := 2;
      4: result := 3;
      5: result := 4;
      6: result := 6;
      7: result := 8;
      8: result := 9;
      9: result := 15;
      10: result := 20;
    end;
end;

Procedure tform1.CreateList;
begin
  getx := getmx;
  gety := getmy;
  case comp of
    1, 2: list1;
    3: list2;
    4: list3;
    5: list4;
    6: list6;
    7: list8;
    8: list9;
    9: list15;
    10: list20;
  end;
end;

procedure tform1.endlist(i: integer);
//завершение построения листа предпросмотра
begin
  showp[i].Visible := true;
  showp[i].Enabled := true;
  showp[i].Width := getx;
  showp[i].Height := gety;
  showp[i].Stretch := true;
  showp[i].Proportional := true;
  showp[i].Parent := panel1;
  //showp[i].PopupMenu := popupmenu1;
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  pol := TrackBar3.Position;
  label9.Caption:='Поля [' + inttostr(pol) + ']';
end;


procedure tform1.List1;
var
  i: integer;
begin
  for i := 1 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  if not ex[0] then
    begin
      showp[0] := timage.Create(form1.Panel1);
      showp[0].Name := 'im0';
      ex[0] := true;
    end;
  showp[0].Top := pol;
  showp[0].Left := pol;
  endlist(0);
end;

procedure tform1.List2;
var
  i: integer;
begin
  for i := 2 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  for i := 0 to 1 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      showp[i].Top := pol + (i * (gety + pol));
      showp[i].Left := pol;
      endlist(i);
    end;
end;

procedure tform1.List3;
var
  i: integer;
begin
  for i := 3 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  for i := 0 to 2 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      showp[i].Top := pol + (i * (gety + pol));
      showp[i].Left := pol;
      endlist(i);
    end;
end;

procedure tform1.List4;
var
  i, j: integer;
begin
  for i := 4 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  for i := 0 to 3 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      if i < 2 then j := 0 else j := 1;
      showp[i].Top := pol + (j * (gety + pol));
      if i mod 2 = 0 then j := 0 else j := 1;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List6;
var
  i, j: integer;
begin
  for i := 6 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  for i := 0 to 5 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      j := i div 2;
      showp[i].Top := pol + (j * (gety + pol));
      if i mod 2 = 0 then j := 0 else j := 1;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List8;
var
  i, j: integer;
begin
  for i := 8 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  for i := 0 to 7 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      j := i div 2;
      showp[i].Top := pol + (j * (gety + pol));
      if i mod 2 = 0 then j := 0 else j := 1;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List9;
var
  i, j: integer;
begin
  for i := 9 to 19 do
   if ex[i] then
    begin
      ex[i] := false;
      showp[i].Destroy;
    end;
  for i := 0 to 8 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      case i of
        0..2: j := 0;
        3..5: j := 1;
        6..8: j := 2;
      end;
      showp[i].Top := pol + (j * (gety + pol));
      case i of
        0, 3, 6: j := 0;
        1, 4, 7: j := 1;
        2, 5, 8: j := 2;
      end;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.List15;
var
  i, j: integer;
begin
  for i := 15 to 19 do
    if ex[i] then
     begin
       ex[i] := false;
       showp[i].Destroy;
     end;
  for i := 0 to 14 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      case i of
        0..2: j := 0;
        3..5: j := 1;
        6..8: j := 2;
        9..11: j := 3;
        12..14: j := 4;
      end;
      showp[i].Top := pol + (j * (gety + pol));
      case i of
        0, 3, 6, 9, 12: j := 0;
        1, 4, 7, 10, 13: j := 1;
        2, 5, 8, 11, 14: j := 2;
      end;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;


procedure tform1.List20;
var
  i, j: integer;
begin
  for i := 0 to 19 do
    begin
      if not ex[i] then
        begin
          showp[i] := timage.Create(form1.Panel1);
          s := 'im' + inttostr(i);
          showp[i].Name := s;
          ex[i] := true;
        end;
      case i of
        0..3: j := 0;
        4..7: j := 1;
        8..11: j := 2;
        12..15: j := 3;
        16..19: j := 4;
      end;
      showp[i].Top := pol + (j * (gety + pol));
      case i of
        0, 4, 8, 12, 16: j := 0;
        1, 5, 9, 13, 17: j := 1;
        2, 6, 10, 14, 18: j := 2;
        3, 7, 11, 15, 19: j := 3;
      end;
      showp[i].Left := pol + (j * (getx + pol));
      endlist(i);
    end;
end;

procedure tform1.endclick(im: timage);
begin
  label6.visible:=true;
  self.Repaint;
  showindex := 0;
  createlist;
  showpict(showindex);
  showlistnum;
  image8.Picture := im.Picture;
  label6.Visible:=false;
end;


procedure TForm1.Image1Click(Sender: TObject);
begin
  label2.Caption := '1 в центре';
  comp := 1;
  endclick(sender as timage);
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  label2.Caption := '1 сверху';
  comp := 2;
  endclick(sender as timage);
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  label2.Caption := '1 х 2';
  comp := 3;
  endclick(sender as timage);
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  label2.Caption := '1 х 3';
  comp := 4;
  endclick(sender as timage);
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  label2.Caption := '2 х 2';
  comp := 5;
  endclick(sender as timage);
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  label2.Caption := '2 х 3';
  comp := 6;
  endclick(sender as timage);
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
   label2.Caption := '2 х 4';
   comp := 7;
   endclick(sender as timage);
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
   label2.Caption := '3 х 3';
   comp := 8;
   endclick(sender as timage);
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
   label2.Caption := '3 х 5';
   comp := 9;
   endclick(sender as timage);
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  label2.Caption := '4 х 5';
  comp := 10;
  endclick(sender as timage);
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  panel3.Caption:='\/';
  panel4.Caption:='';
  orn:=0;
  ComboBox1Change(Sender);
  RefreshScreen;
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
  panel4.Caption:='\/';
  panel3.Caption:='';
  orn:=1;
  ComboBox1Change(Sender);
  RefreshScreen;
end;


procedure tform1.AddPict(p: string);
// анализ параметров запуска
var
  s: string;
begin
  if (copy(p, 1, 2)='x=') or
     (copy(p, 1, 2)='X=') then
       begin
         ScaleX := strtoint(copy(p, 3, length(p)-2));
         exit;
       end;
  if (copy(p, 1, 2)='y=') or
     (copy(p, 1, 2)='Y=') then
       begin
         ScaleY := strtoint(copy(p, 3, length(p)-2));
         exit;
       end;
  s := copy(p, (length(p)-3), 4);
  s := uppercase(s);
  if (s = '.JPG') or (s = '.BMP') or (s = '.PNG') or (s = '.ICO') then
    begin
      inc(buf);
      setlength(toprint, buf);
      toprint[buf-1].pict := p;
      toprint[buf-1].rot := 0;
    end;
end;

{
function tform1.Rotor(im: tImage; g: integer): tImage; // вращение picture вправо
var
   x1, y1, x2, y2: integer;
begin
   result := tImage.Create(form1);
   case g of
     1: // 90 гр
     begin
        label1.Caption:='!!!';
        result.Width := im.Height;
        result.Height := im.Width;
        y2:=0; x2:=result.Width-1;
        for y1:=0 to im.Height-1 do
          begin
          for x1:=0 to im.Width-1 do
            begin
                 result.Canvas.Pixels[x2,y2] := im.Canvas.Pixels[x1,y1];
                 inc(y2);
            end;
            y2:=0;
            dec(x2);
          end;
        exit;
     end;
   end;
end;

 }


end.


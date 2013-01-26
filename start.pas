unit start;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, printers, ComCtrls, Menus, PrintersDlgs; //, jwawingdi;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
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
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ODl1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    SDD1: TSelectDirectoryDialog;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
     procedure Button10Click(Sender: TObject);
     procedure Button11Click(Sender: TObject);
     procedure Button3Click(Sender: TObject);
     procedure Button5Click(Sender: TObject);
     procedure Button6Click(Sender: TObject);
     procedure Button7Click(Sender: TObject);
     procedure Button8Click(Sender: TObject);
     procedure Button9Click(Sender: TObject);
     procedure CheckBox2Change(Sender: TObject);
     procedure CheckBox3Change(Sender: TObject);
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
     procedure LabeledEdit1Change(Sender: TObject);
     procedure MenuItem1Click(Sender: TObject);
     procedure MenuItem2Click(Sender: TObject);
     procedure Panel3Click(Sender: TObject);
     procedure Panel4Click(Sender: TObject);
     procedure StaticText1Click(Sender: TObject);
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
     procedure RefreshScreen; // обновить изображение (после игр с настройками)
     procedure SetListPrn; // Установить размер выходного image в соответствии с форматом листа
     procedure FillList; // Заполнение листа картинкой
     procedure TrackBar3MouseUp(Sender: TObject; Button: TMouseButton;
       Shift: TShiftState; X, Y: Integer);
     procedure MoveStart(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer); // процедуры перемещения showp[0]
     procedure MoveNow(Sender: TObject; Shift: TShiftState; X, Y: Integer);
     procedure MoveEnd(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
     procedure GetUserSize; // установить произвольные размеры листа
     procedure EndFrms; // завершение изменения формата листа
     function GetPictIndex(sender:  TObject): integer; // получить номер картинки в общем списке по image, в котором ее видно
     procedure LoadFiles; // загрузка файлов из командной строки, т.е. переданных как параметры запуска (выделенных мышкой перед запуском)
     procedure SetPg(p: string); // Установить формат бумаги из командной строки при запуске программы
     procedure SetPg2(p: string); // -//- для пользовательского формата
     procedure SetComp(p: string); // установка начальной компоновки из командной строки

     //function Rotor(im: tImage; g: integer): tImage; // вращение pictute
                         // g = 1 - 90, 2 - 180, 3 - 270 градусов по часой стрелке

  private
    { private declarations }
  public
    { public declarations }
  end;

  tpict = record
    pict: string; // путь к файлу
    rot: integer; // 0 - нормально, 1 - 90 гр, 2 - 180 гр, 3 - 270 гр вправо
    pct: tPicture;  // картинка
    left: integer; // координата Х
    top: integer;  // координата Y
    heigth: integer; // высота
    width: integer; // ширина
    show: boolean; // флаг того, что картинка уже была расчитана для данной компоновки, ее надо просто показать
    load: boolean; // флаг того, картинка уже загружена в память
    z: integer; // z-порядок
  end;


  var
    Form1: TForm1;
    num: integer; // временная переменная для передачи параметров
    pol, tmp_pol: integer; // Ширина полей
    orn: integer; // ориентация 0 - книжная, 1 - альбомная
    frm: integer; // формат листа 0 - А4, 1 - A6
    ver, gor: integer; // текущие размеры листа
    lists, curlist: integer; // всего листов и текущий лист
    frms: array[0..5,0..3] of integer; // массив размеров: первый индекс - формат А4, А6 ... (frm)
                                       // второй индекс 0 - X, 1 - Y - размеры листа в мм 2 - scl
    scl: integer; // Масштаб на экране - чтобы красиво вписать в форму
    capt: array[0..5] of string; // массив заготовок надписей в центре листа предпросмотра
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
    FlagMove: boolean; // флаг разрешения передвижения showp[0]
    MovX, MovY: integer; // предыдущие координаты мышки (для рачета перемещения)
    imindex: integer; // индекс картинки, на image которой нажали кнопку мышки
    fl: boolean; // просто флаг для промежуточных операций
    sc: string;

implementation

{$R *.lfm}

uses ab;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject); // Начало
var
  i: integer;
begin
  form1.BorderStyle:=bsSingle;
  flagmove:=false;
  showindex := 0;
  ScaleX := 100;
  ScaleY := 100;
  scl := 1;
  pol := 10;
  orn := 0;
  frm := 0;
  ver := 594;
  gor := 420;
  fl:=true;
  image11.Visible:=false;
  combobox1.Text:='Лист A4 21х29.7';
  combobox1.Items.Add('Лист A4 21х29.7');
  combobox1.Items.Add('Лист A5 14.8х21');
  combobox1.Items.Add('Лист A6 10.5x14.8');
  combobox1.Items.Add('Фоторгафия 10x15');
  combobox1.Items.Add('Фоторгафия 15x20');
  combobox1.Items.Add('Произвольный размер');
  label2.Caption := '1 в центре';
  label5.Caption:='Лист 0 из 0';
  buf := 0;
  // поддерживаемые размеры (книжная ориентация) (может быть потом будет смысл вынести во внешний файл)
  frms[0][0]:=210; frms[0][1]:=297; frms[0][2]:=2; // A4
  frms[1][0]:=148; frms[1][1]:=210; frms[1][2]:=3; // A5
  frms[2][0]:=105; frms[2][1]:=148; frms[2][2]:=4; // A6
  frms[3][0]:=100; frms[3][1]:=150; frms[3][2]:=4; // Фото 10х15
  frms[4][0]:=150; frms[4][1]:=200; frms[4][2]:=3; // Фото 15х20
  frms[5][0]:=0; frms[5][1]:=0; frms[5][2]:=0; // Users format
  // Надписи
  capt[0]:='Лист А4 21 х 29.7';
  capt[1]:='Лист А5 14.8 х 21';
  capt[2]:='Лист А6 10.5 х 14.8';
  capt[3]:='Фотография 10 х 15';
  capt[4]:='Фотография 15 x 20';
  capt[5]:='Произвольный размер';
  if paramstr(1) <> '' then loadfiles; // загрузка параметров, т.е. выделенных файлов
  label3.Caption:='X = ' + inttostr(scalex) + '%';
  trackbar1.Position := scalex;
  label4.Caption:='Y = ' + inttostr(scaley) + '%';
  trackbar2.Position := scaley;
  for i := 0 to 19 do ex[i] := false;
  image1click(image1);
end;

procedure tform1.LoadFiles;
var
  i, j: integer;
  pr: string;
  fl: boolean;
begin
   pr:='';
   for i:=1 to ParamCount do
     begin
       if ((copy(paramstr(i), 1,1) = '/') or
          (copy(paramstr(i), 1,1) = '*')) and (pr <> '') then
            begin
              addpict(pr);
              pr:='';
            end;
       pr:=pr+' '+paramstr(i);
     end;
     if pr<>'' then addpict(pr);

     exit;

   fl:=false;
   for i:=1 to ParamCount do
     begin
        fl:=pos(#13, paramstr(i))>0;
        if fl then break;
     end;
   if fl then  // Nautilus и т.п.
      begin
       pr:='';
       for i:=1 to ParamCount do pr:=pr+paramstr(i);
       repeat
         j:= pos(#13, pr);
         addpict(copy(pr, 1, length(pr)-(j+1)));
         pr:=copy(pr, j+1, length(pr)-j);
       until pr='';
      end else for i := 1 to ParamCount do addpict(paramstr(i)); // для Dolphin и т.п
   if buf = 0 then showmessage ('Файлов, пригодных для печати не обнаружено');
end;

procedure tform1.GetUserSize;
// установить произвольный размер бумаги (открыть панель приема размера)
begin
   panel5.Left:=25;
   panel5.Top:=260;
   panel5.Visible:=true;
   labelededit1.Text:='210';
   labelededit2.Text:='297';
   labelededit3.Text:='2';
 end;

procedure tform1.MoveStart(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then
    begin
      (sender as timage).Cursor:=crsizeall;
      flagmove:=true;
      movx:=x;
      movy:=y;
      (sender as timage).BringToFront;
    end;
end;

procedure tform1.MoveEnd(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i: integer;
begin
  flagmove:=false;
  if buf > 0 then for i:=0 to steplist(comp)-1 do toprint[i+showindex].z:=showp[i].Tag;
  (sender as timage).Cursor:=crdefault;
end;


procedure tform1.MoveNow(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  imindex := GetPictIndex(sender);
  if flagmove then if (abs(x-movx)<>1) and (abs(y-movy)<>1) then
    begin
       (sender as timage).Left:=(sender as timage).Left + (x-movx) div 2;
       (sender as timage).Top:=(sender as timage).Top + (y-movy) div 2;
       movx:=x;
       movy:=y;
       num:=showindex+strtoint(copy((sender as timage).Name, 3, 2));
       toprint[num].left:=(sender as timage).Left;
       toprint[num].top:=(sender as timage).Top;
    end;
end;

procedure tform1.RefreshScreen; // обновить изображение
begin
  for num:=0 to buf-1 do toprint[num].show:=false;
  endstep(0);
end;


procedure tform1.SetListPrn;
// установить размер заготовки в соответствии с форматом листа и его ориентацией
var
  Prin: TPrinter;
begin
  prin := Printer;
  if orn=0 then
    begin
      image11.Width:=trunc(prin.XDPI * (frms[frm][0] / 25.4)); // точек по горизонтали
      image11.Height:=trunc(prin.YDPI * (frms[frm][1] / 25.4)); // точек по вертикали
    end else begin
      image11.Width:=trunc(prin.XDPI * (frms[frm][1] / 25.4)); // точек по горизонтали
      image11.Height:=trunc(prin.YDPI * (frms[frm][0] / 25.4)); // точек по вертикали
    end;
  //label10.Caption:=inttostr(image11.Width)+'-'+ inttostr(image11.Height);
end;


procedure tform1.showlistnum;
// показать номер текущего листа предпросмотра и сколько всего листов
var
  i: integer;
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
  toprint[num].left:=im.Left;
  toprint[num].top:=im.Top;
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
  toprint[num].heigth:=im.Height;
  toprint[num].width:=im.Width;
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
      AddPict(odl1.FileName);
      image1click(image1);
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  label3.enabled := not label3.enabled;
  label4.enabled := not label4.enabled;
  trackbar1.enabled := not trackbar1.enabled;
  trackbar2.enabled := not trackbar2.enabled;
  checkbox1.enabled := not checkbox1.enabled;
end;

procedure TForm1.Button7Click(Sender: TObject);
// О программе
begin
     form2.Show;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  inc(pol);
  label12.Caption:='['+FloatToStr(pol/2)+']';
  RefreshScreen;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  dec(pol);
  label12.Caption:='['+FloatToStr(pol/2)+']';
  RefreshScreen;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
    RefreshScreen;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
   button8.Enabled:=not checkbox3.Checked;
   button9.Enabled:=not checkbox3.Checked;
   trackbar3.Enabled:=not checkbox3.Checked;
   if checkbox3.Checked then begin tmp_pol:=pol; pol:=0; end
      else pol:=tmp_pol;
   if (comp=1) and checkbox3.Checked then FillList;
   label12.Caption:=FloatToStr(pol/2);
   RefreshScreen;
 end;

procedure tform1.FillList;
// Расчитать значение отрицательных полей для полного заполнения листа
// в первой компоновке
var
  e: extended;
  x, y: integer;
begin
     x:=showp[0].Width; y:=showp[0].Height;
     e :=  showp[0].Width / showp[0].Height;
     showp[0].Height:=ver;
     showp[0].Width:=trunc(showp[0].Height * e);
     pol := (gor - showp[0].Width) div 2;
     if pol>0 then
       begin
          showp[0].Width:=x; showp[0].Height:=y;
          e :=  showp[0].Height / showp[0].Width ;
          showp[0].Width:=gor;
          showp[0].Height:=trunc(showp[0].Width * e);
          pol := (ver - showp[0].height) div 2;
       end;
 end;

procedure TForm1.TrackBar3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// быстрое изменение размера полей
begin
    pol:=trackbar3.Position * 2;
    label12.Caption:='['+FloatToStr(pol/2)+']';
    RefreshScreen;
end;


procedure TForm1.ComboBox1Change(Sender: TObject);
// Выбор нового формата листа
begin
   if frm <> 5 then num := frm;
   frm := combobox1.ItemIndex;
   if frm = -1 then frm := 0;
   if frm = 5 then
     begin
       getusersize;
       exit;
     end;
   endfrms;
end;

procedure tform1.endfrms;
begin
   scl:=frms[frm][2];
   gor:=frms[frm][0] * scl;
   panel1.Caption:=capt[frm];
   if orn = 0 then begin gor:=frms[frm][0] * scl; ver:=scl*frms[frm][1]; end
              else begin gor:=frms[frm][1] * scl; ver:=scl*frms[frm][0]; end;
   panel1.Width:=gor;
   panel1.Height:=ver;
   panel1.top:=(594 - ver) div 2 + 80;
   form1.Width := 773 + (gor - 420);
   label5.Width:=gor;
   label5.Top:= panel1.Top - 24;
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

procedure TForm1.Button10Click(Sender: TObject);
begin
  frms[5][0]:=strtoint(labelededit1.Text);
  frms[5][1]:=strtoint(labelededit2.Text);
  frms[5][2]:=strtoint(labelededit3.Text);
  endfrms;
  panel5.Visible:=false;
  combobox1.ItemIndex:=-1;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  panel5.Visible:=false;
  frm:=num;
  combobox1.ItemIndex:=num;
  endfrms;
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
   image11.Canvas.Clear;
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
   prn;
   label6.visible:=false;
   //image11.visible:=true;
   //panel1.visible:=false;
   //image11.Proportional:=true;
   //label11.Caption:=inttostr(image11.Width)+'-'+ inttostr(image11.Height);
   //image11.Width:= image11.Width div 20;
   //image11.Height:= image11.Height div 20;
   //label10.Caption:=inttostr(image11.Width)+'-'+ inttostr(image11.Height);
end;

procedure TForm1.Prn;
// печать страницы
var
  Prin: TPrinter;
  Im: TRect;
  x, y: integer;
  sm: integer;
  sx, sy: extended;
begin
  prin := Printer;

  //prin.PageWidth:=trunc((prin.XDPI / 25.4) * frms[frm][0]);
  //prin.PageHeight:=trunc((prin.YDPI / 25.4) * frms[frm][1]);
  if orn = 0 then prin.Orientation:=poPortrait else prin.Orientation:=poLandscape;
  sx:= prin.PageWidth / prin.PaperSize.Width;
  sy:= prin.PageHeight / prin.PaperSize.Height;
  x := trunc(image11.Picture.Width * (scalex / 100) * sx);
  y := trunc(image11.Picture.Height * (scaley / 100) * sy);
  //exit;
  // Начало печати
  prin.BeginDoc;
  prin.Title:='Картинки';
  sm:= (prin.PageWidth - image11.Width) div 2;
  Im:=Rect(sm, 0, x+sm, y);
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
      num:=i+index;
      if num >= buf then
        begin
          showp[i].Picture:=nil;
          continue;
        end;
      showp[i].Center := true;
      if not(toprint[num].load) then
                                  begin
                                   toprint[num].pct.loadfromfile(toprint[num].pict);
                                   toprint[num].load:=true;
                                  end;
      showp[i].Picture:=toprint[num].pct;
      if toprint[num].show then
          begin
             showp[i].Left:=toprint[num].left;
             showp[i].Top:=toprint[num].top;
             showp[i].Height:=toprint[num].heigth;
             showp[i].Width:=toprint[num].width;
             showp[i].Tag:=toprint[num].z;
          end else
          begin
             // подогнать размер
             setsize(showp[i]);
             // уточнить позицию
             setpos(showp[i]);
             toprint[num].show:=true;
             toprint[num].z:=showp[i].Tag;
          end;
    end;
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
  showp[i].OnMouseDown:=@MoveStart;
  showp[i].OnMouseMove:=@MoveNow;
  showp[i].OnMouseUp:=@MoveEnd;
  showp[i].PopupMenu := popupmenu1;
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
  for num:=0 to buf-1 do toprint[num].show:=false;
  label6.visible:=true;
  self.Repaint;
  showindex := 0;
  createlist;
  showpict(showindex);
  image8.Picture := im.Picture;
  showlistnum;
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

procedure TForm1.LabeledEdit1Change(Sender: TObject);
var
  a: char;
begin
  if fl then
    begin
     fl:=false;
     label9.Visible:=false;
     if length((sender as tLabelededit).Text)=0 then (sender as tLabelededit).Text:='0';
     a := (sender as tLabelededit).Text[length((sender as tLabelededit).text)];
     if not (a in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then label9.Visible:=true;
     label13.Visible:=label9.Visible;
     if label9.Visible then (sender as tLabelededit).Text:=copy((sender as tLabelededit).Text, 1, length((sender as tLabelededit).Text)-1) + '';
     fl:=true;
  end;
end;

function tform1.getpictindex(sender:  TObject): integer;
// получить номер картинки в общем списке по image, в котором ее видно
var
  s: string;
begin
  s:= (sender as timage).Name;
  result:=strtoint(copy(s, 3, 2))+showindex;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
// удалить картинку совсем
var
  i, j: integer;
begin
  i:=imindex;
  for j:=i to buf-2 do toprint[j] := toprint[j+1];
  dec(buf);
  setlength(toprint, buf);
  refreshscreen;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
//удалить картинку, но ee место не занимать
var
  i: integer;
begin
  i:=imindex;
  toprint[i].pict := '';
  toprint[i].pct:=nil;
  refreshscreen;
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  label2.Caption := '4 х 5';
  comp := 10;
  endclick(sender as timage);
  panel1.visible:=true;
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

procedure TForm1.StaticText1Click(Sender: TObject);
begin

end;


procedure tform1.setpg(p: string);
// установить формат бумаги
begin
  p:=uppercase(p);
  if p='*PA4' then combobox1.ItemIndex:=0;
  if p='*PA5' then combobox1.ItemIndex:=1;
  if p='*PA6' then combobox1.ItemIndex:=2;
  if p='*P10X15' then combobox1.ItemIndex:=3;
  if p='*P15X20' then combobox1.ItemIndex:=4;
  combobox1change(nil);
  if copy(p,1,3)='*PX' then setpg2(p);
end;

procedure tform1.setpg2(p: string);
// установить пользовательский формат бумаги из командной строки
var
  i, j: integer;
begin
  i:=pos('Y', p);
  if i=0 then exit;
  for j:=4 to i-1 do if not(p[j] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then exit;
  for j:=i+1 to length(p) do if not(p[j] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then exit;
  frms[5][0]:=strtoint(copy(p, 4, i-4));
  frms[5][1]:=strtoint(copy(p, i+1, length(p)-i));
  frms[5][2]:=trunc((300-frms[5][0])/50);
  if frms[5][2]=0 then frms[5][2]:=1;
  frm:=5;
  endfrms;
  combobox1.ItemIndex:=-1;
  combobox1.text:=copy(p, 4, i-4)+'x'+copy(p, i+1, length(p)-i);
end;

procedure tform1.setcomp(p: string);
// установка начальной компоновки из командной строки
begin
  if (length(p)<>3) or not (p[3] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    begin
     Image1Click(image1);
     exit;
    end;
  case strtoint(p[3]) of
    0: Image1Click(image1);
    1: Image2Click(image2);
    2: Image3Click(image3);
    3: Image4Click(image4);
    4: Image5Click(image5);
    5: Image6Click(image6);
    6: Image7Click(image7);
    7: Image9Click(image9);
    8: Image10Click(image10);
    9: Image12Click(image12);
  end;
end;

procedure tform1.AddPict(p: string);
// анализ параметров запуска
var
  s: string;
begin
  p:=trim(p);
  if (copy(p, 1, 2)='*c') or
      (copy(p, 1, 2)='*C') then
        begin
          sc:=p;
          exit;
        end;
  if (copy(p, 1, 2)='*p') or
      (copy(p, 1, 2)='*P') then
        begin
          setpg(p);
          exit;
        end;
  if (copy(p, 1, 3)='*ns') or
      (copy(p, 1, 3)='*NS') then
        begin
          checkbox1.Checked:=false;
          exit;
        end;
  if (copy(p, 1, 3)='*x=') or
     (copy(p, 1, 3)='*X=') then
       begin
         ScaleX := strtoint(copy(p, 4, length(p)-2));
         exit;
       end;
  if (copy(p, 1, 3)='*y=') or
     (copy(p, 1, 3)='*Y=') then
       begin
         ScaleY := strtoint(copy(p, 4, length(p)-2));
         exit;
       end;
  s := copy(p, (length(p)-3), 4);
  s := uppercase(s);
  if (s = '.JPG') or (s = '.BMP') or (s = '.PNG') or (s = '.ICO') or (s = 'JPEG')then
    begin
      inc(buf);
      setlength(toprint, buf);
      toprint[buf-1].pict := p;
      toprint[buf-1].rot := 0;
      toprint[buf-1].pct:=tPicture.Create;
      toprint[buf-1].left:=0;
      toprint[buf-1].top:=0;
      toprint[buf-1].show:=false;
      toprint[buf-1].load:=false;
      toprint[buf-1].z:=0;
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


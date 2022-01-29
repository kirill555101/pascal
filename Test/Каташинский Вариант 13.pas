uses crt;
type
  mas=array[1..100,1..100] of integer;
var
  n,x,y,x1,y1:integer;
function searchmax(g:mas):integer;
var max,i,j:integer;
begin
  max:=0;
  for i:=1 to n do
    for j:=1 to n do
      if (j>=i) and ((i+j)<=(n+1)) and (g[i,j]>max) then begin
        x:=i;
        y:=j;
        max:=g[i,j];
      end;
  result:=max;
end;

function searchmin(g:mas):integer;
var min,i,j:integer;
begin
  min:=1000;
  for i:=1 to n do
    for j:=1 to n do
      if (j<=i) and ((i+j)>=(n+1)) and (g[i,j]<min) then begin
        x1:=i;
        y1:=j;
        min:=g[i,j];
      end;
  result:=min;
end;
procedure zamena(var g:mas);
var t:integer;
begin
  t:=g[x,y];
  g[x,y]:=g[x1,y1];
  g[x1,y1]:=t;
end;
var
  a:mas;
  max,min,i,j:integer;
begin
  writeln('Введите размерность матрицы n*n,n<=100');
  read(n);
  writeln('Введите матрицу вида ',n,'*',n);
  for i:=1 to n do
    for j:=1 to n do
      read(a[i,j]);
  writeln('Исходная матрица');
  for i:=1 to n do begin
    for j:=1 to n do
      write(a[i,j]:4);
    writeln;
  end;
  writeln;
  max:=searchmax(a);
  min:=searchmin(a);
  writeln('Наибольший элемент равен ',max);
  writeln('Наименьший элемент равен ',min);
  writeln;
  writeln('Новая матрица');
  writeln;
  zamena(a);
  for i:=1 to n do begin
    for j:=1 to n do
      write(a[i,j]:4);
    writeln;
  end;
  readln;
end.
  
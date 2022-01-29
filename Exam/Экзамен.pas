type
  sym=class
    private
      s:char;
    public
      procedure init(s1:char);
      function getchar:char;
  end;
  
  str=class
    private
      stroka:array[1..15] of sym;
    public
      procedure initall(s:char;i:integer);
      procedure print;
      procedure destroy;
  end;
  
procedure sym.init(s1:char);
begin
  s:=s1;
end;

function sym.getchar:char;
begin
  result:=s;
end;

procedure str.initall(s:char;i:integer);
begin
  stroka[i]:=new sym;
  stroka[i].init(s);
end;

procedure str.print;
var 
  i:integer;
begin
  for i:=1 to 15 do
    write(stroka[i].getchar);
end;

procedure str.destroy;
var 
  i:integer;
begin
  for i:=1 to 15 do
    stroka[i]:=nil;
end;

var
  str1:str;
  i:integer;
  c:char;
begin
  str1:=new str;
  for i:=1 to 15 do begin
    read(c);
    str1.initall(c,i);
  end;
  str1.print;
  str1.destroy;
  str1:=nil;
end.
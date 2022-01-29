Type 
  tpel=^element;
  element=record
    num:integer;
    p:tpel; 
  end;
var
  first,q:tpel;
  a:integer;
procedure vuvod(e:tpel);
begin
  if (e^.p<>nil) then
    vuvod(e^.p);
  write(e^.num,' ');
end;
begin
  writeln('Введите последовательность, в конце которой стоит 0.');
  new(first);
  read(a);
  first^.p:=nil;
	first^.num:=a;  
  while (a<>0) do begin
    read(a);
    new(q);
	  q^.num:=a;   
	  q^.p:=first;
	  first:=q;
  end;
  writeln('Исходный список:');
  vuvod(q);
  writeln;
  a:=first^.num;
  q:=first;
  while (q^.p<>nil) do
    q:=q^.p;
  first^.num:=q^.num;
  q^.num:=a;
  writeln('Новый список:');
  q:=first;
  vuvod(q);
  writeln;
  while (q^.p<>nil) do begin
    first:=q^.p;
    dispose(q);
    q:=first;
  end;
  dispose(q);
  q:=nil;
end.
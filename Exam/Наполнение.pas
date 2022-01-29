type
  troom=class
    private
      length,width:single;
    public
      function square:single;
      procedure init(l,w:single);
  end;
  tbroom=class(troom)
    private
      pb:troom;
    public
      function bsquare:single;
      procedure initall(l,w:single;lb,wb:single);
  end;
  function troom.square:single;
  begin
    result:=length*width;
  end;
  procedure troom.init(l,w:single);
  begin
    length:=l; width:=w
  end;
  procedure tbroom.initall(l,w:single;lb,wb:single);
  begin
    init(l,w);
    if (lb=0) or (wb=0) then 
      pb:=nil
    else begin
      pb:=new troom; pb.init(lb,wb);
    end;
  end;
  function tbroom.bsquare:single;
  begin
    if pb=nil then 
      result:=square
    else 
      result:=square+pb.square;
  end;
var
  b:tbroom;
begin
  b:=new tbroom;
  b.initall(3.4,5.1,1.8,0.8);
  writeln('bsquare=',b.bsquare:8:2);
end.
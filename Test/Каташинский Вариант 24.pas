uses crt;

var
  x, k: real;
  i, n: integer;
  t: boolean;

begin
  writeln('Введите число x');
  readln(x);
  writeln('Значения sin(x^n) равны:');
  n := 0;
  for i := 1 to 50 do
  begin
    k := power(x, i);
    writeln('sin(', x, '^', i, ') =', sin(k):10);
    if (sin(k) < 0) then n := n + 1;
  end;
  if (n > 3) then t := true
  else t := false;
  writeln;
  writeln('Значение t равно ', t);
end.
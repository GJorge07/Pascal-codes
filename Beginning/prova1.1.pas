program tabuada;
var
    n,i:integer;
begin
    read(n);
    i:=1;
    while i<=10 do
    begin
        writeln(n*i);
        i:=i+1;
    end;
end.
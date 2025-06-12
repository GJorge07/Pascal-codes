program mediia;
var
    n,m,cont,soma:real;
    media:real;
begin 
    read(n,m);
    cont:=1;
    while cont <=10 do
    begin
        soma:=(n+m)/2;
        writeln(soma);
        read(n,m);
        cont:=cont+1;
    end;
end.
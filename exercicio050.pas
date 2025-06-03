program exercicio050;
var
    a,b,i,cont:longint;
begin
    read(a,b);
    cont:=0;
    while a mod b = 0 do 
begin
    i:=a div b;
    cont:=cont+1;
    a:=i;
    end;
    writeln(cont);
end.
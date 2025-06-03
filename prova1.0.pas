program raizqdd;
var
    n,cont,x:real;
begin  
    read(n);
    cont:=1;
    while cont<=n do
    begin  
        x:=sqrt(cont);
        write(x);
        cont:=cont+1;
    end;
end.
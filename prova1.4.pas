program fatorialaten;
var
    n,cont,fatorial,u:longint;
begin
    read(n);
    cont:=1;
    fatorial:=1;
    u:=1;
    while cont<=n do
    begin
        fatorial:=fatorial*cont;
        u:=fatorial;
        writeln(fatorial);
        cont:=cont+1;
        fatorial:=u;
    end;
end.
        

{OU}
program fatorial1_n_v2;
var
    cont , n, fat : integer;
begin
    read (n) ;
    cont:= 1;
    fat:= 1;
    while cont <= n do
    begin
        fat:= fat * cont;
        writeln (fat) ;
        cont:= cont + 1;
    end;
end.
        
        

        
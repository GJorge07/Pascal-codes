program invertenumero;
var
    n,unidade,inverso:longint;
begin;
    read(n);
    inverso:=0;
    while n<>0 do 
    begin
        unidade:=n mod 10;
        inverso:=inverso*10+unidade;
        n:=n div 10;
    end;
        writeln(inverso);
end.

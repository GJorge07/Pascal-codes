program decimalbinario;
var
    n,pot2:longint;
begin
    read(n);
    pot2:=128;
        while pot2>0 do
    begin
        if n<pot2 then
            writeln(0)
        else
        begin
            writeln(1);
            n:=n-pot2;
        end;
        pot2:=pot2 div 2;
    end;
end.
program tabuada;
var
    i,j:longint;
begin  
    i:=1;
    while i<=10 do
    begin
        j:=1;
        while j<=10 do
        begin
            writeln(i*j);
            j:=j+1;
        end;
        i:=i+1;
    end;
end.>
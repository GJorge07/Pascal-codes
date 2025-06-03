program mdceuclideano;
var
a,b,resto:longint;
begin
    read(a,b);
    resto:=a mod b;
    while resto<>0 do 
    begin
        a:=b;
        b:=resto;
        resto:=a mod b;
    end;
    writeln(b);
end.

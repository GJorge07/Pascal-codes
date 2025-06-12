program abc;
var
    a,b,c,x,e:real;
begin
    read(a,b,c);
    read(x);
    e:=a*(x*x)+(b*x)+c;
    while x<>0 do 
    begin
        writeln(e:0:2);
        read(x);
        e:=a*(x*x)+(b*x)+c;
    end;
end.

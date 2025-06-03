program mediadosn;
var 
    n,media,cont:real;
begin
    read(n);
    media:=0;
    cont:=0;
    while n<>0 do   
    begin
        media:=media+n;
        read(n);
        cont:=cont+1;
    end;
        writeln(media /cont :0:2);
end.
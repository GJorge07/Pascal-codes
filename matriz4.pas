program permutacaoemmatriz;

type matriz = array[1..100,1..100] of longint;

var w:matriz;
    n:longint;

procedure lematriz(var w:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do   
        for j:=1 to n do
            read (w[i,j]);
end;






begin
    read(n);
    lematriz(w,n);
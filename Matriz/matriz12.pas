program ampulheta;

type matriz = array[1..100,1..100] of longint;

var m:matriz;
    n,soma:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do 
            read(m[i,j]);
end;

function maior_ampulheta(var m:matriz;n:longint):longint;
var i,j,soma,maior:longint;
begin
    maior:=0;
    for i:=1 to n-2 do
        for j:=1 to n-2 do
        begin
            soma:= m[i,j] + m[i,j+1] + m[i,j+2] + m[i+1,j+1] + m[i+2,j] + m[i+2,j+1] + m[i+2,j+2];
            if soma > maior then
                maior:=soma;
        end;
    maior_ampulheta:=maior;
end;

begin
    read(n);
    lematriz(m,n);
    soma:=maior_ampulheta(m,n);
    writeln(soma);
end.
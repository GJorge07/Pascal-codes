program provafinal;

type matriz = array[1..1000,1..1000] of longint;

var w:matriz;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

function somasubmatriz(m:matriz;linini,colini,linfim,colfim:longint;):longint;
var i,j,s:longint;
begin
    s:=0;
    for i:=linini to linfim do
        for j:=colini to colfim do
            s:=s + w[i,j];
    somasubmatriz:=s;
end;

begin
    read(m,n);
    lematriz(w,m,n);
    somatotal:=somasubmatriz(w,1,1,m,n);
    for k:=1 to lin1 do
        for s:=1 to col1 do
        begin
            s1:=somasubmatriz(w,1,1,i,j);
            s2:=somasubmatriz(w,i,j,m,n);
            somasub:=s1+s2 -m[i,j];
            if somasub = somatotal - somasub then
                writeln(i,' 'j);
        end;
end;
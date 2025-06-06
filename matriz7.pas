program buscaemmatriz;

type matriz = array[1..100,1..100] of longint;

var w:matriz;
    m,n,x:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do   
        for j:=1 to n do
            read (w[i,j]);
end;

function buscamatriz(var w:matriz;m,n,x:longint):boolean;
var i,j:longint;
    achou: boolean;
begin
    achou:=false;
    i:=1;
        while (i<=m) and not achou do
        begin
            j:=1;
                while (j<=n) and not achou do
                begin
                    if w[i,j] = x then
                        achou:=true;
                        j:=j+1;
                end;
            i:=i+1;
        end;
    buscamatriz:=achou;              
end;

begin
    read(m);
    read(n);
    lematriz(w,m,n);
    read(x);
    if buscamatriz(w,m,n,x) then
        writeln('sim')
    else 
        writeln('nao');
end.
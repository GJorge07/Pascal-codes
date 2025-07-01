program borda;

type matriz = array[1..1000,1..1000] of longint;

var m:matriz;
    i,j,n,tam:longint;
    ok:boolean;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

procedure imprime_matriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
            write(m[i,j],' ');
        writeln;
    end;
end;

function achar_borda_quadrada(var m:matriz;n,linini,colini,tam:longint):boolean;
var i,j,valor:longint;
begin
    valor:=m[linini,colini];
    for i:=1 to tam do
        for j:=1 to tam do
        begin
            if m[linini,j] <> valor then
                achar_borda_quadrada:=false;
            if m[i,colini] <> valor then
                achar_borda_quadrada:=false;
        end;

    achar_borda_quadrada:=true;
end;

procedure remover_cor(var m:matriz; n, k: longint);
var i, j: longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            if m[i,j] = k then
                m[i,j]:=0;
end;

begin
    read(n);
    lematriz(m,n);
    ok:=false;
    for tam:=2 to n do
        for i:=1 to n-tam+1 do
            for j:=1 to n-tam+1 do
                if ((i=1) and (j=1)) and achar_borda_quadrada(m,n,i,j,tam) then
                begin
                    ok:=true;
                end;
    if ok then 
    begin
        remover_cor(m,n,m[i,j]);
        imprime_matriz(m,n);
    end;

end.
{n foi exatamente oq o exercicio pediu mas foi oq eu consegui fazer}
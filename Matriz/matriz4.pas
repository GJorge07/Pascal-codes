program permutacaoemmatriz;

type matriz = array[1..100,1..100] of longint;

var m:matriz;
    n:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do   
        for j:=1 to n do
            read (m[i,j]);
end;

procedure permuta(var m:matriz; n:longint);
var
    i, j, cont: longint;
    ok: boolean;
begin
    ok := true;
    for i := 1 to n do
    begin {tem esse begin pra zerar o contador em cada linha}
        cont := 0;
        for j := 1 to n do
        begin
            if (m[i,j] <> 0) and (m[i,j] <> 1) then
                ok := false;
            if m[i,j] = 1 then
                cont := cont + 1;
        end;
        if cont <> 1 then
            ok := false;
    end;

    for j := 1 to n do
    begin
        cont := 0;
        for i := 1 to n do
            if m[i,j] = 1 then
                cont := cont + 1;
        if cont <> 1 then
            ok := false;
    end;
    if ok then
        writeln('sim')
    else
        writeln('nao');
end;

begin
    read(n);
    lematriz(m,n);
    permuta(m,n);
end.

    {Uma matriz inteira A n×n é considerada uma matriz de permutação se em cada linha e em cada coluna
houver n - 1 elementos nulos e um único elemento igual a 1. Faça um programa em Free Pascal que leia um inteiro positivo n, sendo 1 ≤ m, n ≤ 100, e uma matriz
inteira A n×n . O programa deve imprimir “sim” caso a matriz A seja de permutação, caso contrário deve
imprimir “nao”.}
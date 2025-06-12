program farmaalgquadradomagico1;

type matriz = array[1..100,1..100] of longint;

var m:matriz;
    n:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

function linhas(var m:matriz;n:longint):longint;
var i,j,soma1,soma:longint;
    iguais:boolean;
begin
    soma1:=0;
    for j:=1 to n do
        soma1:=soma1 +m[1,j];
    iguais:=true;
    for i:=2 to n do
    begin
        soma:=0;
        for j:=1 to n do
            soma:=soma + m[i,j];
        if soma <> soma1 then
            iguais:= false;
    end;
    if iguais then 
        linhas:=soma1;
end;

function colunas(var m:matriz;n:longint):longint;
var i,j,soma1,soma:longint;
    iguais:boolean;
begin
    soma1:=0;
    for i:=1 to n do
        soma1:=soma1 +m[i,1];
    iguais:=true;
    for j:=2 to n do
    begin
        soma:=0;
        for i:=1 to n do
            soma:=soma + m[i,j];
        if soma <> soma1 then
            iguais:= false;
    end;
    if iguais then 
        colunas:=soma1;
end;

function diagprincipal(var m:matriz;n:longint):longint;
var i,j,soma:longint;
begin
    soma:=0;
    for i:=1 to n do
        for j:=1 to n do
            if i=j then
                soma:=soma + m[i,j];
    diagprincipal:=soma;
end;

function diagsecundaria(var m:matriz;n:longint):longint;
var i,soma:longint;
begin
    soma:=0;
    for i:=1 to n do
        soma:=soma+m[i,n-i+1];
        diagsecundaria:=soma;
end;

begin
    read(n);
    lematriz(m,n);
    if (linhas(m,n) = colunas(m,n)) and (colunas(m,n) = diagprincipal(m,n)) and (diagprincipal(m,n) = diagsecundaria(m,n)) then 
        writeln('sim')
    else 
        writeln('nao');
end.
program quadradomagico2;

type matriz = array[1..1000,1..1000] of longint;

var m:matriz;
    n:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do 
        for j:=1 to n do
            read(m[i,j]);
end;
{peguei essas proximas funções do quadmagico1}
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


function quadmagico(var m:matriz;n:longint):boolean;
begin
    quadmagico:=false;
    if (linhas(m,n) = colunas(m,n)) and (colunas(m,n) = diagprincipal(m,n)) and (diagprincipal(m,n) = diagsecundaria(m,n)) then
        quadmagico:=true;
end;

function quadmagico2(var m:matriz;n:longint):longint;
var i,j,cont,k,s,tam:longint;
    sub:matriz;
begin
    cont:=0;
    for tam:=2 to n do  {pro tamanho ser >=2}
        for i:=1 to n-tam+1 do  {pra caber na matriz}
            for j:=1 to n-tam+1 do
            begin
                for k:=1 to tam do       {pra fzr todos os tamanhos possiveis}
                    for s:=1 to tam do
                        sub[k,s]:=m[i+k-1,j+s-1]; {pra copiar os numeros da matriz original pra essa}
                    if quadmagico(sub,tam) then {primeiro verifica a matriz toda, dps verifica - por isso ta fora do laço de s}
                            cont:=cont+1;
            end;
    quadmagico2:=cont;
end;

begin
    read(n);
    lematriz(m,n);
    writeln(quadmagico2(m,n));
end.

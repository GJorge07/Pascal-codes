program relembrandosubmatriz;

type matriz = array[1..1000,1..1000] of longint;

var m1,m2:matriz;
    lin1,col1,lin2,col2,lin,col:longint;

procedure lematriz(var m:matriz;x,n:longint);
var i,j:longint;
begin
    for i:=1 to x do
        for j:=1 to n do
            read(m[i,j]);
end;

function submatriz(var m1,m2:matriz;lin1,col1,lin2,col2:longint;var lin,col:longint):boolean;
var i,j,k,s:longint;
    ok,achou:boolean;
begin
    achou:=false;
    for i:=1 to lin1 - lin2 + 1 do
        for j:=1 to col1 - col2 + 1 do
            begin
                ok:=true;
                for k:=1 to lin2 do
                    for s:=1 to col2 do
                        if m2[k,s]<>m1[i+k-1,j+s-1] then
                            ok:=false;
                if ok and not achou then
                begin
                    lin:=i;
                    col:=j;
                    achou:=true;
                end;
            end;
    submatriz:=achou;
end;


begin
    read(lin1,col1);
    lematriz(m1,lin1,col1);
    read(lin2,col2);
    lematriz(m2,lin2,col2);
    if submatriz(m1,m2,lin1,col1,lin2,col2,lin,col) then
        writeln(lin,' ',col)
    else
        writeln('nao existe');
end.




{Escreva um programa que leia 2 matrizes (m1, m2) de dimensões n1xm1 e n2xm2, respectivamente, onde n2<=n1 e m2<=m1.  O programa deve determinar se existe uma submatriz em m1 que seja igual a m2.  Em caso afirmativo, o programa deve escrever a posição do elemento superior esquerdo da matriz m1 a partir do qual a matriz m2 foi encontrada.  Se a submatriz não foi encontrada, o programa deve escrever 'nao existe'.}
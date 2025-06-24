program submatriz;

type matriz = array[1..100,1..100] of longint;

var m1,m2:matriz;
    l1,c1,l2,c2,lin,col:longint;

procedure lematrizes(var m1,m2:matriz;var l1,c1,l2,c2:longint);
var i,j:longint;
begin
    read(l1);
    read(c1);
    for i:=1 to l1 do
        for j:=1 to c1 do
            read(m1[i,j]);
    
    read(l2);
    read(c2);
    for i:=1 to l2 do  
        for j:=1 to c2 do
            read(m2[i,j]);
end;

function temsubmatriz(var m1, m2: matriz;l1, c1, l2, c2: longint; var lin, col: longint): boolean;
var
    i, j, k, s: longint;
    igual: boolean;
begin
    for i := 1 to l1 - l2 + 1 do
        for j := 1 to c1 - c2 + 1 do {procura até na l1 e c2 máximos que der}
        begin
            igual := true;
            for k := 1 to l2 do
                for s := 1 to c2 do
                    if m1[i + k - 1, j + s - 1] <> m2[k, s]  then
                        igual := false; {compara elementos da m2 com os da m1 nos locais correspondentes}
            if igual then
            begin
                lin := i; 
                col := j;
                temsubmatriz := true;
                exit;
            end;
        end;
    temsubmatriz := false;
end;

begin
    lematrizes(m1,m2,l1,c1,l2,c2);
    if temsubmatriz(m1,m2,l1,c1,l2,c2,lin,col) then
        writeln(lin,' ',col)
    else 
        writeln('nao existe');
end.

{Escreva um programa que leia 2 matrizes (m1, m2) de dimensões n1xm1 e n2xm2, respectivamente, onde n2<=n1 e m2<=m1.  O programa deve determinar se existe uma submatriz em m1 que seja igual a m2.  Em caso afirmativo, o programa deve escrever a posição do elemento superior esquerdo da matriz m1 a partir do qual a matriz m2 foi encontrada.  Se a submatriz não foi encontrada, o programa deve escrever 'nao existe'.}
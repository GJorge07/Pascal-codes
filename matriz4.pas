program ex4farmaalg;

const MAX = 100;

type matriz = array[1..MAX,1..MAX];

var w:matriz;
    m,n: longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

function repetidos(var w:matriz;m,n:longint):boolean;
var i,j,proxlin,proxcol:longint;
    repetiu:boolean;
begin
    repetidos:=false;
    i:=1;
    while (i<=m) and not repetiu do
    begin
        j:=1;
            while(j<=n) and not repetiu do
            begin 
    end;


end;




begin
    read(m);
    read(n);
    lematriz(w,m,n,);
    if repetidos then
        writeln('sim')
    else 
        writeln('nao');
end;



{Faça um programa em Free Pascal que leia dois inteiros positivos m e n, sendo 1 ≤ m, n ≤ 100, e uma matriz A m×n . O programa deve imprimir “sim” se há elementos repetidos na matriz A, caso contrário deve imprimir “nao”.}
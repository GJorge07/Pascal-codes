program achamenormatriz;

const maxlin = 100;
      maxcol = 100;

type matriz = array[1..maxlin,1..maxcol] of longint;

var w:matriz;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

function menormatriz(var w:matriz;m,n:longint):longint;
var i,j:longint;
    menor:longint;
begin  
    menor:= w[1,1];
    for i:=1 to m do
        for j:=1 to n do 
            if w[i,j] < menor then
                menor:=w[i,j];
        menormatriz:=menor;

end;


begin
    read(m,n);
    lematriz(w,m,n);
    writeln(menormatriz(w,m,n));
end.
program multiplicacaomatriz;

type matriz = array[1..100,1..100] of longint;

var w,x,mult: matriz;
    m,linsoma,colsoma:longint;

procedure lematriz(var w,x:matriz;m:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to  m do 
            read(w[i,j]);
    for i:=1 to m do 
        for j:=1 to m do
            read(x[i,j]);
end;

procedure multmatriz(var w,x,mult:matriz;m,linsoma,colsoma:longint);
var i,j,k:longint;
begin
    linsoma:=m;
    colsoma:=m;
        for i:=1 to m do 
            for j:=1 to m do
            begin
                mult[i,j]:=0;
                for k:=1 to m do 
                    mult[i,j]:=mult[i,j] + (w[i,k] * x[k,j]);
                write(mult[i,j], ' ');
        end;
        writeln;
end;
begin 
    read(m);
    lematriz(w,x,m);
    linsoma:=m;
    colsoma:=m;
    multmatriz(w,x,mult,m,linsoma,colsoma);
end.
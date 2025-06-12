program inserircoluna;
type matriz = array[1..100,1..100] of longint;
      vetor = array[1..100] of longint;

var w:matriz;
    m,n,x,k:longint;
    v:vetor;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do   
        for j:=1 to n do
            read (w[i,j]);
end;

procedure levetor(var v:vetor;m:longint);
var i:longint;
begin
    for i:=1 to m do
        read(v[i]);
end;

procedure inserecoluna(var w:matriz;var v:vetor;m,n,k:longint);
var i,j:longint;
begin
    for j:=n downto k do
        for i:=1 to m do
            w[i,j+1]:=w[i,j];
    for i:=1 to m do 
        w[i,k]:=v[i];
        for i:=1 to m do
    begin
       for j:=1 to n+1 do
            write(w[i,j], ' ');
        writeln;
    end;
end;

begin
    read(m);
    read(n);
    lematriz(w,m,n);
    levetor(v,m);
    read(k);
    inserecoluna(w,v,m,n,k);
end.
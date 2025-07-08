program provafinal;

matriz = array[1..1000,1..1000] of longint;

var m1,m2:matriz;
    i,j,lin1,col1,lin2,col2:longint;
    achou:boolean;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do 
        for j:=1 to n do
            read(w[i,j]);
end;

function tem2igual(m1,m2:matriz;lin2,col2,i,j:longint):boolean;
var k,s,cont:longint;
    ok:boolean;
begin
    tem2igual:=false;
    cont:=0;
    for k:=1 to lin2 do
        for s:=1 to col2 do
            if m2[k,s] = m1[i+k-1,j+s-1] then
                cont:=cont+1;
                
    if cont = 2 then
        tem2igual:=true;
end;

begin
    read(lin1,col1);
    lematriz(m1,lin1,col1);
    read(lin2,col2);
    lematriz(m2,lin2,col2);
    achou:=false;
    for i:=1 to lin1 - lin2 + 1 do
        for j:=1 to col1 - col2 + 1 do
            if tem2igual(m1,m2,lin2,col2,i,j) then
            begin
                writeln('sim');
                achou:=true;
            end;
    if not achou then
        writeln('nao');
end.
      
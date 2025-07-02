program cacapalavras;

type matriz = array[1..1000,1..1000] of longint;
     vetor =  array[1..2000] of longint;

var v:vetor;
    w:matriz;
    m,n,lin,col,p:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

procedure levetor(var v:vetor;p:longint);
var i:longint;
begin
    for i:=1 to p do
        read(v[i]);
end;

function horizontal1(var w:matriz; var v:vetor; lin,col,p: longint): boolean;
var k: longint;
begin
    horizontal1 := true;
    for k := 1 to p do
        if v[k] <> w[lin, col + k - 1] then
        begin
            horizontal1 := false;
            exit;
        end;
end;

function horizontal2(var w:matriz;var v:vetor;lin,col,p:longint):boolean;
var k:longint;
begin
    horizontal2:=true;
    for k:=p downto 1 do
        if v[k] <> w[lin,col+k-1] then
        begin
            horizontal2:=false;
            exit;
        end;
end;


function vertical1(var w:matriz;var v:vetor;lin,col,p:longint):boolean;
var k:longint;
begin
    vertical1:=true;
    for k:= 1 to p do
        if v[k]<> w[lin+k-1,col] then
        begin
            vertical1:=false;
            exit;
        end;
end;

function vertical2(var w:matriz;var v:vetor;lin,col,p:longint):boolean;
var k:longint;
begin
    vertical2:=true;
    for k:=p downto 1 do 
        if v[k]<>w[lin+k-1,col] then
        begin
            vertical2:=false;
            exit;
        end;
end;


begin
    read(m,n);
    lematriz(w,m,n);
    read(p);
    levetor(v,p);
    read(lin,col);
    if horizontal1(w,v,lin,col,p) or horizontal2(w,v,lin,col,p) or vertical1(w,v,lin,col,p) or vertical2(w,v,p,lin,col) then
        writeln('sim')
    else
        writeln('nao');
end.

{o exit ali acho q n precisa}
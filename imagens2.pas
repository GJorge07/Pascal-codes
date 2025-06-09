program clarearimagem;

type imagem = array[1..1000,1..1000] of longint;

var m,n,max,cte:longint;
    p:imagem;

procedure lerimagem(var p:imagem;var m,n,max:longint);
var i,j:longint;
    s:string[2];
begin
    read(s);
    if s = 'P2' then
    begin
        read(n);
        read(m);
        read(max);
        for i:=1 to m do 
            for j:=1 to n do
                read(p[i,j]);
    end
    else
        writeln('formato invalido');
end;

procedure clarearimagem(var p:imagem;m,n,max,cte:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do 
        begin
            p[i,j]:= p[i,j] + cte;
            if p[i,j] > max then
                p[i,j]:= max;
        end;
end;

procedure imprimirimagem(var p:imagem;m,n,max:longint);
var i,j:longint;
begin
    writeln('P2');
    writeln(n,' ',m);
    writeln(max);
    for i:=1 to m do
    begin
        for j:=1 to n-1 do 
            write(p[i,j],' ');
            writeln(p[i,n]); {fazemos isso pq se colocassemos só 'n' e não 'n-1', ficaria um espaço extra após a última coluna};
    end;
end;

begin 
    lerimagem(p,m,n,max);
    read(cte);
    clarearimagem(p,m,n,max,cte);
    imprimirimagem(p,m,n,max);
end.
program detectabordas;

type imagem = array[1..1000,1..1000] of longint;

var m,n,max,limiar:longint;
    p,o:imagem;

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

procedure detectabordas(var p,o:imagem;m,n,limiar:longint;var max:longint);
var i,j,grad:longint;
begin
    for i:=1 to m do 
    begin
        o[i,1]:=0;
        o[i,n]:=0;
    end;
    for j:=1 to n do
    begin
        o[1,j]:=0;
        o[m,j]:=0;
    end;
{esses 2 for foram pra zerar as extremidades}
    for i:=2 to m-1 do
        for j:=2 to n-1 do 
        begin
            grad:=(p[i,j]*4- (p[i-1,j]+p[i,j-1]+p[i+1,j]+p[i,j+1]));
            if grad > limiar then
                o[i,j]:=255
            else
                o[i,j]:=0;    
        end;
    max:=255;
    {comparamos o valor *4 com a soma dos 4 vizinhos dele. Se for maior, o pixel vira branco, se não, vira preto.}
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
    read(limiar);
    detectabordas(p,o,m,n,limiar,max);
    imprimirimagem(o,m,n,max);
end.
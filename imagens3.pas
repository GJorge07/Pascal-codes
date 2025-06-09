program zoomimagem;

type imagem = array[1..1000,1..1000] of longint;

var m,n,max,co,lo,maxo:longint;
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

function maior(var o:imagem;lo,co:longint):longint;
var i,j,maiorr:longint;
begin
    maiorr:=o[1,1];
    for i:=1 to lo do 
        for j:=1 to co do 
            if o[i,j] > maiorr then
                maiorr:= o[i,j];
    maior:= maiorr;
end;

function mediados4(var p:imagem;i,j:longint):longint;
var x,y:longint;
begin
    x:=2*i - 1; {é i e j pq ta dentro da função zoom ali}
    y:=2*j - 1;  {formula p achar o canto sup esquerdo de cadabloco}
    mediados4:= (p[x,y] + p[x+1,y] + p[x,y+1] + p[x+1,y+1]) div 4;
end;

procedure zoom(var p,o:imagem;m,n:longint;var lo,co,maxo:longint); {lo = linha o; co = coluna o; maxo = max do o}
var i,j:longint;
begin   
    lo:= m div 2;
    co:= n div 2;
    for i:=1 to lo do 
        for j:=1 to co do
            o[i,j]:=mediados4(p,i,j);
    maxo:=maior(o,lo,co);
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
    zoom(p,o,m,n,lo,co,maxo);
    imprimirimagem(o,lo,co,maxo); {não precisa mudar o procedimento la em cima, ele n precisa ter as mesmas variaveis daqui!!!}
end.
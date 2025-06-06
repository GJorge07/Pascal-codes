program repetidos;

type matriz = array[1..100,1..100] of longint;

var w:matriz;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do   
        for j:=1 to n do
            read (w[i,j]);
end;

function achourepetidos(var w:matriz;m,n:longint):boolean;
var i,j,p,q:longint;
    repetiu:boolean;
begin
    i:=1;
    repetiu:=false;
    while (i<=m) and not repetiu do
    begin
        j:=1;
            while (j<=n) and not repetiu do
            begin
                p:=1;
                    while (p<=n) and not repetiu do
                    begin
                        q:=1;
                            while (q<=n) and not repetiu do
                            begin
                                if (w[p,q] = w[i,j]) and (p<>i) or (q<>j) then   {tem isso pra n comparar o elemento com ele mesmo}
                                    repetiu:=true;
                                q:=q+1;
                            end;
                        p:=p+1;
                    end;
                j:=j+1;
            end;
        i:=i+1;
    end;
achourepetidos:=repetiu;
end;

begin
    read(m);
    read(n);
    lematriz(w,m,n);
    if achourepetidos(w,m,n) then
        writeln('sim')
    else 
        writeln('nao');
end.
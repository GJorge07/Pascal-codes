program exerciciolivro;

const FIM = 0;
      MAX = 100;

type vetor = array[1..MAX] of longint;

var v:vetor;
    num,n:longint;

procedure levetor(var v:vetor;n:longint);
var i:longint;
begin  
    read(n);
    i:=1;
        while n<>0 do
        begin
            v[i]:=n;
            i:=i+1;
            read(n);
        end;
end;
        
function pertence(var v:vetor;num:longint):boolean;
var i:longint;
begin
    pertence:=false;
    for i:=1 to MAX do
        if v[i] = num then
            pertence:=true;
end;

begin
    levetor(v,n);
    read(num);
    while num<>0 do 
    begin
        if pertence(v,num) then
            writeln('pertence')
        else   
            writeln('nao pertence');
        read(num);
    end;
end.

{Faça um programa em Pascal que leia uma sequência de inteiros terminada em
zero e armazene esta sequência em um vetor. O zero não deve ser processado
pois serve para marcar o final da entrada de dados. Em seguida o programa
deve ler uma outra sequência de inteiros também terminada em zero e, para cada
valor lido, o programa deve dizer se ele pertence ou não ao vetor armazenado
previamente. Esta segunda sequência não precisa ser armazenada em vetores.
Use ao máximo funções e procedimentos apropriados.}
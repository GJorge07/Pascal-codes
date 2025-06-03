program exerciciolivro;

type vetor = array[1..100] of longint;

var v:vetor;
    n,num,p:longint;

procedure levetor(var v:vetor;var n,num:longint);
var i:longint;
begin
    read(n);
    for i:=1 to n do
    begin
        read(num);
        v[i]:=num;
    end;
end;

procedure removevetor(var v: vetor; var n: longint; p: longint);
var i: longint;
begin
    if (p >= 1) and (p <= n) then {ve se p é valido}
    begin
        for i := p to n - 1 do
            v[i] := v[i + 1];  // Desloca elementos para a esquerda
        n := n - 1;  // Reduz tamanho do vetor
    end;
end;

procedure escrevevetor(var v:vetor;n:longint);
var i:longint;
begin
    for i:=1 to n do
        write(v[i],' ');
    writeln;
end;

begin 
    levetor(v,n,num);
    read(p);
    removevetor(v,n,p);
    escrevevetor(v,n);
end.




{Faça um programa em Pascal que leia um inteiro n e em seguida leia n números
inteiros quaisquer. Seu programa deve então ler um número inteiro positivo p
que esteja na faixa de índices válidos do vetor e remover o conteúdo deste índice
do vetor, evidentemente reduzindo em uma unidade o tamanho do vetor. Ao
final, deve imprimir o vetor resultante. Sabendo que o vetor não está ordenado,
implemente uma procedure eficiente para fazer esta exclusão}
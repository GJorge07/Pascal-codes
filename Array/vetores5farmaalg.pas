program recomendacao;

type vetor = array[1..1000] of longint;

var v:vetor;
    n,p,tam:longint;

procedure levetor(var v:vetor;var n:longint;var tam:longint);
var i:longint;
begin
    i:=1;
    tam:=0;
    read(n);
    while n<>0 do 
    begin
        v[i]:=n;
        i:=i+1;
        tam:=tam+1;
        read(n);
    end;
end;

procedure temoun(var v:vetor;tam:longint);
var
    i, pos,p: longint;
begin
    read(p);
    while p <> 0 do
    begin
        pos := 0;
        for i := 1 to tam do
             if (p = v[i]) and (pos = 0) {pra pegar a primeira ocorrencia do numero só} then
            pos := i;
        if pos = 0 then
            writeln(0)
        else
            writeln(pos);
        read(p);
    end;
end;

begin 
    levetor(v,n,tam);
    if tam = 0 then
        writeln('vetor vazio')
    else 
        temoun(v,tam);
end.

{Faça um programa que leia uma sequência de inteiros terminada em zero e armazene esta sequência em um vetor. O zero não deve ser processado pois serve para marcar o final da entrada de dados. Em seguida o programa deve ler uma outra sequência de inteiros também terminada em zero e, para cada valor lido, o programa deve dizer qual a posição do valor dentro do vetor, caso o valor exista no vetor, ou 0 (zero) caso não exista. Esta segunda sequência não precisa ser armazenada em vetores. Use ao máximo funções e procedimentos apropriados.

}
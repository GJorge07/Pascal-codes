program subsequenciasfarmaalg;

const MAX = 100;

type vetor = array [1..MAX] of longint;

var
    v : vetor;
    n, pos, tamanho_subsequencia: longint;

procedure ler_vetor (var v: vetor; n: longint);
var i:longint;
begin
    for i:=1 to n do 
        read(v[i]);
end;

function tem_subsequencia_iguais (var v: vetor; n, tam_seg: longint): longint;
var
    i, j, k: longint;
    igual: boolean;
begin
    for i := 1 to n - tam_seg + 1 do
        for j := i + tam_seg to n - tam_seg + 1 do
        begin
            igual := true;
            for k := 0 to tam_seg - 1 do
                if v[i + k] <> v[j + k] then
                begin
                    igual := false;
                    break;
                end;
            if igual then
            begin
                tem_subsequencia_iguais := i;
                exit;
            end;
        end;
    tem_subsequencia_iguais := 0;
end;
begin
    read (n);
    ler_vetor (v,n); 
    pos:= 0;
    tamanho_subsequencia:= n div 2; // inicia com maior valor possivel
    while (pos = 0) and (tamanho_subsequencia >= 2) do
begin
    pos := tem_subsequencia_iguais(v, n, tamanho_subsequencia);
    if pos = 0 then
        tamanho_subsequencia := tamanho_subsequencia - 1;
end;
if pos > 0 then
    writeln(pos, ' ', tamanho_subsequencia)
else
    writeln('nenhuma');
{Faça um programa em Free Pascal que leia um número natural 0 < n ≤ 100 e em seguida leia uma sequência de n números também naturais. Seu programa deve verificar se existem duas subsequências iguais nesta sequência com tamanho pelo menos 2. O tamanho da sequência encontrada deverá ser máximo, se ela existir. Caso exista, seu programa deve imprimir o valor do ı́ndice i e do tamanho máximo da sequência m, nesta ordem, onde i é a primeira ocorrência da sequência que possui uma cópia na sequência original e m é o tamanho desta sequência que se repete. Caso contrário seu programa deve imprimir "nenhuma".}
program exerciciolivro;

type
  vetor = array[1..100] of longint;

var
  v: vetor;
  tam, p: longint;

procedure leVetor(var v: vetor; var tam: longint);
var
  i, n: longint;
begin
  i := 1;
  tam := 0;
  read(n);
  while n <> 0 do
  begin
    tam := tam + 1;
    v[i] := n;
    i := i + 1;
    read(n);
  end;
end;

procedure ordenaVetor(var v: vetor; tam: longint);
var
  i, j, aux: longint;
begin
  for i := 1 to tam - 1 do
    for j := i + 1 to tam do
      if v[i] > v[j] then
      begin
        aux := v[i];
        v[i] := v[j];
        v[j] := aux;
      end;
end;

function buscaBinaria(var v: vetor; p, tam: longint): longint;
var
  inicio, meio, fim: longint;
begin
  inicio := 1;
  fim := tam;
  buscaBinaria := 0;

  while inicio <= fim do
  begin
    meio := (inicio + fim) div 2;
    if v[meio] = p then
    begin
      buscaBinaria := meio;
      exit;
    end
    else if v[meio] > p then
      fim := meio - 1
    else
      inicio := meio + 1;
  end;
end;

procedure menorIndice(var v: vetor; tam, p: longint);
var
  i, pos: longint;
begin
  pos := buscaBinaria(v, p, tam);
  if pos = 0 then
    writeln('nao esta presente')
  else
  begin
    for i := 1 to pos do
      if v[i] = p then
      begin
        writeln(i);
        exit;
      end;
  end;
end;

begin
  leVetor(v, tam);         { OK: agora aceita só dois parâmetros }
  ordenaVetor(v, tam);     { OK: removeu parâmetro inútil n }
  read(p);
  menorIndice(v, tam, p);
end.


Faça um programa em Pascal que leia uma sequência de valores inteiros quaisquer terminada em zero. O zero não deve ser processado pois serve para marcar
o final da entrada de dados. Em seguida, leia um número qualquer do teclado e
imprima a posição em que ele se encontra no vetor, ou então a mensagem nao
esta presente se ele não estiver presente no vetor. Você deve implementar uma
variante da busca binária na qual, ao invés de achar a primeira ocorrência do
valor na lista, imprima o menor índice do vetor no qual o valor ocorra. Use ao
máximo funções e procedimentos apropriados. Lembre-se que a busca binária só
pode ocorrer se o vetor estiver ordenado. Então, se a entrada de dados não estiver ordenada, ordene-a. Você pode usar funções e procedimentos de exercícios
anteriores aqui.
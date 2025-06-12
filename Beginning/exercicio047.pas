program exercicio047;
var
  i,soma,a: longint;
begin
    i:= 1;
    soma:= 0;
    while i<=50 do
    begin
        a:= i*i;
        soma:= soma + a;
        i:= i + 1;
    end;
    writeln('A soma dos quadrados dos 50 primeiros numeros inteiros e: ', soma);
    end.>
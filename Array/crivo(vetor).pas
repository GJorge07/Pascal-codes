program Crivo;

const
  MAX = 1000;

type
  vetor = array[2..MAX] of boolean;

var
  v: vetor;
  i: integer;


procedure inicializar(var v: vetor);
var
  i: integer;
begin
  for i := 2 to MAX do
    v[i] := true;
end;

function ehPrimo(i: integer; var v: vetor): boolean;
var
  j: integer;
begin
  ehPrimo := true;
  if v[i] then
  begin
    j := i * 2;
    while j <= MAX do
    begin
      v[j] := false;
      j := j + i;
    end;
  end
  else
    ehPrimo := false;
end;

begin
  inicializar(v);

  for i := 2 to 31  {raiz de 1000} do
    ehPrimo(i, v);

  writeln('Numeros primos de 2 a ', MAX, ':');
  for i := 2 to MAX do
    if v[i] then
      writeln(i);
end.

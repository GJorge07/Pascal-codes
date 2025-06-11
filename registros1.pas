program leeimprime;

type registro=record  {registro}
              nome:string[100];
              telefone:longint;
              endereco:string[100];
              rg:longint;
              idade:integer;
              cpf:longint;      
    end;
var
        r: registro;
{se der erro com longint usa string msm pra numero, vai ler certo}
procedure lereg(var r:registro);
begin
    with r do
    begin
        readln (nome);
        readln (telefone);
        readln (endereco);
        readln (rg);
        readln (idade);
        readln (cpf);
    end;
end;
{usa readln p ler os espaços q tiver entre as palavras}
procedure imprimereg(var r:registro);
begin
    with r do
    begin
        writeln (nome);
        writeln (telefone);
        writeln (endereco);
        writeln (rg);
        writeln (idade);
        writeln (cpf);
    end;
end;

begin
    lereg(r);
    imprimereg(r);
end.
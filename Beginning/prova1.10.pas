program recomendacao;

var n,i:longint;

begin
    read(n);
    while n<> 0 do 
    begin
        if n > 0 then
            for i:=1 to 10 do  
                write(n*i,' ');
        read(n);
    end;
end.

{Faça um programa Pascal que leia do teclado uma sequência de N > 0 números inteiros quaisquer. Para cada valor lido, se ele for positivo, imprima os primeiros 10 múltiplos dele. Assuma que a sequência tenha pelo menos 1 número e que ela termina com 0. O zero serve para indicar o final da entrada de dados e não deverá ser processado. Caso ele não seja positivo, não imprima nada.}
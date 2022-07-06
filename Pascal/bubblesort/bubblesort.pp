program Bubble;
uses crt;

var
   v: array [1..10000] of integer;
   I: integer;
 
// Procedimento para ordenação utilizando o método bolha
procedure bubble_sort();

var
   I, J, troca: integer;
begin
    
    for I := 1 to 10000 do
    begin
        for J := I+1 to 10000 do
            begin
                if v[J] < v[I] then
                begin
                    troca := v[I];
                    v[I] := v[J];
                    v[J] := troca;
                end;
            end;
    end;
    
end;
 
 
var K : integer;
begin
    
    for K := 1 to 1000 do
    begin 
        randomize;
        for I := 1 to 10000 do
        begin
            v[I]:= random(10000);
        end;
        // Impressão dos valores.
        writeln('');
        writeln('* Resultado *');
        for I := 0 to 9999 do
        begin
            writeln('posicao ', I, ': ', v[I]);
        end;
        writeln('Execucao ', K)
    end;
     // Ordenação
     bubble_sort(); 
end.

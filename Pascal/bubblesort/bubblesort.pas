
program bubblesort;
uses crt;
uses DateUtils;

var
    v: array [1..10000] of integer;
    I: integer;
    inicio, final : Cardinal;
    tempo : Extended;
    tempoIndividual: Extended;
    FromTime, ToTime: TDateTime;
    DiffMinutes: Integer;
 

procedure bubble_sort();

var
   I, J,P, troca: integer;
begin
    FromTime := Now;
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
    ToTime := Now;
    DiffMinutes := MinutesBetween(ToTime,FromTime);
    
    for P := 0 to 9999 do
    begin
        writeln(DiffMinutes);
    end;
    
end;
 
 
var K : integer;
var tempImprim : Extended;
begin
    //Assign(Myfile,'resultados-bubblesort.txt');
    //Rewrite(MyFile);
    for K := 1 to 1000 do
    begin 
        randomize;
        for I := 1 to 100 do
        begin
            v[I]:= random(10000);
        end;
        // Impressão dos valores.
        
        for I := 0 to 9999 do
        begin

            bubble_sort(); 
            
            //Write(Myfile, tempImprim,'\n');
        end;
    end;
    //Close(MyFile);
     // Ordenação
     
end.

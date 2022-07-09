program bubblesort;
uses crt, DateUtils,sysutils;

var
    v: array [1..10000] of integer;
    I: integer;
    inicio, final : Cardinal;
    tempo : Extended;
    FromTime, ToTime: TDateTime;
    DiffMinutes: Integer;
 

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
 
 
var K ,I: integer;
begin
    //Assign(Myfile,'resultados-bubblesort.txt');
    //Rewrite(MyFile);
    for K := 1 to 100 do
    begin 
        randomize;
        for I := 1 to 10000 do
        begin
            v[I]:= random(10000);
        end;
        // Impressão dos valores.
        
        
        FromTime := now;
        
        bubble_sort(); 
        
        
        ToTime := now;
        DiffMinutes := MilliSecondsBetween(ToTime,FromTime);
        writeln(DiffMinutes);
        
        
    end;
   
     
end.

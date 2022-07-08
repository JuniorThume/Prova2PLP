program massaMola;
uses crt;


procedure massa_mola();
CONST
    TMAX = 10.0;
    dt = 0.001;
    m = 1.0;
    k = 1.0;
    tam_vet = TMAX/dt;


var
    
    x: REAL;
    vx: REAL;
    dx: REAL;
    t: REAL;
    dvx: REAL;
    pos: array [0...(tam_vet-1)] of REAL;
    vel: array [0...(tam_vet-1)] of REAL;
    i: integer;
    aux: integer := 0;

begin
    i := 0;
    while t < TMAX do
    begin
        dvx := -(k/m)*x*dt;
        vx := vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos[i] := x;
        vel[i] = vx;
        i := i+1;
        t := t + dt;
    end;

    Assign(Myfile, 'resultados.txt');
    Rewrite(MyFile);

    while aux < tam_vet do
    begin
        Write(Myfile, vel[aux], ' ',pos[aux],'\n');
        aux:= aux + 1;
    end;
    Close(Myfile);
end.







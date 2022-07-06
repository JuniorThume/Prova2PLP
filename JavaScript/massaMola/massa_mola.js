const fs = require('fs');


function massa_mola(){
    const inicio = Date.now();
    TMAX = 10.0
    dt = 0.001
    x = -1.0
    vx = 0.0
    m=1.0
    k=1.0
    dvx = undefined
    dx = undefined
    vel = []
    pos = []

    for(t=0; t < TMAX; t+=dt){
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos.push(x);
        //pos.append(x);
        vel.push(vx);
        //vel.append(vx);
    }
    const fim = Date.now();
   
    tam = TMAX/dt;
    var stream = fs.createWriteStream("saida.txt");
    stream.once('open', function(fd) {
    for(i = 0; i < tam; i++) {
        stream.write(`${vel[i]} ${pos[i]}\n`);
    }
    stream.end();
    });
        
    
    let tempoTotal = (fim - inicio);
    
    return tempoTotal
}

temp = massa_mola();
console.log(temp)

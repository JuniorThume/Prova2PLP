const fs = require('fs');



function massa_mola(){
    const inicio = Date.now();
    TMAX = 100000
    dt = 0.01
    x = -1.0
    vx = 0.0
    m=1.0
    k=1.0
    let vel = []
    let pos = []

    for(t=0; t < TMAX; t+=dt){
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos.push(x);
        vel.push(vx);
        
    }
    const fim = Date.now();
    var stream = fs.createWriteStream("./saida.txt");
    stream.once('open', function(fd) {
    for(i = 0; i < vel.length; i++) {
        stream.write(`${vel[i]} ${pos[i]}\n`);
    }
    stream.end();
    });
        
    console.log(fim - inicio);
}

massa_mola();


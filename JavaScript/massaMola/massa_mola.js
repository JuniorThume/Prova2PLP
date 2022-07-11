const fs = require('fs');


let vel = []
let pos = []
function massa_mola(){
    
    TMAX = 100000
    dt = 0.01
    x = -1.0
    vx = 0.0
    m=1.0
    k=1.0
    

    for(t=0; t < TMAX; t+=dt){
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos.push(x);
        vel.push(vx);
        
    }
    
    
}

const inicio = Date.now();

massa_mola();

const fim = Date.now();
let result = fim - inicio;
    var stream = fs.createWriteStream("./saida-massa-mola.csv");
    stream.once('open', function(fd) {
    
    stream.write(`${result}\n`);
    
    stream.end();
    });
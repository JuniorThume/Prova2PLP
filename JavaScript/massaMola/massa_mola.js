const fs = require('fs');



function massa_mola(dt){
    
    TMAX = 10000
    x = -1.0
    vx = 0.0
    m=1.0
    k=1.0
    pos = 0.0
    vel = 0.0

    for(t=0; t < TMAX; t+=dt){
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos=x;
        vel=vx;
    }
    
    
}


const inicio=0.0;
const fim=0.0;
let result = 0.0;

var stream01 = fs.createWriteStream("./runtime-massa-mola01.csv");
var stream001 = fs.createWriteStream("./runtime-massa-mola001.csv");

stream01.once('open', function(fd) {
  
});

stream001.once('open', function(fd) {
    
});


for(i=0; i<100; i+=1){
    inicio01 = Date.now();
    massa_mola(0.01);
    fim01 = Date.now();
    result = fim01 - inicio01;
    stream01.write(`${result}\n`);
    
    inicio001 = Date.now();
    massa_mola(0.001);
    fim001 = Date.now();
    result = fim001 - inicio001;
    stream001.write(`${result}\n`);
}

stream01.end();
stream001.end();
    

    


cont=0;
dentro=0;
fora=0;
sorteio=0;
x=0;
y=0;
ponto= 0;
aux1=0;
aux2=0;

const fs = require('fs');

const inicio = Date.now();

while(cont < 1000000){
    sorteio = Math.random();
    x = 2 * sorteio -1;

    sorteio = Math.random();
    y = 2 * sorteio -1;

    ponto = x * x + y * y;

    if(ponto<=1)
        dentro++;
    else
        fora++;
    cont++;
}

aux1 = 4*dentro;
aux2 = dentro + fora;

valor_pi = aux1 / aux2;

const fim = Date.now();

let tempoTotal = (fim - inicio);

var stream = fs.createWriteStream("JavaScript/monteCarlo/runtime-montecarlo.txt");
stream.once('open', function(fd) {
    stream.write(`Tempo de execução: ${tempoTotal}\n`);
    stream.end();
});

console.log("Valor simulado de pi: ", valor_pi);
console.log("Tempo de execução: ",tempoTotal);




dentro=0;
fora=0;
sorteio=0;
x=0;
y=0;
ponto= 0;
aux1=0;
aux2=0;

const fs = require('fs');

var arr = [];

function montecarlo(){
    var tempoTotal;
    var inicio, fim;
    
    cont = 0
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

}
    
for(i = 0; i <100;i++){
    inicio = new Date().getTime();
    montecarlo();
    fim = new Date().getTime();
    tempoTotal = fim - inicio;
    arr.push(tempoTotal);
    console.log(tempoTotal);
}

var stream = fs.createWriteStream("./runtime-montecarlo.txt");
stream.once('open', function(fd) {});
console.log(`Tamanho do vetor = ${arr.length}`)
for(i = 0; i < arr.length;i++){
    stream.write(arr[i]+"\n");
}

stream.end();


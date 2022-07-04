// Variaveis
const NUM = 10000

function bubbleSort(items) {
    const inicio = Date.now();
    for (var i = 0; i < NUM; i++) { 
        for (var j = 0; j < (NUM - i - 1); j++) { 
            if(items[j] > items[j+1]) {
                var tmp = items[j]; 
                items[j] = items[j+1]; 
                items[j+1] = tmp; 
            }
        }
    }
    const fim = Date.now();
    let tempoTotal = (fim - inicio)/1000;
    return (tempoTotal)
}
function insertArray(array){
    for(let i = 0; i < NUM; i++){
        array[i] = Math.floor(Math.random() * 10000);
    }
}

function removeArray(array){
    for(let i = 0; i < NUM; i++){
        array.pop();
    }
}


let tempo = 0
for(let k = 0; k < 10000; k++){
    var array = new Array(NUM);
    insertArray(array);
    tempo = tempo + bubbleSort(array);
    removeArray(array);
    console.log(`Execução ${k}: tempo de ${tempo} segundos`);
}

console.log(`O tempo total decorrido foi de ${tempo} segundos`);


 

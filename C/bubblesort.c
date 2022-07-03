#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int bubbleSort(FILE* arq, int qtd){
    clock_t t;
    t = clock();
    int vet[10000], n, aux, i, j;
    n= 10000;   
    
    for(i=0; i < n; i++){
        vet[i]= rand() % 10000;
        
    }
    
    for(i=0; i < n - 1; i++){       
        for(j=0; j < n - i - 1; j++){          
            if(vet[j] > vet[j+1]){               
                aux = vet[j];
                vet[j] = vet[j+1];
                vet[j+1] = aux;

            }
        }
    }
    t = clock()-t;
   
    fprintf(arq,"Tempo de execução %d execução = %lf \n",qtd,(((double)t)/(CLOCKS_PER_SEC/1000))); // Milissegundos
    
    return (((double)t)/(CLOCKS_PER_SEC/1000));
}


int main(){
    
    FILE* arq;
    int i;
    double tempoMedio,tempo;
    arq = fopen("tempo.txt","wt");
    
    for(i=0; i<1000 ; i++){
        tempo=bubbleSort(arq,i);
        tempoMedio = tempoMedio+tempo;
        
    }
    printf("Media das execucoes = %lf\n",tempoMedio);    
    tempoMedio = tempoMedio/1000.0;
    fprintf(arq,"Media das execuções = %lf",tempoMedio);
    
    fclose(arq);
    
    return 0;
}
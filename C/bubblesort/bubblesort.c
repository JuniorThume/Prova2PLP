#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#define TAM 10000

void bubbleSort(FILE* arq, int qtd){
    
    int vet[TAM], aux, i, j;
       
    
    for(i=0; i < TAM; i++){
        vet[i]= rand() % 10000;
        
    }

    clock_t t;
    t = clock();
    for(i=0; i < TAM - 1; i++){       
        for(j=0; j < TAM - i - 1; j++){          
            if(vet[j] > vet[j+1]){               
                aux = vet[j];
                vet[j] = vet[j+1];
                vet[j+1] = aux;

            }
        }
    }
    t = clock()-t;
    fprintf(arq,"%lf \n",(((double)t/CLOCKS_PER_SEC)*1000)); // Milissegundos
    
}


int main(){
    FILE* arq;
    int i;
    double tempoMedio,tempo;
    arq = fopen("tempo-bubblesort.csv","wt");
    for(i=0; i<100 ; i++){
        bubbleSort(arq,i);    
    }  
    
    fclose(arq);
    
    return 0;
}
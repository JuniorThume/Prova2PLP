#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#define TAM 10000

int bubbleSort(FILE* arq, int qtd){
    clock_t t;
    t = clock();
    int vet[TAM], aux, i, j;
       
    
    for(i=0; i < TAM; i++){
        vet[i]= rand() % 10000;
        
    }
    
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
    
    return (((double)t/CLOCKS_PER_SEC)*1000);
}


int main(){
    FILE* arq;
    int i;
    double tempoMedio,tempo;
    arq = fopen("tempo-bubblesort.csv","wt");
    for(i=0; i<1000 ; i++){
        tempo=bubbleSort(arq,i);
        tempoMedio = tempoMedio+tempo;     
    }  
    tempoMedio = tempoMedio/1000.0;
    
    
    fclose(arq);
    
    return 0;
}
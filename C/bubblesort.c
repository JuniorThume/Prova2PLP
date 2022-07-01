#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    
    int vet[10000], n, aux, i, j;

    time_t t;

    srand((unsigned) time(&t));

    printf("Numero de elementos: 10000 ");

    n= 10000;   

    printf("Sorteando numeros ");

    for(i=0; i < n; i++){
        vet[i]= rand() % 1000;
        
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

    printf("Vetor após bubble sort: ");

    for(i=0; i < n; i++){

        printf("%d  ", vet[i]);

    }

    return 0;
}
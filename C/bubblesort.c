#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    
    int vet[10000], y, n, aux;

    time_t t;

    srand((unsigned) time(&t));

    printf("Numero de elementos: 10000 ");

    n= 10000;   

    printf("Sorteando numeros ");

    for(int i = 0; i < n; i++){
        vet[i]= rand() % 1000;
        
    }

    for(int i = 0; i < n - 1; i++){       

        for(y = 0; y < n - i - 1; y++){          

            if(vet[y] > vet[y + 1]){               

                aux = vet[y];

                vet[y] = vet[y + 1];

                vet[y + 1] = aux;

            }

        }

    }

    printf("Vetor após bubble sort: ");

    for(int i = 0; i < n; i++){

        printf("%d  ", vet[i]);

    }

    return 0;
}
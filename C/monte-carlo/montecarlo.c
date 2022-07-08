#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

int main(){

    clock_t tempo;
	tempo = clock();

    srand(time(NULL));

    int cont=0, dentro=0, fora=0;

    float aux1,aux2;

    float x,y,ponto,sorteio, valor_pi;

    while(cont < 100){
        sorteio = (float)rand()/(float)RAND_MAX;
        x= 2 * sorteio -1;

        sorteio = (float)rand()/(float)RAND_MAX;
        y= 2 * sorteio -1;

        ponto = x*x + y*y;

        if(ponto<=1){
            dentro++;
        }
            
        else{
            fora++;
            printf("Entra ponto - %d\n",ponto);
        }
            

        cont++;
    }

    aux1 = 4*dentro;
    aux2 = dentro+fora;

    valor_pi = aux1 / aux2;

    FILE* arq;
    arq = fopen("runtime-montecarlo.txt","wt");
    fprintf(arq,"Tempo de execucao %f\n", (clock() - tempo) / (double)CLOCKS_PER_SEC);
    fclose(arq);

    printf("Valor simulado de pi: %.6f \n",valor_pi);
    printf("Tempo de execução: %f\n",(clock() - tempo) / (double)CLOCKS_PER_SEC);

    return 0;
}


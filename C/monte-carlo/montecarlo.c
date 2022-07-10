#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

int main(){

    clock_t tempo;
    srand(time(NULL));
   

    int cont=0, dentro=0, fora=0;
    int i;
    float aux1,aux2;

    float x,y,ponto,sorteio, valor_pi;
    FILE* arq;
    arq = fopen("runtime-montecarlo.txt","wt");
    //fprintf(arq,"Runtime Monte Carlo\n");   
    
    while(cont < 100){
        tempo = clock();
        for(i=0;i<1000000;i++){
         
            sorteio = (float)rand()/(float)RAND_MAX;
            
            x= 2 * sorteio -1;
            
            sorteio = (float)rand()/(float)RAND_MAX;
            y= 2 * sorteio -1;
            
            ponto = x*x + y*y;

            if(ponto<=1)
            dentro++;
            
            else
                fora++;
            
        }
        
        aux1 = 4*dentro;
        aux2 = dentro+fora;

        valor_pi = aux1 / aux2;
        
        //fprintf(arq,"Execucao  %d\n", cont);   
        //fprintf(arq,"Valor simulado de pi %f\n", valor_pi);   
        fprintf(arq,"%f\n", ((clock() - tempo) / (double)CLOCKS_PER_SEC)*1000);
        //fprintf(arq,"###################\n");      
        cont++;
    }


    fclose(arq);


    return 0;
}


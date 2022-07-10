#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define TMAX 100000.0


void escreve_saida(float *vet, float *vet1, float dtAtual);

float massa_mola(float dt){
    clock_t time;
    
    
    //int tam_vet = (int)((TMAX/dt)+1);
    
    float *vel = (float *) malloc(10552840 * sizeof(float)); 
    float *pos = (float *) malloc(10552840 * sizeof(float));
    //printf("%d\n", tam_vet);
    time = clock();
    int i=0;
    float x = -1.0;
    float vx = 0.0;
    //printf("%ld",sizeof(vel));
    float dx;
    float dvx;
    float t;
    float m = 1.0;
    float k = 1.0;
    t=0.0; 
    while(t < TMAX){
        
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos[i]=x;
        vel[i]=vx;
        i++;
        t+=dt;
    }
    
    time = clock()-time;
    escreve_saida(vel,pos,dt);
    free(pos);
    free(vel);
    time = ((double)time/CLOCKS_PER_SEC)*1000; 
    
    return time;
}
void escreve_saida(float *vet, float *vet1, float dtAtual){
    FILE* arq;
    char *nomeArq;
    if(dtAtual == 0.01f) {
        arq = fopen("../../../../Resultados-MassaMola/C/runtime_massa_mola-01.csv","wt");
    } else { 
        arq = fopen("../../../../Resultados-MassaMola/C/runtime_massa_mola-001.csv","wt");
    }
    for(int i=0; i < (TMAX/dtAtual); i++){
        fprintf(arq,"%f %f\n",vet[i],vet1[i]);
    }
    fclose(arq);
}


int main(){
    FILE* temp;
    float runtime;
    temp = fopen("runtime-massaMola.txt","wt");
    runtime = massa_mola(0.01f);
    fprintf(temp,"Tempo de execucao %f\n", runtime);
    fclose(temp);
}
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define TMAX 100.0
#define dt 0.001

void escreve_saida(float *vet, float *vet1);

float massa_mola(){
    clock_t time;
    time = clock();
    int i=-1;
    float x = -1.0;
    float vx = 0.0;
    int tam_vet = TMAX/dt;
    float *vel = (float*) malloc(tam_vet * sizeof(float));
    float *pos = (float*) malloc(tam_vet * sizeof(float));
    float dx;
    float dvx;
    float t;
    float m = 1.0;
    float k = 1.0;
    
    for (t=0.0; t < TMAX ;t+=dt){
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos[++i]=x;
        vel[i]=vx;
    }
    time = clock()-time;
    escreve_saida(vel,pos);
    free (vel);
    free (pos);
    time = ((double)time/CLOCKS_PER_SEC)*1000; 
    return time;
}
void escreve_saida(float *vet, float *vet1){
    FILE* arq;
    arq = fopen("tempo-massa-mola.txt","wt");
    for(int i=0; i < (TMAX/0.001); i++){
        fprintf(arq,"%f %f\n",vet[i],vet1[i]);
    }
    fclose(arq);
}


int main(){
    FILE* temp;
    float runtime = massa_mola();
    temp = fopen("runtime_massa_mola.txt","wt");
    fprintf(temp,"Tempo de execucao %f\n", runtime);
    fclose(temp);
}
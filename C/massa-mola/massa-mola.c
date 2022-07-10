#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define TMAX 1000.0f


void escreve_saida(float *vet, float *vet1, float dtAtual);

float massa_mola(float dt){
    clock_t time;
    time = clock();
    int i=0;
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
        
        pos[i]=x;
        vel[i]=vx;
        i+=1;
    }
    time = clock()-time;
    escreve_saida(vel,pos,dt);
    free (vel);
    free (pos);
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
    float tam[2];
    tam[0] = 0.01f;
    tam[1] = 0.001f;
    int l;
    float runtime;
    temp = fopen("runtime-massaMola.txt","wt");
    for(l=0; l < 2; l++){
        printf("Passei 1\n");
        printf("%d\n",l);
        
        runtime = massa_mola(tam[l]);
        fprintf(temp,"Tempo de execucao %f\n", runtime);
        
    }   
    fclose(temp);
}
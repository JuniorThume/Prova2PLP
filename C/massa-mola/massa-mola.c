#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#define TMAX 10000.0


void escreve_saida(float pos, float vel, float dtAtual);

float massa_mola(float dt){
    
    clock_t time;
    float vel,pos;
    float x = -1.0;
    float vx = 0.0;
    float dx;
    float dvx;
    float t;
    float m = 1.0;
    float k = 1.0;
    t=0.0; 
    time = clock();
    for(t=0.0; t < TMAX; t+=dt){
        dvx = -(k/m)*x*dt;
        vx = vx+dvx;
        dx = vx*dt;
        x = x+dx;
        pos=x;
        vel=vx;
        
        //escreve_saida(vel,pos,dt);
    }
    
    time = clock()-time;
    
    time = ((double)time/CLOCKS_PER_SEC)*1000; 
    
    return time;
}
void escreve_saida(float pos, float vel, float dtAtual){
    FILE* arq;
    char *nomeArq;
    if(dtAtual == 0.01f) {
        
        arq = fopen("../../../../Resultados-MassaMola/C/runtime_massa_mola-01.csv","a");
    } else if(dtAtual == 0.001) { 
        arq = fopen("../../../../Resultados-MassaMola/C/runtime_massa_mola-001.csv","a");
    }
    
    fprintf(arq,"%f %f\n",pos,vel);
    fclose(arq);
}


int main(){
    FILE* temp;
    float runtime;
    float dt[3];
    int i,j;
    char name[100];
    char dt_string[15];

    dt[0]=0.01;
    dt[1]=0.001;

    for(i=0;i<2;i++){
        sprintf(dt_string,"%.3f",dt[i]);
        strcat(strcpy(name,"runtime-massaMola-"),dt_string);
        strcat(name,".txt");
        temp = fopen(name,"a");
        for(j=0;j<100;j++){
            runtime = massa_mola(dt[i]);
            fprintf(temp,"%f\n", runtime);
        }
        fclose(temp);
    } 
}
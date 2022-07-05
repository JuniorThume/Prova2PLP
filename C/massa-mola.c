#include <stdio.h>
#include <stdlib.h>
#define TMAX 1

float massa_mola(){
    int i=-1;
    float x = -1.0;
    float vx = 0.0;
    float dt;
    dt = 0.001;
    float* vel = (float*) malloc(sizeof(float) * (TMAX/dt));
    float* pos = (float*) malloc(sizeof(float) * (TMAX/dt));
    float dx;
    float dvx;
    
    float t;
    float m = 1.0;
    float k = 1.0;
    
    for (t=0.0; t < TMAX ;t+=dt){
        dx = vx*dt;
        dvx = -(k/m)*x*dt;
        x = x+dx;
        vx = vx+dvx;
        pos[++i]=x;
        vel[i]=vx;
        printf("%f teste\n",t);
    }
    
    free (vel);
    free (pos);
    
    return 2.0;
}


int main(){

    printf("%f", massa_mola());

}
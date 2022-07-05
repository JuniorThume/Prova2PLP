#include <stdio.h>
#include <stdlib.h>
#define TMAX 1000000

float massa_mola(){
    float i=-1.0;
    float x = -1.0;
    float vx = 0.0;
    float vel = (float*) malloc(sizeof(float) * TMAX);
    float pos = (float*) malloc(sizeof(float) * TMAX);
    float dx;
    float dvx;
    float dt = 0.00001;
    float t;
    float m = 1.0;
    float k = 1.0;
    for (t=0; t < TMAX ;t+=dt){
        dx = vx*dt;
        dvx = -(k/m)*x*dt;
        x = x+dx;
        vx = vx+dvx;
        pos[++i]=x;
        vel[i]=vx;
    }
    free (vel);
    free (pos);

    return time = 2.0;
}


int main(){

    printf("%f", massa_mola());

}
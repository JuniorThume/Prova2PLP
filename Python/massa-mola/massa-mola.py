from fileinput import close
import time

TMAX = 10000.0


def massa_mola(dt):
    j=-1
    x = -1.0
    vx = 0.0
    tam_vet = TMAX/dt
    
    vel = 0.0
    pos =0.0
    m = 1.0
    k = 1.0
    t=0.0
    
    while(1):
        dvx = -(k/m)*x*dt
        vx = vx+dvx
        dx = vx*dt
        x = x+dx
        j = j+1
        pos = x
        vel=vx
        t = t+dt
        if(t >= TMAX) :
            break

def main():
    
    arq01 = open("./runtime_massa-mola-massaMola01_python.csv","w")
    arq001 = open("./runtime_massa-mola-massaMola001_python.csv","w")
    i=0
    for i in range(10):

        ini01 = time.time()
        massa_mola(0.01)
        end01 = time.time()
        tempo01 = (end01-ini01)*1000 #Milissegundos
        arq01.write(str(tempo01)+"\n")
        
        ini001 = time.time()
        massa_mola(0.001)
        end001 = time.time()
        tempo001 = (end001-ini001)*1000 #Milissegundos
        arq001.write(str(tempo001)+"\n")
    
    arq01.close()
    arq001.close()
        
main()
        

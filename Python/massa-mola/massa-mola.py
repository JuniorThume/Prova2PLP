from fileinput import close
import time

TMAX = 100000.0


def massa_mola(dt):
    j=-1
    x = -1.0
    vx = 0.0
    tam_vet = TMAX/dt
    contador = int(tam_vet)
    vel = [contador]
    pos = [contador]
    m = 1.0
    k = 1.0
    t=0.0
    
    while(1):
        dvx = -(k/m)*x*dt
        vx = vx+dvx
        dx = vx*dt
        x = x+dx
        j = j+1
        pos.append(x)
        vel.append(vx)
        t = t+dt
        if(t >= TMAX) :
            break

def main():
    arq = open("./runtime_massa-mola-massaMola0.01_python.csv","w")
    ini = time.time()
    massa_mola(0.01)
    end = time.time()
    tempo = (end-ini)*1000 #Milissegundos
    arq.write(str(tempo)+"\n")
    arq.close()
        
main()
        

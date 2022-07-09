from fileinput import close
import time

TMAX = 1000000.0

def escreve(vel,pos,dt):
    arq = open("../../../../Resultados-MassaMola/Python/Resultados-massa"+str(dt)+".csv","w")
    for i in range(int(TMAX/dt)):
        arq.write("vel - "+str(vel[i])+" pos- "+ str(pos[i])+"\n")
    arq.close()



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
    
    escreve(vel,pos,dt)
    

def main():
   
    
    for i in range(2):
        if(i==0):
            dt=0.01
        elif(i==1):
            dt=0.001
        arq = open("runtime_massa-molaa"+str(dt)+".csv","a")
        ini = time.time()
        massa_mola(dt)
        end = time.time()
        tempo = (end-ini)*1000 #Milissegundos
        arq.write(str(tempo)+"\n")
    arq.close()
        
main()
        

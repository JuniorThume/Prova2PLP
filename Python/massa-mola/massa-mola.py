from fileinput import close
import time

TMAX = 1000.0

def escreve(vel,pos,dt):
    arq = open("Resultados-massa"+str(dt)+".csv","w")
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
   
    arq = open("runtime_massa-molaa.txt","a")
    for i in range(3):
        if(i==0):
            dt=0.01
        elif(i==1):
            dt=0.001
        elif(i==2):
            dt=0.00001
        
        ini = time.time()
        massa_mola(dt)
        end = time.time()
        tempo = (end-ini)*1000 #Milissegundos
        arq.write(str(dt)+"- Tempo de execucao " + str(tempo)+"\n")
    arq.close()
        
main()
        

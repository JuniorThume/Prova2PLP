import time

TMAX = 100.0
dt = 0.001

def massa_mola():
    print("Funcao massa mola")
    j=-1
    x = -1.0
    vx = 0.0
    tam_vet = TMAX/dt
    contador = int(tam_vet)
    vel = [contador]
    pos = [contador]
    m = 1.0
    k = 1.0
    
    for i in range(contador):
        dvx = -(k/m)*x*dt
        vx = vx+dvx
        dx = vx*dt
        x = x+dx
        j = j+1
        print(x)
        pos[j]=x
        vel[j]=vx



def main():
    print("Aqui")
    ini = time.time()
    massa_mola()
    end = time.time()
    tempo = (end-ini)*1000 #Milissegundos

    print("Tempo de exucucao "+str(tempo)+" ms")



main()
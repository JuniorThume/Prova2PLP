import random
import time

def bubbleSort(vet) :
    n=len(vet)
    for i in range(n-1):
        for j in range(n-i-1):
            if(vet[j] > vet[j + 1]):
                aux = vet[j]
                vet[j] = vet[j+1]
                vet[j+1] = aux
    
tempoMedia=0.0
arq = open("tempo-bubblesort.csv","w")

n=10000

for i in range(100):

    vet= random.sample(range(n),n)
    inicio = time.time()
    bubbleSort(vet)
    fim = time.time()
    total = (fim-inicio)*1000#milissegundos
    
    arq.write(str(total)+"\n")
    vet.clear()
    tempoMedia = tempoMedia+total


tempoMedia = tempoMedia/100 
print(tempoMedia)
arq.close()







    
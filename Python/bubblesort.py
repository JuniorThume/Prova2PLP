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
arq = open("tempo.txt","w+")

n=10000

for i in range(1000):

    vet= random.sample(range(n),n)
    
    inicio = time.time()
    bubbleSort(vet)
    fim = time.time()
    total = (fim-inicio)*1000 #milissegundos
    
    print("Tempo de execucao "+str(i)+" = "+ str(total)+"\n")
    arq.write("Tempo de execucao "+str(i)+" = "+ str(total)+"\n")
    vet.clear()
    tempoMedia = tempoMedia+total


tempoMedia = tempoMedia/1000 
arq.write("Tempo media das execucoes = "+str(tempoMedia))
arq.close()







    
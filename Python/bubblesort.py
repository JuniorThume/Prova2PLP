
from random import seed
from random import randint

vet= []
n=10000

seed(1)

for i in range (n):
    vet.append(randint(0, 1000))

for i in range(n-1):
    for j in range(n-i-1):
        if(vet[j] > vet[j + 1]):
            aux = vet[j]
            vet[j] = vet[j+1]
            vet[j+1] = aux

print (vet)



    
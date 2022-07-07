
import random
import math
import time

cont=0
dentro=0
fora=0

arq = open("Python/monte-carlo/runtime-montecarlo.txt","w")

inicio = time.time()

while (cont<1000000): 

   x=2*random.random()-1   
   y=2*random.random()-1  

   ponto = x*x + y*y             

   if (ponto<=1):        
      dentro +=1
      
   else:            
      fora +=1
   cont += 1

print("dentro ",dentro)
print("fora ",fora)
valor_pi = 4*dentro/(dentro+fora)

fim = time.time()

tempo = (fim-inicio)*1000 #milissegundos

print("Valor simulado de pi: ",valor_pi)
print("Tempo de execucao = "+ str(tempo)+"\n")
arq.write("Tempo de execucao = "+ str(tempo)+"\n")



import random
import time

def monteCarlo() :
   cont = 0
   dentro=0
   fora=0
   for j in range(1000000):
      x=2*random.random()-1   
      y=2*random.random()-1  
      
      ponto = x**2 + y**2
      
      if (ponto<=1):        
         dentro +=1
         
      else:            
         fora +=1
   
   valor_pi = 4*dentro/(dentro+fora)
   return valor_pi

def main():
  
   arq = open("runtime-montecarlo.csv","w")
   media = 0.0
   
   for i in range(100):
      inicio = time.time()
      valor_pi= monteCarlo()
      fim = time.time()

      tempo = (fim-inicio)*1000 #milissegundos
      media = media+tempo
      arq.write(str(tempo)+"\n")

   media = media/100
   
   print("Tempo medio das execucoes "+str(media)+"\n")
   arq.close()

main()
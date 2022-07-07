
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
  
   arq = open("Python/monte-carlo/runtime-montecarlo.txt","w")
   arq.write("RESULTADO MONTE CARLO PYTHON\n")
   media = 0.0
   
   for i in range(10):
      inicio = time.time()
      valor_pi= monteCarlo()
      fim = time.time()

      tempo = (fim-inicio)*1000 #milissegundos
      media = media+tempo
      print("Valor simulado de pi: ",valor_pi)
      print("Tempo de execucao = "+ str(tempo)+"\n")
      arq.write("Tempo de execucao = "+ str(tempo)+"\n")

   media = media/10
   
   print("Tempo medio das execucoes "+str(media)+"\n")
   arq.write("Tempo medio das execucoes "+str(media)+"\n")
   arq.close()

main()
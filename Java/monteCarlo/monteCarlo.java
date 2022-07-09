package monteCarlo;

import java.util.Random;
import java.io.IOException;
import java.io.*;


public class monteCarlo{

    public static float sorteio(){
        float min= 0.0f;
        float max= 1.0f;
        Random r = new Random();
        float numero = min + (max - min) * r.nextFloat();
        return(numero); 
    }

    public void escreveArquivo(long time) throws IOException{
        FileWriter arqTeste = new FileWriter("resultado-java.csv", true);
        
        arqTeste.append((time)+"\n");
        
        arqTeste.close();
    } 

    public void limpaArquivo() throws IOException{
        FileWriter arqTeste = new FileWriter("resultado-java.csv", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }

    public static void main(String args[]) throws IOException{

        int cont=0, dentro=0, fora=0;
        float x,y,ponto,valor_pi;
        float aux1,aux2;

        long start = System.currentTimeMillis();

        while(cont < 1000000){
            x = 2 * sorteio() -1;
            y = 2 * sorteio() -1;

            ponto = x * x + y * y;

            if(ponto<=1)
                dentro++;
            else   
                fora++;
            cont++;
        }

        aux1 = 4 * dentro;
        aux2 = dentro + fora;

        valor_pi = aux1 / aux2;

        long time = System.currentTimeMillis() - start;

        System.out.println("Valor simulado de pi: "+ valor_pi);
        System.out.println("Tempo de execução: "+ time);

        FileWriter arq = new FileWriter("Java/monteCarlo/runtime-monteCarlo.csv", true);
        
        arq.append((time)+"\n");
        
        arq.close();



        

    }


}
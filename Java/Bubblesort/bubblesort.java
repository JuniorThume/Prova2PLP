package Bubblesort;
import java.util.Random;
import java.io.*;



public class bubblesort {
    final static int TAM = 10000;
   
    public static void main(String args[]) throws IOException {
        long tempoTotal = 0;
        long mediaTempoFinal;
        long tempoExecucaoIndividual = 0;
        bubblesort bs = new bubblesort();
        bs.limpaArquivo();
        for(int i = 0; i < 1000; i++) {
            int v[] = new int[TAM];
            bs.insercao(v);
            tempoExecucaoIndividual = bs.ordenar(v);
            bs.escreveArquivo(tempoExecucaoIndividual);
            tempoTotal +=tempoExecucaoIndividual;
        }
        
        mediaTempoFinal = tempoTotal/1000;
        System.out.println(mediaTempoFinal);
        
    }

    public long ordenar(int[] v) {
        long tempoInicial = System.currentTimeMillis();
        
        for(int i = 0; i < TAM - 1; i++) {
            for(int j = 0; j < TAM - 1 - i; j++) {
                if(v[j] > v[j + 1]) {
                int aux = v[j];
                v[j] = v[j + 1];
                v[j + 1] = aux;
                }
            }
        }
        long tempoFinal = System.currentTimeMillis();
        long tempoTotal = (tempoFinal - tempoInicial);
        
        return tempoTotal;
    }

    public void insercao(int []v){
        Random gerarAleatorio = new Random();
        for(int i = 0; i < TAM; i++){
            v[i] = gerarAleatorio.nextInt(TAM);
        }
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

    
}





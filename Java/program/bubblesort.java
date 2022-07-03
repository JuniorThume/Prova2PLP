package program;
import java.util.Random;
import java.io.*;


public class bubblesort {
    final static int TAM = 10000;
   
    public static void main(String args[]) throws IOException {
        long tempoTotal = 0;
        long mediaTempoFinal;
        long tempoExecucaoIndividual = 0;
        arqEdit arq = new arqEdit();
        arq.limpaArquivo();
        for(int i = 0; i < 10; i++) {
            int v[] = new int[TAM];
            bubblesort bs = new bubblesort();
            bs.insercao(v);
            tempoExecucaoIndividual = bs.ordenar(v);
            arq.escreveArquivo(tempoExecucaoIndividual, 'r', i);
            tempoTotal +=tempoExecucaoIndividual;
            System.out.println("Aqui terminou a execucao: " + i +"\n");
        }
        
        mediaTempoFinal = tempoTotal/1000;
        arq.escreveArquivo(mediaTempoFinal,' ', 0);
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

    
}





package massaMola;

import java.io.IOException;

public class massa_mola {
    public static void main(String[] args) throws IOException{
        float val_dt[] = new float[2];
        val_dt[0]= (float) 0.01;
        val_dt[1]= (float) 0.001;
        executa_mm runMM = new executa_mm();
        
        
        for(int i=0; i<val_dt.length; i++){
            saida.limpaArquivo(val_dt[i]);
            long tempoInicial = System.currentTimeMillis();
            runMM.executa_massa_mola(val_dt[i]);
            long tempoFinal = System.currentTimeMillis();
            long tempoTotal = (tempoFinal - tempoInicial);
            System.out.println("MASSA MOLA: "+tempoTotal);
            escreve_arquivo saida = new escreve_arquivo();
            saida.escreveArquivo(tempoTotal);
        }
        
    }
}

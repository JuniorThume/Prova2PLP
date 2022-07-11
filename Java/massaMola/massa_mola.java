package massaMola;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class massa_mola {
    public static void main(String[] args) throws IOException{
        massa_mola mm = new massa_mola();
        
      
        mm.limpaArquivo();
        long tempoInicial = System.currentTimeMillis();
        mm.executa_massa_mola();
        long tempoFinal = System.currentTimeMillis();
        long tempoTotal = (tempoFinal - tempoInicial);
        System.out.println("MASSA MOLA: "+tempoTotal);
        mm.escreveArquivo(tempoTotal);
    
        
    }
    public void escreveArquivo(float tempo) throws IOException{
        FileWriter arqTeste = new FileWriter("runtimejavaSaidaMM.txt", true);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.append(tempo+"\n");
        
        gravaTeste.close();
        arqTeste.close();
    }

    public void limpaArquivo() throws IOException{
        FileWriter arqTeste = new FileWriter("runtimejavaSaidaMM.txt", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }
    public void executa_massa_mola() throws IOException{
        float TMAX = 100000.0f;
        float dtAtual = 0.01f;
        float x = -1.0f;
        float vx = 0.0f;
        ArrayList<Float> pos = new ArrayList<Float>();
        ArrayList<Float> vel = new ArrayList<Float>();
        float dx;
        float dvx;
        float t;
        float m = 1.0f;
        float k = 1.0f;
    
        for (t=0.0f; t < TMAX ;t+=dtAtual){
            dvx = -(k/m)*x*dtAtual;
            vx = vx+dvx;
            dx = vx*dtAtual;
            x = x+dx;
            pos.add(x);
            vel.add(vx);
        }
        
    }
}

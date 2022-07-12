package massaMola;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class massa_mola {
    public static void main(String[] args) throws IOException{
        massa_mola mm = new massa_mola();
        
        float dt01 = 0.01f;
        float dt001 = 0.001f;
        int i;
       // long tempoInicial01;
       // long tempoFinal01;
       // long tempoTotal01;

       // long tempoInicial001;
       // long tempoFinal001;
        //long tempoTotal001;

        mm.limpaArquivo();
        long tempoInicial01;
        long tempoFinal01;
        long tempoTotal01;

        long tempoInicial001;
        long tempoFinal001;
        long tempoTotal001;
        for(i=0; i<100; i=i+1){
            tempoInicial01 = System.currentTimeMillis();
            mm.executa_massa_mola();
            tempoFinal01 = System.currentTimeMillis();
            tempoTotal01 = (tempoFinal01 - tempoInicial01);
            
            tempoInicial001 = System.currentTimeMillis();
            mm.executa_massa_mola(0.001);
            tempoFinal001 = System.currentTimeMillis();
            tempoTotal001 = (tempoFinal001 - tempoInicial001);
            mm.escreveArquivo(tempoTotal01,tempoTotal001);
        
        }
        
        
        
         //System.out.println("MASSA MOLA: "+tempoTotal);
    
        
    }
    public void escreveArquivo(float tempo01,float tempo001) throws IOException{
        FileWriter arqTeste01 = new FileWriter("runtime_java01.txt", true);
        PrintWriter gravaTeste01 = new PrintWriter(arqTeste01);

        FileWriter arqTeste001 = new FileWriter("runtime_java001.txt", true);
        PrintWriter gravaTeste001 = new PrintWriter(arqTeste001);

        arqTeste01.append(tempo01+"\n");
        arqTeste001.append(tempo001+"\n");
        
        gravaTeste01.close();
        gravaTeste001.close();
        arqTeste01.close();
        arqTeste001.close();
    }

    public void limpaArquivo() throws IOException{
        FileWriter arqTeste = new FileWriter("runtimejavaSaidaMM.txt", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }
    public void executa_massa_mola(float dtAtual) throws IOException{
        float TMAX = 10000.0f;
        float x = -1.0f;
        float vx = 0.0f;
        float pos;
        float vel;
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
            pos=x;
            vel=vx;
        } 
    }
}

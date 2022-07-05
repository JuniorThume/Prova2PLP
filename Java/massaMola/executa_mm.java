package massaMola;
import java.io.IOException;
import java.util.ArrayList;

public class executa_mm {

    public void executa_massa_mola() throws IOException{
        float TMAX = 100.0f;
        float dt = 0.001f;

        long tempoInicial = System.currentTimeMillis();
        float x = -1.0f;
        float vx = 0.0f;
        ArrayList<Float> pos = new ArrayList<Float>();
        ArrayList<Float> vel = new ArrayList<Float>();
        float dx;
        float dvx;
        float t;
        float m = 1.0f;
        float k = 1.0f;
    
        for (t=0.0f; t < TMAX ;t+=dt){
            dvx = -(k/m)*x*dt;
            vx = vx+dvx;
            dx = vx*dt;
            x = x+dx;
            pos.add(x);
            vel.add(vx);
        }
        long tempoFinal = System.currentTimeMillis();
        long tempoTotal = (tempoFinal - tempoInicial);
        escreve_arquivo saida = new escreve_arquivo();
        saida.limpaArquivo();
        saida.escreveArquivo(vel, pos);
        System.out.println("tempo total de execução foi: " + tempoTotal);
    }
}

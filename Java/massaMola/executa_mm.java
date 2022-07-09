package massaMola;
import java.io.IOException;
import java.util.ArrayList;

public class executa_mm {

    public void executa_massa_mola(float dtAtual) throws IOException{
        float TMAX = 100000.0f;
        
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
        
        escreve_arquivo saida = new escreve_arquivo();
        saida.limpaArquivo(dtAtual);
        saida.escreveArquivo(vel, pos, dtAtual);
        
    }
}

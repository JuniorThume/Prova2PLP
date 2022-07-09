package massaMola;

import java.io.*;
import java.util.ArrayList;

public class escreve_arquivo {
    public void escreveArquivo(ArrayList<Float> vel, ArrayList<Float> pos, float dt) throws IOException{
        FileWriter arqTeste = new FileWriter("javaSaidaMM"+dt+".txt", true);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.write("");
        for(int i = 0; i < vel.size(); i++){
            arqTeste.append(vel.get(i) + " " + pos.get(i) + "\n");
        }
        gravaTeste.close();
        arqTeste.close();
    }

    public void limpaArquivo(float dt) throws IOException{
        FileWriter arqTeste = new FileWriter("javaSaidaMM"+dt+".txt", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }
}

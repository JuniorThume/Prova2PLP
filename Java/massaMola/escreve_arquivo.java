package massaMola;

import java.io.*;
import java.util.ArrayList;

public class escreve_arquivo {
    public void escreveArquivo(float tempo) throws IOException{
        FileWriter arqTeste = new FileWriter("-javaSaidaMM"+dt+".txt", true);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.write("");
        arqTeste.append(tempo+"\n");
        
        gravaTeste.close();
        arqTeste.close();
    }

    public void limpaArquivo(float dt) throws IOException{
        FileWriter arqTeste = new FileWriter("runtimejavaSaidaMM"+dt+".txt", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }
}

package massaMola;

import java.io.*;
import java.util.ArrayList;

public class escreve_arquivo {
    public void escreveArquivo(ArrayList<Float> vel, ArrayList<Float> pos) throws IOException{
        FileWriter arqTeste = new FileWriter("C:\\Users\\junin\\OneDrive\\Área de Trabalho\\.vscode\\AvaliaçãoPLP\\Prova2PLP\\Java\\massaMola\\saidaMM.txt", true);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.write("");
        for(int i = 0; i < vel.size(); i++){
            arqTeste.append(vel.get(i) + " " + pos.get(i) + "\n");
        }
        gravaTeste.close();
        arqTeste.close();
    }

    public void limpaArquivo() throws IOException{
        FileWriter arqTeste = new FileWriter("C:\\Users\\junin\\OneDrive\\Área de Trabalho\\.vscode\\AvaliaçãoPLP\\Prova2PLP\\Java\\massaMola\\saida1MM.txt", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }
}

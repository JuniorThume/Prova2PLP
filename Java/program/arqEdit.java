package program;


import java.io.*;

public class arqEdit {
    
    public void escreveArquivo(long time, char flagType, int iteration) throws IOException{
        FileWriter arqTeste = new FileWriter("C:\\Users\\junin\\OneDrive\\Área de Trabalho\\.vscode\\AvaliaçãoPLP\\Prova2PLP\\Java\\program\\saida.txt", true);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
       
        if(flagType == 'r'){
            arqTeste.append("tempo de execucao " + iteration + ": " + time + " segundos\n");
        }else{
            arqTeste.append("Tempo medio final: " + time + " segundos\n");
        }
        gravaTeste.close();
        arqTeste.close();
    
        
    } 
    public void limpaArquivo() throws IOException{
        FileWriter arqTeste = new FileWriter("C:\\Users\\junin\\OneDrive\\Área de Trabalho\\.vscode\\AvaliaçãoPLP\\Prova2PLP\\Java\\program\\saida.txt", false);
        PrintWriter gravaTeste = new PrintWriter(arqTeste);
        arqTeste.flush();
        arqTeste.close();
        gravaTeste.close();

    }
}

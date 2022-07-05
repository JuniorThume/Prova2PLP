//Gerar pontos distribuidos uniformemente num quadrado unitario;
    //Calculo da distancia de cada ponto a origem;
    //Determinacao dos pontos que se encontram dentro do semicirculo
    //Estimar o valor de pi;
    //Fazer dois graficos: o primeiro do valor da estimativa de pi
    //em funcao do numero de pontos gerados; o segundo da dependencia
    //funcional em funcao do numero de pontos gerados.


    ofstream file;
    file.open("Dados_para_o_numero_pi.txt");

    for(int k=0;k<numerototal;k++){
            numero*=10;
            Nd=0;
            for(i=0;i<numero;i++){
                    x = drand48();
                    y = drand48();
                    distancia = pow(x,2)+pow(y,2);
                    //Se os pontos que estão no quadrado estao tambem dentro do
                    //semicirculo, soma mais uma unidade a Nd
                    if(distancia<=1.0)
                       Nd++;
            }

            pi = 4*Nd/(double)numero;
            errocomlogaritmo = log10(fabs(M_PI-pi));


            file << numero << "\t" << setprecision(10) << pi << "\t" << k+1 << "\t" << setprecision(8) <<
            errocomlogaritmo << "\t" << endl;
    }
    file.close();
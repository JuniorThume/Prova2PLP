# Prova2PLP :thumbsup:

Os colegas da sua empresa gostaram muito das suas sugestões de linguagens para as aplicações que precisam desenvolver. No entanto, um líder sênior de desenvolvimento gostaria que você apresentasse uma justificativa do desempenho de algumas das linguagens que foram propostas.
Nesta avaliação, você deverá implementar alguns algoritmos simples em diferentes linguagens e compará-los segundo alguns critérios. As linguagens em questão são C,  Fortran95, Java, Python, Pascal, PHP, Javascript, e Lisp.

1.  Implemente um algoritmo de Bubble Sort para números inteiros. Seu programa deverá gerar 10000 números inteiros aleatórios, efetuar a ordenação e apresentar as estatísticas de tempos transcorridos. Realize múltiplas execuções para obter valores médios (N=1000, por exemplo).
Interprete esses dados e escreva um relatório comparativo entre os resultados obtidos, explicando a causa de cada um. Compare também a clareza e a facilidade ou dificuldade de gerar o código para o algoritmo solicitado.

2. Implemente um algoritmo para estimar o valor de Pi utilizando o Método de Monte Carlo. O método consiste em sortear N pontos aleatórios dentro de um quadrado e contar qual o percentual desses pontos que caiu dentro do círculo contido pelo quadrado (x²+y²< R² onde R é a metade do lado do quadrado).  Esse percentual é a razão entre as áreas do círculo A_c= πr² e do quadrado A_q=4r². Como você estima o valor de Pi? Caso não saiba, pergunte ao professor. N precisa ser consideravelmente grande, inicie com N=1000000. Repita os testes e apresente estatísticas e comparações entre os resultados e as linguagens.

3. Por fim, implemente, nas mesmas linguagens:
Um algoritmo para simular 1000000 passos de tempo de um oscilador harmônico simples (massa-mola). Dados x inicial = -1, vx inicial = 0, e valores de dt=[0.01, 0.001, 0.00001], você deve implementar um loop iterando as equações de forma similar a:


i=-1
loop (t=0; t < TMAX ;t+=dt)
       dx = vx*dt
       dvx = -(k/m)*x*dt
       x = x+dx
       vx = vx+dvx
       pos[++i]=x
       vel[i]=vx

Assuma m=1 e k=1. Todas as variáveis devem ser de ponto flutuante. Para testar a corretudo da sua implementação, você deverá gravar os vetores pos e vel em um arquivo csv no disco e traçar um gráfico utilizando o Gnuplot, Excel, etc..
Assim como na questão 1, você deverá apresentar as estatísticas de tempos necessários para a conclusão da operação. Realize múltiplas execuções para obter valores médios. Aconteceu alguma anomalia? Discuta.

Interprete esses dados e escreva um relatório comparativo entre os resultados obtidos, explicando a causa de cada um. Compare também a clareza e a facilidade de gerar o código para o algoritmo solicitado. 

PLUS: Resolva a questão 3 utilizando o método de integração denominado Runge-Kutta de quarta ordem, e analise seus resultados comparativamente.

Você encontrou obstáculos para implementar os algoritmos solicitados em alguma das linguagens? Justifique.

## CheckList

  - Bubblesort
    - [x] C
    - [x] Java
    - [x] Javascript
    - [x] Pascal
    - [x] PHP
    - [x] Python
    - [ ] Lisp
    - [x] Fortran95
    
   - Atividade 2 </br>
      - [x] C </br>
      - [x] Java </br>
      - [x] Javascript </br>
      - [ ] Pascal </br>
      - [ ] PHP </br>
      - [x] Python </br>
      - [ ] Lisp </br>
      - [x] Fortran95  </br>   
    
   - Atividade 3
      - [x] C </br>
      - [x] Java </br>
      - [x] Javascript </br>
      - [x] Pascal </br>
      - [x] PHP </br>
      - [x] Python </br>
      - [ ] Lisp </br>
      - [x] Fortran95 </br>    

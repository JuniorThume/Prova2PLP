<?php

function gravar($texto,$valor){
    $arquivo = "runtime_monteCarlo.csv";
    $fp = fopen($arquivo, "w");
    fwrite($fp ,$texto."\n");
    fclose($fp);
}

function limpaArquivo(){
    $arquivo = "runtime_monteCarlo.csv";
    $fp = fopen($arquivo, "w");
    fwrite($fp, "");
    fclose($fp);
}

function massa_mola(){
    
    $time_start = microtime(true);
    
    $cont = 0;
    $dentro = 0;
    $fora = 0;
    $ponto = 0.0;
    $x;
    $y;
    $i;
    $aux1;
    $aux2;
    $valor_pi;
    $sorteio;
    while ( $cont < 100){
        for($i = 0; $i < 1000000; $i++){
            $sorteio = rand(-10000,10000)/10000 . "\n";
            $x = 2 * $sorteio-1;
            $sorteio = rand(-10000,10000)/10000 . "\n";
            $y = 2 * $sorteio-1;

            $ponto = $x*$x + $y*$y;

            if($ponto <=1){
                $dentro = $dentro + 1;
            }else{
                $fora = $fora + 1;
            }
        }
        $aux1 = 4*$dentro;
        $aux2 = $dentro+$fora;
        $valor_pi = $aux1/$aux2;

        $time_end = microtime(true);
        $totalTime = round($time_end - $time_start, 3);

        $texto = "Tempo de Execuação".(string)$totalTime;
        $texto = $texto." ";
        $texto = $texto.(string)$valor_pi;
        gravar($texto);
        $cont = $cont +1;
    }
    
}

limpaArquivo()
massa_mola()

?>
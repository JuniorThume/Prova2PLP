<?php

function gravar($arquivo,$texto){

    $fp = fopen($arquivo, "a+");
    fwrite($fp ,$texto."\n");
    fclose($fp);
}

function limpaArquivo($arquivo){
    $fp = fopen($arquivo, "w");
    fwrite($fp, "");
    fclose($fp);
}

function monte_carlo(){
    
    $dentro = 0;
    $fora = 0;
    $ponto = 0.0;
    $x = 0.0;
    $y = 0.0;
    $i = 0.0;
    $aux1 = 0.0;
    $aux2 = 0.0;
    $valor_pi = 0.0;
    $sorteio = 0.0;

    
        for($i = 0; $i < 1000000; $i++){
            $sorteio = rand(0,10000)/10000;
            $x = 2 * $sorteio-1;
            $sorteio = rand(0,10000)/10000;
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

        
    }
    
$arr = array();



limpaArquivo("runtime-monte-carlo.csv");
$cont = 0;
while ($cont < 100){
    $time_start = microtime(true);
    monte_carlo();
    $time_end = microtime(true);
    $totalTime = (round($time_end - $time_start , 3))*1000;
    
    gravar("runtime-monte-carlo.csv",$totalTime);
    
    $cont = $cont +1;
}

?>
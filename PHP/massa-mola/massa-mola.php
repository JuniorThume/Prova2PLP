<?php

function gravarArrays($array1,$array2){
    for($g = 0;$g < count($array1);$g++){
        
        gravar("resultado-massaMola01.csv",$array1[$g] . " " . $array2[$g] . "\n");
    }
}
function gravar($arq,$texto){
	$fp = fopen($arq, "a+");
	fwrite($fp, $texto);
	fclose($fp);
}

function limpaArquivo($arq){
	$fp = fopen($arq, "w");
	fwrite($fp, "");
	fclose($fp);
}

function massa_mola($dt){

    $TMAX = 100000.0;
    $x = -1.0;
    $vx = 0.0;
    $dx;
    $dvx;
    $t;
    $m = 1.0;
    $k = 1.0;

    $pos = array();
    $vel = array();
    

    for($r = 0; $r < $TMAX; $r++){
        $dvx = -($k/$m)*$x*$dt;
        $vx = $vx+$dvx;
        $dx = $vx*$dt;
        $x = $x+$dx;
        $pos[] = $x;
        $vel[] = $vx;
        //$pos[$r]=$x;
        //$vel[$r]=$vx;
    }
   
    gravarArrays($vel,$pos);
    print_r($pos);
    unset($vel);
    unset($pos);

}


limpaArquivo("runtime-massa_mola.txt");
limpaArquivo("resultado-massaMola01.csv");

    
    $time_start = microtime(true);
    massa_mola(0.01);
    $time_end = microtime(true);
    $totalTime = round($time_end - $time_start, 3);
    gravar("runtime-massa_mola.txt",$totalTime);

















?>
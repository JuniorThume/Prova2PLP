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
    
    $TMAX = 10000.0;
    $x = -1.0;
    $vx = 0.0;
    $dx;
    $dvx;
    $t;
    $m = 1.0;
    $k = 1.0;

    $pos = 0.0;
    $vel = 0.0;
    
    for($r = 0; $r < $TMAX; $r++){
        $dvx = -($k/$m)*$x*$dt;
        $vx = $vx+$dvx;
        $dx = $vx*$dt;
        $x = $x+$dx;
        $pos = $x;
        $vel = $vx;
        
    }
   
    //gravarArrays($vel,$pos);
    //print_r($pos);
    //unset($vel);
    //unset($pos);

}


limpaArquivo("runtime-massa_mola01.txt");
limpaArquivo("runtime-massa_mola001.txt");


    for($i = 0; $i < 100;$i++){
        $time_start01 = microtime(true);
        massa_mola(0.01);
        $time_end01 = microtime(true);
        $totalTime01 = round($time_end01 - $time_start01, 3);
        gravar("runtime-massa_mola01.txt",$totalTime01);

        $time_start001 = microtime(true);
        massa_mola(0.001);
        $time_end001 = microtime(true);
        $totalTime001 = round($time_end001 - $time_start001, 3);
        gravar("runtime-massa_mola001.txt",$totalTime001);
        
    }
    

















?>
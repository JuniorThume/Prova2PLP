<?php

function gravarArrays($array1,$array2,$tmax,$dt){
    for($g = 0;$g < $tmax;$g++){
        if($dt == 0.01){
            gravar("../../../../Resultados-MassaMola/PHP/resultado-massaMola01.csv",$array1[$g] . " " . $array2[$g] . "\n");
        }else{
            gravar("../../../../Resultados-MassaMola/PHP/resultado-massaMola001.csv",$array1[$g] . " " . $array2[$g] . "\n");
        }
        
    }
}
function gravar($arq,$texto){
	$fp = fopen($arq, "w");
	fwrite($fp, $texto."\n");
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
    $tam = $TMAX/$dt;
    $vel = new SplFixedArray($tam);
    $pos = new SplFixedArray($tam);

    for($r = 0; $r < $TMAX; $r++){
        $dvx = -($k/$m)*$x*$dt;
        $vx = $vx+$dvx;
        $dx = $vx*$dt;
        $x = $x+$dx;
        $pos[$r]=$x;
        $vel[$r]=$vx;
    }
   
    gravarArrays($vel,$pos,$TMAX,$dt);
    unset($vel);
    unset($pos);

}


limpaArquivo("runtime-massa_mola.txt");

for($t = 0; $t < 2; $t++){
    
    if($t == 0){
        $op = 0.01;
    }else{
        $op = 0.001;
    }
    $time_start = microtime(true);
    massa_mola($op);
    $time_end = microtime(true);
    $totalTime = round($time_end - $time_start, 3);
    gravar("runtime-massa_mola.txt",$totalTime);
    
    
}

















?>
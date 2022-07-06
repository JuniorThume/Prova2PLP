<?php

function massa-mola(){
    $time_start = microtime(true);

    $TMAX = 100.0;
    $dt = 0.001;
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

    for($r = 0; $r < 100; $r++){
        $dvx = -($k/$m)*$x*$dt;
        $vx = $vx+$dvx;
        $dx = $vx*$dt;
        $x = $x+$dx;
        $pos[$r]=$x;
        $vel[$r]=$vx;
    }
    $time_end = microtime(true);
    $totalTime = round($time_end - $time_start, 3);
    for($f = 0; $f < $tam; $f++){
        print_r($vel[$f] . "\n")
    }
    unset($vel);
    unset($pos);

}




















?>
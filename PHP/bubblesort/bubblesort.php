<?php

function insert_array($arr) {
    $size = count($arr);
    for($k=0; $k<$size; $k++) {
        $arr[$k] = rand(0, $size-1);
    }
    return $arr;
}

function bubbleSort($array)
{
  $time_start = microtime(true);
  for($i = 0; $i < count($array); $i++)
  {
     for($j = 0; $j < count($array) - 1; $j++)
     {
       if($array[$j] > $array[$j + 1])
       {
         $aux = $array[$j];
         $array[$j] = $array[$j + 1];
         $array[$j + 1] = $aux;
       }
     }
  }
  $time_end = microtime(true);
  $totalTime = round($time_end - $time_start, 3);
  $base = 10;
  $exp = 6;
  print_r($totalTime . "\n");
  return $array;
}
for($r = 0; $r < 100; $r++){
  $array = new SplFixedArray(1000);
  $array = insert_array($array);
  $array = bubbleSort($array);
  //print_r($array);
  unset($array);
}

 
?>
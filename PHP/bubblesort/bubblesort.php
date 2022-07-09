<?php

function insert_array($arr) {
    $size = count($arr);
    for($k=0; $k<$size; $k++) {
        $arr[$k] = rand(0, $size-1);
    }
    return $arr;
}
function gravar($texto){
	$arquivo = "resultado-bubblesort.csv";
	$fp = fopen($arquivo, "a+");
	fwrite($fp, $texto."\n");
	fclose($fp);
}

function limpaArquivo(){
  $arquivo = "resultado-bubblesort.csv";
	$fp = fopen($arquivo, "w");
	fwrite($fp, "");
	fclose($fp);
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
  $totalTime = round($time_end - $time_start, 3)*1000;
  gravar($totalTime);
  //print_r($totalTime . "\n");
  return $array;
}





limpaArquivo();
for($r = 0; $r < 100; $r++){
  
  $array = new SplFixedArray(10000);
  $array = insert_array($array);
  $array = bubbleSort($array);
  unset($array);
}

 
?>
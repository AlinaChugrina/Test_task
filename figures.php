<?php


abstract class figures {
    public $num_cor;
    public $area;
}
class Rectаngle extends figures
{
    public $num_cor=4;
    public $hight;
    public $weight;
    public function __construct($h,$w)
    {
        $this->hight=$h;
        $this->weight=$w;
    }
    public function Area() {
        return $this->hight*$this->weight;
    }
}
class Circle  extends figures
{
    const PI=3.141592;
   public $num_cor=0;
   public $radius;
    public function __construct($r)
    {
        $this->radius=$r;
    }
   public function Area() {
        return $this::PI*$this->radius*$this->radius;
    }
}
class Triangle  extends figures
{
    public $num_cor=3;
    public $side1;
    public $side2;
    public $side3;
    public function __construct($s1,$s2,$s3) {
        $this->side1=$s1;
        $this->side2=$s2;
        $this->side3=$s3;
    }
     public function Area() {
          $p=($this->side1+$this->side2+$this->side3)/2;
     return sqrt($p*($p-$this->side1)*($p-$this->side2)*($p-$this->side3));
     }
}
$collection=array();
 for($i=0;$i<15;$i++)
 {
    $buf=rand(1,3);
    if ($buf==1)
    {
        $collection[$i]=new Rectаngle(rand(0,100),rand(0,100));        
        $collection[$i]->area=$collection[$i]->Area();
    }
    if ($buf==2)
    {
         $collection[$i]=new Circle(rand(0,100));
         $collection[$i]->area=$collection[$i]->Area();
    }
    if ($buf==3)
    {
        do
        {
         $a=rand(0,100);
       $b=rand(0,100);
       $c=rand(0,100);
       if (($a + $b > $c)AND ($c + $b > $a)AND ($a + $c > $b)) {
                $collection[$i] = new Triangle($a, $b, $c);
                 $collection[$i]->area=$collection[$i]->Area();
                break;
            }
        } while (1==1);
        
    }

    
 }
function cmp($a, $b) {
  if ($a->area == $b->area) {
    return 0;
  } else {
    return $a->area < $b->area ? 1 : -1; // reverse order
  }
}

usort($collection, 'cmp');
 
  echo "<pre> <h3> Данные отсортированны по убыванию площади фигуры </h3>";
    
    print_r($collection);
    echo "</pre>";
    
   $fd=fopen("saved_data.txt", 'w+')or die("Could not open file open!");
   $str_data= serialize($collection);
   if(file_put_contents("saved_data.txt",$str_data))
           echo "<h3>Данные были сохранены в файл saved_data.txt </h3> ";
   $string_data = file_get_contents("saved_data.txt");
    $array = unserialize($string_data);
    echo "<pre> <h3>Ранее сохраненные данные, полученные из файла </h3>";
    print_r($array);
    echo "</pre>";
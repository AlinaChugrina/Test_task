
    <?php

    
        echo ' <h3>First 64 Fibonacci numbers:<h3> ';
        $f0=0;$f1=1;
       echo "$f0, $f1, ";         
       for ($i = 0; $i < 62; $i++)
        {
            $f2=$f0+$f1;
            echo $f2;
            if ($i!=61)
            echo ', ';
            else 
                echo '.';
            $f0=$f1; $f1=$f2;
            
           }
    


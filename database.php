<?php

$con= mysqli_connect("localhost","root","","books");
mysqli_set_charset($con, "utf8");

     if (mysqli_connect_errno())
     {
         echo "Failed to connect to MySQL:". mysqli_connect_error();
     }
      $query="SELECT * FROM catalog JOIN books ON books.id=catalog.id_b JOIN authors ON authors.id=catalog.id_a ORDER BY books.id";
     echo "<h3> Каталог библиотеки </h3> ";
     $result=mysqli_query($con,$query);

    while ($row= mysqli_fetch_array($result) ) {

        echo " <pre>  Книга: ".$row['book'];   
        echo " Автор: ".$row['author']."  <hr> </pre>";

    }
    
     $qcoun="SELECT * FROM catalog JOIN authors ON authors.id=catalog.id_a JOIN books ON books.id=catalog.id_b GROUP BY authors.author HAVING COUNT(book)<7";
      $resultc=mysqli_query($con,$qcoun);
     echo "Авторы, которые участвовали в написании не более 6 книг: ";
     while ($rowc = mysqli_fetch_array($resultc)) {
        echo ($rowc['author'])." ";
     }



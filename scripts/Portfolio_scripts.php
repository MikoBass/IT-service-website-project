<?php
    $servername = "localhost";
    $username = "root";
    $password = "";

    //starts
    $conn = new mysqli($servername, $username, $password, "cvs_db_mb");

    //check if works

    if ($conn->connect_error){
        die("Conncetion Failed: " . $conn->connect_error);
    }
    
    echo $searched;
    
?>




<?php
    $servername = "localhost";
    $serverusername = "root";
    $serverpassword = "";

    //starts
    $conn = new mysqli($servername, $serverusername, $serverpassword, "portfoliodatabase");

    //check if works

    if ($conn->connect_error){
        die("Conncetion Failed: " . $conn->connect_error);
    }
    
    
?>




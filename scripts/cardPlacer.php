<?php
    echo "<section class='info'>";
    echo "<section class='nameCard'>";
    echo $row["firstName"] . "&nbsp";
    echo $row["lastName"] . "&nbsp &nbsp";
    echo "</section>";
    if($row["available"] == 1){
        echo "<img src=./images/available.svg placeholder='unavailable' class='available'>";
    }
    else{
        echo "<img src=./images/not.svg placeholder='unavailable' class='available'>";
    }
    
    echo "<section class='desc'>";
    echo "<img src='./images/houseicon.svg' class='icons'>" . "&nbsp";
    echo "<section class='livein'>";
    echo $row["country"] . "&nbsp &nbsp";
    echo $row["city"] . "&nbsp &nbsp";
    echo "</section>";
    echo "<section class='explang'>";
    echo $row["experience"] . "&nbsp &nbsp";
    echo "</section>";
    echo "</section>";
    echo "</section>";

?>
 
<?php
    $experienceQuery = $conn->query("select id, name from experience where lanOrExp = 'exp'");
    while($row=$experienceQuery->fetch_row()){

        echo "<section class='expcheck'>";
        echo "<input id='$row[0]' name='$row[1]' type='checkbox' class='choosables'><br>";
        echo "<label for='$row[0]'>$row[1]</label>";
        echo "</section>";
    }
    
?>
<?php
    $slangQuery = $conn->query("select id, name from experience where lanOrExp = 'lan'");
    while($row=$slangQuery->fetch_row()){

        echo "<section class='slacheck'>";
        echo "<input id='$row[0]' name='$row[1]' type='checkbox' class='choosables'><br>";
        echo "<label for='$row[0]'>$row[1]</label>";
        echo "</section>";
    }
    
?>
<?php
    $countryQuery = $conn->query("select name, id from country");
    while($row=$countryQuery->fetch_row()){
        echo "<option value=$row[1]>$row[0]</option>";
    }
?>
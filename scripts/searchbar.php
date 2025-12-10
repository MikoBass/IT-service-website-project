<?php
if(!isset($_GET["searchbar"])){
    return 0;
}
else if($_GET["searchbar"] == "")
{
    
    if(!isset($_GET["hiddenCheck"])){
        return 0;
    }
    $specSearch = $_GET["hiddenCheck"];

    if(isset($_GET["hiddenCheck"])){
        
        $specsearchQuery = $conn->query("
        SELECT 
        firstName, 
        lastName,
        country.id, 
        country.name AS country, 
        city, 
        github, 
        about, 
        available, 
        GROUP_CONCAT(DISTINCT experience.name) AS experience
        FROM users
        INNER JOIN experienceConnector ON experienceConnector.userId = users.id
        INNER JOIN experience ON experience.id = experienceConnector.experienceId
        INNER JOIN country ON country.id = users.country
        GROUP BY users.id
        HAVING CONCAT(' ', country.id, ' ', GROUP_CONCAT(DISTINCT experience.name), ' ') LIKE CONCAT('%', '$specSearch', '%') 
    ");
        if($specsearchQuery->num_rows > 0){
            while($row = $specsearchQuery->fetch_assoc()){
                
                include "./scripts/cardPlacer.php";
            }
        }
        else{
            echo "No results";
        }
    }
}    
  
else {
        $searched = $_GET["searchbar"];
        //add more things like that since some look weird + add so that they show up looking normal but anyway gg
        if(strcasecmp($searched, 'java script') == 0){
            $searched = 'java_script';
        }
        if(strcasecmp($searched, 'c#') == 0){
            $searched = 'csharp';
        }
        if(strcasecmp($searched, 'c++') == 0){
            $searched = 'cpp';
        }
        if(strcasecmp($searched, 'ux') == 0){
            $searched = 'ux-ui';
        }
        if(strcasecmp($searched, 'ui') == 0){
            $searched = 'ux-ui';
        }
        $searchQuery = $conn->query("
        SELECT 
        firstName, 
        lastName, 
        country.name AS country, 
        city, 
        github, 
        about, 
        available, 
        GROUP_CONCAT(DISTINCT experience.name) AS experience
        FROM users
        INNER JOIN experienceConnector ON experienceConnector.userId = users.id
        INNER JOIN experience ON experience.id = experienceConnector.experienceId
        INNER JOIN country ON country.id = users.country
        GROUP BY users.id
        HAVING CONCAT(' ', firstName, ' ', lastName, ' ', country.name, ' ', city, ' ', github, ' ', about, ' ', GROUP_CONCAT(DISTINCT experience.name), ' ') LIKE CONCAT('%', '$searched', '%')
        ");
    if($searchQuery->num_rows > 0){
        while($row = $searchQuery->fetch_assoc()){
            include "./scripts/cardPlacer.php";
        }
    }
    else{
        echo "No results";
    }
}
?>
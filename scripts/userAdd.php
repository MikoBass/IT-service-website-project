<?php
    if(!isset($_POST["registerSubmit"])){
        return 0;
    }
    $username = $_POST["username"];
    $password = hash("sha256", $_POST["password"]);
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $country = $_POST["country"];
    $city = $_POST["city"];
    $github = $_POST["github"];
    $about = $_POST["about"];
    if(!isset($_POST["available"])){
        $available = 0;
    }
    else{
        $available = 1;
    }
    

    $credentialAddQuery = $conn->query("
    INSERT INTO credentials (username, password)
    VALUES ('$username', '$password')
    ");

    $userAddQuery = $conn->query("
    INSERT INTO users (firstName, lastName, country, city, github, about, available)
    VALUES ('$firstname', '$lastname', $country, '$city', '$github', '$about', $available);
    ");
    
    $currentUserIdQuery = $conn->query("
    SELECT id FROM credentials
    WHERE username = '$username'
    ");
    $currentUserId = $currentUserIdQuery->fetch_assoc()['id'];


    $experienceAmountQuery = $conn->query("
    SELECT id, name FROM experience
    WHERE lanOrExp = 'exp'
    ");
    $experienceAmount = $experienceAmountQuery->num_rows;

    if($experienceAmount > 0){
        while($row = $experienceAmountQuery->fetch_assoc()){
            if(isset($_POST[$row['name']])){
                $experienceAdd = $conn->query("
                INSERT INTO experienceconnector (userId, experienceId)
                VALUES ($currentUserId, '" . $row['id'] . "')
                ");
            }
        }
    }

    $langAmountQuery = $conn->query("
    SELECT id, name FROM experience
    WHERE lanOrExp = 'lan'
    ");
    $langAmount = $langAmountQuery->num_rows;

    if($langAmount > 0){
        while($row = $langAmountQuery->fetch_assoc()){
            if(isset($_POST[$row['name']])){
                $langAdd = $conn->query("
                INSERT INTO experienceconnector (userId, experienceId)
                VALUES ($currentUserId, '" . $row['id'] . "')
                ");
            }
        }
    }
    setcookie('username', $username, time() + (1000*60*60))
    setcookie('password', $password, time() + (1000*60*60))

?>
<?php
    if(!isset($_POST["editorSubmit"])){
        return 0;
    }
    
    $username = $_POST["username"];
    $password = hash("sha256", $_POST["password"]);
    $sesuser = $_SESSION['username'];
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $country = $_POST["country"];
    $city = $_POST["city"];
    $github = $_POST["github"];
    $about = $_POST["about"];
    $adminPass = $conn->query("
    SELECT username, password FROM credentials
    WHERE username = 'Admin'
    ")->fetch_assoc()['password'];
    if(!isset($_POST["available"])){
        $available = 0;
    }
    else{
        $available = 1;
    }
    $credentialCheckQuery = $conn->query("
    SELECT id, username, password FROM credentials
    WHERE username = '$username'
    ");
    if($credentialCheckQuery){
        $credentialCheck = $credentialCheckQuery->fetch_assoc();
        $credentialCheckId = $credentialCheck['id'];
        if($credentialCheck['password'] == $password ||$password == $adminPass){
            $userUpdateQuery = $conn->query("
            UPDATE users
            SET
            firstName = '$firstname',
            lastName = '$lastname',
            country = $country,
            city = '$city',
            github = '$github',
            about = '$about',
            available = $available
            WHERE id = '$credentialCheckId'
            ");
            $expCheck = $conn->query("
            SELECT userId 
            FROM experienceconnector
            WHERE userId = '$credentialCheckId'
            ")->fetch_assoc();
            if($expCheck){
                $expDelete = $conn->query("
                DELETE FROM experienceconnector
                WHERE userId = '$credentialCheckId'
                ");
            }
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
                        VALUES ($credentialCheckId, '" . $row['id'] . "')
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
                        VALUES ($credentialCheckId, '" . $row['id'] . "')
                        ");
                    }
                }
            }
        }
    }
?>
<?php
    if (!isset($_POST['username']) && !isset($_POST["password"])) {
        echo "<a href='?reglog=true' id='reglog'>Login</a>";
        if (isset($_GET['reglog']) && $_GET['reglog'] === 'true') {
            header('Location: ./login.php');
            exit;
        }
    } else {
        

        setcookie("username", $_POST['username'], time()+ (2*60));
        setcookie("password", hash("sha256", $_POST["password"]), time()+ (2*60));
        if(isset($_COOKIE['username']) && isset($_COOKIE["password"])){
            $loggedUsername = $_COOKIE['username'];
            $loggedPassword = $_COOKIE['password'];
            $profileVerification = $conn->query("
                SELECT id, username, password FROM credentials
                WHERE username = '$loggedUsername' AND password = '$loggedPassword'
            ");
        
            $profileData = $profileVerification->fetch_assoc();

            if ($profileData) {
                $nameRetriever = $conn->query("
                    SELECT id, firstName, lastName FROM users
                    WHERE id = '{$profileData['id']}'
                ");
                $userData = $nameRetriever->fetch_assoc();

                echo "<span class='welcome'>Welcome " . $userData["firstName"] . " " . $userData["lastName"] . "</span>";
            } else {
                header('Location: ./login.php');
                exit;
            }
        }else {
            header("Refresh:0");
        }
    }

    /*if(!isset($_POST['username']) && !isset($_POST["password"])){
        echo "<a href='?reglog=true' id='reglog'>Login</a>";
        if (isset($_GET['reglog']) && $_GET['reglog'] === 'true') {
            header('Location: ./login.php');
            exit;
        }
    }
    else{
        $loggedUsername = $_POST['username'];
        $loggedPassword = hash("sha256", $_POST["password"]);
        
        $profileVerification = $conn->query("
        SELECT id, username, password FROM credentials
        WHERE username = '$loggedUsername' AND password = '$loggedPassword'
        ");
    
        $profileData = $profileVerification->fetch_assoc();
        $nameRetriever = $conn->query("
        SELECT id, firstName, lastName FROM users
        WHERE id = '$profileData['id']'
        ");
        $userData = $nameRetriever->fetch_assoc();
        echo "<span>Welcome" . $userData["firstName"] . " " . $userData["lastName"] . "</span>";

    }*/

?>
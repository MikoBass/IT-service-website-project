<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfol.io</title>
    <link rel="icon" href="./images/logo.svg">
    <link rel="stylesheet" href="./scripts/Portfolio.css">
</head>
<body>
    <?php
        include "./scripts/dbConnector.php";
    ?>
    <form action="./Portfolio.php" method="POST">
        <section class="reginput">
            <section class="regcard">
                <a href='?backlog=true' id='backlog1'class="backlog"><img src="./images/arrow.svg"></a>
                <?php
                    if (isset($_GET['backlog']) && $_GET['backlog'] === 'true') {
                        header('Location: ./Portfolio.php');
                        exit;
                    }
                ?>
                <section class="logheader">Add Profile</section>
                <input required type="text" class="name" placeholder="username" name="username">
                <input required type="password" class="pass" placeholder="password" name="password">
                <input required type="text" class="firstname" placeholder=" First Name" name="firstname">
                <input required type="text" class="lastname" placeholder="Last Name" name="lastname">
                <select required class="country_selector" name="country">
                    <option disabled selected>Country</option>
                    <?php
                        include "./scripts/countryList.php";
                    ?>
                </select>
                <input required type="text" class="city" placeholder="city" name="city">
                <input required type="text" class="github" placeholder="github link" name="github">
                <textarea required class="about" name="about" placeholder="About"></textarea>
                <input id="available" type="checkbox" name="available" value="1"><lable for="available">Are you available?</lable>
                <p>What are you experienced in?</p>
                <section class='experienceChecks'>
                    <?php
                        include "./scripts/experiencePlacer.php"
                    ?>
                </section>
                <p>What languages do you speak</p>
                <section class='slangChecks'>
                    <?php
                        include "./scripts/slangPlacer.php"
                    ?>
                </section>
                <!--
                    figure out how to make the experiences choosable a select probably with checkmarks
                    and then try making a query to add all the given values

                -->
                
                    
                
                <input type="submit" value="Add Profile" name="registerSubmit" class="registerSubmit">
                <span>Already have a profile?</span>
                <a href="./editor.php">Edit Profile</a>
            </section>
        </section>

    </form>
    <!-- 
    -add choosing between login and register
    - register - adds all info to database + connections + below
    - login - on the main page changes login button to a icon/text you are logged in as [user]
    - make i look nice 
    - make a profile page accesible from the icon 
    - and make profiles of other accesible through the searchbar
    - then make it so only the correct user can modify their profile-->
</body>
</html>
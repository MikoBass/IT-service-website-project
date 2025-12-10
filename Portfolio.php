
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
    
    <form action="Portfolio.php" method="GET">
        <section id="unclicked" ></section>
        <header>
            <img class="logo" src="./images/logo.svg">
            <span id="clock"></span>
            <section class="profButtons">
                <a href='?reglog=true' id='reglog'class="reglog">Add Profile</a>
                <a href='?modlog=true' id='modlog'class="reglog">Edit Profile</a>
            </section>
            <?php
            if (isset($_GET['reglog']) && $_GET['reglog'] === 'true') {
                header('Location: ./register.php');
                exit;
            }
            if (isset($_GET['modlog']) && $_GET['modlog'] === 'true') {
                header('Location: ./editor.php');
                exit;
            }
            if(isset($_POST['registerSubmit'])){
                include "./scripts/userAdd.php";   
            }
            else if(isset($_POST['editorSubmit'])){
                include "./scripts/userEdit.php";
            }
            ?>
            
        </header>
        <section class="main-banner">
            <section class="imgban" id="imgban4">
                
            </section>
            <section class="imgban" id="imgban3">
                
            </section>
            <section class="imgban" id="imgban2">
                
            </section>
            <section class="imgban" id="imgban1">
                
            </section>

        </section>
        <section id="search_section">
            <input type="text" placeholder="search" name="searchbar" id="searchbar" onchange="submit()"><input type="submit" style="display:none;">
            <section id="search_buttons" >
                <?php
                    include "./scripts/buttonPlacer.php";
                ?>
            </section>
            
            <select class="country_selector" onchange="spec(this.value), this.form.submit()">
                <option>Country</option>
                <?php
                    include "./scripts/countryList.php";
                ?>
            </select>
            <button type="button" id="filters" onclick="showF()">More options</button>


            <!--tu dodaj jakoś otwierające się okno z chekboxami do językow + całej reszty rzeczy-->
        </section>
        <section id='hidden_filters' class='hide'>
            <h4 style="text-align:center">Filters</h4>
            <button type="button" id="close" style="width: 2.5vh; height: 2.5vh;" onclick="hideF()">X</button>
            
            <section class="filter_buttons_parent">
            <select class="country_selector" onchange="spec(this.value), this.form.submit()">
                <option>Country</option>
                <?php
                    include "./scripts/countryList.php";
                ?>
            </select>
                <section class="filter_buttons">
                    <?php
                            include "./scripts/buttonPlacer.php";
                    ?>
                </section>

            </section>
        </section>
        <input id="hiddenCheck" name="hiddenCheck" style="display: none;">
        <?php
            include "./scripts/searchbar.php";
        ?>
    </form>
    
    
    <script src="./scripts/Portfolio.js"></script> 
    <!-- <script><?=file_get_contents("Portfolio.js")?></script> -->
</body>
</html>
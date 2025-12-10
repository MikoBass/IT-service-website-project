<?php
    $countryQuery = $conn->query("select name from experience where lanOrExp = 'exp'");
    while($row=$countryQuery->fetch_row()){
        $shit = '"data-value"';
        echo "<button class='searchables' style='background-image: url(./images/$row[0].svg)' data-value='$row[0]' onclick='spec(this.getAttribute($shit))'></button>";
        /*echo "<div class='lang-button'>
                <div>
                    <svg class='lang-button-text' focusable='false' aria-hidden='true'>
                    <path fill-rule='evenodd' clip-rule='evenodd' d='M4.00172 3.60643L5.19575 19.1209C5.22063 19.3483 5.36988 19.5505 5.59376 19.6263L11.8873 21.6477C11.9868 21.673 12.1112 21.673 12.2356 21.6477L18.5292 19.6263C18.753 19.5505 18.9023 19.3483 18.9272 19.1209L20.1212 3.60643C20.0963 3.27795 19.8476 3 19.5242 3H4.54898C4.2256 3 3.97684 3.27795 4.00172 3.60643ZM17.4032 8.39059H9.6867L9.90858 10.5894H17.2306L16.7622 16.8574L12.4725 18.2727L8.18285 16.8827L7.93631 13.597H10.1798V15.2146L12.5218 15.8717L14.8639 15.2146L15.0365 12.6619H7.86235L7.39394 6.39394H17.5758L17.4032 8.39059Z' fill='url(#htmlCategoryIcon)'></path>
                    <defs><linearGradient id='htmlCategoryIcon' x1='-2.1054e-07' y1='17.9048' x2='36' y2='17.9048' gradientUnits='userSpaceOnUse'><stop stop-color='#FFFFFF'></stop><stop offset='1' stop-color='#FFFFFF'></stop></linearGradient></defs>
                    </svg>
                </div>
            </div>";*/
    }
?>
function showF()
{
    document.getElementById("hidden_filters").classList.remove("hide")
    document.getElementById("search_section").classList.add("disabled") 
}
function hideF()
{
    document.getElementById("hidden_filters").classList.add("hide") 
    document.getElementById("search_section").classList.remove("disabled") 
}

function showL()
{
    document.getElementById("hidden_login").classList.remove("hide")
    document.getElementById("search_section").classList.add("disabled") 
}
function hideL()
{
    document.getElementById("hidden_login").classList.add("hide")
    document.getElementById("search_section").classList.remove("disabled")      
}
function spec(search){
    document.getElementById("hiddenCheck").value = search;
    console.log(search)
}

function clock(){
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();

    const clockStr = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    document.getElementById('clock').innerHTML = clockStr;
}
clock();
setInterval(clock, 1000);

var bannerStatus = 1;
var bannerTimer = 4000;
window.onload = function(){
    bannerLoop();
}

var startBannerLoop = setInterval(function(){
    bannerLoop();
}, bannerTimer);
function bannerLoop(){
    if(bannerStatus === 1){
        setTimeout(function(){
            document.getElementById("imgban1").style.right = "0px";
            document.getElementById("imgban1").style.zIndex = "1000";
            document.getElementById("imgban2").style.right = "-1200px";
            document.getElementById("imgban2").style.zIndex = "1100";
        }, 500);
        
        
        bannerStatus = 2;
    }
    else if(bannerStatus === 2){
        setTimeout(function(){
            document.getElementById("imgban2").style.right = "0px";
            document.getElementById("imgban2").style.zIndex = "1000";
            document.getElementById("imgban1").style.right = "-1200px";
            document.getElementById("imgban1").style.zIndex = "1100";
        }, 500);
        
        
        bannerStatus = 1;
    }
    /*else if(bannerStatus === 3){
        setTimeout(function(){
            document.getElementById("imgban3").style.right = "0px";
            document.getElementById("imgban3").style.zIndex = "1000";
            document.getElementById("imgban4").style.right = "-1200px";
            document.getElementById("imgban4").style.zIndex = "1100";
        }, 500);
        
        
        bannerStatus = 4;
    }
    else if(bannerStatus === 4){
        setTimeout(function(){
            document.getElementById("imgban4").style.right = "0px";
            document.getElementById("imgban4").style.zIndex = "1000";
            document.getElementById("imgban1").style.right = "-1200px";
            document.getElementById("imgban1").style.zIndex = "1100";
        }, 500);
        
        
        bannerStatus = 1;
    }*/
}
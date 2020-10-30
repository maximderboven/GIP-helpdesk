////ACORDION INSTELLEN FAQ
//=============================
var acc = document.getElementsByClassName("accordion"); //de acordion ophalen en declareren
var i; //teller declareren

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        this.classList.toggle("active-accordion"); //een classe geven om het + en - te veranderen. auto op + met deze classe op -
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) { //als het al zijn max grote heeft: terug kleiner zetten en anders open zetten.
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    });
}

//TABS INSTELLEN INFO
//=============================
function openTab(evt, TabName) {//constructor maken met 2 parameters
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent"); //de content onder de tab selecteren.
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(TabName).style.display = "block";
    evt.currentTarget.className += " active";
}

document.getElementById("defaultOpen").click();// element met het id defaultOpen en het event clicken reconstrueren.


//COLOR NAVBAR TOEKENNEN
//=============================
window.onscroll = function () {
    myFunction()// Bij elke keer scrollen de functie uitvoeren.
};

var navbar = document.getElementById("navbar");// De navbar die vastgezet moet worden selecteren om te volgen.
var sticky = navbar.offsetTop;// de plaats van de top tussen de navbar verkrijgen.

function myFunction() {
    if (window.pageYOffset >= sticky) {// Als die plaats 0 is. de klasse sticky toekennen.
        navbar.classList.add("sticky")
    } else {
        navbar.classList.remove("sticky");// zo niet. weghalen.
    }
}

//LOGIN MODAL BOX
//=============================
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
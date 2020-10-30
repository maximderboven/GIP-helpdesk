// Wanneer de gebruiker scrollt de functie "sticktop" uitvoeren
window.onscroll = function() {myFunction()};

// Haal de navbar op
var navbar = document.getElementById("navbar");

// Haal de positie
var sticky = navbar.offsetTop;
// Geef hem de klasse sticky als hij op zijn positie is en haal het weg als men terug scrollt.
function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}







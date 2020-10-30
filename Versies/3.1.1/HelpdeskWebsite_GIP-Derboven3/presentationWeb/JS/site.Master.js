//Fixes the navbar overlapping the content on small screens
$(window).resize(function () {
    $('body').css('padding-top', parseInt($('#main-navbar').css("height")) - 30);
});

$(window).on('load', function () {
    $('body').css('padding-top', parseInt($('#main-navbar').css("height")) - 30);
});




function menuHide(x) {
    for (var i = 1; i <= 5; i++) {
        if (document.getElementById("menu" + i)) {
            if (x == "menu" + i) {
                document.getElementById("m" + i).setAttribute("aria-expanded", "true");
                document.getElementById("menu" + i).setAttribute("aria-expanded", "true");
            } else {
                document.getElementById("menu" + i).className = "panel-collapse collapse";
            }
        }
    }
}

function menuChange() {
    var cururl = window.location.pathname;
    var curpage = cururl.substr(cururl.lastIndexOf('/') + 1);

    // Account menu
    if (cururl.indexOf("profiel") > -1) {
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className = "panel-collapse collapse in";
        document.getElementById("menu_profiel").className = "active";
        document.getElementById("menu_profiel").style.color = "#fff";
        document.getElementById("menu_profiel").style.backgroundColor = "#252525";
    }
    if (cururl.indexOf("reset-passwoord") > -1) {
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className = "panel-collapse collapse in";
        document.getElementById("menu_reset_password").className = "active";
        document.getElementById("menu_reset_password").style.color = "#fff";
        document.getElementById("menu_reset_password").style.backgroundColor = "#252525";
    }

    // Gebruiker menu
    if (cururl.indexOf("gebruiker-aanmaken") > -1) {
        document.getElementById("m4").setAttribute("aria-expanded", "true");
        document.getElementById("menu4").className = "panel-collapse collapse in";
        document.getElementById("menu_gebruiker_aanmaken").className = "active";
        document.getElementById("menu_gebruiker_aanmaken").style.color = "#fff";
        document.getElementById("menu_gebruiker_aanmaken").style.backgroundColor = "#252525";
    }
    if (cururl.indexOf("gebruiker-beheer") > -1) {
        document.getElementById("m4").setAttribute("aria-expanded", "true");
        document.getElementById("menu4").className = "panel-collapse collapse in";
        document.getElementById("menu_gebruiker_beheer").className = "active";
        document.getElementById("menu_gebruiker_beheer").style.color = "#fff";
        document.getElementById("menu_gebruiker_beheer").style.backgroundColor = "#252525";
    }
    // ticket menu
    if (cururl.indexOf("ticket-aanmaken") > -1) {
        document.getElementById("m2").setAttribute("aria-expanded", "true");
        document.getElementById("menu2").className = "panel-collapse collapse in";
        document.getElementById("menu_ticket_aanmaken").className = "active";
        document.getElementById("menu_ticket_aanmaken").style.color = "#fff";
        document.getElementById("menu_ticket_aanmaken").style.backgroundColor = "#252525";
    }

    if (cururl.indexOf("ticket-beheer") > -1) {
        document.getElementById("m2").setAttribute("aria-expanded", "true");
        document.getElementById("menu2").className = "panel-collapse collapse in";
        document.getElementById("menu_ticket_beheer").className = "active";
        document.getElementById("menu_ticket_beheer").style.color = "#fff";
        document.getElementById("menu_ticket_beheer").style.backgroundColor = "#252525";
    }

    if (cururl.indexOf("ticket-details") > -1) {
        document.getElementById("m2").setAttribute("aria-expanded", "true");
        document.getElementById("menu2").className = "panel-collapse collapse in";
        document.getElementById("menu_ticket_beheer").className = "active";
        document.getElementById("menu_ticket_beheer").style.color = "#fff";
        document.getElementById("menu_ticket_beheer").style.backgroundColor = "#252525";
    }
}

function addLoadEvent(func) {
    var oldonload = window.onload;
    if (typeof window.onload != 'function') {
        window.onload = func;
    } else {
        window.onload = function () {
            if (oldonload) {
                oldonload();
            }
            func();
        }
    }
}

addLoadEvent(menuChange); 
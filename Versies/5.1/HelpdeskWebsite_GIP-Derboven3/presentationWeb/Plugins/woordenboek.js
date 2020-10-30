var dict = {
    "Over ons": {
        en: "About us",
        fr: "De nous"
    },
    "Registreer": {
        en: "Sign up",
        fr: "S'inscrire"
    },
    "Login": {
        en: "Sign in",
        fr: "Connecter"
    },
    "Stel je vragen aan": {
        en: "Ask your questions",
        fr: "Posez vos questions"
    },
    "We proberen u te helpen bij al uw vragen of problemen. Wij zijn het antwoord op uw vraag.": {
        en: "We try to help you with all your questions or problems. We are the answer to your question.",
        fr: "Nous essayons de vous aider avec toutes vos questions ou problèmes.Nous sommes la réponse à votre question."
    },
    "Ontdek meer &nbsp;&nbsp;&nbsp;&gt;&gt;": {
        en: "discover more &nbsp;&nbsp;&nbsp;&gt;&gt;",
        fr: "En savoir plus &nbsp;&nbsp;&nbsp;&gt;&gt;"
    },
    "Ontdek meer &nbsp;& nbsp;& nbsp;>>": {
        en: "discover more &nbsp;& nbsp;& nbsp;>>",
        fr: "En savoir plus &nbsp;& nbsp;& nbsp;>>"
},
    "Wij zijn het antwoord op uw vraag!": {
        en: "We are the answer to your question!",
        fr: "Nous sommes la réponse à votre question!"
    },
    "Wij zijn gespecialiseerd in zowel hardware als softwarematige problemen. Ons team kan u zeker op weg helpen met de Microsoft Officepakketten. Ook de Adobe applicaties, foto-, videobewerking is geen probleem.": {
        en: "We specialize in both hardware and software problems. Our team can certainly help you on your way with the Microsoft Office packages. The Adobe applications, photo and video editing is also no problem.",
        fr: "Nous sommes spécialisés dans les problèmes matériels et logiciels. Notre équipe peut certainement vous aider sur votre chemin avec les packages Microsoft Office. Les applications Adobe, l'édition de photos et de vidéos ne posent également aucun problème."
    },
    "Het programmeerteam is bekend met de meeste omgevingen en talen als C#, html, CSS, JS, ASP.Net en zelfs Java en SQL. Voor hardware problemen, het besturing-, telefoonsyteem of problemen aan het toestel doen wij ook ons best!": {
        en: "The programming team is familiar with most environments and languages ​​such as C #, html, CSS, JS, ASP.Net and even Java and SQL. We also do our best for hardware problems, the operating system, telephone system or problems with the device!",
        fr: "L'équipe de programmation est familière avec la plupart des environnements et langages tels que C #, html, CSS, JS, ASP.Net et même Java et SQL. Nous faisons également de notre mieux pour les problèmes matériels, le système d'exploitation, le système téléphonique ou les problèmes avec l'appareil!"
    },
    "Waarom wij de beste zijn..": {
        en: "Why we are the best ..",
        fr: "Pourquoi nous sommes les meilleurs .."
    },
    "Wij leerlingen van het laatste jaar informaticabeheer kennen de computer van binnen en van buiten. Door onze interesse hebben we een brede kennis over onze geleverde onderwerpen. Wij bieden hulp en een duidelijk antwoord op uw vragen. De website is makkelijk te gebruiken en zeer overzichtelijk.": {
        en: "We students of the last year of IT management know the computer inside and out. Because of our interest, we have a broad knowledge of our delivered subjects. We offer help and a clear answer to your questions. The website is easy to use and very clear.",
        fr: "Nous, étudiants de dernière année en gestion informatique, connaissons l'ordinateur à l'intérieur comme à l'extérieur. En raison de notre intérêt, nous avons une vaste connaissance de nos sujets livrés. Nous offrons de l'aide et une réponse claire à vos questions. Le site Web est facile à utiliser et très clair."
    },
    "Ik ben overtuigd &nbsp;&nbsp;&nbsp;&gt;&gt;": {
        en: "I am convinced &nbsp;&nbsp;>>",
        fr: "Je suis convaincu &nbsp;&nbsp;>>"
    },
    "Onze methodes": {
        en: "Our methods",
        fr: "Nos méthodes"
    },
    "Andere / Talen": {
        en: "Other / Languages",
        fr: "Autre / Langues"
    }
}

var translator = $('body').translate({ lang: "nl", t: dict }); //use English

$(".lang_selector").click(function (ev) {
    var lang = $(this).attr("data-value");
    translator.lang(lang);

    console.log(lang);
    ev.preventDefault();
});
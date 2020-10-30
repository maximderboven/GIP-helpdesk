//Fixes the navbar overlapping the content on small screens
$(window).resize(function () { 
    $('body').css('padding-top', parseInt($('#main-navbar').css("height"))-30);
});

$(window).on('load', function () { 
    $('body').css('padding-top', parseInt($('#main-navbar').css("height"))-30);         
});





/*function menuHide(x) {
    for(var i=1;i<=5;i++) {
        if (document.getElementById("menu"+i)) { 
            if(x=="menu"+i) {
                document.getElementById("m"+i).setAttribute("aria-expanded", "true"); 
                document.getElementById("menu"+i).setAttribute("aria-expanded", "true");    
            } else {
                document.getElementById("menu"+i).className = "panel-collapse collapse";    
            }
        }
    }
}

function menuChange(){ 
    var cururl = window.location.pathname;
    var curpage = cururl.substr(cururl.lastIndexOf('/') + 1);
  
    // Account menu
    if (cururl.indexOf("profile") >-1 || cururl.indexOf("profile-change-email") >-1 || cururl.indexOf("profile-change-password") >-1) {
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className="panel-collapse collapse in";    
        document.getElementById("menu_profile").className="active";
        document.getElementById("menu_profile").style.color = "#fff";
        document.getElementById("menu_profile").style.backgroundColor = "#252525"; 
    }
    if(cururl.indexOf("payout-information") >-1) {  
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className="panel-collapse collapse in";
        document.getElementById("menu_payout_information").className="active";
        document.getElementById("menu_payout_information").style.color = "#fff";
        document.getElementById("menu_payout_information").style.backgroundColor = "#252525";
    } 
    if(cururl.indexOf("notifications") >-1) {  
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className="panel-collapse collapse in";    
        document.getElementById("menu_notifications").className="active";
        document.getElementById("menu_notifications").style.color = "#fff";
        document.getElementById("menu_notifications").style.backgroundColor = "#252525";
    }         
    if(cururl.indexOf("tickets") >-1 || cururl.indexOf("ticket-create") >-1 || cururl.indexOf("ticket-detail") >-1 ) {  
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className="panel-collapse collapse in";    
        document.getElementById("menu_tickets").className="active";
   document.getElementById("menu_tickets").style.color = "#fff";
   document.getElementById("menu_tickets").style.backgroundColor = "#252525";
    }   
    if (cururl.indexOf("payment-methods") >-1)
  { 
   document.getElementById("m1").setAttribute("aria-expanded", "true");
   document.getElementById("menu1").className="panel-collapse collapse in";    
   document.getElementById("menu_payment_methods").className="active";
   document.getElementById("menu_payment_methods").style.color = "#fff";
   document.getElementById("menu_payment_methods").style.backgroundColor = "#252525";
  }
    if (cururl.indexOf("customization") >-1)
    { 
        document.getElementById("m1").setAttribute("aria-expanded", "true");
        document.getElementById("menu1").className="panel-collapse collapse in";                                
        document.getElementById("menu_customization").className="active";
        document.getElementById("menu_customization").style.color = "#fff";
        document.getElementById("menu_customization").style.backgroundColor = "#252525";
    }
 
  // Sales menu
    if (curpage == 'payouts' || curpage == 'confirm-payout') {
//  if(cururl.indexOf("payouts") >-1 || cururl.indexOf("confirm-payout") >-1 )
  //{
   document.getElementById("m2").setAttribute("aria-expanded", "true");
   document.getElementById("menu2").className="panel-collapse collapse in";    
   document.getElementById("menu_payouts").className="active";
   document.getElementById("menu_payouts").style.color = "#fff";
   document.getElementById("menu_payouts").style.backgroundColor = "#252525";
  }
    if(cururl.indexOf("stats") >-1 )
   {
   document.getElementById("m2").setAttribute("aria-expanded", "true");
   document.getElementById("menu2").className="panel-collapse collapse in";    
   document.getElementById("menu_stats").className="active";
   document.getElementById("menu_stats").style.color = "#fff";
   document.getElementById("menu_stats").style.backgroundColor = "#252525";
  }
    
    if(cururl.indexOf("report") >-1 ) 
  {
   document.getElementById("m2").setAttribute("aria-expanded", "true");
   document.getElementById("menu2").className="panel-collapse collapse in";    
   document.getElementById("menu_report").className="active";
   document.getElementById("menu_report").style.color = "#fff";
   document.getElementById("menu_report").style.backgroundColor = "#252525";
  }
  
  if(cururl.indexOf("ipnlogs") >-1 )
   {
   document.getElementById("m2").setAttribute("aria-expanded", "true");
   document.getElementById("menu2").className="panel-collapse collapse in";    
   document.getElementById("menu_ipn_logs").className="active";
   document.getElementById("menu_ipn_logs").style.color = "#fff";
   document.getElementById("menu_ipn_logs").style.backgroundColor = "#252525";
  }    

  if(cururl.indexOf("email-invoices") >-1 )
   {
   document.getElementById("m2").setAttribute("aria-expanded", "true");
   document.getElementById("menu2").className="panel-collapse collapse in";    
   document.getElementById("menu_email_invoices").className="active";
   document.getElementById("menu_email_invoices").style.color = "#fff";
   document.getElementById("menu_email_invoices").style.backgroundColor = "#252525";
  }
    
  // Payouts menu 
    if(cururl.indexOf("payouts-history") >-1)
  {
   document.getElementById("m3").setAttribute("aria-expanded", "true");
   document.getElementById("menu3").className="panel-collapse collapse in";    
   document.getElementById("menu_payouts_history").className="active";
   document.getElementById("menu_payouts_history").style.color = "#fff";
   document.getElementById("menu_payouts_history").style.backgroundColor = "#252525";
  }    

  // Payouts menu 
if(cururl.indexOf("payouts-transactions") >-1) {
   document.getElementById("m5").setAttribute("aria-expanded", "true");
   document.getElementById("menu5").className="panel-collapse collapse in";    
   document.getElementById("menu_payouts_transactions").className="active";
   document.getElementById("menu_payouts_transactions").style.color = "#fff";
   document.getElementById("menu_payouts_transactions").style.backgroundColor = "#252525";
  }

if(cururl.indexOf("payouts-dashboard") >-1) {
   document.getElementById("m5").setAttribute("aria-expanded", "true");
   document.getElementById("menu5").className="panel-collapse collapse in";    
   document.getElementById("menu_payouts_dashboard").className="active";
   document.getElementById("menu_payouts_dashboard").style.color = "#fff";
   document.getElementById("menu_payouts_dashboard").style.backgroundColor = "#252525";
  }

}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(menuChange);  */
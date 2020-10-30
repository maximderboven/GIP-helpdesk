using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class dashboard : System.Web.UI.Page
    {
        Business _business = new Business();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["loggedin"]) == true)
            {
                if (Session["role"].ToString() == "Gebruiker")
                {
                    div_admin.Visible = false;
                    div_gebruiker.Visible = true;

                    lblTicketsGebruiker.Text = (_business.count_tickets_gebruiker(Convert.ToInt16(Session["id"]))).ToString();
                }
                else
                {
                    //lbMeldingen.DataSource = _business.read_meldingen(Convert.ToInt16(Session["id"]));
                    //lbMeldingen.DataBind();
                    lblAantalAdmins.Text = _business.count_gebruikers_soort("Admin").ToString();
                    lblAantalgebruikers.Text = _business.count_gebruikers_soort("Gebruiker").ToString();
                    lblgebruikersonline.Text = Application["TotalOnlineUsers"].ToString();
                    lblGeslotenTickets.Text = _business.count_tickets_status("Gesloten").ToString();
                    lblonbekendTickets.Text = _business.count_tickets_status("Onbekend").ToString();
                    lblOpenTickets.Text = _business.count_tickets_status("Open").ToString();
                    lblTotaalTickets.Text = _business.count_tickets().ToString();
                    lbMeldingen.DataSource = _business.read_meldingen(Convert.ToInt16(Session["id"]));
                    lbMeldingen.DataBind();
                    lbMeldingen.Enabled = false;
                }
            }
            else
            {
                Response.Redirect("Account/loginForm.aspx");
            }
        }
    }
}
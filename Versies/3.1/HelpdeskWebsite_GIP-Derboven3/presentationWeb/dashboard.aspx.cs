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
                    double totaalticketten = _business.count_tickets();
                    double openticketten = _business.count_tickets_status("Open");
                    double onbekendeticketten = _business.count_tickets_status("Onbekend");
                    int totaalmin = 0;
                    double openpercentage = ((openticketten / totaalticketten) * 100);
                    double onbekendepercentage = ((onbekendeticketten / totaalticketten) * 100);
                    ArrayList takenlijst = new ArrayList();
                    if (openpercentage < 10 && onbekendepercentage < 10)
                    {
                        takenlijst.Add("Geen taken, alles lijkt goed te gaan.");
                    }
                    else
                    {
                    if (onbekendepercentage > 10)
                    {
                        totaalmin += 4;
                        takenlijst.Add("Reageer op meer ticketten!");
                        if (onbekendepercentage > 25)
                        {
                            totaalmin = 2;
                        }
                    }
                        if (openpercentage > 10)
                        {
                            if (openpercentage > 25)
                            {
                                totaalmin += 2;
                            }
                            else
                            {
                                totaalmin += 4;
                            }
                            takenlijst.Add("Open meer ticketten!");
                        }
                    }
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "updateProgress("+ Convert.ToString(10-totaalmin) + ")", true);
                    listTaken.DataSource = takenlijst;
                    listTaken.DataBind();
                    lblAantalAdmins.Text = _business.count_gebruikers_soort("Admin").ToString();
                    lblAantalgebruikers.Text = _business.count_gebruikers_soort("Gebruiker").ToString();
                    lblgebruikersonline.Text = Application["TotalOnlineUsers"].ToString();
                    lblGeslotenTickets.Text = _business.count_tickets_status("Gesloten").ToString();
                    lblonbekendTickets.Text = onbekendeticketten.ToString();
                    lblOpenTickets.Text = openticketten.ToString();
                    lblTotaalTickets.Text = totaalticketten.ToString();
                }
            }
            else
            {
                Response.Redirect("Account/loginForm.aspx");
            }
        }
    }
}
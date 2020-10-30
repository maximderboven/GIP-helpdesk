using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class registerForm : System.Web.UI.Page
    {
        Business _business = new Business();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistreer_Click(object sender, EventArgs e)
        {
            string errortext = "";
            if (txtgebruikersnaam.Text == "" || txtpassword.Text == "" || txtemail_user.Text == "" || txtpassword2.Text == "")
            {
                error.Visible = true;
                lblError.Text = "Gelieve alles in te vullen.";
            }
            else if (!txtemail_user.Text.Contains("@"))
            {
                error.Visible = true;
                lblError.Text = "Gelieve een geldig email te geven.";
            }
            else if (txtpassword.Text.Length < 5)
            {
                error.Visible = true;
                lblError.Text = "Passwoord moet minstens 5 tekens zijn.";
            }
            else if (txtpassword.Text == txtpassword2.Text)
            {
                errortext = _business.register(txtgebruikersnaam.Text, txtemail_user.Text, txtpassword.Text);
                if (errortext != "true")
                {
                    error.Visible = true;
                    lblError.Text = errortext;
                }
                else
                {
                    int id = _business.login(txtgebruikersnaam.Text, txtpassword.Text);
                    Session["loggedin"] = true;
                    Session["role"] = _business.SoortGebruiker(id);
                    Session["naam"] = txtgebruikersnaam.Text;
                    Session["id"] = id;
                    Response.Redirect("/dashboard.aspx");
                }
            }
            else
            {
                error.Visible = true;
                lblError.Text = "Passwoorden zijn niet hetzelfde.";
            }

        }
    }
}
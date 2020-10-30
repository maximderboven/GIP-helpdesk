using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class gebruiker_aanmaken : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        Business _business = new Business();
        protected void GebruikerToevoegen_Click(object sender, EventArgs e)
        {
            string errortext = "";
            if (txtgebruikersnaam.Text == "" || txtpasswoord1.Text == "" || txtEmail.Text == "" || txtpasswoord2.Text == "")
            {
                errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                errordiv.Visible = true;
                lblError.Text = "Gelieve alles in te vullen.";
            }
            else if (!txtEmail.Text.Contains("@"))
            {
                errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                errordiv.Visible = true;
                lblError.Text = "Gelieve een geldig email te geven.";
            }
            else if (txtpasswoord1.Text.Length < 5)
            {
                errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                errordiv.Visible = true;
                lblError.Text = "Passwoord moet minstens 5 tekens zijn.";
            }
            else if (txtpasswoord1.Text == txtpasswoord2.Text)
            {
                errortext = _business.register(txtgebruikersnaam.Text, txtEmail.Text, txtpasswoord1.Text);
                if (errortext != "true")
                {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                    errordiv.Visible = true;
                    lblError.Text = errortext;
                }
                else
                {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-danger", "alert-success"));
                    errordiv.Visible = true;
                    lblError.Text = txtgebruikersnaam.Text + " successvol aangemaakt.";
                }
            }
            else
            {
                errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                errordiv.Visible = true;
                lblError.Text = "Passwoorden zijn niet hetzelfde.";
            }
        }
    }
}
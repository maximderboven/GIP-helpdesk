using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class profiel : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindProfiel()
        {
            // Geen postback want bij button press ook refresh
            txtregisterdate.Text = Convert.ToString(_business.read_gebruiker_id(Convert.ToInt16(Session["id"].ToString())).Dtmgeregistreerd);
            txtgebruikersnaam.Text = _business.read_gebruiker_id(Convert.ToInt16(Session["id"].ToString())).Naam;
            txtemail.Text = _business.read_gebruiker_id(Convert.ToInt16(Session["id"].ToString())).Email;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]))
                {
                    this.DataBindProfiel();
                }
                else
                {
                    Response.Redirect("Account/loginForm.aspx");
                }
            }

        }
        protected void opslaan_Click(object sender, EventArgs e)
        {
            if (txtgebruikersnaam.Text == _business.read_gebruiker_id(Convert.ToInt16(Session["id"].ToString())).Naam || _business.AvailableNaam(txtgebruikersnaam.Text))
            {
                if (txtemail.Text == _business.read_gebruiker_id(Convert.ToInt16(Session["id"].ToString())).Email || _business.AvailableEmail(txtemail.Text))
                {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-danger", "alert-success"));
                    errordiv.Visible = true;
                    _business.update_profiel(txtgebruikersnaam.Text, txtemail.Text, Convert.ToInt16(Session["id"].ToString()));
                    lblError.Text = "Je profiel is succesvol gewijzigd.";
                    this.DataBindProfiel();
                    Session["naam"] = txtgebruikersnaam.Text;
                }
                else
                {
                    errordiv.Visible = true;
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                    lblError.Text = "Email is al bezet.";
                }
            }
            else
            {
                errordiv.Visible = true;
                errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                lblError.Text = "Naam is al bezet.";
            }

        }
    }
}
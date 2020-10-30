using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class ticket_aanmaken : System.Web.UI.Page
    {
        Business _business = new Business();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true && Session["role"].ToString() == "Gebruiker")
                {
                ddlNewCategorie.DataTextField = "categorie";
                ddlNewCategorie.DataValueField = "Id";
                ddlNewCategorie.DataSource = _business.categorieen();
                ddlNewCategorie.DataBind();
                }
                else
                {
                    Response.Redirect("Account/loginForm.aspx");
                }
            }
        }

        protected void btnVerzenden_Click(object sender, EventArgs e)
        {
            if (_business.count_tickets_status_gebruiker("Open", Convert.ToInt16(Session["id"])) + _business.count_tickets_status_gebruiker("Onbekend", Convert.ToInt16(Session["id"])) >= 1)
            {
                lblError.Text = "Er kan maar 1 ticket tegelijk actief zijn, wacht op een antwoord.";
                error.Visible = true;
            }
            else
            {
                if (txtNewOnderwerp.Text == "" || txtNewBericht.Text == "")
                {
                    lblError.Text = "Gelieve alles in te vullen.";
                    error.Visible = true;
                }
                else
                {
                    _business.insert_antwoorden(Convert.ToInt16(Session["id"]), txtNewBericht.Text, _business.insert_ticket(Convert.ToInt16(Session["id"]), Convert.ToInt16(ddlNewCategorie.SelectedValue), txtNewOnderwerp.Text));
                    txtNewOnderwerp.Text = "";
                    txtNewBericht.Text = "";
                    Response.Redirect("ticket-beheer.aspx");
                }
            }
        }

    }
}
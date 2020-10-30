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
                ddlNewCategorie.DataTextField = "categorie";
                ddlNewCategorie.DataValueField = "Id";
                ddlNewCategorie.DataSource = _business.categorieen();
                ddlNewCategorie.DataBind();
            }
        }

        protected void btnVerzenden_Click(object sender, EventArgs e)
        {
            _business.insert_antwoorden(Convert.ToInt16(Session["id"]), txtNewBericht.Text, _business.insert_ticket(Convert.ToInt16(Session["id"]), Convert.ToInt16(ddlNewCategorie.SelectedValue), txtNewOnderwerp.Text));
            txtNewOnderwerp.Text = "";
            txtNewBericht.Text = "";
            Response.Redirect("ticket-beheer.aspx");
        }

    }
}
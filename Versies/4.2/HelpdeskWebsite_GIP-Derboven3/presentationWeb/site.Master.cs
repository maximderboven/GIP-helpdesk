using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class site : System.Web.UI.MasterPage
    {
        Business _business = new Business();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true)
                {
                    lblsessionID.Text = HttpContext.Current.Session.SessionID.ToString();
                    lblNameEmail.Text = Session["naam"].ToString();
                    int aantalmeldingen = _business.count_meldingen_gebruiker(Convert.ToInt32(Session["id"]));
                    if (aantalmeldingen == 0)
                    {
                        lblMeldingen.Visible = false;
                        lblAantalMeldingen2.Text = 0.ToString();
                    }
                    else
                    {
                        lblAantalMeldingen.Text = aantalmeldingen.ToString();
                        //lblAantalMeldingen2.Text = aantalmeldingen.ToString();
                        int gebruikerID = Convert.ToInt16(Session["id"].ToString());
                        dlMeldingen.DataSource = _business.read_meldingen_gebruiker(gebruikerID);
                        dlMeldingen.DataBind();
                    }
                    if (Session["role"].ToString() != "Gebruiker")
                    {
                        menuAdmin.Visible = true;
                    }
                }
                else
                {
                    Response.Redirect("Account/loginForm.aspx");
                }
            }
        }

        protected void loggout_click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/Account/loginForm.aspx");
        }

        protected void Click_meldingen(object sender, EventArgs e)
        {
            foreach (DataListItem x in dlMeldingen.Items)
            {
                int pMeldingID = Convert.ToInt16(dlMeldingen.DataKeys[x.ItemIndex].ToString());
                _business.set_gelezen(pMeldingID);
            }
            lblMeldingen.Visible = false;
            //lblAantalMeldingen2.Text = 0.ToString();
            int gebruikerID = Convert.ToInt16(Session["id"].ToString());
            dlMeldingen.DataSource = _business.read_meldingen_gebruiker(gebruikerID);
            dlMeldingen.DataBind();
        }

    }
}
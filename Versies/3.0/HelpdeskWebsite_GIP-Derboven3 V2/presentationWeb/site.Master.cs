using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace presentationWeb
{
    public partial class site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true)
                {
                    lblsessionID.Text = HttpContext.Current.Session.SessionID.ToString();
                    lblNameEmail.Text = Session["naam"].ToString();
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
    }
}
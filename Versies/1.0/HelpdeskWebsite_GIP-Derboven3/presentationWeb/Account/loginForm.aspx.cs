using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class loginForm : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true)
                {
                    Response.Redirect("/index.aspx");
                }
            }
        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            int id = _business.login(txtNaam.Text, txtPassword.Text);
            if ( id == 0 )
            {
                lblFout.Visible = true;
            }
            else
            {
                    Session["loggedin"] = true;
                    Session["role"] = _business.SoortGebruiker(id);
                    Session["naam"] = txtNaam.Text;
                    Session["id"] = id;
                    Response.Redirect("/index.aspx");
            }
        }
    }
}
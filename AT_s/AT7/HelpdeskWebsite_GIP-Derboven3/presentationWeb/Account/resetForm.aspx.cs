using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb.Account
{
    public partial class resetForm : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            if (Convert.ToBoolean(Session["loggedin"]) == true)
            {

            }
            else
            {
                Response.Redirect("loginForm.aspx");
            }
            }
        }

        protected void PasswordChange_Click(object sender, EventArgs e)
        {
            string error = "";
            if (txtPassword2.Text == txtPassword.Text)
            {
                error = _business.ResetPassword(Convert.ToInt16(Session["id"]), txtOudPassword.Text, txtPassword2.Text);
            }
            else
            {
                error = "Passwoorden komen niet overeen.";
            }
            lblError.Text = error;
        }
    }
}
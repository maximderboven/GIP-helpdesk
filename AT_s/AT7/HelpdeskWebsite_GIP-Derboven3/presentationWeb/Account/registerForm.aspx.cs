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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string error = "";
            if (txtPassword2.Text == txtPassword.Text)
            {
                error = _business.register(txtNaam.Text, txtemail.Text, txtPassword.Text);
            }
            else
            {
                error = "Passwoorden zijn niet hetzelfde.";
            }

            if (error == "true")
            {

                int id = _business.login(txtNaam.Text, txtPassword.Text);
                    Session["loggedin"] = true;
                    Session["role"] = _business.SoortGebruiker(id);
                    Session["naam"] = txtNaam.Text;
                    Session["id"] = id;
                    Response.Redirect("/index.aspx");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtemail.Text = "";
            txtNaam.Text = "";
            txtPassword.Text = "";
            txtPassword2.Text = "";
        }
    }
}
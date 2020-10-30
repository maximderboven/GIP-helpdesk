using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb.Account
{
    public partial class resetForm1 : System.Web.UI.Page
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
                    Response.Redirect("Account/loginForm.aspx");
                }
            }
        }

        protected void PasswordChange_Click(object sender, EventArgs e)
        {
            string error = "";
            if (txtPassword1.Text != "" && txtPassword2.Text != "" && txtPasswordoud.Text != "")
            {
                if (txtPassword2.Text == txtPassword1.Text)
                {
                    error = _business.ResetPassword(Convert.ToInt16(Session["id"]), txtPasswordoud.Text, txtPassword2.Text);
                }
                else
                {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                    errordiv.Visible = true;
                    error = "Passwoorden komen niet overeen.";
                }
                if (error== "Je paswoord is sucessvol gewijzigd.")
                {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-danger", "alert-success"));
                    errordiv.Visible = true;
                    lblError.Text = error;
                }
                else
	            {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                    errordiv.Visible = true;
                    lblError.Text = error;

                }

            }
            else
            {
                errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-success", "alert-danger"));
                error = "Vul alles in.";
                errordiv.Visible = true;
                lblError.Text = error;
            }

        }
    }

}
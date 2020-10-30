using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
using System.Data;

namespace presentationWeb
{
    public partial class gebruiker_beheer : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindGebruikers()
        {
            if (Session["role"].ToString() == "Admin")
            {
            gvGebruikers.DataSource = _business.read_gebruikers();
            gvGebruikers.DataBind();
            }
            else
            {
                gvGebruikers.DataSource = _business.read_gebruikers_admins();
                gvGebruikers.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]))
                {
                    this.DataBindGebruikers();
                }
                else
                {
                    Response.Redirect("Account/loginForm.aspx");
                }
            }
            else
            {

            }
        }

        //=======================================================================================//

        protected void gvGebruikers_DataBound(object sender, EventArgs e)
        {
        }

        protected void gvGebruikers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow gvr = gvGebruikers.Rows[e.NewEditIndex];
            Label lb = (Label)gvr.FindControl("lblGroep");

            gvGebruikers.EditIndex = e.NewEditIndex;
            this.DataBindGebruikers();

            GridViewRow gvr2 = gvGebruikers.Rows[gvGebruikers.EditIndex];
            DropDownList dr = (DropDownList)gvr2.FindControl("ddlEditGroep");
            dr.SelectedIndex = dr.Items.IndexOf(dr.Items.FindByText(lb.Text));
            dr.Items.Remove(dr.Items.FindByText("Super User"));
            if (Session["role"].ToString() == "Admin")
            {
                dr.Enabled = false;
            }
        }

        protected void gvGebruikers_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // reference the Delete LinkButton
                LinkButton db = (LinkButton)e.Row.FindControl("DeleteButton");
                Label naam = e.Row.FindControl("lblnaam") as Label;
                int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[e.Row.RowIndex].Value.ToString());
                db.OnClientClick = "return confirm('Ben je zeker dat je " + naam.Text + " wilt verwijderen ? \\n Deze gebruiker heeft " + _business.count_tickets_gebruiker(gebruikerID) + " tickets.\\n Alle tickets en antwoorden worden mee verwijderd.');";
            }
        }

        protected void gvGebruikers_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvGebruikers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvGebruikers.EditIndex = -1;
            this.DataBindGebruikers();
        }

        protected void gvGebruikers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            errordiv.Visible = true;
            errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-danger", "alert-success"));
            lblError.Text = "Successvol verwijderd.";
            int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[e.RowIndex].Value.ToString());
            _business.delete_gebruiker(gebruikerID);
            this.DataBindGebruikers();
        }

        public IQueryable ddlEditGroepen_Data()
        {
            return _business.read_groepen().AsQueryable();
        }

        protected void gvGebruikers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[e.RowIndex].Value.ToString());
            TextBox naam = gvGebruikers.Rows[e.RowIndex].FindControl("txtEditNaam") as TextBox;
            TextBox email = gvGebruikers.Rows[e.RowIndex].FindControl("txtEditEmail") as TextBox;
            Label Oudnaam = gvGebruikers.Rows[e.RowIndex].FindControl("lblnaam") as Label;
            Label Oudemail = gvGebruikers.Rows[e.RowIndex].FindControl("lblEditEmail") as Label;
            DropDownList groep = gvGebruikers.Rows[e.RowIndex].FindControl("ddlEditGroep") as DropDownList;
            CheckBox actief = gvGebruikers.Rows[e.RowIndex].FindControl("cbEditActief") as CheckBox;

            if (naam.Text == Oudnaam.Text || _business.AvailableNaam(naam.Text))
            {
                if (email.Text == Oudemail.Text || _business.AvailableEmail(email.Text))
                {
                    updateGebruiker(naam, email, groep, actief, gebruikerID);
                    _business.insert_melding(gebruikerID, "Een admin heeft je profiel aangepast.","profiel.aspx");
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

        protected void updateGebruiker(TextBox naam, TextBox email, DropDownList groep, CheckBox actief, int gebruikerID)
        {
            errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-danger", "alert-success"));
            errordiv.Visible = true;
            _business.update_gebruikers(naam.Text, email.Text, Convert.ToInt32(groep.SelectedValue), Convert.ToBoolean(actief.Checked), gebruikerID);
            lblError.Text = naam.Text + " is succesvol gewijzigd.";
            gvGebruikers.EditIndex = -1;
            this.DataBindGebruikers();
        }

        protected void gvGebruikers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ResetPasswoord")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvGebruikers.Rows[index];

                int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[row.RowIndex].Value.ToString());
                if (_business.StandaardPasswoord(gebruikerID))
                {
                    errordiv.Attributes.Add("class", errordiv.Attributes["class"].ToString().Replace("alert-danger", "alert-success"));
                    errordiv.Visible = true;
                    lblError.Text = "Passwoord is gereset.";
                    _business.insert_melding(gebruikerID, "Een admin heeft je passwoord herstelt.", "reset-passwoord.aspx");
                }
            }
        }
    }
}
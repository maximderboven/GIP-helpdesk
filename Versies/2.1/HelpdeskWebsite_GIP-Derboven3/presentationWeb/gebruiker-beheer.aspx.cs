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
            gvGebruikers.DataSource = _business.read_gebruikers();
            gvGebruikers.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.DataBindGebruikers();
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
        }

        protected void gvGebruikers_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
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
            int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[e.RowIndex].Value.ToString());
            //_business.delete_gebruiker(gebruikerID);
            this.DataBindGebruikers();
        }

        public IQueryable ddlEditGroepen_Data()
        {
            return _business.groepen().AsQueryable();
        }

        protected void gvGebruikers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[e.RowIndex].Value.ToString());
            TextBox naam = gvGebruikers.Rows[e.RowIndex].FindControl("txtEditNaam") as TextBox;
            TextBox email = gvGebruikers.Rows[e.RowIndex].FindControl("txtEditEmail") as TextBox;
            DropDownList groep = gvGebruikers.Rows[e.RowIndex].FindControl("ddlEditGroep") as DropDownList;
            CheckBox actief = gvGebruikers.Rows[e.RowIndex].FindControl("cbEditActief") as CheckBox;
            //if (_business.AvailableNaam(naam.Text)) && email controle ajb
            //{
                errordiv.Style.Add(HtmlTextWriterStyle.BorderColor, System.Drawing.ColorTranslator.ToHtml(System.Drawing.Color.ForestGreen));
                errordiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, System.Drawing.ColorTranslator.ToHtml(System.Drawing.Color.DarkSeaGreen));
                errordiv.Style.Add(HtmlTextWriterStyle.Color, System.Drawing.ColorTranslator.ToHtml(System.Drawing.Color.DarkGreen));
                errordiv.Visible = true;
                _business.update_gebruikers(naam.Text, email.Text, Convert.ToInt32(groep.SelectedValue), Convert.ToBoolean(actief.Checked), gebruikerID);
                lblError.Text = naam.Text + " is succesvol gewijzigd.";
                gvGebruikers.EditIndex = -1;
                this.DataBindGebruikers();
            /*}
            else
            {
                errordiv.Visible = true;
                lblError.Text = "Naam is al bezet.";
            }*/
        }

        protected void gvGebruikers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ResetPasswoord")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = gvGebruikers.Rows[index];

                int gebruikerID = Convert.ToInt32(gvGebruikers.DataKeys[row.RowIndex].Value.ToString());
                if (_business.StandaardPasswoord(gebruikerID))
                {
                    errordiv.Style.Add(HtmlTextWriterStyle.BorderColor, System.Drawing.ColorTranslator.ToHtml(System.Drawing.Color.ForestGreen));
                    errordiv.Style.Add(HtmlTextWriterStyle.BackgroundColor, System.Drawing.ColorTranslator.ToHtml(System.Drawing.Color.DarkSeaGreen));
                    errordiv.Style.Add(HtmlTextWriterStyle.Color, System.Drawing.ColorTranslator.ToHtml(System.Drawing.Color.DarkGreen));
                    errordiv.Visible = true;
                    lblError.Text = "Passwoord is gereset.";
                }
            }
        }
    }
}
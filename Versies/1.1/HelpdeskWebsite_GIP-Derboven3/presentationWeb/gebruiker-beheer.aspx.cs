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
            _business.update_gebruikers(naam.Text, email.Text, Convert.ToInt32(groep.SelectedValue), Convert.ToBoolean(actief.Checked), gebruikerID);
            gvGebruikers.EditIndex = -1;
            this.DataBindGebruikers();
        }
    }
}
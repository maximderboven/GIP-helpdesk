using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class index : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void gridviewViewsAntwoorden()
        {
            for (int i = 0; i < gvAntwoorden.Rows.Count; i++)
            {
                if (Session["role"].ToString() == "Gebruiker")
                {
                    LinkButton btnEdit = (LinkButton)gvAntwoorden.Rows[i].FindControl("btnEdit");
                    LinkButton btnDelete = (LinkButton)gvAntwoorden.Rows[i].FindControl("btnDelete");
                    Label lblGebruiker = (Label)gvAntwoorden.Rows[i].FindControl("lblGebruiker");
                    if (lblGebruiker.Text != Session["naam"].ToString())
                    {
                        btnDelete.Visible = false;
                        btnEdit.Visible = false;
                    }
                }
            }
        }

        protected void gridviewViewsTickets()
        {
            for (int i = 0; i < gvTickets.Rows.Count; i++)
            {
                Label lblstatus = (Label)gvTickets.Rows[i].FindControl("lblStatus");
                if (Session["role"].ToString() == "Gebruiker" && lblstatus.Text == "afgerond")
                {
                    LinkButton btnEdit = (LinkButton)gvTickets.Rows[i].FindControl("btnEdit");
                    LinkButton btnDelete = (LinkButton)gvTickets.Rows[i].FindControl("btnDelete");
                    btnDelete.Visible = false;
                    btnEdit.Visible = false;
                }
            }
        }

        protected void DataBindTickets()
        {
            if (Session["role"].ToString() == "Admin")
            {
                gvTickets.DataSource = _business.read_tickets();
                gvTickets.Columns[1].Visible = true;
            }
            else if (Session["role"].ToString() == "Gebruiker")
            {
                gvTickets.DataSource = _business.read_tickets_gebruiker(Convert.ToInt32(Session["id"]));
            }
            gvTickets.DataBind();
            this.gridviewViewsTickets();
        }

        protected void DataBindGebruikers()
        {
            gvGebruikers.DataSource = _business.read_gebruikers();
            gvGebruikers.DataBind();
        }

        protected void DataBindAntwoorden(int id)
        {
            gvAntwoorden.DataSource = null;
            gvAntwoorden.DataSource = _business.read_antwoorden_ticket(id);
            gvAntwoorden.DataBind();
            gridviewViewsAntwoorden();
        }

        protected void Page_Load(object sender, EventArgs e)

        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true)
                {
                    naamenid.Text = Session["naam"].ToString();
                    ddlNewCategorie.DataTextField = "categorie";
                    ddlNewCategorie.DataValueField = "Id";
                    ddlNewCategorie.DataSource = _business.categorieen();
                    ddlNewCategorie.DataBind();
                    PanelAntwoorden.Visible = false;
                    this.DataBindTickets();
                    if (Session["role"].ToString() == "Admin")
                    {
                        gvGebruikers.Visible = true;
                        this.DataBindGebruikers();
                    }
                }
                else
                {
                    Server.Transfer("Account/loginForm.aspx");
                }
            }
        }

        protected void btnNewTicket_Click1(object sender, EventArgs e)
        {
            _business.insert_antwoorden(Convert.ToInt16(Session["id"]), txtNewVraag.Text, _business.insert_ticket(Convert.ToInt16(Session["id"]), Convert.ToInt16(ddlNewCategorie.SelectedValue), txtNewOnderwerp.Text));
            this.DataBindTickets();
            txtNewOnderwerp.Text = "";
            txtNewVraag.Text = "";
        }

        protected void gvTickets_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTickets.EditIndex = e.NewEditIndex;
            this.DataBindTickets();
        }

        public IQueryable ddlEditCategorie_Data()
        {
            return _business.categorieen().AsQueryable();
        }

        public IQueryable ddlEditStatus_Data()
        {
            return _business.statussen().AsQueryable();
        }

        protected void gvTickets_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {  
            if (e.Row.RowType == DataControlRowType.DataRow && gvTickets.EditIndex == e.Row.RowIndex)
            {
                if (Session["role"].ToString() == "Gebruiker")
                {
                    DropDownList ddlEditStatus = (e.Row.FindControl("ddlEditStatus") as DropDownList);
                    ddlEditStatus.Enabled = false;
                }
            }
        }

        protected void gvTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvTickets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTickets.EditIndex = -1;
            this.DataBindTickets();
        }

        protected void gvTickets_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Ticketid = Convert.ToInt32(gvTickets.DataKeys[e.RowIndex].Values[0]);
            _business.delete_ticket(Ticketid);
            this.DataBindTickets();
            gvAntwoorden.Visible = false;
            PanelAntwoorden.Visible = false;
        }

        protected void gvTickets_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ticketID = Convert.ToInt32(gvTickets.DataKeys[e.RowIndex].Value.ToString());
            TextBox onderwerp = gvTickets.Rows[e.RowIndex].FindControl("txtEditOnderwerp") as TextBox;
            DropDownList categorie = gvTickets.Rows[e.RowIndex].FindControl("ddlEditCategorie") as DropDownList;
            DropDownList status = gvTickets.Rows[e.RowIndex].FindControl("ddlEditStatus") as DropDownList;

            _business.update_ticket(ticketID, Convert.ToInt16(categorie.SelectedValue), Convert.ToInt16(status.SelectedValue), onderwerp.Text);
            gvTickets.EditIndex = -1;
            this.DataBindTickets();
        }


        //=======================================================================================


        protected void gvAntwoorden_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = gvTickets.SelectedRow;
            int id = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Value.ToString());
            gvAntwoorden.EditIndex = e.NewEditIndex;
            this.DataBindAntwoorden(id);
        }

        protected void gvAntwoorden_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
        }

        protected void gvAntwoorden_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void gvAntwoorden_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewRow row = gvTickets.SelectedRow;
            int id = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Value.ToString());
            gvAntwoorden.EditIndex = -1;
            this.DataBindAntwoorden(id);
        }

        protected void gvAntwoorden_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int antwoordID = Convert.ToInt32(gvAntwoorden.DataKeys[e.RowIndex].Values[0]);
            _business.delete_antwoorden(antwoordID);
            GridViewRow row = gvTickets.SelectedRow;
            int id = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Value.ToString());
            this.DataBindAntwoorden(id);
        }

        protected void gvAntwoorden_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int antwoordID = Convert.ToInt32(gvAntwoorden.DataKeys[e.RowIndex].Value.ToString());
            TextBox omschrijving = gvAntwoorden.Rows[e.RowIndex].FindControl("txtEditVraag") as TextBox;
            _business.update_antwoord(antwoordID, omschrijving.Text);
            gvAntwoorden.EditIndex = -1;
            GridViewRow row = gvTickets.SelectedRow;
            int id = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Value.ToString());
            this.DataBindAntwoorden(id);
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Account/loginForm.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("Account/resetForm.aspx");
        }

        protected void BtnVerzendenAntwoord_Click(object sender, EventArgs e)
        {

            GridViewRow row = gvTickets.SelectedRow;
            int id = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Value.ToString());
            _business.insert_antwoorden(Convert.ToInt16(Session["id"]), txtAntwoord.Text, id);
            this.DataBindAntwoorden(id);
        }

        //=======================================================================================


        protected void gvGebruikers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvGebruikers.EditIndex = e.NewEditIndex;
            this.DataBindGebruikers();
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
            _business.delete_gebruiker(gebruikerID);
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
            _business.update_gebruikers(naam.Text,email.Text,Convert.ToInt32(groep.SelectedValue),Convert.ToBoolean(actief.Checked),gebruikerID);
            gvGebruikers.EditIndex = -1;
            this.DataBindGebruikers();
        }

    }
}
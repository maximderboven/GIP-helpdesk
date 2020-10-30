using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class ticket_admin : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindTicketsOpen()
        {
            gvTickets.DataSource = _business.read_tickets();
            gvTickets.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true && Session["role"].ToString() != "Gebruiker")
                {
                    this.DataBindTicketsOpen();
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

        protected void gvTickets_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow gvr = gvTickets.Rows[e.NewEditIndex];
            Label lb = (Label)gvr.FindControl("lblCategorie");

            gvTickets.EditIndex = e.NewEditIndex;
            this.DataBindTicketsOpen();

            GridViewRow gvr2 = gvTickets.Rows[gvTickets.EditIndex];
            DropDownList dr = (DropDownList)gvr2.FindControl("ddlEditCategorie");
            dr.SelectedIndex = dr.Items.IndexOf(dr.Items.FindByText(lb.Text));
        }

        public IQueryable ddlEditCategorie_Data()
        {
            return _business.categorieen().AsQueryable();
        }

        protected void gvTickets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTickets.EditIndex = -1;
            this.DataBindTicketsOpen();
        }

        protected void gvTickets_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Ticketid = Convert.ToInt32(gvTickets.DataKeys[e.RowIndex].Values[0]);
            _business.delete_ticket(Ticketid);
            this.DataBindTicketsOpen();
        }

        protected void gvTickets_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ticketID = Convert.ToInt32(gvTickets.DataKeys[e.RowIndex].Value.ToString());
            TextBox onderwerp = gvTickets.Rows[e.RowIndex].FindControl("txtEditOnderwerp") as TextBox;
            DropDownList categorie = gvTickets.Rows[e.RowIndex].FindControl("ddlEditCategorie") as DropDownList;
            Label naam = gvTickets.Rows[e.RowIndex].FindControl("lblEditgebruiker") as Label;

            _business.update_ticket_status(ticketID, Convert.ToInt16(categorie.SelectedValue), onderwerp.Text);
            _business.insert_melding(_business.read_gebruikerID_naam(naam.Text), "Een admin heeft je ticket aangepast.");

            gvTickets.EditIndex = -1;
            this.DataBindTicketsOpen();
        }

        protected void gvTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '$' });
                string pID = _business.Encrypt_QueryString(commandArgs[0]);
                string onderwerp = _business.Encrypt_QueryString(commandArgs[2]);
                string status = _business.Encrypt_QueryString(commandArgs[1]);
                Response.Redirect("ticket-details.aspx?id=" + pID + "&o=" + onderwerp + "&s=" + status);
            }
            if (e.CommandName == "Accept")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '$' });
                string pID = commandArgs[0];
                string onderwerp = _business.Encrypt_QueryString(commandArgs[2]);
                string status = _business.Encrypt_QueryString(commandArgs[1]);
                _business.set_admin(Convert.ToInt32(pID), Convert.ToInt32(Session["id"]));
                Response.Redirect("ticket-details.aspx?id=" + _business.Encrypt_QueryString(pID) + "&o=" + onderwerp + "&s=" + status);
            }
        }
    }
}
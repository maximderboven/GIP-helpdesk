using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class ticket_beheer : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindTickets()
        {
            if (Session["role"].ToString() == "gebruiker")
            {
                gvTickets.DataSource = _business.read_tickets_gebruiker(Convert.ToInt32(Session["id"]));
                gvTickets.Columns[3].Visible = false;
                gvTickets.Columns[2].Visible = false;
            }
            else
            {
                gvTickets.DataSource = _business.read_tickets();
            }
            gvTickets.DataBind();
            this.gridviewViewsTickets();
        }

        protected void gridviewViewsTickets()
        {
            for (int i = 0; i < gvTickets.Rows.Count; i++)
            {
                if (gvTickets.Rows[i].RowState != DataControlRowState.Edit)
                {
                Label lblstatus = (Label)gvTickets.Rows[i].FindControl("lblStatus");
                if (Session["role"].ToString() == "gebruiker" && lblstatus.Text != "Onbekend")
                {
                    LinkButton btnEdit = (LinkButton)gvTickets.Rows[i].FindControl("btnEdit");
                    LinkButton btnDelete = (LinkButton)gvTickets.Rows[i].FindControl("btnDelete");
                    btnDelete.Visible = false;
                    btnEdit.Visible = false;
                }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["loggedin"]) == true)
                {
                    this.DataBindTickets();
                }
                else
                {
                    Server.Transfer("Account/loginForm.aspx");
                }
            }
            else
            {

            }
        }

        //=======================================================================================//

        protected void gvTickets_DataBound(object sender, EventArgs e)
        {
        }

        protected void gvTickets_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow gvr = gvTickets.Rows[e.NewEditIndex];
            Label lb = (Label)gvr.FindControl("lblCategorie");
            Label lb2 = (Label)gvr.FindControl("lblStatus");

            gvTickets.EditIndex = e.NewEditIndex;
            this.DataBindTickets();

            GridViewRow gvr2 = gvTickets.Rows[gvTickets.EditIndex];
            DropDownList dr = (DropDownList)gvr2.FindControl("ddlEditCategorie");
            dr.SelectedIndex = dr.Items.IndexOf(dr.Items.FindByText(lb.Text));
            DropDownList dr2 = (DropDownList)gvr2.FindControl("ddlEditStatus");
            dr2.SelectedIndex = dr2.Items.IndexOf(dr2.Items.FindByText(lb2.Text));

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
                if (Session["role"].ToString() == "gebruiker")
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

        protected void gvTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '$' });
                string pID = commandArgs[0];
                string onderwerp = commandArgs[2];
                string status = commandArgs[1];

                //Server.UrlEncode()
                Response.Redirect("ticket-details.aspx?id=" + pID + "&o=" + onderwerp + "&s=" + status);
            }
        }
    }
}
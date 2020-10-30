using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
// URL ENCRYPTIE:
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace presentationWeb
{
    public partial class ticket_beheer : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindTickets()
        {
            if (Session["role"].ToString() == "Gebruiker")
            {
                gvTickets.DataSource = _business.read_tickets_gebruiker(Convert.ToInt32(Session["id"]));
                gvTickets.Columns[3].Visible = false;
                gvTickets.Columns[2].Visible = false;
                filter.Visible = false;
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
                if (gvTickets.Rows[i].RowState != DataControlRowState.Edit && gvTickets.Rows[i].RowState == DataControlRowState.Alternate || gvTickets.Rows[i].RowState == DataControlRowState.Normal)
                {
                    Label lblstatus = (Label)gvTickets.Rows[i].FindControl("lblStatus");
                    if (Session["role"].ToString() == "Gebruiker" && lblstatus.Text!="Onbekend")
                    {
                        LinkButton btnEdit = (LinkButton)gvTickets.Rows[i].FindControl("btnEdit");
                        LinkButton btnDelete = (LinkButton)gvTickets.Rows[i].FindControl("btnDelete");
                        btnDelete.Visible = false;
                        btnEdit.Visible = false;
                    }

                    switch (lblstatus.Text)
                    {
                        case "Open":
                            lblstatus.Attributes.Add("class", lblstatus.Attributes["class"].ToString().Replace("label-danger", "label-success"));
                            break;
                        case "Onbekend":
                            lblstatus.Attributes.Add("class", lblstatus.Attributes["class"].ToString().Replace("label-danger", "label-warning"));
                            break;
                        default:
                            lblstatus.Attributes.Add("class", lblstatus.Attributes["class"].ToString().Replace("label-danger", "label-danger"));
                            break;
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

                    ddlCategorieFilter.DataTextField = "categorie";
                    ddlCategorieFilter.DataValueField = "categorie";
                    ddlCategorieFilter.DataSource = _business.categorieen();
                    ddlCategorieFilter.DataBind();
                    ddlCategorieFilter.Items.Insert(0, "");

                    ddlStatusFilter.DataTextField = "status";
                    ddlStatusFilter.DataValueField = "status";
                    ddlStatusFilter.DataSource = _business.statussen();
                    ddlStatusFilter.DataBind();
                    ddlStatusFilter.Items.Insert(0, "");
                }
                else
                {
                    //Server.Transfer
                    Response.Redirect("Account/loginForm.aspx");
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
            Label lblStatus = (Label)gvr2.FindControl("lblEditStatus");

            switch (dr2.SelectedItem.Text)
            {
                case "Open":
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-danger", "label-success"));
                    lblStatus.Attributes.Add("class", lblStatus.Attributes["class"].ToString().Replace("label-danger", "label-success"));
                    break;
                case "Onbekend":
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-danger", "label-warning"));
                    lblStatus.Attributes.Add("class", lblStatus.Attributes["class"].ToString().Replace("label-danger", "label-warning"));
                    break;
                default:
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-danger", "label-danger"));
                    lblStatus.Attributes.Add("class", lblStatus.Attributes["class"].ToString().Replace("label-danger", "label-danger"));
                    break;
            }

            if (Session["role"].ToString() == "Gebruiker")
            {
                dr2.Visible = false;
                lblStatus.Visible = true;
            }

        }

        protected void ddlEditStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvr2 = gvTickets.Rows[gvTickets.EditIndex];
            DropDownList dr2 = (DropDownList)gvr2.FindControl("ddlEditStatus");

            switch (dr2.SelectedItem.Text)
            {
                case "Open":
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-danger", "label-success"));
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-warning", "label-success"));
                    break;
                case "Onbekend":
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-danger", "label-warning"));
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-success", "label-warning"));
                    break;
                default:
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-success", "label-danger"));
                    dr2.Attributes.Add("class", dr2.Attributes["class"].ToString().Replace("label-warning", "label-danger"));
                    break;
            }
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

            if (e.Row.RowState == DataControlRowState.Edit && e.Row.RowState == DataControlRowState.Alternate || e.Row.RowState == DataControlRowState.Normal)
            {

            }
            if (e.Row.RowType == DataControlRowType.DataRow && gvTickets.EditIndex == e.Row.RowIndex)
            {

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
            Label statusOud = gvTickets.Rows[e.RowIndex].FindControl("lblEditStatus") as Label;
            if (statusOud.Text != "Gesloten" && status.SelectedItem.Text == "Gesloten")
            {
                _business.setDatumGesloten(ticketID);
            }
            _business.update_ticket(ticketID, Convert.ToInt16(categorie.SelectedValue), Convert.ToInt16(status.SelectedValue), onderwerp.Text);
            gvTickets.EditIndex = -1;
            this.DataBindTickets();
        }

        protected void gvTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '$' });
                string pID = Encrypt_QueryString(commandArgs[0]);
                string onderwerp = Encrypt_QueryString(commandArgs[2]);
                string status = Encrypt_QueryString(commandArgs[1]);

                //Server.UrlEncode()
                Response.Redirect("ticket-details.aspx?id=" + pID + "&o=" + onderwerp + "&s=" + status);
            }
        }

        public static string Encrypt_QueryString(string str)
        {
            string EncrptKey = "Kaso;2640!)";
            byte[] byKey = { };
            byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
            byKey = System.Text.Encoding.UTF8.GetBytes(EncrptKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(str);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
    }
}
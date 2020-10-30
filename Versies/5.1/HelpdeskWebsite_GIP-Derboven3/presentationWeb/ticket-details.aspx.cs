using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;

namespace presentationWeb
{
    public partial class ticket_details : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindAntwoorden()
        {
            int ticketID = Convert.ToInt16(_business.Decrypt_QueryString(Request.QueryString["id"].ToString()));
            dlAntwoorden.DataSource = _business.read_antwoorden_ticket(ticketID);
            dlAntwoorden.DataBind();
            this.DataViewAntwoorden();
        }

        protected void DataViewAntwoorden()
        {
            for (int i = 0; i < dlAntwoorden.Items.Count; i++)
            {
                if (dlAntwoorden.Items[i].ItemType != ListItemType.EditItem)
                {
                if (Session["role"].ToString() == "Gebruiker")
                {
                    LinkButton btnEdit = (LinkButton)dlAntwoorden.Items[i].FindControl("btnEdit");
                    LinkButton btnDelete = (LinkButton)dlAntwoorden.Items[i].FindControl("btnDelete");

                    Label lblGebruiker = (Label)dlAntwoorden.Items[i].FindControl("lblGebruiker");
                    if (lblGebruiker.Text != Session["naam"].ToString())
                    {
                        btnDelete.Visible = false;
                        btnEdit.Visible = false;
                    }
                }
                }
            }
        }

        protected void dlAntwoorden_CancelCommand(object source, DataListCommandEventArgs e)
        {
            dlAntwoorden.EditItemIndex = -1;
            this.DataBindAntwoorden();
        }

        protected void dlAntwoorden_EditCommand(object source, DataListCommandEventArgs e)
        {
            //Cancel the Edit Mode
            dlAntwoorden.EditItemIndex = e.Item.ItemIndex;
            this.DataBindAntwoorden();
        }

        protected void dlAntwoorden_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int antwoordID = (int)dlAntwoorden.DataKeys[(int)e.Item.ItemIndex];
            Label txtgebruiker = (Label)e.Item.FindControl("lblGebruiker");
            if (Session["role"].ToString() != "Gebruiker")
            {
                _business.insert_melding(Convert.ToInt16(_business.read_gebruikerID_naam(txtgebruiker.Text)), "Je antwoord is verwijderd.", HttpContext.Current.Request.Url.PathAndQuery);
            }
            _business.delete_antwoorden(Convert.ToInt16(antwoordID));
            this.DataBindAntwoorden();
        }

        protected void dlAntwoorden_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            TextBox txtAntwoord = (TextBox)e.Item.FindControl("txtEditAntwoord");
            Label txtgebruiker = (Label)e.Item.FindControl("lblGebruiker");
            int antwoordID = (int)dlAntwoorden.DataKeys[(int)e.Item.ItemIndex];
            if (Session["role"].ToString() != "Gebruiker")
            {
                _business.insert_melding(Convert.ToInt16(_business.read_gebruikerID_naam(txtgebruiker.Text)), "Je antwoord is aangepast.", HttpContext.Current.Request.Url.PathAndQuery);
            }
                _business.update_antwoord(antwoordID,txtAntwoord.Text);
            dlAntwoorden.EditItemIndex = -1;
            this.DataBindAntwoorden();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            if (Convert.ToBoolean(Session["loggedin"]) == true)
            {
                int ticketID = Convert.ToInt16(_business.Decrypt_QueryString(Request.QueryString["id"].ToString()));
                string onderwerp = _business.Decrypt_QueryString(Request.QueryString["o"].ToString());
                string status = _business.Decrypt_QueryString(Request.QueryString["s"].ToString());
                this.DataBindAntwoorden();


                lblNaam.Text = onderwerp;
                lblStatus.Text = status;
                lblID.Text = Convert.ToString(ticketID);

                void disableEdit()
                {
                    for (int i = 0; i < dlAntwoorden.Items.Count; i++)
                    {
                        if (Session["role"].ToString() == "Gebruiker")
                        {
                            LinkButton btnEdit = (LinkButton)dlAntwoorden.Items[i].FindControl("btnEdit");
                            LinkButton btnDelete = (LinkButton)dlAntwoorden.Items[i].FindControl("btnDelete");
                            btnDelete.Visible = false;
                            btnEdit.Visible = false;
                        }
                    }
                }

                switch (status)
                {
                    case "Open":
                        DIVstatus.Attributes.Add("class", DIVstatus.Attributes["class"].ToString().Replace("label-danger", "label-success"));
                        break;
                    case "Onbekend":
                        DIVstatus.Attributes.Add("class", DIVstatus.Attributes["class"].ToString().Replace("label-danger", "label-warning"));
                        break;
                    default:
                        DIVstatus.Attributes.Add("class", DIVstatus.Attributes["class"].ToString().Replace("label-danger", "label-danger"));
                        btnReageer.Enabled = false;
                        disableEdit();
                        break;
                }
            }
            else
            {
                    Response.Redirect("Account/loginForm.aspx");
            }
            }

        }

        protected void btnReageer_Click(object sender, EventArgs e)
        {
            int ticketID = Convert.ToInt16(_business.Decrypt_QueryString(Request.QueryString["id"].ToString()));
            //Om een status terug op open te zetten wanneer een admin reageert:
            if (Session["role"].ToString() != "Gebruiker")
            {
                _business.update_status_ticket(ticketID);
                _business.insert_melding(Convert.ToInt16(_business.read_gebruikerID_ticket(ticketID)),"Je hebt een nieuwe reactie op je ticket.", HttpContext.Current.Request.Url.PathAndQuery);
            }
            else
            {
                ArrayList lijst = new ArrayList();
                foreach (DataListItem item in dlAntwoorden.Items)
                {
                    /// FIXEEEEEn
                    Label lblGebruiker = (Label)item.FindControl("lblGebruiker");
                    if (lblGebruiker.Text != Session["naam"].ToString())
                    {
                        int id2 = _business.read_gebruikerID_naam(lblGebruiker.Text);
                        int teller = 0;

                        foreach (int id in lijst)
                        {
                            if (id == id2)
                            {
                                teller++;
                            }
                        }

                        if (teller==0)
                        {
                            lijst.Add(id2);
                        }
                    }
                }

                foreach (int id in lijst)
                {
                    _business.insert_melding(id, "Je hebt een nieuw antwoord op een van je ticketten.", HttpContext.Current.Request.Url.PathAndQuery);
                }
            }
            _business.insert_antwoorden(Convert.ToInt16(Session["id"]), txtAntwoord.Text, ticketID);
            this.DataBindAntwoorden();
            txtAntwoord.Text = "";
        }
    }
}
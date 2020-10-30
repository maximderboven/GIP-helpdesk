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
    public partial class ticket_details : System.Web.UI.Page
    {
        Business _business = new Business();

        protected void DataBindAntwoorden()
        {
            int ticketID = Convert.ToInt16(Decrypt_QueryString(Request.QueryString["id"].ToString()));
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
            _business.delete_antwoorden(Convert.ToInt16(antwoordID));
            this.DataBindAntwoorden();
        }

        protected void dlAntwoorden_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            TextBox txtAntwoord = (TextBox)e.Item.FindControl("txtEditAntwoord");
            int antwoordID = (int)dlAntwoorden.DataKeys[(int)e.Item.ItemIndex];
            _business.update_antwoord(antwoordID,txtAntwoord.Text);
            dlAntwoorden.EditItemIndex = -1;
            this.DataBindAntwoorden();
        }

        public static string Decrypt_QueryString(string str)
        {
            str = str.Replace(" ", "+");
            string DecryptKey = "Kaso;2640!)";
            byte[] byKey = { };
            byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
            byte[] inputByteArray = new byte[str.Length];

            byKey = System.Text.Encoding.UTF8.GetBytes(DecryptKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Convert.FromBase64String(str);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.Encoding encoding = System.Text.Encoding.UTF8;
            return encoding.GetString(ms.ToArray());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            if (Convert.ToBoolean(Session["loggedin"]) == true)
            {
                int ticketID = Convert.ToInt16(Decrypt_QueryString(Request.QueryString["id"].ToString()));
                string onderwerp = Decrypt_QueryString(Request.QueryString["o"].ToString());
                string status = Decrypt_QueryString(Request.QueryString["s"].ToString());
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

            int ticketID = Convert.ToInt16(Decrypt_QueryString(Request.QueryString["id"].ToString()));
            /* Om een status terug op open te zetten wanneer een admin reageert:
            if (Session["role"].ToString() != "Gebruiker")
            {
                _business.update_status_ticket(ticketID);
            }*/
            _business.insert_antwoorden(Convert.ToInt16(Session["id"]), txtAntwoord.Text, ticketID);
            this.DataBindAntwoorden();
            txtAntwoord.Text = "";
        }



    }
}
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="presentationWeb.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 137px;
        }

        .auto-style2 {
            height: 42px;
        }
        .auto-style3 {
            height: 137px;
            width: 272px;
        }
        .auto-style4 {
            height: 42px;
            width: 272px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="naamenid" runat="server" Text="Label"></asp:Label>

            &nbsp;<asp:Button ID="btnlogout" runat="server" OnClick="btnlogout_Click" Text="logout" />
            &nbsp;<asp:Button ID="ResetPassword" runat="server" OnClick="Button2_Click" Text="reset password" />

            <asp:GridView ID="gvTickets" runat="server"
                AutoGenerateColumns="False" Width="767px"
                DataKeyNames="ID"
                OnRowCancelingEdit="gvTickets_RowCancelingEdit"
                OnRowDeleting="gvTickets_RowDeleting"
                OnRowEditing="gvTickets_RowEditing"
                OnRowUpdating="gvTickets_RowUpdating"
                EmptyDataText="Je hebt nog geen tickets aangemaakt."
                OnRowDataBound="gvTickets_RowDataBound"
                OnSelectedIndexChanged="gvTickets_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <%-- KOLOM 1: ID --%>
                    <%-- KOLOM 2: gebruiker --%>
                    <%-- KOLOM 3: Categorie  --%>
                    <%-- KOLOM 4: Onderwerp  --%>
                    <%-- KOLOM 5: Vraag  --%>
                    <%-- KOLOM 6: Status  --%>
                    <%-- KOLOM 7: datumgemaakt  --%>
                    <%-- KOLOM 8: Selecteer  --%>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ReadOnly="True" Visible="False" DataField="id" HeaderText="ID" />
                    <asp:BoundField ReadOnly="True" Visible="False" DataField="gebruiker" HeaderText="Gebruiker" InsertVisible="False" />
                    <asp:TemplateField HeaderText="Categorie">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditCategorie" runat="server" Height="16px" Width="105px"
                                DataTextField="categorie"
                                DataValueField="Id"
                                AppendDataBoundItems="true"
                                SelectMethod="ddlEditCategorie_Data">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCategorie" runat="server" Text='<%# Bind("Categorie") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Onderwerp">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditOnderwerp" runat="server" Text='<%# Bind("onderwerp") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("onderwerp") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Vraag">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditVraag" runat="server" Text='<%# Bind("vraag") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("vraag") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" Height="16px" Width="105px"
                                DataTextField="status"
                                DataValueField="Id"
                                SelectMethod="ddlEditStatus_Data">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="datumgemaakt" HeaderText="Gemaakt" ReadOnly="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <br />

            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">Categorie:<br />
                        <asp:DropDownList ID="ddlNewCategorie" runat="server" Height="17px" Width="176px" AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        Onderwerp:<br />
                        <asp:TextBox ID="txtNewOnderwerp" runat="server" Width="168px"></asp:TextBox>
                        <br />
                        Vraag:<br />
                        <asp:TextBox ID="txtNewVraag" runat="server" TextMode="MultiLine"></asp:TextBox>

                        <br />
                        <asp:Button ID="btnNewTicket" runat="server" OnClick="btnNewTicket_Click1" Text="Verzenden" />

                    </td>
                    <td class="auto-style1">
                        <asp:GridView ID="gvAntwoorden" runat="server"
                            AutoGenerateColumns="False"
                            Width="585px"
                            DataKeyNames="ID"
                            OnRowCancelingEdit="gvAntwoorden_RowCancelingEdit"
                            OnRowDeleting="gvAntwoorden_RowDeleting"
                            OnRowEditing="gvAntwoorden_RowEditing"
                            OnRowUpdating="gvAntwoorden_RowUpdating"
                            EmptyDataText="Je hebt nog niet geantwoord."
                            OnRowDataBound="gvAntwoorden_RowDataBound"
                            OnSelectedIndexChanged="gvAntwoorden_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ReadOnly="True" Visible="False" DataField="id" HeaderText="ID" InsertVisible="False" />
                                <asp:TemplateField HeaderText="Gebruiker" InsertVisible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="lblGebruiker" runat="server" Text='<%# Eval("gebruiker") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblGebruiker" runat="server" Text='<%# Bind("gebruiker") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Antwoord">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditVraag" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Omschrijving") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="datumgemaakt" InsertVisible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("datumgemaakt") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("datumgemaakt") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:Panel ID="PanelAntwoorden" runat="server">
                            <asp:Button ID="BtnVerzendenAntwoord" runat="server" OnClick="BtnVerzendenAntwoord_Click" Text="Verzenden" />
                            <asp:TextBox ID="txtAntwoord" runat="server" Height="21px" Width="476px"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">1. auto select dropdown<br />
                        2. gebruiker beheer<br />
                        3. Vraag disablen wanner gesloten<br />
                        4. dtmOpgelost<br />
                        5. open klikken vraag<br />
                        6. Gebruiker vraag zelf sluiten<br />
                        7. Max length boxes<br />
                        8. Dubbel controle<br />
                        9. &quot;Mijn profiel&quot;<br />
                        10. Design af<br />
                        11. Catgeorien en statussen toevoegen<br />
                        12. Superadmin<br />
                        13. Nadenken deisgn<br />
                        14. Tabs ? Bepaalde disablen voor gebruiker<br />
                        15. Favoerieten &amp; filters</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvGebruikers" runat="server"
                DataKeyNames="ID"
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False" Width="774px"
                OnRowCancelingEdit="gvGebruikers_RowCancelingEdit"
                OnRowDeleting="gvGebruikers_RowDeleting"
                OnRowEditing="gvGebruikers_RowEditing"
                OnRowUpdating="gvGebruikers_RowUpdating"
                EmptyDataText="Geen gebruikers."
                OnRowDataBound="gvGebruikers_RowDataBound"
                OnSelectedIndexChanged="gvGebruikers_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:TemplateField HeaderText="Naam">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditNaam" runat="server" Text='<%# Bind("naam") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("naam") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="email">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Groep">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditGroep" runat="server"
                                DataTextField="groep"
                                DataValueField="Id"
                                AppendDataBoundItems="true"
                                SelectMethod="ddlEditGroepen_Data">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("groep") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actief">
                        <EditItemTemplate>
                            <asp:CheckBox ID="cbEditActief" runat="server" Checked='<%# Bind("actief") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("actief") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DtmAangemaakt">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("DtmAangemaakt") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DtmAangemaakt") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />

        </div>
    </form>
</body>
</html>

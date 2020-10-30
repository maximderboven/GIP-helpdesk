<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ticket-beheer.aspx.cs" Inherits="presentationWeb.ticket_beheer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link href="/CSS/algemeen.css" rel="stylesheet" />
    <link rel="stylesheet" href="/CSS/gridview-opmaak.css" />
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB">
                    <li>
                        <i class="fa fa-comment"></i>&nbsp; Tickets </li>
                    <li>
                        <i class="fa fa-book"></i>&nbsp; Beheren </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h4>Je tickets</h4>
                <div class="table-responsive table-curved" style="border: none; margin: 0px; border-top-left-radius: 5px; border-top-right-radius: 5px;">
                    <asp:GridView CssClass="gridviewcss" ID="gvTickets" runat="server"
                        DataKeyNames="ID"
                        AutoGenerateColumns="False" Width="100%"
                        OnDataBound="gvTickets_DataBound"
                        OnRowCancelingEdit="gvTickets_RowCancelingEdit"
                        OnRowDeleting="gvTickets_RowDeleting"
                        OnRowEditing="gvTickets_RowEditing"
                        OnRowUpdating="gvTickets_RowUpdating"
                        EmptyDataText="Geen tickets gevonden."
                        OnRowDataBound="gvTickets_RowDataBound"
                        OnSelectedIndexChanged="gvTickets_SelectedIndexChanged"
                        Onrowcommand="gvTickets_RowCommand">
                        <AlternatingRowStyle CssClass="AltRow" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False" ItemStyle-Width="0.7%">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="" Style="color: red;" class="btn btn-mini">
                                <i class="fa fa-trash fa-lg"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" ItemStyle-Width="5.5%">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="" Style="color: darkgreen;" class="btn btn-mini">
                                    <i class="fa fa-edit fa-lg">&nbsp</i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="" Style="color: darkgreen;">
                                &nbsp&nbsp&nbsp&nbsp<i class="fa fa-check-circle fa-lg">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" Text=" " Style="color: darkred;">
                                <i class="fa fa-ban fa-lg"></i>
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id" HeaderText="id #" InsertVisible="False" ReadOnly="True" ItemStyle-Width="5%" />
                            <asp:TemplateField HeaderText="Gebruiker" ItemStyle-Width="12%">
                                <EditItemTemplate>
                                    <asp:Label ID="txtEditgebruiker" ReadOnly="true" runat="server" Text='<%# Bind("gebruiker") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("gebruiker") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Categorie" ItemStyle-Width="7%">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditCategorie" runat="server"
                                        DataTextField="categorie"
                                        DataValueField="Id"
                                        AppendDataBoundItems="true"
                                        SelectMethod="ddlEditCategorie_Data"
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCategorie" runat="server" Text='<%# Bind("categorie") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Onderwerp" ItemStyle-Width="17%">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditOnderwerp" runat="server" Text='<%# Bind("onderwerp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbOnderwerp" CommandArgument='<%# Eval("id")+"$"+Eval("status")+"$"+Eval("onderwerp")  %>' CommandName="Details" runat="server" Text='<%# Bind("onderwerp") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="15%">
                                <EditItemTemplate>
                                    <asp:DropDownList class="label label-danger" ID="ddlEditStatus" runat="server" Enabled="true"
                                        DataTextField="status"
                                        DataValueField="Id"
                                        AppendDataBoundItems="true"
                                        SelectMethod="ddlEditStatus_Data"
                                        AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlEditStatus_SelectedIndexChanged" >
                                    </asp:DropDownList>
                                    <asp:Label class="label label-danger" ID="lblEditStatus" Visible="false" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label class="label label-danger" ID="lblStatus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Datum" ItemStyle-Width="15%">
                                <EditItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DatumGemaakt") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DatumGemaakt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- KOLOM 1: ID --%>
                            <%-- KOLOM 2: gebruiker --%>
                            <%-- KOLOM 3: Categorie  --%>
                            <%-- KOLOM 4: Onderwerp  --%>
                            <%-- KOLOM 5: Vraag  --%>
                            <%-- KOLOM 6: Status  --%>
                            <%-- KOLOM 7: datumgemaakt  --%>
                            <%-- KOLOM 8: Selecteer  --%>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <div class="col-lg-12 text-center" style="padding: 0px;">
                    <br />
                    <p><strong>Opgelet, </strong>er kan maar 1 ticket open zijn op hetzelfde moment.</p>
                </div>
            </div>
        </div>
        <p></p>
        <p>
            <br />
        </p>
    </div>
</asp:Content>

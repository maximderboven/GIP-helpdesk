<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="gebruiker-beheer.aspx.cs" Inherits="presentationWeb.gebruiker_beheer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link rel="stylesheet" href="/CSS/gridview-opmaak.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB">
                    <li>
                        <i class="fa fa-chevron-right"></i>&nbsp Gebruikers </li>
                    <li>
                        <i class="fa fa-book"></i>&nbsp Beheer
                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <h4>Beheer gebruikers</h4>
                <div class="col-sm-10 col-xs-12" style="padding: 0px;">
                    <p>Verander de status of instellingen van gebruikers hieronder.</p>
                </div>
            </div>
        </div>

        <div class="table-responsive table-curved">

            <asp:GridView CssClass="gridviewcss" ID="gvGebruikers" runat="server"
                DataKeyNames="ID"
                AutoGenerateColumns="False" Width="100%"
                OnDataBound="gvGebruikers_DataBound"
                OnRowCancelingEdit="gvGebruikers_RowCancelingEdit"
                OnRowDeleting="gvGebruikers_RowDeleting"
                OnRowEditing="gvGebruikers_RowEditing"
                OnRowUpdating="gvGebruikers_RowUpdating"
                EmptyDataText="Geen gebruikers."
                OnRowDataBound="gvGebruikers_RowDataBound"
                OnSelectedIndexChanged="gvGebruikers_SelectedIndexChanged">
                <AlternatingRowStyle CssClass="AltRow" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="0.7%">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="" Style="color: red;" class="btn btn-mini">
                                <i class="fa fa-user-times fa-lg"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="5.5%">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="" Style="color: darkgreen;" class="btn btn-mini">
                                    <i class="fa fa-edit fa-lg">&nbsp</i>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="" Style="color: darkgreen;">
                                &nbsp&nbsp&nbsp&nbsp<i class="fa fa-check-circle fa-lg">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="Cancel" runat="server" CommandName="Cancel" Text=" " Style="color: darkred;">
                                <i class="fa fa-ban fa-lg"></i>
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id #" InsertVisible="False" ReadOnly="True" Visible="true" ItemStyle-Width="5%" />
                    <asp:TemplateField HeaderText="Naam" ItemStyle-Width="12%">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditNaam" runat="server" Text='<%# Bind("naam") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("naam") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="E-mail" ItemStyle-Width="17%">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role" ItemStyle-Width="7%">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditGroep" runat="server"
                                DataTextField="groep"
                                DataValueField="Id"
                                AppendDataBoundItems="true"
                                SelectMethod="ddlEditGroepen_Data"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGroep" runat="server" Text='<%# Bind("groep") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actief" ItemStyle-Width="5%">
                        <EditItemTemplate>
                            <asp:CheckBox ID="cbEditActief" AutoPostBack="True" runat="server" Checked='<%# Bind("actief") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("actief") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Registratiedatum" ItemStyle-Width="15%">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("DtmAangemaakt") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DtmAangemaakt") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

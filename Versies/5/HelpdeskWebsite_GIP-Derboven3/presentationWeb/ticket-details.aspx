<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ticket-details.aspx.cs" Inherits="presentationWeb.ticket_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link href="/CSS/algemeen.css" rel="stylesheet" />
    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" id="ol_01eb_0">
                    <li>
                        <i class="fa fa-comment"></i>&nbsp; Tickets </li>
                    <li>
                        <i class="fa fa-book"></i>&nbsp; Beheren </li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <div class="col-lg-10 col-xs-12" id="div_01eb_0">
                    <h4>Ticket&nbsp;#<strong><asp:Label ID="lblID" runat="server" Text="Label"></asp:Label></strong>:&nbsp;<strong>"<asp:Label ID="lblNaam" runat="server" Text="Label"></asp:Label>"</strong></h4>
                </div>
                <div class="col-lg-2 col-xs-12" id="div_01eb_1">
                    <h4>Status:&nbsp;<span runat="server" id="DIVstatus" class="label label-danger btn-sm"><asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label></span></h4>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-12" id="div_01eb_2">
                <input type='hidden' name='id' value='18760'>
                <input type='hidden' name='action' value='reply'>
                <div class="col-lg-12 col-xs-12" id="div_01eb_3">
                    Bericht:
                </div>
                <div class="col-lg-12 col-xs-12 input-group" id="div_01eb_4">
                    <asp:TextBox runat="server" ID="txtAntwoord" TextMode="MultiLine" class="form-control" name="message" Style="width: 100%; height: 100px; padding: 10px; border-color: #c8d9f2; resize: none; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-lg-offset-5 col-xs-12 text-center" id="div_01eb_5">
                    <p>1000 karakters max.</p>
                    <asp:Button runat="server" class="btn btn-success btn-block" ID="btnReageer" type="submit" Text="Verzenden" OnClick="btnReageer_Click"></asp:Button><br />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <div id="div_01eb_6"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">

                <asp:DataList ID="dlAntwoorden" Style="width: 100%" runat="server" OnCancelCommand="dlAntwoorden_CancelCommand"
                    OnEditCommand="dlAntwoorden_EditCommand" OnUpdateCommand="dlAntwoorden_UpdateCommand" OnDeleteCommand="dlAntwoorden_DeleteCommand" DataKeyField="id">
                    <ItemTemplate>
                        <div class="panel panel-kasodesk">
                            <div class="panel-heading" id="div_01eb_7">
                                <div class="row">
                                    <div class="text-left col-sm-6">
                                        <asp:LinkButton runat="server" ID="btnEdit" CommandName="edit"><i id="i_01eb_0" class="fa fa-pencil-square fa-lg" aria-hidden="true"></i></asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton runat="server" ID="btnDelete" CommandName="delete"><i id="i_01eb_1" class="fa fa-minus-square fa-lg" aria-hidden="true"></i></asp:LinkButton>
                                    </div>
                                    <div class="text-right col-sm-6">
                                        &nbsp;&nbsp;Verzonden op <%# Eval("dtmGemaakt") %>&nbsp;door&nbsp;<strong><asp:Label ID="lblGebruiker" runat="server" Text='<%# Bind("gebruiker") %>'></asp:Label></strong>&nbsp;

                                    </div>
                                </div>
                            </div>
                            <div class="panel-body" id="div_01eb_8"><%# Eval("omschrijving") %></div>
                        </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <div class="panel panel-kasodesk">
                            <div class="panel-heading" id="div_01eb_9">
                                <div class="row">
                                    <div class="text-left col-sm-6">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="update"><i id="i_01eb_2" class="fa fa-floppy-o fa-lg" aria-hidden="true"></i></asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="cancel"><i id="i_01eb_3" class="fa fa-ban fa-lg" aria-hidden="true"></i></asp:LinkButton>
                                    </div>
                                    <div class="text-right col-sm-6">
                                        <asp:Label ID="lblID" Visible="false" runat="server"><%# Eval("id") %></asp:Label>
                                        &nbsp;&nbsp;Verzonden op <%# Eval("datumGemaakt") %>&nbsp;door&nbsp;<strong><asp:Label ID="lblGebruiker" runat="server" Text='<%# Bind("gebruiker") %>'></asp:Label></strong>&nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <asp:TextBox TextMode="MultiLine" class="form-control" Style="width: 100%; height: 100px; padding: 10px; border-color: #c8d9f2; resize: none; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;" ID="txtEditAntwoord" runat="server" Text='<%# Eval("omschrijving") %>'></asp:TextBox>
                            </div>
                        </div>
                    </EditItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>

</asp:Content>
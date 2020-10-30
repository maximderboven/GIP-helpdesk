<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="presentationWeb.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB;">
                    <li>
                        <i class="fa fa-dashboard"></i>&nbsp Dashboard

                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <h4>Overzicht</h4>
                <div class="col-sm-10 col-xs-12" style="padding: 0px;">
                    <p>Hieronder vind je een status van de website.</p>
                </div>
            </div>
        </div>

        <div class="row col-lg-12 col-xs-12" id="div1_gebruikers" runat="server">
            <div class="col-md-2 panel panel-default">
                <div class="panel-heading">Gebruikers online</div>
                <div class="panel-body">
                    <asp:Label ID="lblgebruikersonline" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <div style="margin-top: 20px; margin-bottom: 20px; border: 1px; border-top: 1px solid #CCC"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <h4>Tickets</h4>
            </div>
        </div>

        <div class="row col-lg-12 col-xs-12" id="Div2_Tickets_Admin" runat="server">
            <div class="col-md-2 panel panel-default">
                <div class="panel-heading">Totaal aantal</div>
                <div class="panel-body">
                    <asp:Label ID="lblTotaalTickets" runat="server" Text="Label"></asp:Label>
                </div>
                </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2 panel panel-default">
                    <div class="panel-heading">Aantal gesloten</div>
                    <div class="panel-body">
                        <asp:Label ID="lblGeslotenTickets" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2 panel panel-default">
                    <div class="panel-heading">Aantal onbekend</div>
                    <div class="panel-body">
                        <asp:Label ID="lblonbekendTickets" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>&nbsp;&nbsp;&nbsp;
                <div class="col-md-2 panel panel-default">
                    <div class="panel-heading">Aantal open</div>
                    <div class="panel-body">
                        <asp:Label ID="lblOpenTickets" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
        </div>

        <div class="row" id="Div2_Tickets_Gebruiker" runat="server">
            <div class="col-md-2 panel panel-default">
                <div class="panel-heading">Totaal Tickets</div>
                <div class="panel-body">
                    <asp:Label ID="lblTicketsGebruiker" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

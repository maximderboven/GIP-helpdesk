<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ticket-aanmaken.aspx.cs" Inherits="presentationWeb.ticket_aanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link href="/CSS/algemeen.css" rel="stylesheet" />
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB">
                    <li>
                        <i class="fa fa-comment"></i>&nbsp; Tickets </li>
                    <li>
                        <i class="fa fa-wrench"></i>&nbsp; Aanmaken </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h4>Maak een nieuw ticket aan</h4>
                <br />
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-12 col-xs-12" style="padding: 0px;">
                    Onderwerp
                </div>
            </div>
            <div class="col-lg-12">

                <div class="col-lg-8 col-xs-12 input-group" style="padding: 0px;">

                    <span class="input-group-addon"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList ID="ddlNewCategorie" Width="150px" class="form-control col-md-1" runat="server"></asp:DropDownList>
                    <asp:TextBox runat="server" Width="910" class="form-control col-md-1" ID="txtNewOnderwerp" name="subject" type="text" MaxLength="35"></asp:TextBox>
                </div>


                <div class="col-lg-2 col-xs-12" style="padding: 0px; margin-bottom: 20px;">
                    <span>35 karakters max.</span>
                </div>
                <div class="col-lg-2"></div>
            </div>

        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-3 col-xs-12" style="padding: 0px;">
                    Bericht
                </div>
            </div>
            <div class="col-lg-12">
                <div class="col-lg-8 col-xs-12 input-group" style="padding: 0px;">
                    <asp:TextBox runat="server" TextMode="MultiLine" Style="resize: vertical;" ID="txtNewBericht" class="form-control" name="message" MaxLength="1000" Rows="4" min-height="250px" max-height="250px"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-xs-12" style="padding: 0px; margin-bottom: 20px;">
                    <span>1000 karakters max.</span>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-xs-12 text-center">
                <div class="col-lg-4 col-lg-offset-2 col-xs-12 input-group" style="padding: 0px;">
                    <input type="hidden" name="action" value="new">
                    <asp:Button runat="server" class="btn btn-success btn-block" ID="createTicket" type="submit" OnClick="btnVerzenden_Click" Text="Verzenden"></asp:Button>
                </div>
                <div class="col-lg-4"></div>
                <p>
                    <br />
                </p>
            </div>
        </div>
    </div>
</asp:Content>

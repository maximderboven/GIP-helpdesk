<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="ticket-aanmaken.aspx.cs" Inherits="presentationWeb.ticket_aanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link href="/CSS/algemeen.css" rel="stylesheet" />
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" id="ol_df9b_0">
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

                <!-- Error Alert -->
        <div class="row">
        <div class="col-lg-8">
        <div runat="server" id="error" visible="false" class="alert alert-danger">
            <p class="style-Alert">
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label></p>
        </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-12 col-xs-12" id="div_df9b_0">
                    Onderwerp
                </div>
            </div>
            <div class="col-lg-12">

                <div class="col-lg-8 col-xs-12 input-group" id="div_df9b_1">

                    <span class="input-group-addon"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList ID="ddlNewCategorie" AutoPostBack="true" Width="150px" class="form-control col-md-1" runat="server"></asp:DropDownList>
                    <asp:TextBox runat="server" max-width="910" class="form-control col-md-1" ID="txtNewOnderwerp" name="subject" type="text" MaxLength="45"></asp:TextBox>
                </div>


                <div class="col-lg-2 col-xs-12" id="div_df9b_2">
                    <span>45 karakters max.</span>
                </div>
                <div class="col-lg-2"></div>
            </div>

        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-3 col-xs-12" id="div_df9b_3">
                    Bericht
                </div>
            </div>
            <div class="col-lg-12">
                <div class="col-lg-8 col-xs-12 input-group" id="div_df9b_4">
                    <asp:TextBox runat="server" TextMode="MultiLine" Style="resize: vertical;" ID="txtNewBericht" class="form-control" name="message" MaxLength="1000" Rows="4" min-height="250px" max-height="250px"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-xs-12" id="div_df9b_5">
                    <span>1000 karakters max.</span>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-xs-12 text-center">
                <div class="col-lg-4 col-lg-offset-2 col-xs-12 input-group" id="div_df9b_6">
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
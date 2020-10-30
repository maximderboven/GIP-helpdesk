<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="gebruiker-aanmaken.aspx.cs" Inherits="presentationWeb.gebruiker_aanmaken" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link href="/CSS/algemeen.css" rel="stylesheet" />
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB">
                    <li>
                        <i class="fa fa-chevron-right"></i>&nbsp Gebruikers </li>
                    <li>
                        <i class="fa fa-wrench"></i>&nbsp Aanmaken
                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <h4>Gebruiker aanmaken</h4>
                <div class="col-sm-10 col-xs-12" style="padding: 0px;">
                    <p>maak hieronder een nieuwe gebruiker aan, snel en gemakkelijk.</p>
                </div>
                <div class="col-lg-2 col-xs-12 text-center" style="padding: 0px;">
                    <asp:Button runat="server" ID="GebruikerToevoegen" type="submit" class="btn btn-success btn-block" Text="Toevoegen" OnClick="GebruikerToevoegen_Click"></asp:Button>
                    <p></p>
                </div>
            </div>
        </div>

        <!-- Error Alert -->
        <div runat="server" id="errordiv" visible="false" class="alert alert-danger">
            <p class="style-Alert">
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label></p>
        </div>

        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <div class="panel"><!--  panel-kasodesk -->
                    <div class="panel-body">
                        <div class="col-lg-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-3 col-xs-12 " style="padding: 0px;">
                                    Gebruikersnaam
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" style="padding: 0px; margin-bottom: 20px;">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtgebruikersnaam" type="text" value=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-xs-12" style="padding: 0px;">
                                    E-mail
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" style="padding: 0px; margin-bottom: 20px;">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtEmail" type="text" value=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-xs-12" style="padding: 0px;">
                                    Passwoord
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" style="padding: 0px; margin-bottom: 0px;">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtpasswoord1" type="password" value=""></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-lg-3 col-xs-12" style="padding: 0px;">
                                    Herhaal het passwoord
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" style="padding: 0px; margin-bottom: 0px;">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtpasswoord2" type="password" value=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="profiel.aspx.cs" Inherits="presentationWeb.profiel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" style="background-color: #E5E6EB">
                    <li>
                        <i class="fa fa-home"></i>&nbsp Account </li>
                    <li>
                        <i class="fa fa-user"></i>&nbsp; Profiel </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12  col-xs-12" style="margin-bottom:8px;">
                <h4>Profiel</h4>
                <div class="col-sm-10 col-xs-12" style="padding: 0px;">
                    <p>Hier kun je je persoonlijke gegevens aanpassen.</p>
                    <a href="reset-passwoord.aspx" class="btn-link">Verander je passwoord</a>
                </div>


                <div class="col-lg-2 col-xs-12 text-center" style="padding: 0px;">
                    <asp:Button runat="server" ID="opslaan" type="submit" class="btn btn-success btn-block" Text="Opslaan"></asp:Button>
                </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-kasodesk">
                <div class="panel-body">
                    <input type="hidden" name="userid" value="x">
                    <div class="row p-bottom-20">
                        <div class="col-lg-5 col-xs-12">
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input type="email" class="form-control" value="" readonly>
                            </div>
                        </div>
                        <div class="col-lg-2 col-xs-12">
                            <div class="form-group">
                                <label for="language">Taal</label>
                                <select name="language" class="form-control" disabled>
                                    <option value="nl" selected>Nederlands</option>
                                    <option value="en" >English</option>
                                    <option value="fr">French</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row p-bottom-20">
                        <div class="col-lg-5 col-xs-12">
                            <div class="form-group">
                                <label for="firstname">Voornaam</label>
                                <input type="text" class="form-control" value="" readonly>
                            </div>
                        </div>
                        <div class="col-lg-5 col-xs-12">
                            <div class="form-group">
                                <label for="lasttname">Achternaam</label>
                                <input type="text" class="form-control" value="" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="row p-bottom-20">
                        <div class="col-lg-3 col-xs-12">
                            <div class="form-group">
                                <label for="bdate">Geboortedatum</label>
                                <input type="text" class="form-control" value="" readonly>
                            </div>
                        </div>
                        <div class="col-lg-2 col-xs-12">
                            <div class="form-group">
                                <label for="mobile">Telefoon nummer</label>
                                <input type="text" class="form-control" name="tele" value="" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="row p-bottom-20">
                        <div class="col-lg-11 col-xs-12">
                            <div class="form-group">
                                <label for="website_description">Beschrijving/status</label>
                                <textarea class="form-control" style="width: 75%" name="beschrijving_status" readonly></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row p-bottom-20">
                        <div class="col-lg-8 col-xs-12">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="meldingen" checked disabled>
                                    Nieuwe meldingen gemaild krijgen
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

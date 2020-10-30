<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="reset-passwoord.aspx.cs" Inherits="presentationWeb.Account.resetForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_content_wrapper" runat="server">
    <link href="/CSS/algemeen.css" rel="stylesheet" />
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb" id="ol_f868_0">
                    <li>
                        <i class="fa fa-home"></i>&nbsp Account </li>
                    <li>
                        <i class="fa fa-key"></i>&nbsp; Verander passwoord 
                    </li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-xs-12">
                <h4>Reset passwoord</h4>
                <div class="col-sm-10 col-xs-12" id="div_f868_0">
                    <p>Vul je nieuw password in, gevolgd door je huidig passwoord.</p>
                </div>
                <div class="col-lg-2 col-xs-12 text-center" id="div_f868_1">
                    <asp:Button runat="server" ID="PasswordChange" type="submit" class="btn btn-success btn-block" Text="Verander passwoord" OnClick="PasswordChange_Click"></asp:Button>
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
                <div class="panel">
                    <!--  panel-kasodesk -->
                    <div class="panel-body">
                        <div class="col-lg-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-3 col-xs-12 " id="div_f868_2">
                                    Nieuw passwoord
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" id="div_f868_3">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtPassword1" type="password" value=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-xs-12" id="div_f868_4">
                                    Bevestig het nieuw passwoord
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" id="div_f868_5">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtPassword2" name="repeatnewpassword" type="password" value=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-xs-12" id="div_f868_6">
                                    Huidig passwoord
                                </div>
                                <div class="col-lg-9 col-xs-12 input-group" id="div_f868_7">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <asp:TextBox class="form-control" runat="server" ID="txtPasswordoud" name="currentpassword" type="password" value=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

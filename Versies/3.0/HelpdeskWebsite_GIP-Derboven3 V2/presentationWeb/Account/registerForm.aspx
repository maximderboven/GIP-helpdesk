<%@ Page Title="" Language="C#" MasterPageFile="~/Account/account.Master" AutoEventWireup="true" CodeBehind="registerForm.aspx.cs" Inherits="presentationWeb.registerForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="account_content_wrapper" runat="server">
<div>
            <!-- Error Alert -->
        <div runat="server" id="error" visible="false" class="alert alert-danger">
            <p class="style-Alert"><asp:Label ID="lblError" runat="server" Text=""></asp:Label></p>
        </div>
                            <div class="form-group" style="padding: 9px 0px 5px 0px;">
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:Textbox runat="server" class="form-control" id='txtgebruikersnaam' title='Gebruikersnaam' alt='gebruikersnaam' type="text" placeholder='Gebruikersnaam' onfocus="this.style.background='#FFFFFF'" onblur="this.style.background='#FFFFFF'" maxlength="65" ></asp:Textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="padding: 0px 0px 5px 0px;">
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <asp:Textbox runat="server" class="form-control" id='txtemail_user' title='email' alt='email' type="text" placeholder='Email' onfocus="this.style.background='#FFFFFF'" onblur="this.style.background='#FFFFFF'" maxlength="65" ></asp:Textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group"  style="padding: 0px 0px 5px 0px;">
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:Textbox runat="server" class="form-control" id='txtpassword' title='Password' alt='Password' type="password" placeholder='Password' onfocus="this.style.background='#FFFFFF'" onblur="this.style.background='#FFFFFF'" maxlength="65"></asp:Textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group"  style="padding: 0px 0px 5px 0px;">
                                <div class="cols-sm-10">
                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:Textbox runat="server" class="form-control" id='txtpassword2' title='Password' alt='Password' type="password" placeholder='Herhaal password' onfocus="this.style.background='#FFFFFF'" onblur="this.style.background='#FFFFFF'" maxlength="65"></asp:Textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:button runat="server" onlclick="btnRegistreer_Click" id="btnRegistreer" style="width:100%; border:0;" text="Registreer" type="submit" class="btn btn-danger btn-md" OnClick="btnRegistreer_Click" OnClientClick="btnRegistreer_Click"></asp:button>
                            </div>
                        <div class="login-register">
                            <p></p>
                            <a class="link" href='loginForm.aspx'>Al een account ?</a>
                        </div>
</div>
</asp:Content>

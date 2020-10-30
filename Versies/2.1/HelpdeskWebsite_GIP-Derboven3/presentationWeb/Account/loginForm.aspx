<%@ Page Title="" Language="C#" MasterPageFile="~/Account/account.Master" AutoEventWireup="true" CodeBehind="loginForm.aspx.cs" Inherits="presentationWeb.loginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="account_content_wrapper" runat="server">

    <div>
        <!-- Error Alert -->
        <div runat="server" id="error" visible="false" class="alert alert-danger">
            <p class="style-Alert"> Foute gebruikersnaam of passwoord.</p>
        </div>
        <div class="form-group style-FG">
            <!-- texbox field  idee: [ icon ] placeholder   ]-->
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <!-- [ icon ] -->
                    <!-- [ input field ] -->
                    <asp:TextBox runat="server" class="form-control" ID='txtemail_gebruikersnaam' title='Email / Gebruikersnaam' alt='Email / Username' type="text" placeholder='Gebruikersnaam' onfocus="this.style.background='#FFFFFF'" onblur="this.style.background='#FFFFFF'" value="" MaxLength="65" oninvalid="this.setCustomValidity('Verplicht')" oninput="setCustomValidity('')" required></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox runat="server" class="form-control" ID='txtpassword' title='Password' alt='Password' type="password" placeholder='Password' onfocus="this.style.background='#FFFFFF'" onblur="this.style.background='#FFFFFF'" value="" MaxLength="65" oninvalid="this.setCustomValidity('Verplicht')" oninput="setCustomValidity('')" required></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <!-- verzenden knop -->
            <asp:Button runat="server" ID="btnLogin" Style="width: 100%; border: 0;" type="submit" class="btn btn-danger btn-md" Text="Login" OnClick="btnLogin_Click"></asp:Button>
        </div>
        <div class="login-register">
            <!-- Nog geen account knop -->
            <p></p>
            <a class="link" href='registerForm.aspx'>Nog geen account ?</a>
        </div>
    </div>
</asp:Content>

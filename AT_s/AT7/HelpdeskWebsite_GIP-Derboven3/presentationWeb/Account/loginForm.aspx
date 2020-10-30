<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginForm.aspx.cs" Inherits="presentationWeb.loginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" for="txtNaam"><b>Naam:</b></asp:Label>
            <br />
            <asp:TextBox required="true" placeholder="Naam" ID="txtNaam" runat="server"></asp:TextBox>
            <br />
            <asp:Label runat="server" for="txtPassword"><b>Password:</b></asp:Label>
            <br />
            <asp:TextBox required="true" placeholder="Passwoord" ID="txtPassword" type="password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click1" />
            <br />
            <asp:Label Visible="False" ID="lblFout" runat="server" Text="Fout password of username."></asp:Label>
            <br />
            Nog geen account ? <a href="registerForm.aspx">Registreer</a>.</div>
    </form>
</body>
</html>
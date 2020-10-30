<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerForm.aspx.cs" Inherits="presentationWeb.registerForm" %>

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
                        <asp:Label runat="server" for="txtemail"><b>email:</b></asp:Label>
                        <br />
            <asp:TextBox required="true" placeholder="email" ID="txtemail" runat="server"></asp:TextBox>
                        <br />
            <asp:Label runat="server" for="txtPassword"><b>Password:</b></asp:Label>
                        <br />
            <asp:TextBox required="true" placeholder="Passwoord" ID="txtPassword" type="password" runat="server"></asp:TextBox>
                        <br />
            <asp:Label runat="server" for="txtPassword"><b>Herhaal password:</b></asp:Label>
                        <br />
            <asp:TextBox required="true" placeholder="Passwoord" ID="txtPassword2" type="password" runat="server"></asp:TextBox>
                        <br />
                        <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />

                        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
                        <br />
                        Heb je al een account ? <a href="loginForm.aspx">Login</a>.

            <asp:Label ID="lblFout" runat="server"></asp:Label>
            <br />

        </div>
    </form>
</body>
</html>

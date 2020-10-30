<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetForm.aspx.cs" Inherits="presentationWeb.Account.resetForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" for="txtOudPassword"><b>Oud Password:</b></asp:Label>
            <br />
            <asp:TextBox required="true" placeholder="Oud passwoord" ID="txtOudPassword" type="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label runat="server" for="txtPassword"><b>Password:</b></asp:Label>
            <br />
            <asp:TextBox required="true" placeholder="Passwoord" ID="txtPassword" type="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label runat="server" for="txtPassword"><b>Herhaal password:</b></asp:Label>
            <br />
            <asp:TextBox required="true" placeholder="Passwoord" ID="txtPassword2" type="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Verander_password" runat="server" OnClick="PasswordChange_Click" Text="Verander password" />
        </div>
    </form>
</body>
</html>

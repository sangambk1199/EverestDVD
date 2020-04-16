<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Everest_DVD.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Everest DVD</title>
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="login-form">
        <div class="flex-center">
            <div>
                <span class="navbar-brand">Everest<span>DVD</span></span>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>

            <div class="form-group"> 
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><asp:TextBox TextMode="Password" ID="TextBox2" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="Button1" CssClass="everest-btn" runat="server" Text="Login" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>

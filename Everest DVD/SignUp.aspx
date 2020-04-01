<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Everest_DVD.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>

    <br /><br />

    <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:Label ID="Label2" runat="server" Text="Full Name"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

    <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="TextBox3" TextMode="Email" runat="server"></asp:TextBox>

    <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="TextBox4" TextMode="Password" runat="server"></asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
</asp:Content>

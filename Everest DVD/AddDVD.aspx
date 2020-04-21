<%@ Page Title="Add DVD" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDVD.aspx.cs" Inherits="Everest_DVD.AddDVDStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-12">
           <div class="box">
               
               <h3>Add DVD</h3>
               <hr />
               <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
               </div>
               <div class="form-group">
                    <asp:Label ID="NameLbl" runat="server" Text="Movie"></asp:Label>
                    <asp:DropDownList ID="MovieDDL" runat="server">                    
                    </asp:DropDownList>
               </div>

               <div class="form-group">
                   <asp:Label ID="CopiesLbl" runat="server" Text="No. of copies"></asp:Label>
                    <asp:TextBox ID="CopiesTB" TextMode="Number" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                    <asp:Label ID="PriceLbl" runat="server" Text="DVD Price"></asp:Label>
                    <asp:TextBox ID="PriceTB" TextMode="Number" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                    <asp:Button ID="DVDSaveBtn" runat="server" Text="Add DVD" CssClass="everest-btn" OnClick="DVDSaveBtn_Click"/>
               </div>
               
           </div>  
        </div>
    </div>
</asp:Content>

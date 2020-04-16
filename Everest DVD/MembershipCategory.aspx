<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MembershipCategory.aspx.cs" Inherits="Everest_DVD.MembershipCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-4">
            <div class="box">
               
               <h3>Add Membership Category</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="Label3" runat="server" Text="Category Name"></asp:Label>
                <asp:TextBox ID="CategoryNameTB" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                   <asp:Label ID="Label4" runat="server" Text="Max. DVDs"></asp:Label>
                <asp:TextBox ID="MaxDVDTB" TextMode="Number" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Button ID="CategorySaveBtn" runat="server" Text="Add Category" CssClass="everest-btn" OnClick="CategorySaveBtn_Click"/>
               </div>

               <asp:Label ID="Label7" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>
        </div>
        <div class="col-md-8">
            <div class="box">
                <h3>All Category</h3>
                <hr />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:GridView ID="CategoryTbl" runat="server" CssClass="everest-table" ></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

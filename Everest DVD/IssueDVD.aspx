<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueDVD.aspx.cs" Inherits="Everest_DVD.IssueDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-12">
           <div class="box">
               
               <h3>Issue DVD</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="NameLbl" runat="server" Text="Movie's Name"></asp:Label>
                <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Label ID="ActorsLbl" runat="server" Text="Cast Members"></asp:Label>
                   <asp:ListBox ID="ActorLB" runat="server" SelectionMode="Multiple"></asp:ListBox>                
               </div>

               <div class="form-group">
                <asp:Label ID="ProducerLbl" runat="server" Text="Producer"></asp:Label>
                <asp:DropDownList ID="ProducerDDL" runat="server">                    
                </asp:DropDownList>
               </div>

               <div class="form-group">
                <asp:Label ID="StudioLbl" runat="server" Text="Studio"></asp:Label>
                <asp:DropDownList ID="StudioDDL" runat="server">                    
                </asp:DropDownList>
               </div>

               <div class="form-group">
                   <asp:Label ID="ReleaseDateLbl" runat="server" Text="Release Date"></asp:Label>
                <asp:TextBox ID="ReleaseDateTB" TextMode="Date" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                    <asp:CheckBox ID="AgeRestrictedCB" runat="server" />
                    <asp:Label ID="AgeRestrictedLbl" AssociatedControlID="AgeRestrictedCB" runat="server" Text="Age Restricted"></asp:Label>
               </div>

               <div class="form-group">
                <asp:Button ID="MovieSaveBtn" runat="server" Text="Add Movie" CssClass="everest-btn" OnClick="MovieSaveBtn_Click"/>
               </div>

               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>  
        </div>
    </div>
</asp:Content>

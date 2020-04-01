<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Studios.aspx.cs" Inherits="Everest_DVD.Studios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-4">
           <div class="box">
               
               <h3>Add Studio</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="NameLbl" runat="server" Text="Studio's Name"></asp:Label>
                <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Button ID="StudioSaveBtn" runat="server" Text="Add Studio" CssClass="everest-btn" OnClick="StudioSaveBtn_Click"/>
               </div>

               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>  
        </div>
        <div class="col-md-8">
            <div class="box">
                <h3>All Studios</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>

                <asp:GridView ID="StudioTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                    <asp:Label ID="Studio_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Studio's Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("studio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="producer_name"  runat="server" Text='<%# Eval("studio") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="update">Update</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CommandName="cancel">Cancel</asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="EditBtn" runat="server" CommandName="edit">Edit</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="DeleteBtn" runat="server" CommandName="delete">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div> 
    

    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producers.aspx.cs" Inherits="Everest_DVD.Producers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-4">
           <div class="box">
               
               <h3>Add Producer</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="NameLbl" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Button ID="ProducerSaveBtn" runat="server" Text="Add Producer" CssClass="everest-btn" OnClick="ProducerSaveBtn_Click"/>
               </div>

               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>  
        </div>
        <div class="col-md-8">
            <div class="box">
                <h3>All Producers</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>

                <asp:GridView ID="ProducerTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                    <asp:Label ID="producer_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("producer") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="producer_name"  runat="server" Text='<%# Eval("producer") %>'></asp:Label>
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

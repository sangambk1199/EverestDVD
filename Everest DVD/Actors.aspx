<%@ Page Title="Add Actors" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Actors.aspx.cs" Inherits="Everest_DVD.Actor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-4">
           <div class="box">
               
               <h3>Add Actors</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="NameLbl" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
               </div>
            

               <div class="form-group">
                <asp:Label ID="DOBLbl" runat="server" Text="Date of Birth"></asp:Label>
                <asp:TextBox ID="DOBTB" TextMode="Date" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Label ID="GenderLbl" runat="server" Text="Gender"></asp:Label>
                <asp:DropDownList ID="GenderDDL" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
               </div>

               <div class="form-group">
                <asp:Button ID="ActorSaveBtn" runat="server" Text="Add Actor" CssClass="everest-btn" OnClick="ActorSaveBtn_Click"/>
               </div>

               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>             
        </div>
        <div class="col-md-8">
            <div class="box">
                <h3>All Actors</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>

                <asp:GridView ID="ActorsTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="ActorsTbl_RowCancelingEdit" OnRowEditing="ActorsTbl_RowEditing" OnRowDeleting="ActorsTbl_RowDeleting" OnRowUpdating="ActorsTbl_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                    <asp:Label ID="actor_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("actor_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="actor_name"  runat="server" Text='<%# Eval("actor_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date of Birth">
                            <EditItemTemplate>
                                <asp:TextBox TextMode="Date" ID="TextBox3" runat="server" 
                                    Text='<%# Convert.ToDateTime(Eval("actor_dob")) %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="actor_dob"  runat="server" Text='<%# Eval("actor_dob") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Eval("actor_gender") %>' >
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="actor_gender"  runat="server" Text='<%# Eval("actor_gender") %>'></asp:Label>
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

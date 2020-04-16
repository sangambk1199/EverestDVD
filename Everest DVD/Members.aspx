<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="Everest_DVD.Members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-4">
           <div class="box">
               
               <h3>Add Members</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="NameLbl" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="NameTB" runat="server"></asp:TextBox>
               </div>
            
               <div class="form-group">
                   <asp:Label ID="AgeLbl" runat="server" Text="Contact Number"></asp:Label>
                <asp:TextBox ID="ContactTB" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Label ID="DOBLbl" runat="server" Text="Age"></asp:Label>
                <asp:TextBox ID="AgeTB" TextMode="Number" runat="server"></asp:TextBox>
               </div>

               <div class="form-group">
                <asp:Label ID="CategoryLbl" runat="server" Text="Category"></asp:Label>
                <asp:DropDownList ID="CategoryDDL" runat="server">                    
                </asp:DropDownList>
               </div>

               <div class="form-group">
                <asp:Button ID="MemberSaveBtn" runat="server" Text="Add Member" CssClass="everest-btn" OnClick="MemberSaveBtn_Click"/>
               </div>

               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
           </div> 
            
           <div class="box d-none">
               
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
                <h3>All Members</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>

                <asp:GridView ID="MemberTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="MemberTbl_RowCancelingEdit" OnRowEditing="MemberTbl_RowEditing" OnRowUpdating="MemberTbl_RowUpdating" OnRowDataBound="MemberTbl_RowDataBound" OnRowDeleting="MemberTbl_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                    <asp:Label ID="member_id" runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("member_full_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="member_name"  runat="server" Text='<%# Eval("member_full_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact No.">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Eval("member_contact") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="contact_no"  runat="server" Text='<%# Eval("member_contact") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age">
                            <EditItemTemplate>
                                <asp:TextBox TextMode="Number" ID="TextBox4" runat="server" 
                                    Text='<%# Eval("member_age") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="member_age"  runat="server" Text='<%# Eval("member_age") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <EditItemTemplate>
                                <asp:DropDownList ID="EditCategoryDDL" runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="member_category"  runat="server" Text='<%# Eval("Category") %>'></asp:Label>
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

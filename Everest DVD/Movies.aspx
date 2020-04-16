<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Everest_DVD.Movies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="row">
                    <div class="col-md-8">
                        <h3>All Movies</h3>
                    </div>
                    <div class="col-md-4 text-right">
                        <asp:TextBox ID="SearchBox" runat="server" CssClass="w-auto" OnTextChanged="SearchBox_TextChanged"></asp:TextBox>
                        <asp:Button ID="SearchBtn" runat="server" CssClass="everest-btn w-auto" Text="Search" OnClick="SearchBtn_Click" />
                    </div>
                </div>
                <hr />

                <asp:CheckBox ID="ShowCopies" runat="server" AutoPostBack="True" OnCheckedChanged="ShowCopies_CheckedChanged" Text="Show no. of copies" />

                <br />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

                <asp:GridView ID="MovieTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False" OnRowEditing="MovieTbl_RowEditing" OnRowCancelingEdit="MovieTbl_RowCancelingEdit" OnRowDeleting="MovieTbl_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                    <asp:Label ID="Movie_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Movie's Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("movie_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Movie_name"  runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cast">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("actors") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Actors"  runat="server" Text='<%# Eval("actors") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Producer">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("producer") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Producers"  runat="server" Text='<%# Eval("producer") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Studio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("studio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Studio"  runat="server" Text='<%# Eval("studio") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Release Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("release_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="release_date"  runat="server" Text='<%# Eval("release_date") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age Restricted">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("age_restriction") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="is_age_restricted"  runat="server" Text='<%# Eval("age_restriction") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No. of copies" Visible="false">
                            <ItemTemplate>
                                    <asp:Label ID="no_of_copies"  runat="server" Text='<%# Eval("no_of_copies") %>'></asp:Label>
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

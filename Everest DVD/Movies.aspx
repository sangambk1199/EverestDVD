<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Everest_DVD.Movies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-12">
           <div class="box">
               
               <h3>Add Movie</h3>
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
        <div class="col-md-12">
            <div class="box">
                <h3>All Movies</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>

                <asp:GridView ID="MovieTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False">
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
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cast">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("actors") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("actors") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Producer">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("producer") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("producer") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Studio">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("studio") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("studio") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Release Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("release_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("release_date") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age Restricted">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("age_restriction") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="movie_name"  runat="server" Text='<%# Eval("age_restriction") %>'></asp:Label>
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

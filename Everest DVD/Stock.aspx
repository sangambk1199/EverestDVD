<%@ Page Title="DVD Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="Everest_DVD.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <h3>All Movies</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

                <asp:GridView ID="StockTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="" Visible="false">
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
                        <asp:TemplateField HeaderText="Copy Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("copy_num") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Actors"  runat="server" Text='<%# Eval("copy_num") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DVD Rented">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("is_loaned") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Producers"  runat="server" Text='<%# Eval("is_loaned") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("dvd_price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="Studio"  runat="server" Text='<%# Eval("dvd_price") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Added">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("date_added") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                    <asp:Label ID="release_date"  runat="server" Text='<%# Eval("date_added") %>'></asp:Label>
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" 
                                    NavigateUrl='<%# String.Format("IssueDVD.aspx?movie={0}&copy={1}", Eval("id"), Eval("copy_num")) %>'
                                    runat="server" Visible='<%# Eval("is_loaned").ToString() == "False" ? true : false %>'>Issue DVD</asp:HyperLink>
                                <asp:LinkButton ID="ReturnBtn" runat="server" CommandName="select" Visible='<%# Eval("is_loaned").ToString() == "True" ? true : false %>'>Return DVD</asp:LinkButton>           
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

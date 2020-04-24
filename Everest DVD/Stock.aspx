<%@ Page Title="DVD Stock" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="Everest_DVD.Stock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="row">
                    <div class="col-md-8">
                        <h3>DVD Stock</h3>
                    </div>
                    <div class="col-md-4 text-right">
                        <asp:Label ID="Label1" runat="server" Text="Show: " CssClass="w-auto"></asp:Label>
                        <asp:DropDownList ID="FilterDDL" runat="server" CssClass="w-auto" OnSelectedIndexChanged="FilterDDL_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="all">All</asp:ListItem>
                            <asp:ListItem Value="old">Old DVDs</asp:ListItem>
                            <asp:ListItem Value="onloan">DVDs on loan</asp:ListItem>
                            <asp:ListItem Value="instock">DVDs in stock</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <hr />

                <asp:Button ID="DeleteOldBtn" runat="server" Text="Delete All DVDs" CssClass="btn-red w-auto" Visible="false" OnClick="DeleteOldBtn_Click"/>

                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

                <asp:Label ID="IssueResponse" runat="server" Text="" ClientIDMode="Static"></asp:Label>

                <asp:GridView ID="StockTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="StockTbl_SelectedIndexChanged" OnRowDataBound="StockTbl_RowDataBound">
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
                        <asp:TemplateField HeaderText="Rate per day">
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
                        <asp:TemplateField HeaderText="Issue DVD">
                            <ItemTemplate>
                                <%--asp:HyperLink ID="HyperLink1" 
                                    NavigateUrl='<%# String.Format("IssueDVD.aspx?movie={0}&copy={1}", Eval("id"), Eval("copy_num")) %>'
                                    runat="server" Visible='<%# Eval("is_loaned").ToString() == "False" ? true : false %>'>Issue DVD</asp:HyperLink--%>
                                <asp:LinkButton ID="IssueSelectBtn" runat="server" CssClass="issue_btn" CommandName="select" Visible='<%# Eval("is_loaned").ToString() == "False" ? true : false %>'>Issue DVD</asp:LinkButton>    
                                <asp:Label ID="NoDVDLbl" runat="server" Text="Rented" Visible='<%# Eval("is_loaned").ToString() == "True" ? true : false %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Operations">
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

    <div class="modal-popup">
        <asp:HiddenField ID="MovieHdn" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="CopyHdn" runat="server" ClientIDMode="Static" />
        <div class="form-group">
            <asp:Label ID="MemberLbl" runat="server" Text="Issue to"></asp:Label>
            <asp:DropDownList ID="MemberDDL" runat="server" ClientIDMode="Static"></asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="DueDateLbl" runat="server" Text="Date Due"></asp:Label>
            <asp:TextBox ID="DueDateTB" TextMode="Date" runat="server" ClientIDMode="Static"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="IssueBtn" runat="server" Text="Issue DVD" CssClass="everest-btn" ClientIDMode="Static" />
            <asp:Button ID="CancelBtn" runat="server" Text="Cancel" CssClass="cancel_btn"/>
        </div>
    </div>
</asp:Content>

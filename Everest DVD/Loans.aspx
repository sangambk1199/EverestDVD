<%@ Page Title="Loans" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loans.aspx.cs" Inherits="Everest_DVD.Loans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="row">
                    <div class="col">
                        <h3>Loan History</h3>
                        <hr />

                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

                        <asp:GridView ID="LoansTbl" runat="server" AutoGenerateColumns="False" CssClass="everest-table">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Loan_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Movie">
                                    <ItemTemplate>
                                        <asp:Label ID="Movie_name" runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Copy No."><ItemTemplate>
                                        <asp:Label ID="Copy_num" runat="server" Text='<%# Eval("copy_num") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rented by">
                                    <ItemTemplate>
                                        <asp:Label ID="Member_name" runat="server" Text='<%# Eval("member_full_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date out">
                                    <ItemTemplate>
                                        <asp:Label ID="Date_out" runat="server" Text='<%# Eval("date_out") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Due">
                                    <ItemTemplate>
                                        <asp:Label ID="Date_due" runat="server" Text='<%# Eval("date_due") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Returned">
                                    <ItemTemplate>
                                        <asp:Label ID="Date_returned" runat="server" Text='<%# Eval("date_returned") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Is returned?">
                                    <ItemTemplate>
                                        <asp:Label ID="Is_returned" runat="server" Text='<%# Eval("is_returned") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Return">
                                    <ItemTemplate>
                                        <asp:Label ID="ReturnedDvdLbl" runat="server" Text="Returned" Visible='<%# Eval("is_returned").ToString() == "Yes" ? true : false %>'></asp:Label>
                                        <asp:LinkButton ID="ReturnDvdBtn" runat="server" CssClass="return_btn" CommandName="select" Visible='<%# Eval("is_returned").ToString() == "No" ? true : false %>'>Return DVD</asp:LinkButton>    
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

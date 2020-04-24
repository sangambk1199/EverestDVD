<%@ Page Title="Find DVD Details" enableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindCopy.aspx.cs" Inherits="Everest_DVD.FindCopy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
       <div class="col-md-3">
           <div class="box">
               
               <h3>Find copy details</h3>
               <hr />
               <div class="form-group">
                   <asp:Label ID="MovieLbl" runat="server" Text="Movie Name"></asp:Label>
                   <asp:DropDownList ID="FindMovieDDL" runat="server" ClientIDMode="Static">
                   </asp:DropDownList>
               </div>
               <div class="form-group">
                   <asp:Label ID="CopyLbl" runat="server" Text="Copy No."></asp:Label>
                   <asp:HiddenField ID="CopyNumHdn" runat="server" ClientIDMode="Static" />
                   <asp:DropDownList ID="FindCopyDDL" runat="server" ClientIDMode="Static"></asp:DropDownList>
               </div>

               <div class="form-group">
                <asp:Button ID="FindCopyBtn" runat="server" Text="Find details" CssClass="everest-btn" OnClick="FindCopyBtn_Click"/>
               </div>

               <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
           </div>  
        </div>
        <div class="col-md-9">
            <div class="box">
                <h3>Loan Details</h3>
                <hr />

                <asp:Label ID="Label2" runat="server" Text="Select movie name and copy number to find copy details." Visible="true"></asp:Label>

                <asp:GridView ID="FindCopyTbl" CssClass="everest-table" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Movie">
                            <ItemTemplate>
                                <asp:Label ID="movie_name" runat="server" Text='<%# Eval("movie_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Copy No.">
                            <ItemTemplate>
                                <asp:Label ID="copy_num" runat="server" Text='<%# Eval("copy_num") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Out">
                            <ItemTemplate>
                                <asp:Label ID="date_out" runat="server" Text='<%# Eval("date_out") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Due">
                            <ItemTemplate>
                                <asp:Label ID="date_due" runat="server" Text='<%# Eval("date_due") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rented By">
                            <ItemTemplate>
                                <asp:Label ID="rented_by" runat="server" Text='<%# Eval("member_full_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Returned">
                            <ItemTemplate>
                                <asp:Label ID="is_returned" runat="server" Text='<%# Eval("is_returned") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div> 
</asp:Content>

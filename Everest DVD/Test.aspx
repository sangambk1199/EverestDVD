<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Everest_DVD.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Grid View</h2>
    <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="movie_name" HeaderText="movie_name" SortExpression="movie_name" />
            <asp:BoundField DataField="producer" HeaderText="producer" SortExpression="producer" />
            <asp:BoundField DataField="studio" HeaderText="studio" SortExpression="studio" />
            <asp:BoundField DataField="release_date" HeaderText="release_date" SortExpression="release_date" />
            <asp:BoundField DataField="age_restriction" HeaderText="age_restriction" ReadOnly="True" SortExpression="age_restriction" />
            <asp:BoundField DataField="actors" HeaderText="actors" ReadOnly="True" SortExpression="actors" />
            <asp:BoundField DataField="No. of copies" HeaderText="No. of copies" ReadOnly="True" SortExpression="No. of copies" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestDBConnectionString %>" SelectCommand="select m.id, m.movie_name, pr.producer, std.studio, m.release_date, CASE 
         WHEN m.is_age_restricted = 1 THEN 'Yes'
         ELSE 'No'
      END AS 'age_restriction',
actors= STUFF((
    SELECT ', ' + act.actor_name 
    FROM movie_cast AS mcs
	INNER JOIN actors as act on mcs.cast_member = act.id
	where mcs.movie = mc.movie
    FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, ''),
	 COUNT(ds.copy_num) as 'No. of copies'
from movies m
left join movie_cast mc on mc.movie = m.id
left join actors act on act.id = mc.cast_member
left join producers pr on pr.id = m.producer
left join studio std on std.id = m.studio
left join dvd_stock ds on m.id = ds.movie
group by m.id, m.movie_name, pr.producer, std.studio, m.release_date, m.is_age_restricted, mc.movie
order by m.release_date;"></asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

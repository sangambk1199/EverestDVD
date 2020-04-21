using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Movies : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql1 = @"select m.id, m.movie_name, pr.producer, std.studio, m.release_date, CASE 
                                WHEN m.is_age_restricted = 1 THEN 'Yes'
                                ELSE 'No'
                            END AS 'age_restriction',
                            actors= STUFF((
                                SELECT ', ' + act.actor_name 
                                FROM movie_cast AS mcs
	                            INNER JOIN actors as act on mcs.cast_member = act.id
	                            where mcs.movie = mc.movie
                                FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, ''),
	                        COUNT(ds.copy_num) as 'no_of_copies'
                            from movies m
                            left join movie_cast mc on mc.movie = m.id
                            left join actors act on act.id = mc.cast_member
                            left join producers pr on pr.id = m.producer
                            left join studio std on std.id = m.studio
                            left join dvd_stock ds on m.id = ds.movie
                            group by m.id, m.movie_name, pr.producer, std.studio, m.release_date, m.is_age_restricted, mc.movie
                            order by m.release_date desc";

            MovieTbl.DataSource = dh.getTable(sql1);
            MovieTbl.DataBind();
        }


        protected void MovieTbl_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MovieTbl.EditIndex = e.NewEditIndex;
            loadTable();
            MovieTbl.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void MovieTbl_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MovieTbl.EditIndex = -1;
            loadTable();
        }

        protected void MovieTbl_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label movieID = MovieTbl.Rows[e.RowIndex].FindControl("Movie_id") as Label;
            string deleteQuery = "delete from movie_cast where movie=" + movieID.Text;
            string deleteQuery3 = "delete from dvd_stock where movie=" + movieID.Text;
            string deleteQuery2 = "delete from movies where id=" + movieID.Text;

            dh.runQuery(deleteQuery);
            dh.runQuery(deleteQuery2);
            dh.runQuery(deleteQuery3);

            loadTable();

            Label2.Visible = true;
            Label2.Text = dh.response;

            MovieTbl.EditIndex = -1;
        }

        protected void SearchBox_TextChanged(object sender, EventArgs e)
        {
            searchTable(SearchBox.Text);            
        }

        protected void searchTable(string actorsName)
        {
            if (actorsName != "")
            {
                Label2.Visible = true;
                Label2.Text = "Showing results for: '" + actorsName + "'";

                string sql1 = $@"select m.id, m.movie_name, pr.producer, std.studio, m.release_date, CASE 
                                        WHEN m.is_age_restricted = 1 THEN 'Yes'
                                        ELSE 'No'
                                    END AS 'age_restriction',
                            actors= STUFF((
                                SELECT ', ' + act.actor_name 
                                FROM movie_cast AS mcs
	                            INNER JOIN actors as act on mcs.cast_member = act.id
	                            where mcs.movie = mc.movie
                                FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, ''),
	                                COUNT(ds.copy_num) as 'no_of_copies'
                            from movies m
                            left join movie_cast mc on mc.movie = m.id
                            left join actors act on act.id = mc.cast_member
                            left join producers pr on pr.id = m.producer
                            left join studio std on std.id = m.studio
                            left join dvd_stock ds on m.id = ds.movie
                            WHERE act.actor_name LIKE '%{actorsName}%' or act.id LIKE '{actorsName}'
                            group by m.id, m.movie_name, pr.producer, std.studio, m.release_date, m.is_age_restricted, mc.movie
                            order by m.release_date desc";

                MovieTbl.DataSource = dh.getTable(sql1);
                MovieTbl.DataBind();
            }
            else
            {
                Label2.Visible = false;
                loadTable();
            }
            
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            searchTable(SearchBox.Text);
        }

        protected void ShowCopies_CheckedChanged(object sender, EventArgs e)
        {
            if(ShowCopies.Checked)
            {
                MovieTbl.Columns[7].Visible = true;
            } else
            {
                MovieTbl.Columns[7].Visible = false;
            }
        }
    }
}
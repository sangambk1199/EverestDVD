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
            string sql1 = @"select m.id, m.movie_name, m.producer, m.studio, m.release_date, CASE 
         WHEN m.is_age_restricted = 1 THEN 'Yes'
         ELSE 'No'
      END AS 'age_restriction',
actors= STUFF((
    SELECT ', ' + act.actor_name 
    FROM movie_cast AS mcs
	INNER JOIN actors as act on mcs.cast_member = act.id
	where mcs.movie = mc.movie
    FOR XML PATH, TYPE).value(N'.[1]', N'varchar(max)'), 1, 2, '') 
from movies m
left join movie_cast mc on mc.movie = m.id
left join actors act on act.id = mc.cast_member
group by m.id, m.movie_name, m.producer, m.studio, m.release_date, m.is_age_restricted, mc.movie
order by m.release_date";

            string sql2 = "SELECT * FROM producers";
            string sql3 = "SELECT * FROM studio";
            string sql4 = "SELECT * FROM actors";

            MovieTbl.DataSource = dh.getTable(sql1);
            MovieTbl.DataBind();

            ProducerDDL.DataSource = dh.getTable(sql2);
            ProducerDDL.DataTextField = "producer";
            ProducerDDL.DataValueField = "id";
            ProducerDDL.DataBind();

            StudioDDL.DataSource = dh.getTable(sql3);
            StudioDDL.DataTextField = "studio";
            StudioDDL.DataValueField = "id";
            StudioDDL.DataBind();

            ActorLB.DataSource = dh.getTable(sql4);
            ActorLB.DataTextField = "actor_name";
            ActorLB.DataValueField = "id";
            ActorLB.DataBind();
        }

        protected void MovieSaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO movies (movie_name, producer, studio, release_date, is_age_restricted) OUTPUT INSERTED.ID  values ('{NameTB.Text.Trim()}', '{ProducerDDL.Text.Trim()}', '{StudioDDL.Text.Trim()}', '{ReleaseDateTB.Text.Trim()}', {(AgeRestrictedCB.Checked ? 1 : 0)})";
            dh.saveData(sql);

            Label1.Visible = true;

            int movieId = dh.identity;
            Label1.Text = movieId.ToString(); // dh.response;

            if (movieId != 0)
            {
                foreach (ListItem item in ActorLB.Items)
                {
                    if (item.Selected)
                    {
                        string sql1 = $@"INSERT INTO movie_cast values ({movieId}, '{item.Value.Trim()}')";
                        dh.saveData(sql1);

                        Label1.Text = sql1; // dh.response;
                    }
                }
            }



            dh.ClearTextBoxes(Page);

            loadTable();
        }
    }
}
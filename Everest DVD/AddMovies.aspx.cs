using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class AddMovies : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadGrid();
        }

        private void loadGrid()
        {
            string sql2 = "SELECT * FROM producers";
            string sql3 = "SELECT * FROM studio";
            string sql4 = "SELECT * FROM actors";

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
                Label1.Text = movieId.ToString() + "..."; 
                foreach (ListItem item in ActorLB.Items)
                {
                    Label1.Text += item.Value.Trim();
                    if (item.Selected)
                    {
                        string sql1 = $@"INSERT INTO movie_cast values ({movieId}, '{item.Value.Trim()}')";
                        dh.saveData(sql1);

                        Label1.Text = sql1; // dh.response;
                    } else
                    {
                        Label1.Text += item.Text + "Not"; // dh.response;
                    }
                }
            }



            dh.ClearTextBoxes(Page);
        }
    }
}
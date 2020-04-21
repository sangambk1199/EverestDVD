using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class AddDVDStock : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadGrid();
        }
        private void loadGrid()
        {
            string sql = "SELECT * FROM movies";

            MovieDDL.DataSource = dh.getTable(sql);
            MovieDDL.DataTextField = "movie_name";
            MovieDDL.DataValueField = "id";
            MovieDDL.DataBind();
        }

        protected void DVDSaveBtn_Click(object sender, EventArgs e)
        {
            int noOfCopies = int.Parse(CopiesTB.Text);

            for (int i = 1; i <= noOfCopies; i++)
            {
                string sql = $@"INSERT INTO dvd_stock (movie, copy_num, is_loaned, dvd_price, date_added) values ('{MovieDDL.Text.Trim()}', '{i}', 0, '{PriceTB.Text.Trim()}', GETDATE())";
                dh.runQuery(sql);
            }            

            Label1.Visible = true;
            Label1.Text = dh.response;

            dh.ClearTextBoxes(Page);
        }
    }
}
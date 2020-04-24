using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class FindCopy : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                loadGrid();
            }
        }

        private void loadGrid()
        {
            string sql = "SELECT id, movie_name FROM movies";

            FindMovieDDL.DataSource = dh.getTable(sql);
            FindMovieDDL.DataTextField = "movie_name";
            FindMovieDDL.DataValueField = "id";
            FindMovieDDL.DataBind();
        }

        private void showGrid(string movie, string copy)
        {
            string sql = $@"select distinct m.movie_name, ds.copy_num, l.date_out, l.date_due, mem.member_full_name,
                            CASE 
                                WHEN l.date_returned is null THEN 'No'
                                ELSE 'Yes'
                            END AS 'is_returned'
                            from loans l
                            left join movies m on m.id = l.movie
                            left join dvd_stock ds on ds.copy_num = l.copy_num
                            left join members mem on mem.member_id = l.member_num
                            WHERE l.movie={movie} and l.copy_num={copy} and 
                            date_out = (SELECT MAX(date_out) FROM loans l WHERE l.movie={movie} and l.copy_num={copy})";

            FindCopyTbl.DataSource = dh.getTable(sql);
            FindCopyTbl.DataBind();
        }

        protected void FindCopyBtn_Click(object sender, EventArgs e)
        {
            //DropDownList ddl = (DropDownList)this.FindControl("FindCopyDDL");
            //Response.Write("ksafja;'");
            string movieId = FindMovieDDL.SelectedValue;
            string copyNum = CopyNumHdn.Value;
            //string copyNum = FindCopyDDL.Text;



            showGrid(movieId, copyNum);
        }
    }
}
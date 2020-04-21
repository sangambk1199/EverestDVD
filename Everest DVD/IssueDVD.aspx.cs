using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class IssueDVD : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {            

            

            if (Request.QueryString["movie"] != null
                && Request.QueryString["copy"] != null
                && Request.QueryString["member"] != null
                && Request.QueryString["dateDue"] != null)
            {
                var movie = Request.QueryString["movie"];
                var copy = Request.QueryString["copy"];
                var member = Request.QueryString["member"];
                var dateDue = Request.QueryString["dateDue"];

                string sql = $@"insert into loans (movie, copy_num, member_num, date_out, date_due) values ({movie}, {copy}, {member}, GETDATE(), '{dateDue}')";
                dh.runQuery(sql);

                string sql2 = $@"UPDATE dvd_stock SET is_loaned = 1 WHERE movie = {movie} and copy_num = {copy}";
                dh.runQuery(sql2);

                Response.Write(dh.response);
                /*Response.Write("Copy: " + Request.QueryString["copy"]);
                Response.Write("Member: " + Request.QueryString["member"]);
                Response.Write("Date Due: " + Request.QueryString["dateDue"]);*/
                Response.End();
            } else
            {
                Response.Write("Error");
                Response.End();
            }
            
        }
    }
}
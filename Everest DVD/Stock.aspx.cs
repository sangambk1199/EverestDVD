using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Stock : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql1 = @"select m.id, m.movie_name, copy_num, is_loaned, dvd_price, date_added
                            from dvd_stock
                            left join movies m on m.id = dvd_stock.movie";

            string sql2 = @"select distinct m.member_id, m.member_full_name
                            from members m
                            inner join membership_category mc on mc.id = m.membership_category
                            inner join loans l on l.member_num = m.member_id
                            group by m.member_id, m.member_full_name, mc.max_dvd_loans
                            having COUNT(l.member_num) < mc.max_dvd_loans
                            order by m.member_full_name";

            StockTbl.DataSource = dh.getTable(sql1);
            StockTbl.DataBind();

            MemberDDL.DataSource = dh.getTable(sql2);
            MemberDDL.DataTextField = "member_full_name";
            MemberDDL.DataValueField = "member_id";
            MemberDDL.DataBind();
        }

        protected void StockTbl_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void StockTbl_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                LinkButton issueBtn = e.Row.FindControl("IssueSelectBtn") as LinkButton;
                
                    
                DataRowView dr = e.Row.DataItem as DataRowView;
                issueBtn.Attributes.Add("data-movie", dr["id"].ToString());
                issueBtn.Attributes.Add("data-copy", dr["copy_num"].ToString());
            }
        }

        protected void FilterDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            DeleteOldBtn.Visible = false;

            if (FilterDDL.SelectedValue == "all")
            {
                loadTable();
            } 
            else if (FilterDDL.SelectedValue == "old")
            {
                string sql = @"select m.id, m.movie_name, copy_num, is_loaned, dvd_price, date_added
                        from dvd_stock
                        left join movies m on m.id = dvd_stock.movie
                        where date_added < GETDATE() - 365";

                StockTbl.DataSource = dh.getTable(sql);
                StockTbl.DataBind();

                DeleteOldBtn.Visible = true;
            }
            else if (FilterDDL.SelectedValue == "onloan")
            {
                string sql = @"select m.id, m.movie_name, copy_num, is_loaned, dvd_price, date_added
                        from dvd_stock
                        left join movies m on m.id = dvd_stock.movie
                        where is_loaned = 1";

                StockTbl.DataSource = dh.getTable(sql);
                StockTbl.DataBind();
            }
            else if (FilterDDL.SelectedValue == "instock")
            {
                string sql = @"select m.id, m.movie_name, copy_num, is_loaned, dvd_price, date_added
                        from dvd_stock
                        left join movies m on m.id = dvd_stock.movie 
                        where is_loaned = 0";

                StockTbl.DataSource = dh.getTable(sql);
                StockTbl.DataBind();
            }            
        }

        protected void DeleteOldBtn_Click(object sender, EventArgs e)
        {
            string sql = @"delete from dvd_stock where date_added < (GETDATE() - 365)";
            dh.runQuery(sql);

            Label2.Visible = true;
            Label2.Text = dh.response;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Loans : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql1 = @"SELECT DISTINCT l.id, m.movie_name, ds.copy_num, 
                            mem.member_full_name, l.date_out, l.date_due, l.date_returned,
                            CASE 
                                WHEN l.date_returned is null THEN 'No'
                                ELSE 'Yes'
                            END AS 'is_returned'
                            from loans l
                            left join movies m on m.id = l.movie
                            left join dvd_stock ds on ds.copy_num = l.copy_num
                            left join members mem on mem.member_id = l.member_num";

            LoansTbl.DataSource = dh.getTable(sql1);
            LoansTbl.DataBind();
        }
    }
}
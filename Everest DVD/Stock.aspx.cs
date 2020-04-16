using System;
using System.Collections.Generic;
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

            StockTbl.DataSource = dh.getTable(sql1);
            StockTbl.DataBind();
        }
    }
}
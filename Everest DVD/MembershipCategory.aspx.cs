using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class MembershipCategory : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql1 = "select * from membership_category";

            CategoryTbl.DataSource = dh.getTable(sql1);
            CategoryTbl.DataBind();
        }

        protected void CategorySaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO membership_category(mem_title, max_dvd_loans) values('{CategoryNameTB.Text.Trim()}', '{MaxDVDTB.Text.Trim()}')";
            dh.runQuery(sql);

            Label1.Visible = true;
            Label1.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }
    }
}
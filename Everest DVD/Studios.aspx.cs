using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Studios : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql = "SELECT * FROM studio";
            StudioTbl.DataSource = dh.getTable(sql);
            StudioTbl.DataBind();
        }

        protected void StudioSaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO studio (studio) values ('{NameTB.Text.Trim()}')";
            dh.saveData(sql);

            Label1.Visible = true;
            Label1.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }
    }
}
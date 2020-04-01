using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Producers : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql1 = "select * from producers";
            ProducerTbl.DataSource = dh.getTable(sql1);
            ProducerTbl.DataBind();
        }

        protected void ProducerSaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO producers (producer) values ('{NameTB.Text.Trim()}') ";
            dh.saveData(sql);

            Label1.Visible = true;
            Label1.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }
    }
}
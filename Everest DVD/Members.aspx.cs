using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Members : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void loadTable()
        {
            string sql1 = "select m.member_id, m.member_full_name, m.member_contact, m.member_age, mc.mem_title AS 'Category' from members m join membership_category mc on m.membership_category = mc.id";
            string sql2 = "SELECT * FROM membership_category";

            MemberTbl.DataSource = dh.getTable(sql1);
            MemberTbl.DataBind();

            CategoryDDL.DataSource = dh.getTable(sql2);
            CategoryDDL.DataTextField = "mem_title";
            CategoryDDL.DataValueField = "id";
            CategoryDDL.DataBind();
        }

        protected void CategorySaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO membership_category(mem_title, max_dvd_loans) values('{CategoryNameTB.Text.Trim()}', '{MaxDVDTB.Text.Trim()}')";
            dh.saveData(sql);

            Label2.Visible = true;
            Label2.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }

        protected void MemberSaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO members(member_full_name, member_contact, member_age, membership_category) values('{NameTB.Text.Trim()}', '{ContactTB.Text.Trim()}', '{AgeTB.Text.Trim()}', '{CategoryDDL.Text.Trim()}')";
            dh.saveData(sql);

            Label2.Visible = true;
            Label2.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
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
            string sql1 = "select m.member_id, m.member_full_name, m.member_contact, m.member_age, m.membership_category, mc.mem_title AS 'Category' from members m join membership_category mc on m.membership_category = mc.id";
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
            dh.runQuery(sql);

            Label2.Visible = true;
            Label2.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }

        protected void MemberSaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO members(member_full_name, member_contact, member_age, membership_category) values('{NameTB.Text.Trim()}', '{ContactTB.Text.Trim()}', '{AgeTB.Text.Trim()}', '{CategoryDDL.Text.Trim()}')";
            dh.runQuery(sql);

            Label2.Visible = true;
            Label2.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }

        protected void MemberTbl_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MemberTbl.EditIndex = e.NewEditIndex;
            loadTable();
            MemberTbl.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void MemberTbl_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MemberTbl.EditIndex = -1;
            loadTable();
        }

        protected void MemberTbl_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label memberID = MemberTbl.Rows[e.RowIndex].FindControl("member_id") as Label;
            TextBox memberName = MemberTbl.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox memberContact = MemberTbl.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox memberAge = MemberTbl.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            DropDownList memberCategory = MemberTbl.Rows[e.RowIndex].FindControl("EditCategoryDDL") as DropDownList;

            string updateQuery = "UPDATE members SET member_full_name='" + memberName.Text + "', member_contact='" + memberContact.Text + "', member_age=" + memberAge.Text + ", membership_category=" + memberCategory.SelectedValue + " where member_id=" + memberID.Text;
            dh.runQuery(updateQuery);
            MemberTbl.EditIndex = -1;

            Label2.Visible = true;
            Label2.Text = "Row edited";
            /*if(dh.response == "Success")
            {
                Label2.Text = dh.response + "Row edited successfully";
            } else
            {
                Label2.Text = dh.response + "Task Failed!";
            }*/

            loadTable();
        }

        protected void MemberTbl_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList memberCategory = (DropDownList)e.Row.Cells[5].FindControl("EditCategoryDDL");

                    //return DataTable havinf department data
                    string sql2 = "SELECT * FROM membership_category";

                    memberCategory.DataSource = dh.getTable(sql2);
                    memberCategory.DataTextField = "mem_title";
                    memberCategory.DataValueField = "id";
                    memberCategory.DataBind();

                    DataRowView dr = e.Row.DataItem as DataRowView;
                    memberCategory.SelectedValue = dr["membership_category"].ToString();
                }
            }
        }

        protected void MemberTbl_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label memberID = MemberTbl.Rows[e.RowIndex].FindControl("member_id") as Label;
            string deleteQuery = "delete from members where member_id=" + memberID.Text;

            dh.runQuery(deleteQuery);

            loadTable();

            Label2.Visible = true;
            Label2.Text = "Row deleted successfully";

            MemberTbl.EditIndex = -1;
        }
    }
}
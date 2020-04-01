using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class Actor : System.Web.UI.Page
    {

        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadTable();
        }

        protected void ActorSaveBtn_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO actors(actor_name, actor_dob, actor_gender) values('{NameTB.Text.Trim()}', '{DOBTB.Text.Trim()}', '{GenderDDL.Text.Trim()}')";
            dh.saveData(sql);

            Label1.Visible = true;
            Label1.Text = dh.response;

            dh.ClearTextBoxes(Page);

            loadTable();
        }

        protected void loadTable()
        {
            string sql = "SELECT * FROM actors";
            ActorsTbl.DataSource = dh.getTable(sql);
            ActorsTbl.DataBind();
        }

        protected void ActorsTbl_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ActorsTbl.EditIndex = e.NewEditIndex;
            loadTable();
            ActorsTbl.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void ActorsTbl_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ActorsTbl.EditIndex = -1;
            loadTable();
        }

        protected void ActorsTbl_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            Label actorID = ActorsTbl.Rows[e.RowIndex].FindControl("actor_id") as Label;
            TextBox actorName = ActorsTbl.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox actorDOB = ActorsTbl.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            DropDownList actorGender = ActorsTbl.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;

            string updateQuery = "UPDATE actors SET actor_name='" + actorName.Text + "', actor_dob='" + actorDOB.Text + "', actor_gender='" + actorGender.Text + "' where id=" + actorID.Text;

            Label2.Visible = true;
            Label2.Text = "Row edited successfully";

            dh.saveData(updateQuery);

            ActorsTbl.EditIndex = -1;

            loadTable();

        }

        protected void ActorsTbl_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label actorId = ActorsTbl.Rows[e.RowIndex].FindControl("actor_id") as Label;
            string deleteQuery = "delete from actors where id=" + actorId.Text;

            dh.saveData(deleteQuery);

            loadTable();

            Label2.Visible = true;
            Label2.Text = "Row deleted successfully";

            ActorsTbl.EditIndex = -1;

        }
    }
}
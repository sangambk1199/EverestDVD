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
            if (!IsPostBack) loadGrid();
        }

        private void loadGrid()
        {
            string sql2 = "SELECT * FROM producers";
            string sql3 = "SELECT * FROM studio";
            string sql4 = "SELECT * FROM actors";

            ProducerDDL.DataSource = dh.getTable(sql2);
            ProducerDDL.DataTextField = "producer";
            ProducerDDL.DataValueField = "id";
            ProducerDDL.DataBind();

            StudioDDL.DataSource = dh.getTable(sql3);
            StudioDDL.DataTextField = "studio";
            StudioDDL.DataValueField = "id";
            StudioDDL.DataBind();

            ActorLB.DataSource = dh.getTable(sql4);
            ActorLB.DataTextField = "actor_name";
            ActorLB.DataValueField = "id";
            ActorLB.DataBind();
        }
    }
}
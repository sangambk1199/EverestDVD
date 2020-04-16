using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class LoginPage : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (Session["user_id"] != null)
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = $@"SELECT * FROM users WHERE user_name = '{TextBox1.Text.Trim()}' AND user_password='{TextBox2.Text.Trim()}'";


            string[] userInfo = dh.loginUser(sql);

            if (userInfo != null)
            {
                Session["user_id"] = userInfo[0];
                Session["user_name"] = userInfo[1];
                Session["user_role"] = userInfo[2];

                Response.Redirect("Default.aspx", false);
            }
            else
            {
                Label1.Text = dh.response;
            }
        }
    }
}
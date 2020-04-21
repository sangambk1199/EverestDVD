using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class SignUp : System.Web.UI.Page
    {
        DataHandler dh = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = $@"INSERT INTO users (user_name, full_name, user_email, user_password, user_role) values ('{TextBox1.Text.Trim()}', '{TextBox2.Text.Trim()}', '{TextBox3.Text.Trim()}', '{TextBox4.Text.Trim()}', 3)";


            dh.runQuery(sql);
            
            Label5.Text = dh.response;

        }

        
    }
}
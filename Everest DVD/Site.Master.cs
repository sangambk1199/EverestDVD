using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Everest_DVD
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            if (Session["user_id"] == null || Session["user_name"] == null || Session["user_role"] == null)
            {

                if(currentPage.ToLower() != "login" 
                    && currentPage.ToLower() != "signup"
                    && currentPage.ToLower() != "404")
                {
                    //Response.Redirect("LoginPage", false);
                }                
            } else
            {
                int userRole = Convert.ToInt32(Session["user_role"]);
                if (userRole == 3 && 
                    (currentPage.ToLower() != "stock" 
                    && currentPage.ToLower() != "default"
                    && currentPage.ToLower() != "default.aspx"
                    && currentPage.ToLower() != "404"))
                {
                    Response.Redirect("404", false);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["user_id"] = null;
            Session["user_name"] = null;
            Session["user_role"] = null;

            Response.Redirect("Login", false);
        }
    }
}
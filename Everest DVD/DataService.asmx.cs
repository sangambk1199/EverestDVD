using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;


namespace Everest_DVD
{
    /// <summary>
    /// Summary description for DataService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DataService : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetCopies(int movieId)
        {
            string cs = ConfigurationManager.ConnectionStrings["everestConn"].ConnectionString;
            List <Copies> copies = new List<Copies>();

            SqlConnection con = new SqlConnection(cs);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            SqlCommand cmd = new SqlCommand("getCopyNumbers", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param = new SqlParameter()
            {
                ParameterName = "@movie_id",
                Value = movieId
            };

            cmd.Parameters.Add(param);

            SqlDataReader dr = cmd.ExecuteReader();

            while(dr.Read())
            {
                Copies copy = new Copies();
                copy.copy_num = Convert.ToInt32(dr["copy_num"]);
                copies.Add(copy);
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(copies));
        }
    }

    public class Copies
    {
        public int copy_num { get; set; }
    }
}

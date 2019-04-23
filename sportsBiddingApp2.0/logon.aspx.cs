using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace sportsBiddingApp2._0
{
    public partial class logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C: \Users\toroc\Desktop\Begos studd\DataBases\sportsBiddingApp2.0\sportsBiddingApp2.0\App_Data\sportsDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework");
            SqlCommand cmd = new SqlCommand("select * from User_Admin_Table where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                HttpCookie cookie = new HttpCookie("Login");
                cookie["username"] = dt.Rows[3]["username"].ToString();
                cookie["Admin_Account"] = dt.Rows[6]["Admin_Account"].ToString();
                Response.Cookies.Add(cookie);


                if (dt.Rows[6]["Admin_Account"].ToString() == "1")
                {
                    Response.Redirect("Default.aspx");
                }

            }
            else
            {
                
            }
        }
    }
}
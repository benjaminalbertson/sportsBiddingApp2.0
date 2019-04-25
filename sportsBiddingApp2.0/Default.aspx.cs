using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Entity;


namespace sportsBiddingApp2._0
{
    public partial class _Default : Page
    {
        sportsDBEntities dbcon = new sportsDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            dbcon.User_Admin_Tables.Load();
            User_Admin_Table myPerson = (from x in dbcon.User_Admin_Tables.Local
                                         where x.username.Trim().Equals(User.Identity.Name)
                                         select x).FirstOrDefault();

            //Label1.Text = Session["name"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
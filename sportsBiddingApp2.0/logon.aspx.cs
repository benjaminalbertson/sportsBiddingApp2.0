using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.UI.Security;
using System.Data.Entity;
using System.Data.SqlClient;

namespace sportsBiddingApp2._0
{
    public partial class logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        sportsDBEntities dbcon = new sportsDBEntities();

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string name = Login1.UserName.Trim();
            string pass = Login1.Password.Trim();

            dbcon.User_Admin_Tables.Load();

            User_Admin_Table myPerson = (from x in dbcon.User_Admin_Tables.Local
                                         where x.username.Trim().Equals(name) &&
                                         x.password.Trim().Equals(pass)
                                         select x).FirstOrDefault();

            //int role = myPerson.Admin_Account;
            
            Response.Redirect("~/Default.aspx");
        }
    }
}
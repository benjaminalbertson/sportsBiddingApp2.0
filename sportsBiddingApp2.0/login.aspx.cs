using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.UI.Security;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Web.Security;

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

            foreach (User_Admin_Table x in dbcon.User_Admin_Tables)
            {
                if (Login1.UserName.Equals(x.username) && Login1.Password.Equals(x.password))
                {
                    User_Admin_Table myPerson = (from y in dbcon.User_Admin_Tables.Local
                                                 where y.username.Trim().Equals(name) &&
                                                 y.password.Trim().Equals(pass)
                                                 select y).FirstOrDefault();

                    //int role = myPerson.Admin_Account;
                    Session.Add("iD", myPerson.Id);
                    Session.Add("name", myPerson.FirstName);
                    Session.Add("balance", myPerson.Balance);
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
                    if (myPerson.Admin_Account == 1)
                    {
                        Response.Redirect("~/Admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
            }

            
            
        }
    }
}
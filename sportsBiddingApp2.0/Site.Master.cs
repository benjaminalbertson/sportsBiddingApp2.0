using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sportsBiddingApp2._0
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
                Label1.Text = Session["name"].ToString();
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }
    }
}
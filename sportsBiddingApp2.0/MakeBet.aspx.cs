using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace sportsBiddingApp2._0
{
    public partial class MakeBet : System.Web.UI.Page
    {
        sportsDBEntities dbcon = new sportsDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int matchId = Convert.ToInt32(TextBox1.Text);
            string team = DropDownList1.SelectedItem.Text;
            decimal amount = Convert.ToDecimal(TextBox2.Text);

        }
    }
}
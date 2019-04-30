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
    public partial class Admin : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedDataKey.Value != null)
            {
                int id = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());

                Sports_Table game = (from x in dbcon.Sports_Tables
                                     where x.Match_ID == id
                                     select x).First();

                if (DropDownList1.SelectedValue.Equals("Home"))
                {
                    game.Home_Winner = 1;
                    game.Away_Winner = 0;
                }
                else
                {
                    game.Home_Winner = 0;
                    game.Away_Winner = 1;
                }



                dbcon.SaveChanges();
                GridView1.DataBind();
                GridView2.DataBind();
            }

       
        }
    }
}
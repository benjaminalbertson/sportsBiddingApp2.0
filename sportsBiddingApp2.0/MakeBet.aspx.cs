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
            int userId = Convert.ToInt32(HttpContext.Current.Session["iD"]);

            Bet newBet = new Bet
            {
                MatchId = matchId,
                HomeAway = team,
                BetAmount = amount,
                UserId = userId
            };

            User_Admin_Table bettingPerson = (from x in dbcon.User_Admin_Tables
                                              where x.Id == userId
                                              select x).First();

            bettingPerson.Balance -= amount;

            dbcon.Bets.Add(newBet);
            dbcon.SaveChanges();
            GridView1.DataBind();

        }
    }
}
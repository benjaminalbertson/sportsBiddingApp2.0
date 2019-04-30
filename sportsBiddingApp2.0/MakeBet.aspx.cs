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
            int userId = Convert.ToInt32(HttpContext.Current.Session["iD"]);

            User_Admin_Table bettingPerson = (from x in dbcon.User_Admin_Tables
                                              where x.Id == userId
                                              select x).First();

            Label4.Text = bettingPerson.Balance.ToString();
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
            
            //verifies that the person has enough money
            if (bettingPerson.Balance >= amount)
            {
                bettingPerson.Balance -= amount;

                dbcon.Bets.Add(newBet);
                dbcon.SaveChanges();
                GridView1.DataBind();

                Label2.Text = "";
                Label4.Text = bettingPerson.Balance.ToString();
            }
            else
            {
                Label2.Text = "You do not have enough funds.";
            }

        }
    }
}
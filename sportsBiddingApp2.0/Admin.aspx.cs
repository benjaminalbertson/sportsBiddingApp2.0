using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data.Entity;
using System.Web.Security;

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
            //first checks if there is anything selected in the grid
            if (GridView1.SelectedDataKey.Value != null)
            {
                int id = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
                //grabs the game using the id
                Sports_Table game = (from x in dbcon.Sports_Tables
                                     where x.Match_ID == id
                                     select x).First();
                //if the admin clicks the button when the dropdown is on home
                if (DropDownList1.SelectedValue.Equals("Home"))
                {
                    //sets the values of the winner
                    game.Home_Winner = 1;
                    game.Away_Winner = 0;

                    //goes through each bet
                    foreach (Bet x in dbcon.Bets)
                    {
                        //if the bet has the same match id as the match that is selected
                        if (x.MatchId == game.Match_ID)
                        {
                            //grabs the person that made the bet
                            User_Admin_Table person = (from y in dbcon.User_Admin_Tables
                                                       where y.Id == x.UserId
                                                       select y).First();


                            //if the bet is correct, assigns the correct amount to winnings and adds to the persons balance
                            if (x.HomeAway.Equals("Home")) {
                                x.Winnings = x.BetAmount * game.H__win;
                                person.Balance = person.Balance + Convert.ToDecimal(x.Winnings);
                            }
                            //if not right, simply sets winnings to 0
                            else
                            {
                                x.Winnings = 0;
                            }
                        }
                    }
                }
                //when the admin clicks the button when the dropdown is on away
                //same as above except for if away wins
                else
                {
                    game.Home_Winner = 0;
                    game.Away_Winner = 1;

                    foreach (Bet x in dbcon.Bets)
                    {
                        if (x.MatchId == game.Match_ID)
                        {
                            User_Admin_Table person = (from y in dbcon.User_Admin_Tables
                                                       where y.Id == x.UserId
                                                       select y).First();

                            if (x.HomeAway.Equals("Away"))
                            {
                                x.Winnings = x.BetAmount * game.A__win;
                                person.Balance = person.Balance + Convert.ToDecimal(x.Winnings);
                            }
                            else
                            {
                                x.Winnings = 0;
                            }
                        }
                    }
                }

                
                //saves changes and updates the grids
                dbcon.SaveChanges();
                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
            }
            else
            {

            }
       
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //logging out
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            Session.Clear();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //adding a game
            string homeTeam = TextBox1.Text;
            string awayTeam = TextBox2.Text;
            decimal homeOdds = Convert.ToDecimal(TextBox3.Text);
            decimal awayOdds = Convert.ToDecimal(TextBox4.Text);

            Sports_Table newGame = new Sports_Table
            {
                Home = homeTeam,
                Away = awayTeam,
                H__win = homeOdds,
                A__win = awayOdds,          
            };
            

            dbcon.Sports_Tables.Add(newGame);
            dbcon.SaveChanges();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
        }
    }
}
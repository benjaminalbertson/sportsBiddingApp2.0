<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="sportsBiddingApp2._0.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 99%; height: 26px;">
        <tr>
            <td style="height: 20px; width: 1229px;">Admin<br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Games"></asp:Label>
                :<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Match ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="643px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home" />
                        <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away" />
                        <asp:BoundField DataField="H% win" HeaderText="H% win" SortExpression="H% win" />
                        <asp:BoundField DataField="A% win" HeaderText="A% win" SortExpression="A% win" />
                        <asp:BoundField DataField="Home Winner" HeaderText="Home Winner" SortExpression="Home Winner" />
                        <asp:BoundField DataField="Away Winner" HeaderText="Away Winner" SortExpression="Away Winner" />
                        <asp:BoundField DataField="Match ID" HeaderText="Match ID" ReadOnly="True" SortExpression="Match ID" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT * FROM [Sports Table]"></asp:SqlDataSource>
                <br />
                PIck Winner:<br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Home</asp:ListItem>
                    <asp:ListItem>Away</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Set Winner" />
                <br />
                <br />
                --------------------------------<br />
                <br />
                Add A Game:<br />
                <asp:Label ID="Label4" runat="server" Text="Home Team:"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Away Team:"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Home Odds:"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Away Odds:"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add Game" />
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Bets"></asp:Label>
                :<br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" Width="440px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="MatchId" HeaderText="MatchId" SortExpression="MatchId" />
                        <asp:BoundField DataField="HomeAway" HeaderText="HomeAway" SortExpression="HomeAway" />
                        <asp:BoundField DataField="BetAmount" HeaderText="BetAmount" SortExpression="BetAmount" />
                        <asp:BoundField DataField="Winnings" HeaderText="Winnings" SortExpression="Winnings" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT * FROM [Bet]"></asp:SqlDataSource>
                <br />
                Users:<br />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="607px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                        <asp:BoundField DataField="Admin Account" HeaderText="Admin Account" SortExpression="Admin Account" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT * FROM [User Admin Table]"></asp:SqlDataSource>
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Log Out" />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td class="text-right" style="height: 20px; width: 1377px">&nbsp;</td>
            <td style="height: 20px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

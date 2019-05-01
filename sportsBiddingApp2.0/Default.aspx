<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sportsBiddingApp2._0._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%; height: 36px;">
        <tr>
            <td style="width: 222px; height: 12px">Your Bets:<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,Match ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="771px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="MatchId" HeaderText="MatchId" SortExpression="MatchId" />
                        <asp:BoundField DataField="HomeAway" HeaderText="HomeAway" SortExpression="HomeAway" />
                        <asp:BoundField DataField="BetAmount" HeaderText="BetAmount" SortExpression="BetAmount" />
                        <asp:BoundField DataField="Winnings" HeaderText="Winnings" SortExpression="Winnings" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                        <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home" />
                        <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT Bet.Id, Bet.MatchId, Bet.HomeAway, Bet.BetAmount, Bet.Winnings, Bet.UserId, [Sports Table].Home, [Sports Table].Away, [Sports Table].[Match ID] FROM Bet INNER JOIN [Sports Table] ON Bet.MatchId = [Sports Table].[Match ID] WHERE (Bet.UserId = @UserId)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="iD" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Log Out" />
            </td>
            <td class="text-right" style="width: 307px; height: 12px">&nbsp;</td>
            <td style="height: 12px">
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeBet.aspx.cs" Inherits="sportsBiddingApp2._0.MakeBet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-size: xx-large">
        Available Games</p>
    <p style="font-size: xx-large">
        &nbsp;</p>
    <p style="font-size: xx-large">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Match_ID" DataSourceID="SqlDataSource1" style="font-size: medium">
            <Columns>
                <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home" />
                <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away" />
                <asp:BoundField DataField="column1" HeaderText="column1" SortExpression="column1" />
                <asp:BoundField DataField="column2" HeaderText="column2" SortExpression="column2" />
                <asp:BoundField DataField="Match_ID" HeaderText="Match_ID" InsertVisible="False" ReadOnly="True" SortExpression="Match_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT [Home], [Away], [H% win] AS column1, [A% win] AS column2, [Match ID] AS Match_ID FROM [Sports Table]"></asp:SqlDataSource>
    </p>
    <p style="font-size: medium">
        Match ID:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="36px"></asp:TextBox>
    </p>
    <p style="font-size: medium">
        Select Team:&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Home</asp:ListItem>
            <asp:ListItem>Away</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p style="font-size: medium">
        Enter amount to bet:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Width="50px"></asp:TextBox>
    </p>
    <p style="font-size: medium">
        <asp:Button ID="Button1" runat="server" Text="Make Bet" />
    </p>
</asp:Content>

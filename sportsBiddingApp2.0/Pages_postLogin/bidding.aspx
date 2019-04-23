<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="bidding.aspx.cs" Inherits="sportsBiddingApp2._0.Pages_postLogin.bidding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-4">
            <h2>Soccer</h2>
            <p>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home">
                        <ControlStyle BorderWidth="5px" />
                        <FooterStyle BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away">
                        <ControlStyle BorderWidth="5px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="column1" HeaderText="Reward Returns Home Bet" SortExpression="column1" />
                        <asp:BoundField DataField="column2" HeaderText="Reward Returns Away Bet" SortExpression="column2" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT [Away], [Home], [H% win] AS column1, [A% win] AS column2 FROM [Sports Table] WHERE ([Bid ID] = @Bid_ID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="Bid_ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> &nbsp; 
            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dropDownHomeVAway" DataTextField="Home" DataValueField="Home">
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="dropDownHomeVAway" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT [Home], [Away] FROM [Sports Table] WHERE ([Bid ID] = @Bid_ID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Bid_ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
&nbsp;
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Basketball</h2>
            <p>
               
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="basketballEvents">
                    <Columns>
                        <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away" />
                        <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home" />
                        <asp:BoundField DataField="column1" HeaderText="column1" SortExpression="column1" />
                        <asp:BoundField DataField="column2" HeaderText="column2" SortExpression="column2" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="basketballEvents" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT [Away], [Home], [H% win] AS column1, [A% win] AS column2 FROM [Sports Table] WHERE ([Bid ID] = @Bid_ID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="Bid_ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
               
            </p>
            <p>

            </p>
        </div>
        <div class="col-md-4">
            <h2>Fighting</h2>
            <p>
                
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="fightingEvents">
                    <Columns>
                        <asp:BoundField DataField="Home" HeaderText="Home" SortExpression="Home" />
                        <asp:BoundField DataField="Away" HeaderText="Away" SortExpression="Away" />
                        <asp:BoundField DataField="column1" HeaderText="column1" SortExpression="column1" />
                        <asp:BoundField DataField="column2" HeaderText="column2" SortExpression="column2" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="fightingEvents" runat="server" ConnectionString="<%$ ConnectionStrings:sportsDBConnectionString1 %>" SelectCommand="SELECT [Home], [Away], [H% win] AS column1, [A% win] AS column2 FROM [Sports Table] WHERE ([Bid ID] = @Bid_ID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="Bid_ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </p>
            <p>

            </p>
        </div>
    </div>
</asp:Content>


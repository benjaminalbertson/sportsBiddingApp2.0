<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logon.aspx.cs" Inherits="sportsBiddingApp2._0.logon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Login"></asp:Label>
    </p>
    <p>
    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
          <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
    </p>
    <p>
    </p>
</asp:Content>

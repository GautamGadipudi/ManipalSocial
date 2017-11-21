<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Styles/Default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="PreLoginOptions" style="text-align:center">
        <%--<asp:button runat="server" text="Manager" id="manager" onclick="ManagerClick"/><br/>--%>
        
        <%--><asp:button runat="server" text="Sales Clerk" id="salesclerk" onclick="SalesClerkClick"/>--%>
        <asp:ImageButton ID="manager" OnClick="ManagerClick" ImageUrl="Images/manager1.png" runat="server" Height="225px" Width="500px"/><br/>
        <asp:ImageButton ID="salesclerk" OnClick="SalesClerkClick" ImageUrl="Images/sales_clerk1.png" runat="server" Height="250px" Width="500px"/>
    </div>
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginSuccess.aspx.cs" Inherits="SalesClerk_LoginSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="WelcomeMessage" runat="server" Text=""></asp:Label>
    <asp:ListBox ID="lb1" runat="server" CssClass="item_list">
        
    </asp:ListBox>
    <asp:TextBox runat="server" ID="quantity"></asp:TextBox>
    
    <asp:Button ID="submit" Text="Order" runat="server" OnClick="submit_Click" />
</asp:Content>


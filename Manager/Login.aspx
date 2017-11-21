<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manager_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="box">
        <asp:TextBox ID="UsernameTB" runat="server" placeholder="Manager Username"></asp:TextBox>
        <asp:RequiredFieldValidator ID="usernameValidator" ErrorMessage="Please enter the username" ControlToValidate="UsernameTB" ForeColor="Red" Font-Bold="true" runat="server"/><br/><br />
        <asp:TextBox ID="PasswordTB" runat="server" placeholder="Password" type="password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="passwordValidator" ErrorMessage="Please enter the password" ControlToValidate="PasswordTB" runat="server" ForeColor="Red" Font-Bold="true"/><br /><br />
        <asp:Label runat="server" ID="Status" Text="" ForeColor="red"></asp:Label><br />
        <asp:Button ID="Submit" runat="server" Text="Login" OnClick="Submit_Click" />
        
    </div>
</asp:Content>


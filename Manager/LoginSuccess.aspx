<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginSuccess.aspx.cs" Inherits="Manager_LoginSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="WelcomeMessage" runat="server" Text=""></asp:Label>
    <asp:SqlDataSource ID="itemds" ConnectionString="Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=nemesis; Integrated Security=SSPI"
        SelectCommand="SELECT * FROM item"
        UpdateCommand="UPDATE item SET name=@name, price=@price, sold=@sold, ingredient_id=@ingredient_id where id=@id" runat="server">
    </asp:SqlDataSource>
    <asp:GridView runat="server" ID="itemgv" DataSourceID="itemds" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="id"
        allowpaging="True" PageSize="3" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Item_ID" ReadOnly="true" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="Item" SortExpression="name" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
            <asp:BoundField DataField="sold" HeaderText="Quantity Sold" SortExpression="sold" />
            <asp:BoundField DataField="ingredient_id" HeaderText="ID" />
            <asp:CommandField ShowEditButton="true" />
                        
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView><br /><br />
  <asp:GridView runat="server" ID="ordergv" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="id"
        allowpaging="True" PageSize="3" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Order_ID" ReadOnly="true"/>
            <asp:BoundField DataField="item_id" HeaderText="Item_ID"/>
            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="Quantity" />
            
            <asp:CommandField ShowEditButton="true" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView> <br /><br />
    <asp:GridView runat="server" ID="ingGV" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="id"
        allowpaging="True" PageSize="3" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Ing_ID" ReadOnly="true"/>
            <asp:BoundField DataField="name" HeaderText="Ing_Name" SortExpression="name"/>
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
            <asp:BoundField DataField="curr_inv" HeaderText="Current_Inventory"/>
            <asp:BoundField DataField="threshold" HeaderText="Threshold"/>
            <asp:CommandField ShowEditButton="true" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
</asp:Content>


using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_LoginSuccess : System.Web.UI.Page
{
    static string connectionString;

    static Manager_LoginSuccess()
    {
        connectionString = WebConfigurationManager.ConnectionStrings["main"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Request.QueryString["username"];
        WelcomeMessage.Text = "Welcome " + username + " !";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand com = new SqlCommand("select * from _order", con);
        SqlDataAdapter ada = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();
        try
        {
            con.Open();
            ada.Fill(ds);
            ordergv.DataSource = ds;
            com = new SqlCommand("select * from ingredients", con);
            ada = new SqlDataAdapter(com);
            ada.Fill(ds1);
            ingGV.DataSource = ds1;
            DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Source);
            Response.Write(ex.Message);
            Response.Write(ex.StackTrace);
        }
        finally { con.Close(); }
    }
}
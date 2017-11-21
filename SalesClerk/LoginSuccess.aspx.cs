using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SalesClerk_LoginSuccess : System.Web.UI.Page
{
    //Dictionary<string, string> item_name;
    protected void Page_Load(object sender, EventArgs e)
    {
        string username;
        HttpCookie cookie = Request.Cookies["Credentials"];
        if(cookie != null)
        {
            username = cookie["username"];
            WelcomeMessage.Text = "Welcome " + username + "! ";
        }

        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=nemesis; Integrated Security=SSPI");
        SqlCommand com = new SqlCommand("select id,name,price from item", con);
        try
        {
            con.Open();
            SqlDataReader r = com.ExecuteReader();

            while (r.Read())
            {
                //item_name[r["id"].ToString()] = r["name"].ToString();
                lb1.Items.Add(new ListItem(
                    r["name"].ToString() + ", " + r["price"].ToString(),
                    r["id"].ToString()));
            }
        }
        catch(Exception ex)
        {
            Console.Write(ex.Message);
            Response.Write(ex.Message);
        }
        finally { con.Close(); }
        lb1.Rows = lb1.Items.Count;
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        string item_id = lb1.SelectedValue;
        int quan = int.Parse(quantity.Text);
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=nemesis; Integrated Security=SSPI");
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("select max(id) as next_id from _order", con);
            SqlDataReader reader = com.ExecuteReader();
            int id = 0;
            reader.Read();

            id = int.Parse(reader["next_id"].ToString()) + 1;
            reader.Close();

            SqlCommand orderUpdate = new SqlCommand("INSERT INTO _order values (@id, @item_id, @quantity)", con);
            orderUpdate.Parameters.AddWithValue("id", id);
            orderUpdate.Parameters.AddWithValue("item_id", item_id);
            orderUpdate.Parameters.AddWithValue("quantity", quan);
            orderUpdate.ExecuteNonQuery();

            SqlCommand itemUpdate = new SqlCommand("UPDATE item SET sold=sold+@quantity where id=@id", con);
            itemUpdate.Parameters.AddWithValue("id", item_id);
            itemUpdate.Parameters.AddWithValue("quantity", quan);
            itemUpdate.ExecuteNonQuery();

            SqlCommand ingredientsUpdate = new SqlCommand("SELECT ingredient_id FROM item WHERE id=@id", con);
            ingredientsUpdate.Parameters.AddWithValue("id", item_id);
            SqlDataReader iReader = ingredientsUpdate.ExecuteReader();
            iReader.Read();
            string ing_id = iReader["ingredient_id"].ToString();
            iReader.Close();

            SqlCommand ingredientsUpdate1 = new SqlCommand("UPDATE ingredients SET curr_inv=curr_inv-@quantity WHERE id=@id", con);
            ingredientsUpdate1.Parameters.AddWithValue("id", ing_id);
            ingredientsUpdate1.Parameters.AddWithValue("quantity", quan);
            ingredientsUpdate1.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally { con.Close(); }
        quantity.Text = "";
    }
}
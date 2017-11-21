using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SalesClerk_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        if (usernameValidator.IsValid && passwordValidator.IsValid)
        {
            if (PasswordTB.Text == "password")
            {
                HttpCookie cookie = new HttpCookie("Credentials");
                cookie["username"] = UsernameTB.Text;
                Response.Cookies.Add(cookie);
                Response.Redirect("LoginSuccess.aspx");
            }
            else
            {
                Status.Text = "Invalid password!";
            }
        }
    }
}
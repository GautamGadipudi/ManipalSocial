using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        if(usernameValidator.IsValid && passwordValidator.IsValid)
        {
            if (PasswordTB.Text == "password")
            {
                string url = "LoginSuccess.aspx" + "?username=" + UsernameTB.Text;
                Response.Redirect(url);
            }
            else
            {
                Status.Text = "Invalid Password";
            }
        }
    }
}
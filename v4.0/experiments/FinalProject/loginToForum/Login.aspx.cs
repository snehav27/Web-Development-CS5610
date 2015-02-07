using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_project_Login : System.Web.UI.Page
{
    CarDAO crDao = new CarDAO();

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        
        
        var loggedInUsername = username.Text;
        Session["loggedInUsername"] = loggedInUsername;
        var loggedInPassword = password.Text;

        if (loggedInUsername == "" || loggedInUsername == null) { 
        
        LoginError.Text = "UserName Cannot be Empty, Please Enter user name.";
        return;
        }
        if (loggedInPassword == "" || loggedInPassword == null) {

            LoginError.Text = "Password Cannot be Empty, Please Enter Password.";
            return;
        }

        Car cr = new Car(loggedInUsername, loggedInPassword,"","","","","");
        String validationReturn = crDao.checkLoginUser(cr);
        if (validationReturn == null)
        {
            LoginError.Text = "User Not available, Contact Admin at vankireddy.s@husky.neu.edu";
            return;
        }

        Session["loggedInUsername"] = loggedInUsername;
        
        Response.Redirect("DashBoard.aspx?username=" + loggedInUsername);
    }

   
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_loginToForum_ChangePassword : System.Web.UI.Page
{
    CarDAO crDao = new CarDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedInUsername"] == null)
        {
            Response.Redirect("Login.aspx");

        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        var loggedInUsername = Request.QueryString["username"].ToString();

        var prevUserPassword = prevPassword.Text;

        var changeUserPassword = changePassword.Text;

        var retypeUserPassword = retypeChangePassword.Text;

        if (prevUserPassword == "" || prevUserPassword == null)
        {

            passwordChangeError.Text = "Current password Should not be empty";
            return;
        }
        if (changeUserPassword == "" || changeUserPassword == null)
        {

            passwordChangeError.Text = "New Password Cannot be Empty, Please Enter New Password.";
            return;
        }
        if (retypeUserPassword == "" || retypeUserPassword == null )
        {

            passwordChangeError.Text = "Confirm Password Cannot be Empty.";
            return;
        }
        if (retypeUserPassword != changeUserPassword)
        {
            passwordChangeError.Text = "Confirm Password should be same as previous password";
            return;
        }
        Car cr = new Car(loggedInUsername, prevUserPassword, changeUserPassword,"","","","");
        String validationReturn = crDao.changePassword(cr);
        if (validationReturn == "Password Entered is wrong, Please retype again")
        {
            passwordChangeError.Text = validationReturn;
            passwordChangeSuccess.Text = "";
            return;
        }
        else {
            passwordChangeError.Text = "";
            passwordChangeSuccess.Text = "Password Changed :) !!!";
        }
    }


    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
}
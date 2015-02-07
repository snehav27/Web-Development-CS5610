using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_loginToForum_EditInfo : System.Web.UI.Page
{
    CarDAO crDao = new CarDAO();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loggedInUsername"] == null)
        {
            Response.Redirect("Login.aspx");

        }
        if (!IsPostBack) { 
        var loggedInUsername = Request.QueryString["username"].ToString();
        Car cr = new Car(loggedInUsername, "","", "", "", "", "");
        cr = crDao.fetchUserInfo(cr);
        firstName.Text = cr.firstname;
        lastName.Text = cr.lastname;
        emailID.Text = cr.email;
        dob.Text = cr.dob;
        updateInfoError.Text = "";
        updateInfoSuccess.Text = "";
        }
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        var loggedInUsername = Request.QueryString["username"].ToString();
        var firstname = firstName.Text;
        var lastname = lastName.Text;
        var email = emailID.Text;

        if (!email.ToLowerInvariant().Contains("@"))
        {
            updateInfoError.Text = "Email ID entered in wrong format";
            return;
        }

        Car cr = new Car(loggedInUsername,"","", firstname, lastname, email,"");
        String validationError = crDao.UpdateUserInfo(cr);

        if (validationError == "success")
        {
            updateInfoSuccess.Text = "Information Updated :) !!!";
            updateInfoError.Text = "";
        }
        else
        {
            updateInfoError.Text = "Error Occured while updating user information";
            updateInfoSuccess.Text = "";
        }

       
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
}
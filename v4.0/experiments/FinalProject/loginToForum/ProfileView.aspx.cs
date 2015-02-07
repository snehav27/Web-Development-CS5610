using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class experiments_loginToForum_ProfileView : System.Web.UI.Page
{
    WallInfoDAO wiDAO = new WallInfoDAO();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["loggedInUsername"] == null)
        {
            Response.Redirect("Login.aspx");

        }
        var ownerUsername = Request.QueryString["username"].ToString().Trim();
        var authorusername = Session["loggedInUsername"].ToString().Trim();

        dashboard.NavigateUrl = String.Format(dashboard.NavigateUrl, Request.QueryString["username"]);
        changepassword.NavigateUrl = String.Format(changepassword.NavigateUrl, Request.QueryString["username"]);
        editInfo.NavigateUrl = String.Format(editInfo.NavigateUrl, Request.QueryString["username"]);


        if (ownerUsername != authorusername)
        {

         //   dashboard.Style.Add("display", "none");
            editInfo.Style.Add("display", "none");
            changepassword.Style.Add("display", "none");
            if (!IsPostBack)
            {
                WallInfo wi = new WallInfo(authorusername, ownerUsername, "", "");
                int count = wiDAO.checkIfFollowing(wi);

                if (count >= 1)
                {
                    unfollow.Style.Add("display", "");
                    follow.Style.Add("display", "none");

                }
                else
                {
                    unfollow.Style.Add("display", "none");
                    follow.Style.Add("display", "");
                }

            }
        }
        else {

            follow.Style.Add("display", "none");
            unfollow.Style.Add("display", "none");
        }

        CarDAO crDao = new CarDAO();
        if (!IsPostBack)
        {
            var loggedInUsername = Request.QueryString["username"].ToString();
            Car cr = new Car(loggedInUsername, "", "", "", "", "", "");
            cr = crDao.fetchUserInfo(cr);

            name.InnerHtml = "Name : "+cr.firstname + "" + cr.lastname;
            emailID.InnerHtml = "Email : " + cr.email;
            dob.InnerHtml = "DOB : " + cr.dob;
            
            folowInfoError.Text = "";
            followInfoSuccess.Text = "";
        }


      

        
    }
    protected void submit_Click(object sender, EventArgs e)
    {

        var ownerUsername = Request.QueryString["username"].ToString().Trim();
        var authorusername = Session["loggedInUsername"].ToString().Trim();

       

        WallInfo wi = new WallInfo(authorusername, ownerUsername, "" ,"");


        String validationError = wiDAO.insertFollowInfo(wi);

        if (validationError == "success")
        {
            followInfoSuccess.Text = "You are following " + ownerUsername+ "!!  :)" ;
            folowInfoError.Text = "";
        }
        else
        {
            folowInfoError.Text = "Error Occured You couldnt follow the user";
            followInfoSuccess.Text = "";
        }

   
        int count = wiDAO.checkIfFollowing(wi);
      
        if (count >= 1)
        {
            unfollow.Style.Add("display", "");
            follow.Style.Add("display", "none");

        }
        else
        {
            unfollow.Style.Add("display", "none");
            follow.Style.Add("display", "");
        }
        

    }
    protected void unfollow_Click(object sender, EventArgs e)
    {
        var ownerUsername = Request.QueryString["username"].ToString().Trim();
        var authorusername = Session["loggedInUsername"].ToString().Trim();



        WallInfo wi = new WallInfo(authorusername, ownerUsername, "", "");


        String validationError = wiDAO.unFollow(wi);

        if (validationError == "success")
        {
            followInfoSuccess.Text = "You have unfollowed : " + ownerUsername + "!!  :(";
            folowInfoError.Text = "";
        }
        else
        {
            folowInfoError.Text = "Error Occured You couldnt follow the user";
            followInfoSuccess.Text = "";
        }


     
        int count = wiDAO.checkIfFollowing(wi);
      
        if (count >= 1)
        {
            unfollow.Style.Add("display", "");
            follow.Style.Add("display", "none");

        }
        else
        {
            unfollow.Style.Add("display", "none");
            follow.Style.Add("display", "");
        }
        
    }


    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

}
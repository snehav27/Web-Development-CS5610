using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class experiments_loginToForum_DashBoard : System.Web.UI.Page
{

    WallInfoDAO wiDAO = new WallInfoDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedInUsername"] == null) {
            Response.Redirect("Login.aspx");
        
        }
        FollowersRepeaterData();
        FollowingRepeaterData();
        var ownerUsername = Request.QueryString["username"].ToString().Trim();
        var authorusername = Session["loggedInUsername"].ToString().Trim();

        dashboard.NavigateUrl = String.Format(dashboard.NavigateUrl, Request.QueryString["username"]);
        changepassword.NavigateUrl = String.Format(changepassword.NavigateUrl, Request.QueryString["username"]);
        editInfo.NavigateUrl = String.Format(editInfo.NavigateUrl, Request.QueryString["username"]);

      
        if (ownerUsername != authorusername)
        {

            editorialadmin.Style.Add("display", "none");
            editInfo.Style.Add("display", "none");
            changepassword.Style.Add("display", "none");
            msg.InnerText = "Welcome To User Dashboard,  ";
           
        }
        if (ownerUsername == "admin" && ownerUsername == authorusername)
        {
            editorialadmin.Style.Add("display", "");
        }
           
        


    }

    protected void FollowersRepeaterData()
    {
        var ownerusername = Request.QueryString["username"].ToString();


        WallInfo wi = new WallInfo("", ownerusername, "", "");

        DataSet ds = wiDAO.fetchFollowersInfo(wi);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Followers.Visible = true;
            Followers.DataSource = ds;
            Followers.DataBind();
        }
        else
        {
            Followers.Visible = false;
        }

    }

    protected void FollowingRepeaterData()
    {
        var ownerusername = Request.QueryString["username"].ToString();


        WallInfo wi = new WallInfo("", ownerusername, "", "");

        DataSet ds = wiDAO.fetchFollowingInfo(wi);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Following.Visible = true;
            Following.DataSource = ds;
            Following.DataBind();
        }
        else
        {
            Following.Visible = false;
        }

    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");    
    }
}
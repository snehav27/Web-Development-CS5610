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
public partial class experiments_loginToForum_RecentActivity : System.Web.UI.Page
{

    WallInfoDAO wdao = new WallInfoDAO();
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

            //  dashboard.Style.Add("display", "none");
            editInfo.Style.Add("display", "none");
            changepassword.Style.Add("display", "none");
        }

        getThreadsCreatedByUser(ownerUsername);
        getCommentsCreatedByUser(ownerUsername);
        getFollowActivity(ownerUsername);
    }


    protected void getFollowActivity(String ownerUsername)
    {
        WallInfo wi = new WallInfo(ownerUsername);


        DataSet ds = wdao.getfollowActivity(wi);
        ;
        if (ds.Tables[0].Rows.Count > 0)
        {
            followactivity.Visible = true;
            followactivity.DataSource = ds;
            followactivity.DataBind();
        }
        else
        {
            followactivity.Visible = false;
        }
    }

    protected void getThreadsCreatedByUser(String ownerUsername)
    {
        WallInfo wi = new WallInfo(ownerUsername);


        DataSet ds = wdao.getThreadsCreatedByUser(wi);
        ;
        if (ds.Tables[0].Rows.Count > 0)
        {
            threadactivity.Visible = true;
            threadactivity.DataSource = ds;
            threadactivity.DataBind();
        }
        else
        {
            threadactivity.Visible = false;
        }
    }


    protected void getCommentsCreatedByUser(String ownerUsername)
    {
        WallInfo wi = new WallInfo(ownerUsername);


        DataSet ds = wdao.getCommentsCreatedByUser(wi);
        ;
        if (ds.Tables[0].Rows.Count > 0)
        {
            commentsAcitivity.Visible = true;
            commentsAcitivity.DataSource = ds;
            commentsAcitivity.DataBind();
        }
        else
        {
            commentsAcitivity.Visible = false;
        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
}
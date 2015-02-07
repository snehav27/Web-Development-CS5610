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
public partial class experiments_loginToForum_WallPosts : System.Web.UI.Page
{
    
    SqlCommand cmd;
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


        if (ownerUsername != authorusername) {

           // dashboard.Style.Add("display", "none");
            editInfo.Style.Add("display", "none");
            changepassword.Style.Add("display", "none");
        }
        else
        {

            btnSubmit.Style.Add("display", "none");
            txtComment.Style.Add("display", "none");
            txtSubject.Style.Add("display", "none");
        }

        if (!IsPostBack)
        {
            BindRepeaterData();
        }
    }

    protected void BindRepeaterData()
    {
        var ownerusername = Request.QueryString["username"].ToString();


        WallInfo wi = new WallInfo("", ownerusername, "", "");

        DataSet ds = wiDAO.fetchWallInfo(wi);
        if (ds.Tables[0].Rows.Count > 0)
        {
            RepDetails.Visible = true;
            RepDetails.DataSource = ds;
            RepDetails.DataBind();
        }
        else
        {
            RepDetails.Visible = false;
        }

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        var ownerUsername = Request.QueryString["username"].ToString().Trim();
        var authorusername = Session["loggedInUsername"].ToString().Trim();

        if (ownerUsername == authorusername)
        {

            wallError.Text = "You cant post on your own wall";
            return;
        }

        WallInfo wi = new WallInfo(authorusername, ownerUsername, txtSubject.Text, txtComment.Text);
        wiDAO.insertDataOnWall(wi);

        txtSubject.Text = string.Empty;
        txtComment.Text = string.Empty;
        BindRepeaterData();
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
 
}
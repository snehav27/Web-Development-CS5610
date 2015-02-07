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

public partial class experiments_loginToForum_Topics : System.Web.UI.Page
{
    ForumDAO frDAO = new ForumDAO();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loggedInUsername"] == null)
        {
            Response.Redirect("Login.aspx");

        }
        var authorusername = Session["loggedInUsername"].ToString().Trim();
        myprofile.NavigateUrl = String.Format(myprofile.NavigateUrl, authorusername);
        if (!IsPostBack)
        {

            var topicID = Request.QueryString["id"].ToString();
            Forum fr = new Forum(topicID);

            DataSet ds = frDAO.fetchPosts(fr);
            if (ds.Tables[0].Rows.Count > 0)
            {
                postRepeater.Visible = true;
                postRepeater.DataSource = ds;
                postRepeater.DataBind();
            }
            else
            {
                postRepeater.Visible = false;
            }
        }


    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
 
}

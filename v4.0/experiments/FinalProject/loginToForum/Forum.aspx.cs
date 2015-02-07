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

public partial class experiments_loginToForum_Forum : System.Web.UI.Page
{
    ForumDAO frdao = new ForumDAO();

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

            DataSet ds = frdao.fetchTopics();
            if (ds.Tables[0].Rows.Count > 0)
            {
                topicsRepeater.Visible = true;
                topicsRepeater.DataSource = ds;
                topicsRepeater.DataBind();
            }
            else
            {
                topicsRepeater.Visible = false;
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
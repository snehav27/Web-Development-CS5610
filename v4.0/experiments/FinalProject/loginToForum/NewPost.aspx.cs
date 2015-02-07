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
using System.Web.Configuration;

public partial class experiments_loginToForum_NewPost : System.Web.UI.Page
{
    ForumDAO frdao = new ForumDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedInUsername"] == null)
        {
            Response.Redirect("Login.aspx");

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int topicId = int.Parse(Request.QueryString["id"]);      
        string postUserName = Session["loggedInUsername"].ToString().Trim();
        string postTitle = txtTitle.Text;
        string postMessage = txtMessage.Text;
        DateTime postDateTime = DateTime.Now;
        Forum fr = new Forum(topicId, postUserName, postTitle, postMessage, postDateTime.ToString());
        frdao.createNewPost(fr);      
        //frdao.insertIntoCommentTable(fr);        
        frdao.updateTopicsInformation(fr);
        Response.Redirect("Topics.aspx?id=" + topicId.ToString());
    }

   
}
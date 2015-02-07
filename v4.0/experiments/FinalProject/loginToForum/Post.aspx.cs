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


public partial class experiments_loginToForum_Post : System.Web.UI.Page
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

            var postID = Request.QueryString["id"].ToString();
            Forum fr = new Forum(postID);

            DataSet ds = frDAO.fetchCommentsforPost(fr);
            
            if (ds.Tables[0].Rows.Count > 0)
            {
                commentRepeater.Visible = true;
                commentRepeater.DataSource = ds;
                commentRepeater.DataBind();
            }
            else
            {
                commentRepeater.Visible = false;
            }

            DataSet ds1 = frDAO.fetchPostInfo(fr);

            if (ds1.Tables[0].Rows.Count > 0)
            {
                PostDetails.Visible = true;
                PostDetails.DataSource = ds1;
                PostDetails.DataBind();
            }
            else
            {
                PostDetails.Visible = false;
            }
        }

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string commentUserName = Session["loggedInUsername"].ToString().Trim();
        string commentMessage = txtMessage.Text;
        DateTime commentDateTime = DateTime.Now;
        int postId = int.Parse(Request.QueryString["id"]);
        Forum fr = new Forum(postId, commentUserName, commentMessage, commentDateTime.ToString());
        frDAO.insertIntoCommentTable2(fr);

        Response.Redirect("Post.aspx?id=" + postId.ToString());
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("loggedInUsername");
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
 

}
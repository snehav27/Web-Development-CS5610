using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Xml;
using System.Net;
using System.IO;
using edu.neu.ccis.rasala;
/// <summary>
/// Summary description for ForumDAO
/// </summary>
public class ForumDAO
{
    static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
	public ForumDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet fetchTopics()
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from [snehav27].[Topics]", con);
        //   var username = Request.QueryString["username"].ToString();
        //  cmd.Parameters.Add("@ownerusername", wi.ownerUsername);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataSet fetchPosts(Forum fr)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM [snehav27].[Posts] WHERE ([TopicId] = @TopicId) ORDER BY [PostDateTime] DESC", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@TopicId", fr.ID);
      //  DataSet ds = new DataSet();
        //SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }
    public DataSet fetchCommentsforPost(Forum fr)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM [snehav27].[Comments] WHERE ([PostId] = @PostId) ORDER BY [CommentDateTime] DESC", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@PostId", fr.ID);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }
    public DataSet fetchPostInfo(Forum fr)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM [snehav27].[Posts] WHERE ([PostId] = @PostId) ", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@PostId", fr.ID);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public String createNewPost(Forum fr)
    {



        SqlConnection conn = new SqlConnection(connstring);





        SqlCommand cmd = new SqlCommand("Insert INTO [snehav27].[Posts](TopicId, PostTitle, PostUserName, PostDateTime,PostMessage) VALUES (@TopicId, @PostTitle, @PostUserName, @PostDateTime,@PostMessage)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TopicId", fr.topicId);
        cmd.Parameters.AddWithValue("@PostTitle", fr.postTitle);
        cmd.Parameters.AddWithValue("@PostUserName", fr.postUserID);
        cmd.Parameters.AddWithValue("@PostDateTime", fr.postDateTime);
        cmd.Parameters.AddWithValue("@PostMessage", fr.postMessage);
        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

   
        return "success";


    }



    public int getPostID(Forum fr)
    {
        int post = 0;
        SqlDataReader rdr = null;        
        SqlConnection conn = new SqlConnection(connstring);
        SqlCommand cmd = new SqlCommand("Select * FROM [snehav27].[Posts] WHERE TopicId=@TopicId AND PostTitle=@PostTitle AND PostUserName=@PostUserName AND PostDateTime=@PostDateTime", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TopicId", fr.topicId);
        cmd.Parameters.AddWithValue("@PostTitle", fr.postTitle);
        cmd.Parameters.AddWithValue("@PostUserName", fr.postUserID);
        cmd.Parameters.AddWithValue("@PostDateTime", fr.postDateTime.ToString());

        using (conn)
        {
            conn.Open();
            rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                post = int.Parse(rdr["PostId"].ToString());
            }
            conn.Close();
        }

        return post;
    }

    public void updateTopicsInformation(Forum fr)
    {
        SqlConnection conn = new SqlConnection(connstring);
        SqlCommand cmd = new SqlCommand("Update [snehav27].[Topics] Set LastPostTitle=@LastPostTitle, LastPostUserName=@LastPostUserName, LastPostDateTime=@LastPostDateTime WHERE TopicId=@TopicId", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@LastPostTitle", fr.postTitle);
        cmd.Parameters.AddWithValue("@LastPostUserName", fr.postUserID);
        cmd.Parameters.AddWithValue("@LastPostDateTime", fr.postDateTime);
        cmd.Parameters.AddWithValue("@TopicId", fr.topicId);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
    public void insertIntoCommentTable(Forum fr)
    {
        int postId = getPostID(fr);
      
        SqlConnection conn = new SqlConnection(connstring);
        SqlCommand cmd = new SqlCommand("Insert INTO [snehav27].[Comments](PostId, CommentUserName, CommentMessage, CommentDateTime) VALUES (@PostId, @CommentUserName, @CommentMessage, @CommentDateTime)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PostId", postId);
        cmd.Parameters.AddWithValue("@CommentUserName", fr.postUserID);
        cmd.Parameters.AddWithValue("@CommentMessage", fr.postMessage);
        cmd.Parameters.AddWithValue("@CommentDateTime", fr.postDateTime);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }


    public void insertIntoCommentTable2(Forum fr)
    {
        SqlConnection conn = new SqlConnection(connstring);
        SqlCommand cmd = new SqlCommand("Insert INTO [snehav27].[Comments](PostId, CommentUserName, CommentMessage, CommentDateTime) VALUES (@PostId, @CommentUserName, @CommentMessage, @CommentDateTime)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PostId", fr.postId);
        cmd.Parameters.AddWithValue("@CommentUserName", fr.commentUserName);
        cmd.Parameters.AddWithValue("@CommentMessage", fr.commentMessage);
        cmd.Parameters.AddWithValue("@CommentDateTime", fr.commentDateTime);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }

}
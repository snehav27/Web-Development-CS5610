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
/// Summary description for WallInfoDAO
/// </summary>
public class WallInfoDAO
{

    static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
    public WallInfoDAO()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public String insertDataOnWall(WallInfo wi)
    {
        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into [snehav27].[UserWallPosts] (UserName,OwnerUserName,Subject,Comment,PostedDate) values(@userName,@ownerUserName,@subject,@comment,@postedDate)", con);
        cmd.Parameters.AddWithValue("@userName", wi.authorusername);
        cmd.Parameters.AddWithValue("@ownerUserName", wi.ownerUsername);
        cmd.Parameters.AddWithValue("@subject", wi.subject);
        cmd.Parameters.AddWithValue("@comment", wi.comment);
        cmd.Parameters.AddWithValue("@postedDate", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
        return "success";



    }
    public String insertFollowInfo(WallInfo wi)
    {
        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into [snehav27].[FollowInfo] (Follower,Followed,FollowDate) values(@follower,@followed,@followDate)", con);
        cmd.Parameters.AddWithValue("@follower", wi.authorusername);
        cmd.Parameters.AddWithValue("@followed", wi.ownerUsername);
        cmd.Parameters.AddWithValue("@followDate", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
        return "success";
    }
    public DataSet fetchWallInfo(WallInfo wi)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from [snehav27].[UserWallPosts] where ownerusername =@ownerusername Order By PostedDate desc", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@ownerusername", wi.ownerUsername);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }
    public DataSet fetchFollowersInfo(WallInfo wi)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from [snehav27].[FollowInfo] where Followed =@followed Order By FollowDate desc", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@followed", wi.ownerUsername.Trim());
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataSet fetchFollowingInfo(WallInfo wi)
    {




        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from [snehav27].[FollowInfo] where Follower =@follower Order By FollowDate desc", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@follower", wi.ownerUsername.Trim());
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }




    public String unFollow(WallInfo wi)
    {
        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM [snehav27].[FollowInfo] WHERE Follower = @follower and Followed = @followed", con);
        cmd.Parameters.AddWithValue("@follower", wi.authorusername);
        cmd.Parameters.AddWithValue("@followed", wi.ownerUsername);

        cmd.ExecuteNonQuery();
        con.Close();
        return "success";
    }


    public int checkIfFollowing(WallInfo wi)
    {


        string stmt = "Select  COUNT(*) FROM [snehav27].[FollowInfo] WHERE Follower = @follower and Followed = @followed";
        int count = 0;

        using (SqlConnection thisConnection = new SqlConnection(connstring))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                cmdCount.Parameters.AddWithValue("@follower", wi.authorusername);
                cmdCount.Parameters.AddWithValue("@followed", wi.ownerUsername);
                thisConnection.Open();
                count = (int)cmdCount.ExecuteScalar();
            }
        }
        return count;

    }
    public DataSet getThreadsCreatedByUser(WallInfo wi)
    {




        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select top 5 * from [snehav27].[Posts] where PostUserName =@postUserName Order By PostDateTime desc", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@postUserName", wi.ownerUsername.Trim());
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }


    public DataSet getCommentsCreatedByUser(WallInfo wi)
    {




        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select top 5 * from [snehav27].[Comments] where CommentUserName =@CommentUserName Order By CommentDateTime desc", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@CommentUserName", wi.ownerUsername.Trim());
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataSet getfollowActivity(WallInfo wi)
    {




        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select top 5 * from [snehav27].[FollowInfo] where Follower =@Follower Order By FollowDate desc", con);
        //   var username = Request.QueryString["username"].ToString();
        cmd.Parameters.Add("@Follower", wi.ownerUsername.Trim());
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }
    
}
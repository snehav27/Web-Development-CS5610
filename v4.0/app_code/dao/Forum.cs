using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Forum
/// </summary>
public class Forum
{
    
    public string ID { set; get; }
    public int topicId { set; get; }
    public string postTitle { set; get; }
    public string postUserID { set; get; }
    public string postMessage { set; get; }
    public string postDateTime { set; get; }
    public int postId { set; get; }
    public string commentUserName { set; get; }
    public string commentMessage { set; get; }
    public string commentDateTime { set; get; } 
	public Forum(String ID)
	{
		//
		// TODO: Add constructor logic here
		//

        this.ID = ID;
	}
    public Forum(int topicId, String postUserID, String postTitle, String postMessage, String postDateTime)
    {
        //
        // TODO: Add constructor logic here
        //
       
        this.topicId = topicId;        
        this.postUserID = postUserID;
        this.postTitle = postTitle;
        this.postMessage = postMessage;
        this.postDateTime = postDateTime;
    }

    public Forum(int postId, String commentUserName, String commentMessage, String commentDateTime)
    {
        //
        // TODO: Add constructor logic here
        //

        this.postId = postId;
        this.commentUserName = commentUserName;
        this.commentMessage = commentMessage;
        this.commentDateTime = commentDateTime;
       
    }

}
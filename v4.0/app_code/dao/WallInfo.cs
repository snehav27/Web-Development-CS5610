using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WallInfo
/// </summary>
public class WallInfo
{

    public string authorusername { set; get; }
    public string ownerUsername { set; get; }
    public string subject { set; get; }
    public string comment { set; get; }
    
    

    public WallInfo(string authorusername, string ownerUsername, string subject, string comment)
    {
        this.authorusername = authorusername;
        this.ownerUsername = ownerUsername;
        this.subject = subject;
        this.comment = comment;
     
        
    }

    public WallInfo(string ownerUsername)
    {
        this.ownerUsername = ownerUsername;
       


    }
	public WallInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
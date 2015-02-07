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
/// Summary description for CarDAO
/// </summary>
public class Car
{
    public string username { set; get; }
    public string password { set; get; }
    public string newPassword { set; get; }
    public string firstname { set; get; }
    public string lastname { set; get; }
    public string email { set; get; }
    public string dob { set; get; }

    public Car(string username, string password, string newPassword,string firstname,string lastname,string email,string dob)
    {
        this.username = username;
        this.password = password;
        this.newPassword = newPassword;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.dob = dob;
    }

    public Car()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
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
/// Summary description for CarInfoDAO
/// </summary>
public class CarInfoDAO
{

    static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
	public CarInfoDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet populateCarCompanyDropDown()
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT distinct CarName FROM snehav27.CAR_STYLE_INFO", con);
       
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataSet populateYearDropDown(CarInfo ci)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT distinct CarYear FROM snehav27.CAR_STYLE_INFO where carName=@Carname", con);
        cmd.Parameters.Add("@Carname", ci.carname);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataSet populateCarmodel(CarInfo ci)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("select (CarSeries + ' - ' + Name) AS CarModelName ,CarID from snehav27.CAR_STYLE_INFO where CarYear=@Year and carName=@Carname", con);
        cmd.Parameters.Add("@Carname", ci.carname);
        cmd.Parameters.Add("@Year", ci.year);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }



}
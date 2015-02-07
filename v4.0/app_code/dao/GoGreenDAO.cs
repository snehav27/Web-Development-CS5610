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
/// Summary description for GoGreenDAO
/// </summary>
public class GoGreenDAO
{
    static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
	public GoGreenDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet populateGreenTable(GoGreen gg)
    {


        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT distinct Model,Cyl,Fuel,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore FROM snehav27.FUEL_ECONOMY_DATA_" + gg.year + "  where Model = @CarName", con);
        cmd.Parameters.Add("@CarName", gg.carname);        
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataTable populateCarnameDropdown(GoGreen gg)
    {

        string selectString = "SELECT distinct Model FROM snehav27.FUEL_ECONOMY_DATA_" + gg.year;
        SqlDataAdapter adpt = new SqlDataAdapter(selectString, connstring);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        return dt;

    }

    public DataSet populateGreenTableUsingMileage(GoGreen gg)
    {
        string quertstring = "select top 50 2011,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                 "from snehav27.FUEL_ECONOMY_DATA_2011 where " + gg.cityappendwhere + gg.highappendwhere + gg.cmbappendwhere +
                                    " UNION ALL " +
                               "select top 50 2012,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from snehav27.FUEL_ECONOMY_DATA_2012 where  " + gg.cityappendwhere + gg.highappendwhere + gg.cmbappendwhere +
                                    " UNION ALL " +
                                    "select top 50 2013,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from  snehav27.FUEL_ECONOMY_DATA_2013 where  " + gg.cityappendwhere + gg.highappendwhere + gg.cmbappendwhere +
                                    " UNION ALL " +
                                    "select top 50 2014,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from  snehav27.FUEL_ECONOMY_DATA_2014 where  " + gg.cityappendwhere + gg.highappendwhere + gg.cmbappendwhere +
                                    " UNION ALL " +
                                    "select top 50 2015,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from snehav27.FUEL_ECONOMY_DATA_2015 where  " + gg.cityappendwhere + gg.highappendwhere + gg.cmbappendwhere;

        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand(quertstring, con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }

    public DataSet populateGreenTableUsingGreenScore(GoGreen gg)
    {
        string greenScoreWhereClause = "";
        string airPolutionScoreWhereClause = "";
        if (gg.greenScore)
            greenScoreWhereClause = "GreenHouseScore = " + gg.score;
        if (gg.airPolutionScore)
            airPolutionScoreWhereClause = " AirPollutionScore = " + gg.score;

        string quertstring = "select top 50  2011,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                "from snehav27.FUEL_ECONOMY_DATA_2011 where " + greenScoreWhereClause + airPolutionScoreWhereClause +
                                   " UNION ALL " +
                              "select top 50  2012,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                 "from  snehav27.FUEL_ECONOMY_DATA_2012 where  " + greenScoreWhereClause + airPolutionScoreWhereClause +
                                   " UNION ALL " +
                                   "select top 50  2013,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                 "from snehav27.FUEL_ECONOMY_DATA_2013 where  " + greenScoreWhereClause + airPolutionScoreWhereClause +
                                   " UNION ALL " +
                                   "select top 50  2014,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                 "from snehav27.FUEL_ECONOMY_DATA_2014 where  " + greenScoreWhereClause + airPolutionScoreWhereClause +
                                   " UNION ALL " +
                                   "select top 50  2015,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                 "from snehav27.FUEL_ECONOMY_DATA_2015 where  " + greenScoreWhereClause + airPolutionScoreWhereClause;

        SqlConnection con = new SqlConnection(connstring);
        con.Open();
        SqlCommand cmd = new SqlCommand(quertstring, con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        return ds;


    }



}
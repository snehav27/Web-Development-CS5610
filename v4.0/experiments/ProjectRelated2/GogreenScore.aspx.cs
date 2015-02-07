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


public partial class experiments_project_Extra_Fields_CarPrices : System.Web.UI.Page
{


    static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
    

    protected void Page_Load(object sender, EventArgs e)
    {

      
    }



    protected void displayinfo3(object sender, EventArgs e)
    {
        Boolean greenScore = radiobuttonGrhs.Checked;
        Boolean airPolutionScore = radiobuttonArp.Checked;
        String score = scoreText.Text;
        if (greenScore || airPolutionScore)
        {

            string greenScoreWhereClause = "";
            string airPolutionScoreWhereClause = "";
            if (greenScore)
                greenScoreWhereClause = "GreenHouseScore = " + score;
            if (airPolutionScore)
                airPolutionScoreWhereClause = " AirPollutionScore = " + score;

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
           
            GridView3.DataSource = ds.Tables[0];
            GridView3.DataBind();

        }
        else
        {


        }
    }



 

}
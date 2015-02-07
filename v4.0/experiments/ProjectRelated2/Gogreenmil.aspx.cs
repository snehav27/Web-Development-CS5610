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
   


    protected void displayinfo2(object sender, EventArgs e)
    {
       
        String cityMPG = TextBox1.Text;
        String highMPG = TextBox2.Text;
        String cmbMPG = TextBox3.Text;
        
        if (cityMPG == "" && highMPG == "" && cmbMPG == "")
        {
            //Result.Attributes.Add("style", "visibility: hidden");


        }
        else
        {
            
            string cityappendwhere = "";
            string highappendwhere = "";
            string cmbappendwhere = "";
            if (cityMPG != "")
                cityappendwhere = "cityMPG =" + cityMPG;
            else
                cityappendwhere = "";

            if (highMPG != "" && cityMPG != "")
                highappendwhere = " and HwyMPG = " + highMPG;
            else if (highMPG != "")
                highappendwhere = " HwyMPG = " + highMPG;
            else
                highappendwhere = "";

            if (cmbMPG != "" && (highMPG != "" || cityMPG != ""))
                cmbappendwhere = " and cmbMPG = " + cmbMPG;
            else if (cmbMPG != "")
                cmbappendwhere = " cmbMPG = " + cmbMPG;
            else
                cmbappendwhere = "";
           
            string quertstring = "select top 50 2011,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                 "from snehav27.FUEL_ECONOMY_DATA_2011 where " + cityappendwhere + highappendwhere + cmbappendwhere +
                                    " UNION ALL " +
                               "select top 50 2012,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from snehav27.FUEL_ECONOMY_DATA_2012 where  " + cityappendwhere + highappendwhere + cmbappendwhere +
                                    " UNION ALL " +
                                    "select top 50 2013,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from  snehav27.FUEL_ECONOMY_DATA_2013 where  " + cityappendwhere + highappendwhere + cmbappendwhere +
                                    " UNION ALL " +
                                    "select top 50 2014,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from  snehav27.FUEL_ECONOMY_DATA_2014 where  " + cityappendwhere + highappendwhere + cmbappendwhere +
                                    " UNION ALL " +
                                    "select top 50 2015,model,cyl,trans,drive,fuel,stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +
                                  "from snehav27.FUEL_ECONOMY_DATA_2015 where  " + cityappendwhere + highappendwhere + cmbappendwhere;

            SqlConnection con = new SqlConnection(connstring);
            con.Open();
            SqlCommand cmd = new SqlCommand(quertstring, con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();                   
                    GridView2.DataSource = ds.Tables[0];
                    GridView2.DataBind();
                    

                

         

        }
    }


 

}
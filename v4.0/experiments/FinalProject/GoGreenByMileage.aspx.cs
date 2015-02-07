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
public partial class experiments_asp_TabsAfterPostBack : System.Web.UI.Page
{
    GoGreenDAO ggDAO = new GoGreenDAO();
    protected string ActiveTab { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack) {

            try
            {




                string URL = "http://www.fueleconomy.gov/ws/rest/fuelprices";

                string xmlContentsAsString = string.Empty;

                // Consuming the helper functions of SimpleProxy class written by Prof. Richard Rasala to obtain the response
                xmlContentsAsString = SimpleProxy.GetResponseContent(URL);


                // Calling the helper function to process the response XML and display it in the front end
                ProcessFuelEconomyXML(xmlContentsAsString);

            }
            catch (Exception ex)
            {
               
            }
        
        }
    }
    protected void ProcessFuelEconomyXML(string xml)
    {
        try
        {



            using (StringReader stringReader = new StringReader(xml))
            using (XmlTextReader reader = new XmlTextReader(stringReader))
            {
                while (reader.Read())
                {
                    if (reader.IsStartElement())
                    {
                        switch (reader.Name)
                        {
                            case "cng":
                                cng.Text = reader.ReadString();
                                break;
                            case "diesel":
                                diesel.Text = reader.ReadString();
                                break;
                            case "e85":
                                e85.Text = reader.ReadString();
                                break;
                            case "electric":
                                electric.Text = reader.ReadString();
                                break;
                            case "lpg":
                                lpg.Text = reader.ReadString();
                                break;
                            case "midgrade":
                                midgrade.Text = reader.ReadString();
                                break;
                            case "premium":
                                premium.Text = reader.ReadString();
                                break;
                            case "regular":
                                regular.Text = reader.ReadString();
                                break;
                        }
                    }
                }
            }
            // results.Style.display = "";
           
        }
        catch (Exception ex)
        {
         
        }
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
            GoGreen gg = new GoGreen(cityappendwhere, highappendwhere, cmbappendwhere);

                    DataSet ds = ggDAO.populateGreenTableUsingMileage(gg);

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        GridView2.DataSource = null;
                        GridView2.DataBind();
                        GoGreenError.Text = "There is no data available in DB. Please try with other input";
                        return;
                    }
                    else {
                        GoGreenError.Text = "";
                        GridView2.DataSource = ds.Tables[0];
                    GridView2.DataBind();
                    }

                

         

        }
    }


 

}
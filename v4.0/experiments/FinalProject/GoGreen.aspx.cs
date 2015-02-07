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

        if (!Page.IsPostBack)
        {

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


    protected void displayinfo(object sender, EventArgs e)
    {

        String value = names.SelectedItem.Text;
        String value2 = year.SelectedItem.Text;
        GoGreen gg = new GoGreen(value, value2);
        if (value == "---Select---")
        {
            // Result.Attributes.Add("style", "visibility: hidden");
        }
        else
        {
            DataSet ds = ggDAO.populateGreenTable(gg);
            DetailsGridView.DataSource = ds.Tables[0];
            DetailsGridView.DataBind();

        }
    }


    protected void displaydropdown2(object sender, EventArgs e)
    {


        names.Items.Clear();
        String value = year.SelectedItem.Text;
        Console.WriteLine("cameeee heree");
        GoGreen gg = new GoGreen("", value);
        if (value == "Select Year")
        {
            // Result.Attributes.Add("style", "visibility: hidden");
        }
        else
        {
            names.DataSource = ggDAO.populateCarnameDropdown(gg);
            names.DataTextField = "Model";
            names.DataValueField = "Model";
            names.DataBind();

            names.Items.Insert(0, new ListItem("---Select---", "initial"));
            names.SelectedValue = "initial";

        }
    }

}
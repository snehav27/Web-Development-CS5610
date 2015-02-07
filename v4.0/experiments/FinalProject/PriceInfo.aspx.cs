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


public partial class experiments_carinfo_CarSeries : System.Web.UI.Page
{
    CarInfoDAO cid = new CarInfoDAO();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlCarName.AppendDataBoundItems = true;
            ddlCarName.DataSource = cid.populateCarCompanyDropDown();
            ddlCarName.DataTextField = "CarName";
            ddlCarName.DataValueField = "CarName";
            ddlCarName.DataBind();
        }
    }

    protected void ddlCarName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlYear.Items.Clear();
        ddlYear.Items.Add(new ListItem("--Select Year--", ""));
        ddlModelName.Items.Clear();
        ddlModelName.Items.Add(new ListItem("--Select Car Model--", ""));
        ddlYear.AppendDataBoundItems = true;
        CarInfo ci = new CarInfo(ddlCarName.SelectedItem.Value, "");

        ddlYear.DataSource = cid.populateYearDropDown(ci);
        ddlYear.DataTextField = "CarYear";
        ddlYear.DataValueField = "CarYear";
        ddlYear.DataBind();
        if (ddlYear.Items.Count > 1)
        {
            ddlYear.Enabled = true;
        }
        else
        {
            ddlYear.Enabled = false;
            ddlModelName.Enabled = false;
        }


    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlModelName.Items.Clear();
        ddlModelName.Items.Add(new ListItem("--Select Car Model--", ""));
        ddlModelName.AppendDataBoundItems = true;
        CarInfo ci = new CarInfo(ddlCarName.SelectedItem.Value, ddlYear.SelectedItem.Value);

        ddlModelName.DataSource = cid.populateCarmodel(ci);
        ddlModelName.DataTextField = "CarModelName";
        ddlModelName.DataValueField = "CarID";
        ddlModelName.DataBind();
        if (ddlModelName.Items.Count > 1)
        {
            ddlModelName.Enabled = true;
        }
        else
        {
            ddlModelName.Enabled = false;
        }


    }

}
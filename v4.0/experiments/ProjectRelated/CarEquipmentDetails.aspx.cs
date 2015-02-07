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


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlCarName.AppendDataBoundItems = true;
            String strConnString = ConfigurationManager
                .ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;

            String strQuery = "SELECT distinct CarName FROM snehav27.CAR_STYLE_INFO ";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                ddlCarName.DataSource = cmd.ExecuteReader();
                ddlCarName.DataTextField = "CarName";
                ddlCarName.DataValueField = "CarName";
                ddlCarName.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }
    protected void ddlCarName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlYear.Items.Clear();
        ddlYear.Items.Add(new ListItem("--Select Year--", ""));
        ddlModelName.Items.Clear();
        ddlModelName.Items.Add(new ListItem("--Select Car Model--", ""));

        ddlYear.AppendDataBoundItems = true;
        String strConnString = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
        String strQuery = "SELECT distinct CarYear FROM snehav27.CAR_STYLE_INFO where carName=@Carname";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@Carname", ddlCarName.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            ddlYear.DataSource = cmd.ExecuteReader();
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
        catch (Exception ex)
        {
            ///  throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlModelName.Items.Clear();
        ddlModelName.Items.Add(new ListItem("--Select Car Model--", ""));
        ddlModelName.AppendDataBoundItems = true;
        String strConnString = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
        String strQuery = "select (CarSeries + ' - ' + Name) AS CarModelName ,CarID from snehav27.CAR_STYLE_INFO where CarYear=@Year and carName=@Carname";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@Year", ddlYear.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@Carname", ddlCarName.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            ddlModelName.DataSource = cmd.ExecuteReader();
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
        catch (Exception ex)
        {
            //  throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

}

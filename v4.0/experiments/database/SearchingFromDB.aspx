    <%@ Page Language="C#" %>

    <%@ Import Namespace="System.Data.SqlClient" %>
    <%@ Import Namespace="System.Data" %>


    <!DOCTYPE html>
     <style type="text/css" media="screen">
            .main-wrapper {
                height: 80%;
                width: 96%;
                padding: 2%;
            }

            .demo {
                border: 2px solid #a1a1a1;
                padding: 10px 40px;
                background: #dddddd;
                width: 300px;
                border-radius: 25px;
            }

            h1 {
                text-align: center;
            }

            div {
            }

            h2 {
                background-color: lightpink;
                color: #808080;
                font-size: 1.1em;
                padding: 0.5em;
                width: 100%;
                text-decoration: none;
            }

            h4 {
                background-color: lightpink;
                color: #808080;
                font-size: 0.9em;
                padding: 0.3em;
                width: 100%;
                text-decoration: none;
            }

            ul.master_navigation {
                font-size: 100%;
                font-weight: bold;
                text-align: center;
                padding: 0;
                list-style: none;
                margin: 0.5em 0;
                /*background: #FF0066*/
            }

                ul.master_navigation li {
                    display: inline-block;
                    padding: 0 0.5%;
                }

            a {
                color: #08f;
                font-weight: bold;
                text-decoration: none;
            }

                a:visited {
                    color: #88f;
                }

                a:hover {
                    color: #88f;
                }

            p {
                text-align: justify;
            }

            #centered {
                width: 800px;
                text-align: left;
                border: 0px;
                padding: 0;
                margin: 0 auto;
            }

            body {
                width: 900px;
                max-width: 100%;
                margin: 0;
                padding: 0;
                background: #DBDBDD;
            }

            .pad {
                padding: 10px;
            }

            .onTopOfEachOther {
                position: relative;
                top: 1px;
                left: -3px;
            }

                .onTopOfEachOther span {
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }

            pre, code {
                direction: ltr;
                text-align: left;
            }

            pre {
                font-size: 0.77em;
                line-height: 0.8em;
                font-family: Courier, "Courier New", mono;
                color: #000000;
                margin: 4px;
                padding: 4px;
                border: solid 1px #808080;
                background: #c3dff8;
            }

            code {
                font-size: 0.9em;
                line-height: 0.9em;
                font-family: Courier, "Courier New", mono;
                color: #000000;
                background: #EEEEEE;
            }
     </style>
    <script runat="server">


        static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
        static int count = 1;

        protected void Page_Load(Object sender, EventArgs e)
        {
            try
            {
                string selectString = "SELECT distinct Model FROM snehav27.FUEL_ECONOMY_DATA_2011";
                SqlDataAdapter adpt = new SqlDataAdapter(selectString, connstring);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                names.DataSource = dt;
                if (!IsPostBack)
                {
                
                    names.DataTextField = "Model";
                    names.DataValueField = "Model";
                    names.DataBind();

                    names.Items.Insert(0, new ListItem("---Select---", "initial"));
                    names.SelectedValue = "initial";
                }

            }
            catch (Exception ex)
            {
                string text = "SQL Failure\n" + ex.Message;

         
            }


        }

  


        protected void displayinfo(object sender, EventArgs e)
        {
            String value = names.SelectedItem.Text;

            if (value == "---Select---")
            {
               // Result.Attributes.Add("style", "visibility: hidden");
            }
            else
            {
                try
                {

                    using (SqlConnection connection = new SqlConnection(connstring))
                    {
                        DataSet ds = new DataSet();
                        string selectString = "SELECT distinct Model,Cyl,Fuel,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore FROM snehav27.FUEL_ECONOMY_DATA_2011 where Model = '" + names.SelectedItem.Text + "'";

                        SqlDataAdapter newAdapter = new SqlDataAdapter(selectString, connection);
                        //90 seconds time out
                        newAdapter.SelectCommand.CommandTimeout = 90;
                        newAdapter.Fill(ds);
                        connection.Close();

                        // Below lines of code is responsible for pushing the data to grid view
                        DetailsGridView.DataSource = ds.Tables[0];

                        DetailsGridView.DataBind();
                    }

                }
                catch (Exception ex)
                {

                }
            }
        }
    </script>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Fetching Data From Database</title>
        <link rel="stylesheet" type="text/css" href="exp7.1.css" />
    </head>
    <body class="main-wrapper" id="centered">
        <h1>Experiment 3:</h1>
    
            <div class="container">
            <div class="exp_name">
                <br />
                <hr />
                <h2 class="heading">Fetching Data From Database</h2>
                <hr />
                <br />
            </div>
            <div class="experiment">
                <form id="form1" runat="server">

                    <div class="text">
                        <strong>Select a CAR name to get info:
                        </strong>&nbsp;&nbsp;
               
                        <asp:DropDownList ID="names" AutoPostBack="true" OnSelectedIndexChanged="displayinfo" runat="server" AppendDataBoundItems="true" Style="margin-top: 0px; text-align: center;">
                        </asp:DropDownList>
                        <br /> <br />
                    <asp:GridView ID="DetailsGridView"  AutoGenerateColumns="true"
                         Width="520px" CellPadding="4" ForeColor="black" GridLines="None" runat="server">
                  
                        <AlternatingRowStyle BackColor="gray" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  
                        <HeaderStyle BackColor="gray" Font-Bold="True" ForeColor="White" />
                    
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    
                    </asp:GridView>
                
                <br />
            
                    </div>
          

                </form>
            </div>
            <div class="source_div">

            

            </div>
    
        <h4> About the experiment :</h4>
            <p> This Experiment is continuation of the <a href="http://net4.ccs.neu.edu/home/snehav27/story/index.htm?../experiments/database/story.txt">Experiment1 and Experiment2</a></p>
                In this experiment , table data from Database is fetched on drop down selection. When we use SQL query selection operation in DB and giving where condition clause DB would
                fetch selected section of data . Same selection of data Users would like to see in front end. In this experiment data will be fetched 
                as user selects the drop down value.
            <h2>View Code </h2>
            <pre> &lt;asp:DropDownList ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="displayinfo" <br />
                runat="server" AppendDataBoundItems="true" Style="margin-top: 0px; text-align: center;"&gt;<br />
                        &lt;/asp:DropDownList&gt;
            </pre>
            <pre> &lt;asp:GridView ID="GridView1"  AutoGenerateColumns="true" <br />
                //Styling contents of grid view goes here                  <br />                 
                    &lt;/asp:GridView&gt; </pre>
            <b> Description :</b>
                <p> Dropdown and grid to be displayed is written in the view content. AutoPostBack="true" in Drop down value
                    Gets or sets a value indicating whether a postback to the server automatically occurs when the user 
                    changes the list selection. So when user changes the drop down value table data is automatically changed. <br />
                    OnSelectedIndexChanged="displayinfo" : -> This will search for displayinfo function inside the code and will perform the operation inside the
                    function. More information explained below.<br /> 
                    GridView : will show results data fetched from DB in a grid type of view.  <br />
                    For More Information on grid view: <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/database/Database.aspx"> Experiment 1</a>

                </p>
            <h4> Code aspx:</h4>
            <pre>
      protected void displayinfo(object sender, EventArgs e) <br />
        { <br />
            String value = names.SelectedItem.Text; <br />
            if (value == "---Select---") <br />
            { <br />
               // Do Nothing <br />
            } <br />
            else <br />
            { <br />
                try <br />
                { <br />

                    using (SqlConnection connection = new SqlConnection(connstring)) <br />
                    { <br />
                        DataSet ds = new DataSet(); <br />
                        string selectString = "SELECT distinct Model,Cyl,Fuel,VehClass,AirPollutionScore, <br />
                        CityMPG,HwyMPG,CmbMPG,GreenHouseScore FROM snehav27.FUEL_ECONOMY_DATA_2011 where <br />
                         Model = '" + names.SelectedItem.Text + "'"; <br />

                        SqlDataAdapter newAdapter = new SqlDataAdapter(selectString, connection); <br />
                        //90 seconds time out <br />
                        newAdapter.SelectCommand.CommandTimeout = 90; <br />
                        newAdapter.Fill(ds); <br />
                        connection.Close(); <br />

                        // Below lines of code is responsible for pushing the data to grid view
                        DetailsGridView.DataSource = ds.Tables[0]; <br />

                        DetailsGridView.DataBind(); <br />
                    }

                }
                catch (Exception ex) <br />
                {

                }
            }
        }    

            </pre>
            <b> Description :</b>
                <p> displayinfo method is called when dropdown is changed. When select is selected in the drop no operation is done.
                    If any other drop down value is selected, selected item will be passed to where condition and results are displayed in grid view.<br />
                     names.SelectedItem.Text  -> will fetch data of the selected drop down. <br />
                    newAdapter.SelectCommand.CommandTimeout = 90; -> is used to set timeout . If the responce is not received within stipulated time
                    then the results will not be fetched.<br />
                    newAdapter.Fill(ds) -> Output fetched will be filled into Dataset . <br />
                </p>

            <h2>Source Code</h2>
            <a href="../../fileview/Default.aspx?~/experiments/database/SearchingFromDB.aspx" target="_blank">View Source</a>
            <hr />

            <h2>References</h2>
            <a href="http://net4.ccs.neu.edu/home/snehav27/story/index.htm?../experiments/database/story.txt" target="_blank">Refered Experiment 1 and Experiment 2 </br>
            <hr />

            <br />
            <br />
        </div>
      
    </body>
    </html>


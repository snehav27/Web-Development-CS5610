<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!IsPostBack)
            {         
                DisplayEbayItems();
            }   
            
        }
        catch (Exception ex)
        {
             
        }
    }

    // Loads the value retrieved from SQL DB into the grid view
    public void DisplayEbayItems()
    {
        try
        {
            DataSet ds = new DataSet();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();

            string query = "select * from snehav27.Ebay order by ID asc";
            SqlDataAdapter newAdapter = new SqlDataAdapter(query, connection);
            //90 seconds time out
            newAdapter.SelectCommand.CommandTimeout = 90;
            newAdapter.Fill(ds);
            connection.Close();

            // Below lines of code is responsible for pushing the data to grid view
            EbayDetailsGridView.DataSource = ds.Tables[0];
          
            EbayDetailsGridView.DataBind();
        
        }
        catch (Exception ex)
        {
            
        } 
    }
    
</script>

<html>

<head id="Head1" runat="server">

    <title>Database Experiment</title>



</head>

<body id="centered">

    <form id="form1" runat="server">

        <div class="main-wrapper" id="centered">

            <h1>Experiment 1 - Fetching Data From Database </h1>

            <hr />

            <div class="exp-wrap">

               

                <asp:GridView ID="EbayDetailsGridView"  AutoGenerateColumns="true"
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
            <hr />

            <h4>About the experiment</h4>
            <p>
            Database is an organized collection of Data. In this experiment I have connected to the database and fetching static table data.</br> 
            I have created table with following conditions :</br>
            1) ItemName and Price Cannot be NULL.</br>
            2) Location can be NULL.</br>
            3) ID is auto incremental field.</br></br>
            I have also used asp:GridView to fetch the table data from database. Table object is fetched and assigned to asp:GridView ID.

            </p>
            <h4> Commands Used to create table:</h4>
            <pre> 
                CREATE TABLE Ebay <br />
                 (</br>
                   ItemName varchar(255) NOT NULL,</br>
                   Price int NOT NULL,</br>
                   Location varchar(255),</br>
                   ID int IDENTITY(1,1) PRIMARY KEY</br>
                  );</br>
            </pre>
            <h4>Code Snippet After Database Fetch:</h4>
            <pre> </br>
                EbayDetailsGridView.DataSource = ds.Tables[0];    </br>
                EbayDetailsGridView.DataBind(); </br>
            </pre>
            <p>  <b>Description :</b> After connecting to database ,  table object is fetched and assigned to the 
                asp:GridView ID  . </p> 
            <h4>Code Snippet in Body :</h4>
              <pre> <br />
                 &lt;asp:GridView ID="EbayDetailsGridView"  AutoGenerateColumns="true" <br />
                Width="520px" CellPadding="4" ForeColor="black" GridLines="None" runat="server"&gt<br />
                 </pre>
            <hr />
            

        <h2>Source Code</h2>
        <a href="../../fileview/Default.aspx?~/experiments/database/Database.aspx" target="_blank">View Source</a>

        <hr />

        <h2>References</h2>
        <a href="http://net4.ccs.neu.edu/home/venkat89/" target="_blank">Venkat </a>

        <hr />

        </br>
        </br>

    </form>
</body>
</html>



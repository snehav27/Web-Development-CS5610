<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item Page</title>
    <script src="jquery-1.4.4.min.js" type="text/javascript"></script>
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
                string st = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(st);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from snehav27.Ebay order by ID asc", con);
                Items.DataSource = cmd.ExecuteReader();
                Items.DataValueField = "ItemName";
                Items.DataTextField = "ItemName";
                Items.DataBind();
            }
        
    
</script>
</head>
<body class="main-wrapper" id="centered">
    <h1>Experiment 2:</h1>
    <h2>Drop Down data from DB:</h2>
    <form id="form1" runat="server">
        <div>
    <div id="SelectCustomers" class="demo">
        Select Item:
        <asp:DropDownList ID="Items" runat="server">
        </asp:DropDownList>
    </div>
    
        <h4> About the experiment :</h4>
        <p> In this experiment , I have connected to DB and fetched data from DB and assigned to a drop down box.
            Some times its necessary to fetch data from db and assign it to any element. If there is any change in the element
            we need to change the code , we just need to do changes in the DB . 
            Which is an advantage of not deploying code again and again when there is change. This will surely help when
            application is very big amd deployment time is high.
        </p>
        <h4>View Code </h4>
        <pre> &lt;asp:DropDownList ID="Items" runat="server"&gt; <br />
        &lt;/asp:DropDownList&gt;

        </pre>
        <b> Description :</b>
            <p> Drop down list is added in the  body code . When page is loaded drop down will be filled with fetched database value. </p>
        <h4> ASPX Code:</h4>
        <pre>
             protected void Page_Load(object sender, EventArgs e)<br />
            {<br />               
                SqlConnection con = new SqlConnection(st);<br />
                con.Open();<br />
                SqlCommand cmd = new SqlCommand("select * from snehav27.Ebay order by ID asc", con);<br />
                Items.DataSource = cmd.ExecuteReader();<br />
                Items.DataValueField = "ItemName"; ;<br />
                Items.DataTextField = "ItemName";<br />
                Items.DataBind();<br />
            }     <br />

        </pre>
        <b> Description :</b>
            <p>
                Page_Load method will be called whenever the page is opened for first time and page reload happens.
                In order to add the drop down items into drop down we need to fetch data from DB and assign it to drop down 
                on page load. <br /><br />
                SqlCommand cmd -> will create a new sql command. <br />
                cmd.ExecuteReader()-> will excute the sql command and fetch data into Items ID. <br />
                Items mentioned in Page_Load function and ID of the dropdown in the view code should be same else data will not be fetched.<br />
            </p>

        <h2>Source Code</h2>
        <a href="../../fileview/Default.aspx?~/experiments/database/DropDownFromDb.aspx" target="_blank">View Source</a>
        <hr />

        <h2>References</h2>
        <a href="http://www.ashishblog.com/" target="_blank">Blog</a> </br>
        <hr />

        <br />
            <br />
    </div>
          </form>
</body>
</html>


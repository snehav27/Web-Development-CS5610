<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecursiveDropDownFromDB.aspx.cs" Inherits="experiments_ProjectRelated_RecursiveDropDownFromDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
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

        pre {
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

        table, td, th {
            border: 1px solid black;
        }

        th {
            background-color: pink;
            color: grey;
        }
        img {
            width: 350px;
            height: 250px;
        }

    </style>
</head>
<body id="centered" class="main-wrapper" >

    <form id="form1" runat="server">
     <h1>Recursive Drop downs</h1>
        <h2> Experiment To fetch details from DB :</h2>
        <div class="demo" >
    
              <span style ="font-family:Arial">Select Car Name : </span> 
        <asp:DropDownList ID="ddlCarName" runat="server" AutoPostBack = "true" OnSelectedIndexChanged="ddlCarName_SelectedIndexChanged">
        <asp:ListItem Text = "--Select Car Name--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <span style ="font-family:Arial">Select Year : </span> 
        <asp:DropDownList ID="ddlYear" runat="server" Enabled = "false" AutoPostBack = "true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
        <asp:ListItem Text = "--Select Country--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <span style ="font-family:Arial">Select Car Model : </span> 
        <asp:DropDownList ID="ddlModelName" runat="server" Enabled = "false" AutoPostBack = "false"  ng-model="carName">
        <asp:ListItem Text = "--Select City--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
    
    </div>
    </form>
      <h4>About the Experiment</h4>
        <p>
            This Experiment is continuation of Drop down from DB Experiment :
            <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/database/DropDownFromDb.aspx">Click Here For Drop Down From DB</a><br /><br />
           There is always a scenerio where we load the drop downs according to the previous drop down while searching any data in the UI.
            <br />
            In this experiment I am connecting to DB and fetching the Dropdown which is depending on the previous drop down. In this experiment I am using 
            three drop down where second drop down will be fetched according to the first drop down selection and third drop down will be fetched according 
            to the first and second drop down. 

        </p>
        
        <h4> Code snippet in the Front end:</h4>
        <pre><br/>
          &ltspan style ="font-family:Arial"&gtSelect Car Name : &lt/span&gt <br/>
        &ltasp:DropDownList ID="ddlCarName" runat="server" AutoPostBack = "true" <br/>
            OnSelectedIndexChanged="ddlCarName_SelectedIndexChanged"&gt <br/>
        &ltasp:ListItem Text = "--Select Car Name--" Value = ""&gt&lt/asp:ListItem&gt <br/>
        &lt/asp:DropDownList&gt <br/>
        
        &ltspan style ="font-family:Arial"&gtSelect Year : &lt/span&gt  <br/>
        &ltasp:DropDownList ID="ddlYear" runat="server" Enabled = "false" AutoPostBack = "true" <br/>
            OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"&gt <br/>
        &ltasp:ListItem Text = "--Select Country--" Value = ""&gt&lt/asp:ListItem&gt <br/>
        &lt/asp:DropDownList&gt <br/>
        
        &ltspan style ="font-family:Arial"&gtSelect Car Model : &lt/span&gt  <br/>
        &ltasp:DropDownList ID="ddlModelName" runat="server" Enabled = "false" AutoPostBack = "false" &gt <br/>
        &ltasp:ListItem Text = "--Select City--" Value = ""&gt&lt/asp:ListItem&gt <br/>
        &lt/asp:DropDownList&gt <br/>
        
</pre><br/> 
        <p>
        <b>Description:<br/> </b>
            In the above code snippet there are three drop downs.<br />
            1)AutoPostBack will post back the information on other elements <br />
            2) Enabled =  false will make drop down intially false , Here I have used false because when first drop down
            is not selected the second and third drop down should be disaibled . <br />
            3) OnSelectedIndexChanged : This will trigger the code behind and will fetch the details from the DB for next consecutive drop down.  <br />

            On page load the first drop down is fetched  .
            So on every change onselectedIndex change will trigger the code behind method and fetch details from DB and set the value to the 
            next drop down i.e When index of the first drop down is changed it will fetch the details for the second drop down same for third drop down.
        </p>
        <h4> Code Behind Snippet : </h4>
        <pre>
           <br />
    {<br />
        if (!IsPostBack)<br />
        {<br />
            ddlCarName.AppendDataBoundItems = true;<br />
           
            String strQuery = "SELECT distinct CarName FROM snehav27.CAR_STYLE_INFO ";<br />
        
            {
                con.Open();<br />
                ddlCarName.DataSource = cmd.ExecuteReader();<br />
                ddlCarName.DataTextField = "CarName";<br />
                ddlCarName.DataValueField = "CarName";<br />
                ddlCarName.DataBind();<br />
            }<br />
         
        </pre>
    <p><b>Descriptipn :</b> <br />
        Note : I have not pasted all the code which is required for explanation.
         on Page load CarName will  be fetched from DB and assigned to first drop down ddlCarName.
        Here I have set key value as carname . So when Car name is selected Car name will be the value of the drop down.
    </p>
    <pre>
 
        ddlYear.Items.Clear();<br />
        ddlYear.Items.Add(new ListItem("--Select Year--", ""));<br />
        ddlModelName.Items.Clear();<br />
        ddlModelName.Items.Add(new ListItem("--Select Car Model--", ""));<br />

        ddlYear.AppendDataBoundItems = true;<br />
        String strConnString = ConfigurationManager.ConnectionStrings["prodConString"].ConnectionString;<br />
        String strQuery = "SELECT distinct CarYear FROM snehav27.CAR_STYLE_INFO where carName=@Carname";<br />
      
        cmd.Parameters.AddWithValue("@Carname", ddlCarName.SelectedItem.Value);<br />
        try
        {
            con.Open();
            ddlYear.DataSource = cmd.ExecuteReader();<br />
            ddlYear.DataTextField = "CarYear";<br />
            ddlYear.DataValueField = "CarYear";<br />
            ddlYear.DataBind();<br />
            if (ddlYear.Items.Count > 1)<br />
            {
                ddlYear.Enabled = true;<br />
            }
            else
            {
                ddlYear.Enabled = false;<br />
                ddlModelName.Enabled = false;<br />
            }
        }
        </pre>
       <p><b>Descriptipn :</b> <br />
        Note : I have not pasted all the code which is required for explanation.
         On change of the first drop down ddlYear year drop down and model drop down are cleared . and again reloaded with new values according to the car name 
           selected.
         Sql Query will  take care of fetching data using where condition :  <b>where carName=@Carname";</b>

           Here I am also checking on the if drop down count is greater than 1 , If the count is greater than 1 . I am enabling the dropdown
           else will disaible the drop down.
    </p>

    <pre>
    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)<br />
    {<br />
        ddlModelName.Items.Clear();<br />
        ddlModelName.Items.Add(new ListItem("--Select Car Model--", ""));<br />
        ddlModelName.AppendDataBoundItems = true;<br />
        String strConnString = ConfigurationManager.ConnectionStrings["prodConString"].ConnectionString;<br />
        String strQuery = "select (CarSeries + ' - ' + Name) AS CarModelName ,CarID from snehav27.CAR_STYLE_INFO <br />
            where CarYear=@Year and carName=@Carname";<br />
 
        cmd.Parameters.AddWithValue("@Year", ddlYear.SelectedItem.Value);<br />
        cmd.Parameters.AddWithValue("@Carname", ddlCarName.SelectedItem.Value);<br />
    
        try
        {
            con.Open();<br />
            ddlModelName.DataSource = cmd.ExecuteReader();<br />
            ddlModelName.DataTextField = "CarModelName";<br />
            ddlModelName.DataValueField = "CarID";<br />
            ddlModelName.DataBind();<br />
            if (ddlModelName.Items.Count > 1)<br />
            {
                ddlModelName.Enabled = true;<br />
            }
            else<br />
            {
                ddlModelName.Enabled = false;<br />
            }

        </pre><br/>
        <b>Descripton:</b>
         Note : I have not pasted all the code which is required for explanation.
         On change of the second drop down ddlModelName model name drop down are cleared . and again reloaded with new values according to the year and car name 
           selected.
         Sql Query will  take care of fetching data using where condition :  <b>where CarYear=@Year and carName=@Carname"</b>

           Here I am also checking on the if drop down count is greater than 1 , If the count is greater than 1 . I am enabling the dropdown
           else will disaible the drop down.
        <h4>Source Code </h4>
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/RecursiveDropDownFromDB.aspx" target="_blank">Front End Source</a> <br />
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/RecursiveDropDownFromDB.aspx.cs" target="_blank">Code Behind Source</a>
        <hr />

        <h4>References</h4>
        <a href="http://stackoverflow.com//" target="_blank">Stack Over Flow</a>
        <hr />
   

</body>
</html>

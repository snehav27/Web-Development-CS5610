<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GogreenScore.aspx.cs" Inherits="experiments_project_Extra_Fields_CarPrices" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>GO Green Score</title>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
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
</head>
<body id="centered" class="main-wrapper" ng-app>
       
    <div   ng-controller="EdmundClientController">
        <h1>Go Green fetch using Score Information</h1>
        <h2> Experiment using DB SQL combining five tables:</h2>
          <form id="form1" runat="server">
        <div class="demo" >
     
               <asp:RadioButton id="radiobuttonGrhs" CssClass="radio" runat="server" GroupName="measurementSystem"></asp:RadioButton>                      
                   <label for="radiobuttonGrhs">Greeen House Score :</label>
                     <asp:RadioButton id="radiobuttonArp" CssClass="radio" runat="server" GroupName="measurementSystem"></asp:RadioButton>
                       
                   <label for="radiobuttonArp">AirPollution Score :</label>
                       <br />
                   <br />    <br />
                       Enter the Score:
                            <asp:TextBox ID="scoreText" runat="server" Text="" onkeypress="return functionx(event)" >
                            </asp:TextBox>
               <br />    <br />
                       <asp:Button id="Button2" Text="Submit" runat="server" OnClick="displayinfo3" CssClass="myButton" />
                 <br /> <br />    <br />
                     
  
         
      
       
    </div>
       
        <asp:GridView ID="GridView3"  AutoGenerateColumns="true"
                             GridLines="None" runat="server"  >                                           
                        </asp:GridView>
                 
            </form>
    <div>
           <h4>About the Experiment</h4>
        This Experiment is continuation of the following experiments :<br />
        <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/database/Database.aspx">Grid View</a> <br />
         <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/database/SearchingFromDB.aspx">Select Crude operation</a> <br />
         <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/ProjectRelated2/Gogreenmil.aspx">Query builder according to user selection</a>
         <p> I have done this experiment to use  radio button selected by user and fetch from db.
          User can select any two of the radio button i.e (green house score or air pollution) . The main challenge was to incoorperate where condition according to user selection.
          So user will have option to select any of the two radio buttons   . 
      </p>


         <h4> Code DB Query</h4>

        <pre>   
           Boolean greenScore = radiobuttonGrhs.Checked;<br />
        Boolean airPolutionScore = radiobuttonArp.Checked;<br />
        String score = scoreText.Text;<br />
        if (greenScore || airPolutionScore)<br />
        {

            string greenScoreWhereClause = "";<br />
            string airPolutionScoreWhereClause = "";<br />
            if (greenScore)<br />
                greenScoreWhereClause = "GreenHouseScore = " + score;<br />
            if (airPolutionScore)<br />
                airPolutionScoreWhereClause = " AirPollutionScore = " + score;

            string quertstring = "select top 50  2011,model,cyl,trans,drive,fuel,stnddescription <br />
            ,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +<br />
                                    "from snehav27.FUEL_ECONOMY_DATA_2011 where "<br />
             + greenScoreWhereClause + airPolutionScoreWhereClause +<br />
                                       " UNION ALL " +<br />
                                  "select top 50  2012,model,cyl,trans,drive,fuel,<br />
            stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +<br />
                                     "from  snehav27.FUEL_ECONOMY_DATA_2012 where  "<br />
             + greenScoreWhereClause + airPolutionScoreWhereClause +<br />
                                       " UNION ALL " +<br />
                                       "select top 50  2013,model,cyl,trans,drive,fuel,<br />
            stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +<br />
                                     "from snehav27.FUEL_ECONOMY_DATA_2013 where  "<br />
             + greenScoreWhereClause + airPolutionScoreWhereClause +<br />
                                       " UNION ALL " +<br />
                                       "select top 50  2014,model,cyl,trans,drive,fuel,<br />
            stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +<br />
                                     "from snehav27.FUEL_ECONOMY_DATA_2014 where  "<br />
             + greenScoreWhereClause + airPolutionScoreWhereClause +<br />
                                       " UNION ALL " +<br />
                                       "select top 50  2015,model,cyl,trans,drive,fuel,<br />
            stnddescription,VehClass,AirPollutionScore,CityMPG,HwyMPG,CmbMPG,GreenHouseScore " +<br />
                                     "from snehav27.FUEL_ECONOMY_DATA_2015 where  "<br />
             + greenScoreWhereClause + airPolutionScoreWhereClause;<br />
            </pre>
            <b>Description : </b>
        <p> When user selects the green score radio button :<br />
            <br />  greenScoreWhereClause = "GreenHouseScore = " + score; where condition is used.<br />
            When user selects the Air pollution score radio button : <br />
                airPolutionScoreWhereClause = " AirPollutionScore = " + score; where condition is used<br />
            So where condition changes according user selection as per code given above . <br />
            Since I have 5 table data i.e year tabled from 2011 to 2015 . I need to merge the results into one table.
            To that I have used union all to append the table data.
        </p>
         <h4>Code after DB query created</h4>
        <pre>
            SqlConnection con = new SqlConnection(connstring);<br />
            con.Open();<br />
            SqlCommand cmd = new SqlCommand(quertstring, con);<br />
            DataSet ds = new DataSet();<br />
            SqlDataAdapter da = new SqlDataAdapter(cmd);<br />
            da.Fill(ds);<br />
            con.Close();<br />
           
            GridView3.DataSource = ds.Tables[0];<br />
            GridView3.DataBind();<br />
                    
 </pre>

       <b>Description : </b>
        <p> After user gets the query string , Data is fetched and added to grid view to show table details on the screen. </p>
       
       
       <h4>Source Code </h4>
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated2/GogreenScore.aspx" target="_blank">Front End Source</a> <br />
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated2/GogreenScore.aspx.cs" target="_blank">Code Behind Source</a>
        <hr />

        <h4>References</h4>
        My old Experiments
        <hr />
   
    </div>
   



</body>

</html>

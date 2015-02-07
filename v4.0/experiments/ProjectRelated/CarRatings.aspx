<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarRatings.aspx.cs" Inherits="experiments_project_Extra_Fields_CarRatings" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Edmund API With Angular JS</title>
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
            width: 600px;
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
        
                #divtable {
    display: table;
    }

  #row  {
    display: table-row;
       border: 2px solid #a1a1a1;
    padding: 10px 40px; 
    background: white;
    width: 300px;
    border-radius: 25px;
    }

  #left, #right, #middle {
    display: table-cell;
    }
    </style>
</head>
<body id="centered" ng-app>
       
    <div class="main-wrapper" ng-controller="EdmundClientController">
        <h1>CAR Rating Information Details </h1>
        <div class="demo" >
        <form id="form1" runat="server">
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
       
            </form>

        
            <button ng-click="getDetails()">Get CAR Details</button> </br>
          </div>
        </br> </br>
        <div  id="divtable"  ng-repeat="cr in carreview">
            <p id="row">
                    <b> Author :</b>
                    {{cr.author.authorName}} <br />
                </p>
            <p id="row">
                <b>Title :</b>
                    {{cr.title}} <br />
                </p>
            <p id="row">
                <b>Description : </b>
                    {{cr.text}}    <br />
                    {{cr.favoriteFeatures}}  <br />
                    {{cr.suggestedImprovements}}  
                </p> 
            <p id="row">
                <b> Description</b> <br />
                    <span ng-repeat="rate in cr.ratings"> 
                        <span id="left" >{{rate.type}} <b>-</b>
                       {{rate.value}}</span>
          </span>
                </p>      
             </br> </br>      
        </div>
        <p id="displayMessage"></p>
       
    </div>
     <h4>About the Experiment</h4>
        <p>
            This Experiment is continuation of Car Details Experiment :<br />
            1) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/api/CarDetailsAPI.html">Click Here For Car Details Experiment</a> and <br />
            2) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/ProjectRelated/RecursiveDropDownFromDB.aspx">Click Here For DB Experiment</a><br />
           In this experiment I am using Edmunds API to  get Car Rating details of the car using the style id of that particular car. Edmunds API provides 
            Car Rating details maping it to style ID using JSON format. <br /><br />          
            In this experiment I have incoorperated DB and angular JS together. DB I have inserted static records which will fetch me the style details .
            I have created CAR_STYLE_INFO table for fetching information from DB.
            

        </p>
        <h4>  URL Used : </h4>
        <pre>
 URL = https://api.edmunds.com/api/vehiclereviews/v2/styles/carstyle?sortby=created%3ADESC&pagenum=1&pagesize=5&fmt=json <br/>
 

        </pre>
        <b>Description : </b>
        Here I have url which will fetch Car ratings according to the style id.

        <h4> Code snippet of script:</h4>
        <pre>
      function EdmundClientController($scope, $http) {<br />
            $http.headers = headers;<br />
            $scope.getDetails = function () {<br />
                var carstyle = $scope.carName;<br />
            
                console.log(carstyle );<br />
                if (carstyle == undefined ) {<br />
                    alert("Please mandatory fields car name ");<br />
                    return false;<br />
                }<br />
              
                    var url = URL8.replace("carstyle", carstyle);<br />

                $http.get(url).success(function (response) {<br />
                    var carreviewdetails = response;<br />

                    if (carreviewdetails.status == "NOT_FOUND") {<br />
                        document.getElementById("displayMessage").innerHTML = <br />
            "No Review Available Retry with another Car.";<br />
                    }else{<br />
                    $scope.carreview = carreviewdetails.reviews;<br />
                    console.log("carreviewdetails " + carreviewdetails.reviewsCount);
                    <br />
                    if (carreviewdetails.reviewsCount == 0) {<br />
                      
                        document.getElementById("displayMessage").innerHTML = <br />
            "No Review Available Retry with another Car.";<br />
                    }
                    else {<br />
                  
                        document.getElementById("displayMessage").innerHTML = "";<br />
                    }
                    }
          
                }).<br />
              error(function (data, status, headers, config) {<br />
                  document.getElementById("displayMessage").innerHTML = <br />
            "No Review Available Retry with another An Old Car.";
              });<br />
            }<br />
        }<br />


     </pre>
        <p>
            <b>Description</b><br/>
            After URL sends the request to Edmund client , response is received and results is fetched in JSON format.
          <b>  $scope.carName : </b> is the information that the user has selected in the car model drop down. <br/>
          <b>  $scope.carreview: </b> object containing the information on ratings to be displayed.<br/>
           In this experiment I have added new feature to handle the error because some time API is returning 
            with error information , So when error information is returned from API we will display no review available.
            Whenever responce is failed <b>.error</b>  will be called.
        </p>
        <h4> Code snippet in the Div:</h4>
        <pre>

           &ltdiv  id="divtable"  ng-repeat="cr in carreview"&gt <br/>
            &ltp id="row"&gt<br/>
                    &ltb&gt Author :&lt/b&gt<br/>
                    { {cr.author.authorName}} <br/>
                &lt/p&gt<br/>
            &ltp id="row"&gt<br/>
                &ltb&gtTitle :&lt/b&gt<br/>
                    { {cr.title}} <br/>
                &lt/p&gt<br/>
            &ltp id="row"&gt<br/>
                &ltb&gtDescription : <br/>
                    { {cr.text}}    <br/>
                    { {cr.favoriteFeatures}}  <br/>
                    { {cr.suggestedImprovements}}  <br/>
                &lt/p&gt <br/>
            &ltp id="row"&gt<br/>
                &ltb&gt Description&lt/b&gt &ltbr /&gt<br/>
                    &ltspan ng-repeat="rate in cr.ratings"&gt <br/>
                        &ltspan id="left" &gt{ {rate.type}} &ltb&gt-&lt/b&gt<br/>
                       { {rate.value}}&lt/span&gt<br/>
          &lt/span&gt<br/>
                &lt/p&gt          <br/>
        &lt/div&gt <br/>
</pre><br/> 
        <p>
        <b>Description:</b>
     carreview object will have all the information that needs to be displayed and above code snippet is used to diaplay object information in
            the div.Rating Array is iterated usign ng-repeat. This information is represented in div since this car review.

        </p>
       
       <h4>Source Code </h4>
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/CarEquipmentDetails.aspx" target="_blank">Front End Source</a> <br />
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/CarEquipmentDetails.aspx.cs" target="_blank">Code Behind Source</a>
        <hr />

        <h4>References</h4>
        <a href="http://developer.edmunds.com/" target="_blank">Edmunds Developer Site</a>
        <hr />
   
    </div>
    <script>

        var URL8 = "https://api.edmunds.com/api/vehiclereviews/v2/styles/carstyle?sortby=created%3ADESC&pagenum=1&pagesize=5&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
        
        var headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        };

        function EdmundClientController($scope, $http) {
            $http.headers = headers;
            $scope.getDetails = function () {
                var carstyle = $scope.carName;
            
                console.log(carstyle );
                if (carstyle == undefined ) {
                    alert("Please mandatory fields car name ");
                    return false;
                }
              
                    var url = URL8.replace("carstyle", carstyle);
             
                    console.log(url);
        

                $http.get(url).success(function (response) {
                    var carreviewdetails = response;

                    if (carreviewdetails.status == "NOT_FOUND") {
                        document.getElementById("displayMessage").innerHTML = "No Review Available Retry with another Car.";
                    }else{
                    $scope.carreview = carreviewdetails.reviews;
                    console.log("carreviewdetails " + carreviewdetails.reviewsCount);
                    
                    if (carreviewdetails.reviewsCount == 0) {
                      
                        document.getElementById("displayMessage").innerHTML = "No Review Available Retry with another Car.";
                    }
                    else {
                  
                        document.getElementById("displayMessage").innerHTML = "";
                    }
                    }
          
                }).
              error(function (data, status, headers, config) {
                  document.getElementById("displayMessage").innerHTML = "No Review Available Retry with another An Old Car.";
              });
            }
        }



    </script>




</body>

</html>

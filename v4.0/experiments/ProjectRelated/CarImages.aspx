<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarImages.aspx.cs" Inherits="experiments_api_carrrrrr" %>


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
<body id="centered" ng-app>
       
    <div class="main-wrapper" ng-controller="EdmundClientController">
        <h1>CAR Pictures using Edmunds API using AngularJS </h1>
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
        <table class="table" id="tab1" style="display:none">
            <thead>
                <tr>
                    <th>Caption :</th>
                    <th>Images :</th>

                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="c in car">
                    <td>{{c.captionTranscript}}</td>
                    <td><span ng-repeat="i in c.photoSrcs" ng-show="$first"><img ng-src="http://media.ed.edmunds-media.com{{i}}" /> <br /></span></td>
                </tr>
            </tbody>
        </table>
        <p id="displayMessage"></p>
       
    </div>
     <h4>About the Experiment</h4>
        <p>
            This Experiment is continuation of Car Details Experiment :<br />
            1) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/api/CarImagesAPI.html">Click Here For Car Images Experiment</a> and <br />
            2) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/ProjectRelated/RecursiveDropDownFromDB.aspx">Click Here For DB Experiment</a><br />
           In this experiment I am using Edmunds API to  get Equipment details of the car using the style id of that particular car. Edmunds API provides 
            Car Image details maping it to style ID using JSON format. <br /><br />          
            In this experiment I have incoorperated DB and angular JS together. DB I have inserted static records which will fetch me the style details .
            I have created CAR_STYLE_INFO table for fetching information from DB and show
            <br />    <br />
             Note : This is a project related experiment , In this experiment I have just combined two experiments which I have used before.
            Check above experiment links for more information.

                 <h4>Source Code </h4>
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/CarImages.aspx" target="_blank">Front End Source</a> <br />
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/CarImages.aspx.cs" target="_blank">Code Behind Source</a>
        <hr />

        <h4>References</h4>
        <a href="http://developer.edmunds.com/" target="_blank">Edmunds Developer Site</a>
        <hr />
    <script>

        var URL = "https://api.edmunds.com/v1/api/vehiclephoto/service/findphotosbystyleid?styleId=carstyle&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
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
                console.log(carstyle);
                if (carstyle == "") {
                    alert("Please select any car name");
                    return false;
                }
                var url = URL.replace("carstyle", carstyle);
                console.log(url);
                $http.get(url).success(function (response) {
                    var carImages = response;
                    $scope.car = carImages;
                    
                    if (carImages[0] == undefined) {
                        document.getElementById("tab1").style.display = "none";
                        document.getElementById("displayMessage").innerHTML = "No Data Available Retry with another Car.";
                    }
                    else {
                        document.getElementById("tab1").style.display = "";
                        document.getElementById("displayMessage").innerHTML = "";
                    }

                });
            }
        }

     

    </script>




</body>

</html>

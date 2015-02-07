<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarPrices.aspx.cs" Inherits="experiments_project_Extra_Fields_CarPrices" %>
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
            width: 500px;
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
        <h1>CAR Price using Edmunds API using AngularJS </h1>
         <div class="demo">
        <form id="form1" runat="server">
           
              <span style ="font-family:Arial">Select Car Name : </span> 
        <asp:DropDownList ID="ddlCarName" runat="server" AutoPostBack = "true" OnSelectedIndexChanged="ddlCarName_SelectedIndexChanged">
        <asp:ListItem Text = "--Select Car Name--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <span style ="font-family:Arial">Select Year : </span> 
        <asp:DropDownList ID="ddlYear" runat="server" Enabled = "false" AutoPostBack = "true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" >
        <asp:ListItem Text = "--Select Year--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <span style ="font-family:Arial">Select Car Model : </span> 
        <asp:DropDownList ID="ddlModelName" runat="server" Enabled = "false" AutoPostBack = "false"  ng-model="carName">
        <asp:ListItem Text = "--Select Car Model--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
       
            </form>

          <input ng-model="zipcode2" class="form-control" placeholder="Enter Zip Code" />
            <button ng-click="getDetails()">Get CAR Details</button> </br>
        </div>
        </br> </br>
        <table class="table" id="tab1" style="display:none">
            <thead>
                <tr>
                    <th>CAR PRICE :</th>
                  

                </tr>
            </thead>
            <tbody>
                <tr >
                    <td>{{car.value}} $</td>
                    
                </tr>
            </tbody>
        </table>
        <p id="displayMessage"></p>
       
    </div>
    <h4>About the Experiment</h4>
        <p>
            This Experiment is continuation of Car Details Experiment :<br />
            1) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/api/CarDetailsAPI.html">Click Here For Car Details Experiment</a> and <br />
            2) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/ProjectRelated/RecursiveDropDownFromDB.aspx">Click Here For DB Experiment</a><br />
           In this experiment I am using Edmunds API to  get Equipment details of the car using the style id of that particular car. Edmunds API provides 
            Car Price details maping it to style ID using JSON format. <br /><br />          
            In this experiment I have incoorperated DB and angular JS together. DB I have inserted static records which will fetch me the style details .
            I have created CAR_STYLE_INFO table for fetching information from DB and show
            <br />    <br />
             Note : This is a project related experiment , In this experiment I have just combined two experiments which I have used before.
            Check above experiment links for more information.
            <h4>URL Used</h4>
            <pre><br />
URL = https://api.edmunds.com/v1/api/tco/newtotalcashpricebystyleidandzip/carstyle/zipcode2?fmt=json <br />
URL2 = https://api.edmunds.com/v1/api/tco/usedtotalcashpricebystyleidandzip/carstyle/zipcode2?fmt=json <br />        
            </pre>
            <p>
                <b>Description :</b>
                Since there are two types of car new and used , I this experiement I have used two url.
                If the Car is new URL is used and if car is old URL2 is used.

            </p>

            <h4> Code Snippet Script</h4>
            <pre>
                function EdmundClientController($scope, $http) { <br />
            $http.headers = headers; <br />
            $scope.getDetails = function () { <br />
                var carstyle = $scope.carName; <br />
                var zipcode = $scope.zipcode2; <br />
                var caryear = document.getElementById("ddlYear").value; <br />
                
                
                if (carstyle == undefined || zipcode == undefined) { <br />
                    alert("Please enter mandatory fields select car name and zipcode :"); <br />
                    return false; <br />
                } <br />
                
                if (caryear > 2013) { <br />
                    var url = URL.replace("carstyle", carstyle); <br />
                    url = url.replace("zipcode2", zipcode); <br />
                    
                } else {<br /> 

                    var url = URL2.replace("carstyle", carstyle);<br />
                    url = url.replace("zipcode2", zipcode);<br />                  
                }                
                $http.get(url).success(function (response) { <br />
                    var carPrice = response; <br />
                    $scope.car = carPrice; <br />                   
                    if ($scope.car.value == null) { <br />
                        document.getElementById("tab1").style.display = "none"; <br />
                        document.getElementById("displayMessage").innerHTML = <br />
                "No Data Available Retry with another Car."; <br />
                    }
                    else { <br />
                        document.getElementById("tab1").style.display = ""; <br />
                        document.getElementById("displayMessage").innerHTML = ""; <br />
                    }

                });<br />
            }
        } </pre>
                <p><b>Description:</b>
                    Before fetching price , I am getting three values : <br />
                    1) car name <br />
                    2) zip code <br />
                    3) year <br />
                    Car name and zip code is used to append details to the URL.<br />
                    Year is used to check if the car is OLD or NEW . If car is old URL is used and new URL2 is used.<br />
                    After appending information to the URL ,json responce is received and the price information is displayed on the screen.
                </p>
            <h4> View code</h4>
            <pre>
                { {car.value}} $
            </pre>
            <p> <b>Description:</b>
                Since responce has price information .So car.value provides the price of the car.

            </p>           
                 <h4>Source Code </h4>
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/CarPrices.aspx" target="_blank">Front End Source</a> <br />
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated/CarPrices.aspx.cs" target="_blank">Code Behind Source</a>
        <hr />

        <h4>References</h4>
        <a href="http://developer.edmunds.com/" target="_blank">Edmunds Developer Site</a>
        <hr />

    <script>     
        var URL4 = "https://api.edmunds.com/v1/api/tco/newtotalcashpricebystyleidandzip/carstyle/zipcode2?fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
        var URL5 = "https://api.edmunds.com/v1/api/tco/usedtotalcashpricebystyleidandzip/carstyle/zipcode2?fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
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
                var zipcode = $scope.zipcode2;
                var caryear = document.getElementById("ddlYear").value;
                
                console.log(carstyle + "" + zipcode);
                if (carstyle == undefined || zipcode == undefined) {
                    alert("Please enter mandatory fields select car name and zipcode :");
                    return false;
                }
                
                if (caryear > 2013) {
                    var url = URL4.replace("carstyle", carstyle);
                    url = url.replace("zipcode2", zipcode);
                    
                } else {

                    var url = URL5.replace("carstyle", carstyle);
                    url = url.replace("zipcode2", zipcode);
                  
                }
                console.log(url);
                $http.get(url).success(function (response) {
                    var carPrice = response;
                    $scope.car = carPrice;
                   
                    if ($scope.car.value == null) {
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

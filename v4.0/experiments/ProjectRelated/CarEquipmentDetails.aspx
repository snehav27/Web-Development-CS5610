<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarEquipmentDetails.aspx.cs" Inherits="experiments_project_Extra_Fields_CarPrices" %>
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
</head>
<body id="centered" class="main-wrapper" ng-app>
       
    <div   ng-controller="EdmundClientController">
        <h1>CAR Equipment Details </h1>
        <h2> Experiment using both AngularJS and DB :</h2>
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
        <select ng-model="equipmentType">
            <option value="All" >All</option>
            <option value="AUDIO_SYSTEM">Audio System</option>
            <option value="COLOR">Color</option>
            <option value="ENGINE">Engine</option>
            <option value="MANUFACTURER">Manufacturer</option>
            <option value="MIRRORS">Mirrors</option>
            <option value="OPTION">Option</option>
            <option value="OTHER">Other</option>
            <option value="TELEMATICS">Telematics</option>
            <option value="TIRES">Tires</option>
        </select>
          
            <button ng-click="getDetails()">Get CAR Details</button> </br>
            </div>
        </br> </br>
        <table class="table" id="tab1" style="display:none">
            <thead>
                <tr>
                    <th>Name :</th>
                    <th>Equipement Type :</th>
                     <th>Availability :</th>
                    <th>Information :</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="e in carequipment">
                    <td>{{e.name}}</td>
                    <td>{{e.equipmentType}}</td>
                    <td>{{e.availability}}</td>                    
                    <td><span ng-repeat="items in e.attributes">
                        <span>{{items.name}}</span> <b>-</b>
                        <span>{{items.value}}</span>
                         <br /></span></td>
                </tr>
            </tbody>
        </table>
        <p id="displayMessage"></p>
       
    </div>
       
    
    <div>
       <h4>About the Experiment</h4>
        <p>
            This Experiment is continuation of Car Details Experiment :<br />
            1) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/api/CarDetailsAPI.html">Click Here For Car Details Experiment</a> and <br />
            2) <a href="http://net4.ccs.neu.edu/home/snehav27/experiments/ProjectRelated/RecursiveDropDownFromDB.aspx">Click Here For DB Experiment</a><br />
           In this experiment I am using Edmunds API to  get Equipment details of the car using the style id of that particular car. Edmunds API provides 
            Car Equipment details maping it to style ID using JSON format. <br /><br />
            This Experiement shows different  Equipments details like :<br />
            1)Audio System<br />
            2)Color<br />
            3)Engine<br />
            4)Mirrors etc .<br />
            In this experiment I have incoorperated DB and angular JS together. DB I have inserted static records which will fetch me the style details .
            I have created CAR_STYLE_INFO table for fetching information from DB and show

        </p>
        <h4>  URL Used : </h4>
        <pre>
 URL = "https://api.edmunds.com/api/vehicle/v2/styles/carstyle/equipment?&fmt=json <br/>
 URL2 =https://api.edmunds.com/api/vehicle/v2/styles/carstyle/equipment?equipmentType=carequipment&fmt=json <br/>

        </pre>
        <b>Description : </b>
        Here I have used two URL's where first URL is used to get information for all the details .
        Second URL is used for information that is for that particular equipment.
        So according to the equipment selected we need to fetch data from API . If ALL is selected from the equipment drop down , then URL will be called.
        If user selects other equipments like Audio System, Engine Etc then URL2 is called.

        <h4> Code snippet of script:</h4>
        <pre>
              
        function EdmundClientController($scope, $http) {<br/>
            $http.headers = headers;<br/>
            $scope.getDetails = function () {<br/>
                var carstyle = $scope.carName;<br/>
                var equipmenttype = $scope.equipmentType;<br/>
                console.log(carstyle + "" + equipmenttype);<br/>
                if (carstyle == undefined || equipmenttype == undefined) {<br/>
                    alert("Please mandatory fields car name and equipment type");<br/>
                    return false;<br/>
                }<br/>
                if (equipmenttype == "All") {<br/>
                    var url = URL1.replace("carstyle", carstyle);<br/>
                    console.log(url);<br/>
                } else {
                    var url = URL2.replace("carstyle", carstyle);<br/>
                    url = url.replace("carequipment", equipmenttype);<br/>
                    console.log(url);<br/>
                }
                $http.get(url).success(function (response) {<br/>
                    var carequipmentdetails = response;<br/>
                    $scope.carequipment = carequipmentdetails.equipment;<br/>
                    console.log("carequipmentdetails " + carequipmentdetails.equipmentCount);<br/>
                    if (carequipmentdetails.equipmentCount == 0) {<br/>
                        document.getElementById("tab1").style.display = "none";<br/>
                        document.getElementById("displayMessage").innerHTML = <br/>
                            "No Data Available Retry with another Car.";<br/>
                    }<br/>
                    else {<br/>
                        document.getElementById("tab1").style.display = "";<br/>
                        document.getElementById("displayMessage").innerHTML = "";<br/>
                    }<br/>

                });
            }
        }



     </pre>
        <p>
            <b>Description</b><br/>
            After URL sends the request to Edmund client , response is received and results is fetched in JSON format.
          <b>  $scope.getDetails : </b> is called after user click on button get details <br/>
          <b>  $scope.car : </b> is the information that the user has selected in the car model drop down. <br/>
          <b>  $scope.equipment: </b> is the information that the user has selected from equipment drop down.<br/>
            URL is modified according to the user selection as explained above. <br />
            response.equipment will have the information of the equipment details. <br />
            equipmentCount details is provided by API to check the count of the records that is fetched .
            So  if carequipmentdetails.equipmentCount == 0 developer can display no details available.
        </p>
        <h4> Code snippet in the Div:</h4>
        <pre>

            &lt;tr ng-repeat="e in carequipment"&gt; <br/>
                    &lt;td&gt;{ {e.name}}&lt;/td&gt; <br/>
                    &lt;td&gt;{ {e.equipmentType}}&lt;/td&gt; <br/>
                    &lt;td&gt;{ {e.availability}}&lt;/td&gt;  <br/>                   
                    &lt;td&gt;&lt;span ng-repeat="items in e. attributes"&gt; <br/>
                        &lt;span&gt;{ {items.name}}&lt;/span&gt; &lt;b&gt;-&lt;/b&gt; <br/>
                        &lt;span&gt;{ {items.value}}&lt;/span&gt; <br/>
                         &lt;br /&gt;&lt;/span&gt;&lt;/td&gt; <br/>
                &lt;/tr&gt; <br/>
</pre><br/> 
        <p>
        <b>Description:</b>
     carequipment object will have all the information that needs to be displayed and above code snippet is used to diaplay object information in
            the table.Array is iterated usign ng-repeat. For more information you can check the car details experiment mentioned above.

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

        var URL6 = "https://api.edmunds.com/api/vehicle/v2/styles/carstyle/equipment?&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
        var URL7 = "https://api.edmunds.com/api/vehicle/v2/styles/carstyle/equipment?equipmentType=carequipment&fmt=json&api_key=ea7qsju5c39uqr697b9vjg4x";
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
                var equipmenttype = $scope.equipmentType;
                console.log(carstyle + "" + equipmenttype);
                if (carstyle == undefined || equipmenttype == undefined) {
                    alert("Please mandatory fields car name and equipment type");
                    return false;
                }
                if (equipmenttype == "All") {
                    var url = URL6.replace("carstyle", carstyle);
                    console.log(url);
                } else {
                    var url = URL7.replace("carstyle", carstyle);
                    url = url.replace("carequipment", equipmenttype);
                    console.log(url);
                }
                $http.get(url).success(function (response) {
                    var carequipmentdetails = response;
                    $scope.carequipment = carequipmentdetails.equipment;
                    console.log("carequipmentdetails " + carequipmentdetails.equipmentCount);
                    if (carequipmentdetails.equipmentCount == 0) {
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

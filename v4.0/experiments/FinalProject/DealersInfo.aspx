<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DealersInfo.aspx.cs" Inherits="experiments_carinfo_CarSeries" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
        <title>Car Point</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/carInfo.css" />
    <script src="js/classie.js"></script>  
    <script src="js/carinfo.js"></script> 
    <link rel="stylesheet" type="text/css" href="css/table.css" />
       <script src="js/menu.js"></script> 
    <link rel="shortcut icon" href="images/caricon.png">
   
   </head>
<body ng-app>
    <nav class="tab" id="tab">
        <ul>
            <li><a href="FrontPage.html">Home</a></li>
            <li><a href="CarSeries.aspx">Car Info</a></li>
            <li><a href="GoGreen.aspx">GoGreen</a></li>
            <li><a href="MapInfo.html">Map Info</a></li>
           <li><a href="loginToForum/Forum.aspx">Forum</a></li>
            <li><a href="loginToForum/Login.aspx">Login</a></li>
        </ul>
        <a href="#" id="pull">Menu</a>
    </nav><br />
    <center>
    <h1>CAR INFO : SERIES, IMAGES, DEALERS INFORMATION, PRICE !!!!! </h1> <br />
    
       <a id="carseries" href="CarSeries.aspx" class="btn btn-5 btn-5a icon-truck"> <span>Car Series </span></a>
        <a id="carImages" href="CarImages.aspx" class="btn btn-5 btn-5a icon-truck"> <span> Car Images </span></a>
    <a id="dealerInfo"  href="DealersInfo.aspx"  class="btn btn-5 btn-5a icon-truck current"> <span> Dealers Info</span></a>
    <a id="priceInfo" href="PriceInfo.aspx" class="btn btn-5 btn-5a icon-truck"> <span>Price Info </span></a>
        <a id="equipmentInfo" href="EquipmentInfo.aspx" class="btn btn-5 btn-5a icon-truck"> <span> Equipments </span></a>
    <a id="carreview" href="CarReview.aspx" class="btn btn-5 btn-5a icon-truck"> <span> Car Reviews</span></a><br />
     <div class="container" ng-controller="CarInfoController3" class="main-wrapper">
      
      
        
            <input type="text" ng-model="zipcode" class="form-control" placeholder="Enter Zip Code" />
           
            <button type ="button" class="myButton" ng-click="getDetails()">Get Dealer Details</button> </br>
        
        </br> </br>

        <table class="table" id="tab3" style="display:none">
            <thead>
                <tr>
                    <th>Company name</th>              
                    <th>Address</th>
                    <th>Map Info</th>
                    <th>Website</th>                    
                    <th>Phone Number</th>
                    <th>Open At</th>
                    <th>Ratings</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="d in dealer">                
                    <td>{{d.name}}</td>
                    <td >
                        {{d.address.street}} ,
                        {{d.address.apartment}} <br />
                        {{d.address.city}} ,
                        {{d.address.stateCode}} ,
                        {{d.address.stateName}} <br /> 
                        {{d.address.country}},                       
                        {{d.address.zipcode}} ,                    
                    </td>
                    <td>
                        
                        <a href="http://maps.google.com/?q={{d.address.latitude}},{{d.address.longitude}}">
                             <img src="images/mapicon.png" class="mapicon" /> Map Info</a>
                        </td>
                    <td>
                        <a href="{{d.contactinfo.dealer_website}}"> Dealer Website </a>
                        
                    </td>                   
                    <td>
                        {{d.contactinfo.phone}} 
                    </td>
                    <td>
                     Wednesday  :   {{d.operations.Wednesday}} <br /> 
                     Tuedsay    :   {{d.operations.Tuesday}} <br /> 
                     Thursday   :   {{d.operations.Thursday}} <br /> 
                     Saturday   :   {{d.operations.Saturday}} <br /> 
                     Friday     :   {{d.operations.Friday}} <br /> 
                     Moday      :   {{d.operations.Monday}} <br /> 
                     Sunday     :   {{d.operations.Sunday}} <br /> 
                    </td>
                   <td> 
                       <span class="stars">{{d.ratings.SALES_OVERALL_RATING}}</span>
                </td>
                    </tr>
            </tbody>

                     
</table>
        <p id="displayMessage3"></p>
        </div>
   </center>
</body>
</html>

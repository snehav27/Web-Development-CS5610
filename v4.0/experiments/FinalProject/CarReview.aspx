<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarReview.aspx.cs" Inherits="experiments_carinfo_CarSeries" %>
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
    <a id="dealerInfo" href="DealersInfo.aspx" class="btn btn-5 btn-5a icon-truck"> <span> Dealers Info</span></a>
    <a id="priceInfo" href="PriceInfo.aspx" class="btn btn-5 btn-5a icon-truck"> <span>Price Info </span></a>
        <a id="equipmentInfo" href="EquipmentInfo.aspx" class="btn btn-5 btn-5a icon-truck"> <span> Equipments </span></a>
    <a id="carreview" href="CarReview.aspx" class="btn btn-5 btn-5a icon-truck current"> <span> Car Reviews</span></a><br />
      <div class="container" ng-controller="CarInfoController6" class="main-wrapper">
          <form runat="server">
  <span style ="font-family:Arial">Select Car Name : </span> 
        <asp:DropDownList ID="ddlCarName" runat="server" AutoPostBack = "true" OnSelectedIndexChanged="ddlCarName_SelectedIndexChanged" >
        <asp:ListItem Text = "--Select Car Name--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style ="font-family:Arial">Select Year : </span> 
        <asp:DropDownList ID="ddlYear" runat="server" Enabled = "false" AutoPostBack = "true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" >
        <asp:ListItem Text = "--Select Country--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        <span style ="font-family:Arial">Select Car Model : </span> 
        <asp:DropDownList ID="ddlModelName" runat="server" Enabled = "false" AutoPostBack = "false"  ng-model="carName" >
        <asp:ListItem Text = "--Select City--" Value = ""></asp:ListItem>
        </asp:DropDownList>
        <br /><br />
       
            </form>

          
            <button type="button" class="myButton" ng-click="getDetails()">Get CAR Details</button> </br>

        </br> </br>
        <div   ng-repeat="cr in carreview">
            <div class="reviewdiv" >
            <p >
                    <b> Author :</b>
                    {{cr.author.authorName}} <br />
                </p>
            <p >
                <b>Title :</b>
                    {{cr.title}} <br />
                </p>
            <p >
                <b>Description : </b>
                    {{cr.text}}    <br />
                    {{cr.favoriteFeatures}}  <br />
                    {{cr.suggestedImprovements}}  
                </p> 
            <p >
                <b> Description</b> <br />
                    <span ng-repeat="rate in cr.ratings"> 
                        <span id="left" >{{rate.type}} <b>-</b>
                       {{rate.value}}</span>
          </span>
                </p>      
             </br> </br>  
                </div>    
        </div>
        <p id="displayMessage6"></p>

        </div>     

   </center>
</body>
</html>

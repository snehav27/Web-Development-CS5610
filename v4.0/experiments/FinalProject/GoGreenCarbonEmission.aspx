﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoGreenCarbonEmission.aspx.cs" Inherits="experiments_asp_TabsAfterPostBack" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Car Point</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>


    <script src="js/modernizr.custom.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/carInfo.css" />
    <link rel="stylesheet" href="css/table.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script>

    <link rel="shortcut icon" href="images/caricon.png" />
    <script src="js/menu.js"></script>
</head>
<body>

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
    </nav>
    <br />
    <br />
    <center>
        <form id="form1" runat="server">



            <h1> Go GREEN LIVE HAPPY</h1>
            <marquee behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">
                <b>TODAYS FUEL PRICES:</b>
                CNG       : <asp:Label id="cng" Text="" runat="server" />$ ,
                DIESEL    : <asp:Label id="diesel" Text="" runat="server" />$ ,
                E85       : <asp:Label id="e85" Text="" runat="server" />$ ,
                ELECTRIC  : <asp:Label id="electric" Text="" runat="server" />$ ,
                LPG       : <asp:Label id="lpg" Text="" runat="server" />$ ,
                MID GRADE : <asp:Label id="midgrade" Text="" runat="server" />$ ,
                PREMIUM   : <asp:Label id="premium" Text="" runat="server" />$ ,
                REGULAR   : <asp:Label id="regular" Text="" runat="server" />$ .
            </marquee>
            <h1>Click Below To Fetch Details Information on Go Green CARS as per below selection Criteria!!!!!</h1>




            <a href="GoGreen.aspx" class="btn btn-9 btn-9a">  Fetch By Car Name </a>
            <a href="GoGreenByMileage.aspx" class="btn btn-9 btn-9a"> Fetch By Mileage Information </a>
            <a href="GoGreenByScore.aspx" class="btn btn-9 btn-9a"> Fetch By Score Details </a>
            <a href="GoGreenCarbonEmission.aspx" class="btn btn-9 btn-9a current2" > Car CO2 Emission Info </a> <br />


            <br />
            <iframe width="710" height="750" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" src="http://calculator.carbonfootprint.com/calculator.aspx?c=car">
                <p>Your browser doesn't support IFRAMES - please use the <a href="http://calculator.carbonfootprint.com/calculator.aspx?c=car" target="_blank">basic calculator</a> instead.</p>
            </iframe>  




        </form>
    </center>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoGreen.aspx.cs" Inherits="experiments_asp_TabsAfterPostBack" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
        <title>Car Point</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
    
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>


 <script src="js/modernizr.custom.js" type="text/javascript"></script>
  <link rel="stylesheet" href="css/carInfo.css"/>   
    <link rel="stylesheet" href="css/table.css"/>   
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js" type="text/javascript"></script>
       
    <link rel="shortcut icon" href="images/caricon.png"/>
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



        
        <a href="GoGreen.aspx" class="btn btn-9 btn-9a current2"> Fetch By Car Name </a>
        <a href="GoGreenByMileage.aspx" class="btn btn-9 btn-9a"> Fetch By Mileage Information </a>
        <a href="GoGreenByScore.aspx" class="btn btn-9 btn-9a"> Fetch By Score Details </a>
        <a href="GoGreenCarbonEmission.aspx" class="btn btn-9 btn-9a"> Car CO2 Emission Info </a> <br />       

          
                <strong>Year:
                            </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                           <asp:DropDownList ID="year" AutoPostBack="true" OnSelectedIndexChanged="displaydropdown2" runat="server" AppendDataBoundItems="true" Style="margin-top: 0px; text-align: center;">
                                 <asp:ListItem Enabled="true" Text="Select Year" Value="-1"></asp:ListItem>
                                 <asp:ListItem Text="2011" Value="2011"></asp:ListItem>
                                 <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
                                 <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                                 <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                                 <asp:ListItem Text="2015" Value="2015"></asp:ListItem>                            
                            </asp:DropDownList> 
            <br /> <br />
                <strong>Car Model:
                            </strong>&nbsp;&nbsp;
                            <asp:DropDownList ID="names" AutoPostBack="true" OnSelectedIndexChanged="displayinfo" runat="server" AppendDataBoundItems="true" Style="margin-top: 0px; text-align: center;">
                                 <asp:ListItem Text = "---Select---" Value = ""></asp:ListItem>
                            </asp:DropDownList> 
                 
                            <br /> <br />
                        <asp:GridView ID="DetailsGridView"  AutoGenerateColumns="true"
                             GridLines="None" runat="server" >
                  
                        
                    
                        </asp:GridView>

          


    </form>
        </center>
</body>
</html>
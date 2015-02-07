<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="experiments_loginToForum_EditInfo" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
        <title>Car Point</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
    	<link rel="stylesheet" type="text/css" href="../css/demo.css" />		
		<link rel="stylesheet" type="text/css" href="../css/component.css" />
      <link rel="stylesheet" type="text/css" href="../css/menu.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
           <script src="../js/menu.js"></script> 
</head>
<body>
  
  
    <form id="form1" runat="server">
         <%
        var username = Request["username"];
    %>
	<div class="container">
	  <nav class="tab" id="tab">
        <ul>
             <li><a href="../FrontPage.html">Home</a></li>
            <li><a href="../CarSeries.aspx">Car Info</a></li>
            <li><a href="../GoGreen.aspx">GoGreen</a></li>
            <li><a href="../MapInfo.html">Map Info</a></li>
            <li><a href="Forum.aspx">Forum</a></li>
            <li><a href="Login.aspx">Login</a></li>
        </ul>
        <a href="#" id="pull">Menu</a>
    </nav>
						<div class="content clearfix">
							<div class="block block-40 clearfix">
								
								<nav class="codrops-demos">
									<a href="DashBoard.aspx?username=<%= username%>">Dashboard</a>
                                    <a  href="ProfileView.aspx?username=<%= username%>">Profile View</a>
									<a  href="ChangePassword.aspx?username=<%= username%>">Change Password</a>
									<a class="current-demo"  href="EditInfo.aspx?username=<%= username%>">Edit your Info</a>                                   
                                    <a href="RecentActivity.aspx?username=<%= username%>">Recent Activity</a>
                                    <a href="WallPosts.aspx?username=<%= username%>">Wall Posts</a>
                                     <div class="imagcaption" >
                                               <a href="Forum.aspx">
                                                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="../images/Forum1.png" />
                                              <div class="caption" ><b>Forum</b></div>
                                             
                                         </a>   
                                     </div>
								</nav>
							</div>
						<div class="block block-60">
                              <div class="imagcaption"  style="margin-right:15px; " align="right">
								<asp:LinkButton runat="server"   id="logout"  Onclick="logout_Click" Text="logout" >
                                               
                                           <img src="../images/logout.png" />
                                              <div class="caption" >Logout</div>                                          
                               </asp:LinkButton>
                                    </div> 
								<p><strong> Edit Your Info </strong></p>
								
                            <div>
                                   First Name :
                                    <asp:TextBox ID="firstName" runat="server" CssClass="inputs"   ></asp:TextBox>
								<br /><br />
							       Last Name &nbsp; : 
                                    <asp:TextBox ID="lastName" runat="server" CssClass="inputs"  ></asp:TextBox>
                                <br /><br />
                                   Email &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
                                    <asp:TextBox ID="emailID" runat="server" CssClass="inputs"  ></asp:TextBox>
                               <br /><br />
                                  DOB  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
                                    <asp:TextBox ID="dob" runat="server" CssClass="inputs" Enabled="false"></asp:TextBox>
                               <br /><br />
                                  <asp:Button CssClass="btn"  id="submit"  runat="server" Text="Save Changes" OnClick="submit_Click"/>     
                                
                            <br />
                                  <asp:Label ID="updateInfoError" runat="server" CssClass="error"/>
                                   <asp:Label ID="updateInfoSuccess" runat="server" CssClass="success"/>
                               
                            </div>
							</div>
						</div>
			
		</div>
	    
    
    </form>
</body>
</html>

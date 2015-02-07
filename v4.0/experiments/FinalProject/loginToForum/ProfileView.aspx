<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileView.aspx.cs" Inherits="experiments_loginToForum_ProfileView" %>

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
                                    	<asp:HyperLink runat="server"   id="dashboard" NavigateUrl="DashBoard.aspx?username={0}" Text="Dashboard"/>
									
                                    <a  class="current-demo" href="ProfileView.aspx?username=<%= username%>">Profile View</a>
								    <asp:HyperLink runat="server"   id="changepassword" NavigateUrl="ChangePassword.aspx?username={0}" Text="Change Password" />
									<asp:HyperLink runat="server"   id="editInfo" NavigateUrl="EditInfo.aspx?username={0}" Text="Edit your Info" />
                                                                   
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
								<p><strong>  Profile  </strong>   </p>   
								<div runat="server" id ="name"></div>   <br />                             
                                <div runat="server" id ="emailID"></div><br />
                                <div runat="server" id ="dob"></div><br /> <br />
                                <div runat="server" id="carTheyLike"></div>
                                 <asp:Button CssClass="btn"  id="follow" runat="server" Text="Follow" OnClick="submit_Click" />
                                <asp:Button CssClass="btn"  id="unfollow"  runat="server" Text="UnFollow" OnClick="unfollow_Click" />
                                     <br />
                                  <asp:Label ID="folowInfoError" runat="server" CssClass="error"/>
                                   <asp:Label ID="followInfoSuccess" runat="server" CssClass="success"/>
                                  <asp:Label ID="Label1" runat="server" CssClass="success"/>
							</div>
				        
                               
						</div>
			
		</div>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecentActivity.aspx.cs" Inherits="experiments_loginToForum_RecentActivity" %>


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
                                    <a  href="ProfileView.aspx?username=<%= username%>">Profile View</a>
								    <asp:HyperLink runat="server"   id="changepassword" NavigateUrl="ChangePassword.aspx?username={0}" Text="Change Password" />
									<asp:HyperLink runat="server"   id="editInfo" NavigateUrl="EditInfo.aspx?username={0}" Text="Edit your Info" />
                                  <a class="current-demo" href="RecentActivity.aspx?username=<%= username%>">Recent Activity</a>
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
								<p><strong> Recent Activity : </strong></p>

                                <h4>Thread Activity</h4>
                                 <asp:Repeater ID="threadactivity" runat="server">
                                     <ItemTemplate>

                                 
                                       <table id="t01" >
                                           <tr>
                                               <td>
                                              <div ><a  href="Post.aspx?id=<%#Eval("PostId") %>&tid=<%#Eval("TopicId") %>"><%#Eval("PostTitle") %>  </div></a>
                                                   </td>
                                               <td align="right">
                                                   @  <%#Eval("PostDateTime") %>
                                               </td>
                                          </tr>
                                                                
                                           <table>                     
                                         </ItemTemplate>
                                </asp:Repeater>
                                 <h4>Comment Activity</h4>
                                 <asp:Repeater ID="commentsAcitivity" runat="server">
                                     <ItemTemplate>

                                 <table id="t01" >
                                           <tr>
                                               <td>
                                       
                                              <div ><%#Eval("CommentMessage") %>  
                                                    </td>
                                               <td align="right">
                                                  @  <%#Eval("CommentDateTime") %></div>
                                   
                                                </td>
                                          </tr>
                                                                
                                           <table>                     
                                         </ItemTemplate>
                                </asp:Repeater>

                                <h4>Follow Activity</h4>

                                <asp:Repeater ID="followactivity" runat="server">
                                     <ItemTemplate>

                                 <table id="t01" >
                                           <tr>
                                               <td>
                                       
                                              <div ><a  href="ProfileView.aspx?username=<%#Eval("Followed") %>"><%#Eval("Followed") %>  </a>
                                                    </td>
                                               <td align="right">
                                                  @  <%#Eval("FollowDate") %></div>
                                   
                                                </td>
                                          </tr>
                                                                
                                           <table>                     
                                         </ItemTemplate>
                                </asp:Repeater>

							</div>
				
						</div>
			
		</div>
	    
  
    </form>
</body>
</html>

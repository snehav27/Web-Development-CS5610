<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WallPosts.aspx.cs" Inherits="experiments_loginToForum_WallPosts" %>


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
	 <%
        var username = Request["username"];
    %>
						<div class="content clearfix">
							<div class="block block-40 clearfix">
								
								<nav class="codrops-demos">
									<asp:HyperLink runat="server"   id="dashboard" NavigateUrl="DashBoard.aspx?username={0}" Text="Dashboard"/>
                                    <a  href="ProfileView.aspx?username=<%= username%>">Profile View</a>
									<asp:HyperLink runat="server"   id="changepassword" NavigateUrl="ChangePassword.aspx?username={0}" Text="Change Password" />
									<asp:HyperLink runat="server"   id="editInfo" NavigateUrl="EditInfo.aspx?username={0}" Text="Edit your Info" />
                                    <a    href="RecentActivity.aspx?username=<%= username%>">Recent Activity</a>
                                    <a class="current-demo" href="WallPosts.aspx?username=<%= username%>">Wall Posts</a>
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
								<p><strong> Wall Posts : </strong></p>
								 
                                  
<div>
<asp:Repeater ID="RepDetails" runat="server">
<HeaderTemplate>
<table style=" border:1px solid #0094ff; width:500px" cellpadding="0">
<tr style="background-color:#0094ff; color:White">
<td colspan="2">
<b>Post a Message On User Wall</b> 
</td>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr style="background-color:#0094ff">
<td>
<table style="background-color:#EBEFF0;border-top:1px dotted #0094ff; width:500px" >
<tr>
<td>
Subject:
<asp:Label ID="lblSubject" runat="server" Text='<%#Eval("Subject") %>' Font-Bold="true"/>
</td>
</tr> 
</table> 
</td> 
</tr>
<tr>
<td>
<asp:Label ID="lblComment" runat="server" Text='<%#Eval("Comment") %>'/>
</td>
</tr>
<tr>
<td>
<table style="background-color:#EBEFF0;border-top:1px dotted #0094ff;border-bottom:1px solid #0094ff; width:500px" >
<tr>
<td> Post By: <a class="current-demo" href="WallPosts.aspx?username=<%#Eval("UserName") %>"><%#Eval("UserName") %></a></td>
<td>Created Date:<asp:Label ID="lblDate" runat="server" Font-Bold="true" Text='<%#Eval("PostedDate") %>'/></td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
</tr>
</ItemTemplate>
<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>
    </div>
     <div>
         <br />
    <table>

<tr>
    <asp:Label ID="wallError" runat="server" CssClass="error"/>
<td><asp:TextBox ID="txtSubject" CssClass="inputs" runat="server"  placeholder="Title" /></td>
</tr>
<tr>

<td><asp:TextBox ID="txtComment" CssClass="inputs" runat="server" Rows="5" Columns="20" 
        TextMode="MultiLine" Width="391px" placeholder="Message" /></td>
</tr>
<tr>
<td><asp:Button ID="btnSubmit" CssClass="btn"  runat="server" Text="Post" onclick="btnSubmit_Click" /></td>
</tr>
</table>
</div>

							</div>
				
						</div>
			
		</div>
	    

    </form>
</body>
</html>

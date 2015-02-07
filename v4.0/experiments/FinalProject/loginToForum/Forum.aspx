        <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="experiments_loginToForum_Forum" %>

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
            <style>

                table, th, td {
       border: 1px solid black;
    }
            </style>
        </head>
        <body >
             
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
                
            <center><h1 > Welcome To Car Point Forum</h1> </center>
                    <table align="right" style="margin-right:15px; ">
                        <tr>
                            <td>
                       <div class="imagcaption"   style="margin-right:15px; ">
                           
                           <asp:HyperLink runat="server"   id="myprofile" NavigateUrl="ProfileView.aspx?username={0}" >
                                               
                                           <img src="../images/profile.png" />
                                              <div class="caption" >My Profile</div>
                                          
                               </asp:HyperLink>
                             
							
                                </td>
                            <td>
                                <div class="imagcaption" align="right"  style="margin-right:15px; ">
                                	<asp:LinkButton runat="server"   id="logout"  Onclick="logout_Click" Text="logout" >
                                               
                                           <img src="../images/logout.png" />
                                              <div class="caption" >Logout</div>                                          
                               </asp:LinkButton>
                                    
                                     </div>
                            </td>
                            </tr>
                        </table>
                    <br /> <br /><br />
                    <center><p > <strong> Select From Any one of the topic below : </strong></p> </center>
            <asp:Repeater ID="topicsRepeater" runat="server" >
   
                <ItemTemplate >
                    <div >
              
                         <center>  <a class="btn btn-6 btn-6k  "  href="Topics.aspx?id=<%# Eval("TopicId") %>"><%# Eval("TopicName") %></a></center> 
                 
                       <p> 
                           <table class="center">
                               <thead>
                               <tr>
                                   <td>Last Post :</td>
                                    <td>Posted User</td>
                                    <td>Posted Date</td>
                               </tr>
                                   </thead>
                               <tbody>
                               <tr>
                                   <td>
                            <%# Eval("LastPostTitle") %>
                        </td>
                                   <td>
                       <a  href="ProfileView.aspx?username=<%# Eval("LastPostUserName") %>">
                           <%# Eval("LastPostUserName") %>
                         </a>
                      </td>
                                   <td>
                            <%# Eval("LastPostDateTime") %>
                                       </td>
                                   </tr>
                                   </tbody>
                               </table>
                     </p>
           
                          </div>
                </ItemTemplate>
            </asp:Repeater>
                    </div>
    
            </form>
               
        </body>
        </html>

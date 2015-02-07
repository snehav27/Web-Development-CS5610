<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Topics.aspx.cs" Inherits="experiments_loginToForum_Topics" %>

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
        <center>  <h1> Recent Threads</h1> </center> 

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
            <br /> <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Forum.aspx"><img src="../images/back.png"  /></a> <br>
              <a id="right" class="btn" href="NewPost.aspx?id=<%= Request.QueryString["id"] %>" >Create New Post</a>
            <br /> <br /><br /><br /><br />
    <asp:Repeater ID="postRepeater" runat="server" >
        <HeaderTemplate>
            <div class="divtablepadding">
            <table class="responstable">
                <thead>
                    <tr>
                        <th> Open</th>
                        <th data-th="  Details">Thread</th>
             
                        <th > By</th>
                    
                        <th> Start Date</th>
                    </tr>

                </thead>
        </HeaderTemplate>
        <ItemTemplate>            
          
                <tr>
                    <td>
                   <a href="Post.aspx?id=<%# Eval("PostId") %>&tid=<%= Request.QueryString["id"] %>"> <img src="../images/post.png"  />
                       </a>
                        </td>
                    <td>
                    <a href="Post.aspx?id=<%# Eval("PostId") %>&tid=<%= Request.QueryString["id"] %>"><%# Eval("PostTitle") %></a>
              
                        </td>
                    
            
                    <td>
                <a  href="ProfileView.aspx?username=<%# Eval("PostUserName") %>">
                     <%# Eval("PostUserName") %>
             </a>
                   
                     </td>
                    <td>
               
                     <%# Eval("PostDateTime").ToString() %>
             
                   
                </td>
                     </tr>
  
        </ItemTemplate>
         <FooterTemplate>            
            </table>
             </div>
        </FooterTemplate>
     
    </asp:Repeater>
            </div>
    </form>
</body>
</html>

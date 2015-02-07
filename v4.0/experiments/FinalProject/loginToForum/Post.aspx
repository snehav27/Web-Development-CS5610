<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="experiments_loginToForum_Post" %>

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
    </nav><br />
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
         <div class="divtablepadding">
        <asp:Repeater ID="PostDetails" runat="server">
            <HeaderTemplate>
                <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="Topics.aspx?id=<%= Request.QueryString["tid"] %>"><img src="../images/back.png"  /></a> 

        <center> <h1>Thread </h1></center>

        </HeaderTemplate>

        <ItemTemplate>
             <p id="right">
                    By:  <a  href="ProfileView.aspx?username=<%# Eval("PostUserName") %>"> <%# Eval("PostUserName") %> </a>
                         @ <%# Eval("PostDateTime") %>
                  </p> <br /> <br />

               <table class="responstable">
                   <thead>
                   <tr> 
                       <th>
                   <div><%# Eval("PostTitle") %></div> 
                       </th>
                  
                        </tr>
                       </thead>

            <tr>
                    <td colspan = "2"> <%# Eval("PostMessage") %> </td>  
                </tr>
                   </table>
        </ItemTemplate>

        
            </asp:Repeater>

      <asp:Repeater ID="commentRepeater" runat="server">
        <HeaderTemplate>
  <center> <h4>Comments</h4></center>
        </HeaderTemplate>

        <ItemTemplate>
               <table class="responstable">
            <tr>
                <td>
                    <%# Eval("CommentMessage") %>
                </td>
                <td align="right">
                   By:  <a  href="ProfileView.aspx?username=<%# Eval("CommentUserName") %>"> 
                    <%# Eval("CommentUserName") %> 
                        </a>@ <%# Eval("CommentDateTime") %>
                </td>
           
                
            </tr>
        </ItemTemplate>

        <FooterTemplate>
               </table>
          
              
                
         
        </FooterTemplate>
    </asp:Repeater>
          <table class="responstable">
                <center><p>
                       <strong> Message: </strong>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6" Columns="40" CssClass="inputs"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                            ErrorMessage="Message is required." Text="*" ControlToValidate="txtMessage"></asp:RequiredFieldValidator></td>
                <br />
                        <asp:Button ID="btnSubmit" runat="server" Text="Comment" 
                            onclick="btnSubmit_Click" class="btn" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </p></center>
              </table>
             </div>
    </div>
    </form>
</body>
</html>

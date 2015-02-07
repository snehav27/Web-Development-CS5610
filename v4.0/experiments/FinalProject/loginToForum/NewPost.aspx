<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewPost.aspx.cs" Inherits="experiments_loginToForum_NewPost" %>

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
    <div class="container" >
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
        <br /><br />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
         <a href="Topics.aspx?id=<%= Request.QueryString["id"] %>"><img src="../images/back.png"  /></a> 
        <br /> 
        <center><h1>Create Thread</h1></center> <br /> <br />

         <div class="divtablepadding">
     <table class="responstable">
                <tr>
                    <td>
                        Title:</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" Columns="50" MaxLength="255" CssClass="inputs"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                            ErrorMessage="Title is required." ControlToValidate="txtTitle" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Message:</td>
                    <td>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6" Columns="40" CssClass="inputs"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                            ErrorMessage="Message is required." Text="*" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button CssClass="btn" ID="btnSubmit" runat="server" Text="Submit" 
                            onclick="btnSubmit_Click" />
                        <a class="btn" href="Topics.aspx?id=<%= Request.QueryString["id"] %>">Cancel</a>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                         </td>
                </tr>
            </table>
             </div>
    </div>
    </form>
</body>
</html>

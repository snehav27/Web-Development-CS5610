<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="experiments_project_Login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Login</title>
      
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="../css/login.css" />
        
        
		 </head>
<body>
 
   <div class="container">
		
			
			<section class="main">
               
				<form class="form-1" runat="server">
                     <center> <h1>Login</h1></center> <br />
					<p class="field">
                        <asp:TextBox ID="username" runat="server" placeholder="Username or email"></asp:TextBox>					
						<i class="icon-user icon-large"></i>
					</p>
						<p class="field">
                             <asp:TextBox ID="password" TextMode="password" runat="server" placeholder="Password"></asp:TextBox>
							
							<i class="icon-lock icon-large"></i>
					</p><br /> <center>
					<asp:Button CssClass="myButton" id="submit"  runat="server" Text="Login"  OnClick="submit_Click"/>
                        </center>
                    <br />
                   <asp:Label ID="LoginError" runat="server" CssClass="error"/>
				</form>
                
			</section>
        
        </div>
    
</body>
</html>

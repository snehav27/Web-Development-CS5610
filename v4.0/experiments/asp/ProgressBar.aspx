<%@ Page Language="C#" AutoEventWireup="true" %>

 

<!DOCTYPE html>

 

<html>
    
    

<head runat="server">

    <title> Progress Bar Using PageRequestManager</title>   
    
<style type="text/css"  media="screen">
   
.main-wrapper {
            height: 80%;
            width: 96%;
            padding: 2%;

        }
    .demo {
       border: 2px solid #a1a1a1;
    padding: 10px 40px; 
    background: #dddddd;
    width: 300px;
    border-radius: 25px;
    }
h1 {
  text-align:center;
}
div {
     
 } 

h2 {
            background-color: lightpink;
            color: #808080;
            font-size: 1.1em;
            padding: 0.5em;
            width: 100%;
            text-decoration: none;
        }
h4 {
            background-color: lightpink;
            color: #808080;
            font-size: 0.9em;
            padding: 0.3em;
            width: 100%;
            text-decoration: none;
        }
p {text-align:justify;
   font-size:14px;
   line-height:14px;
   margin:0px 0px 14px 0px;
   padding:0

}
    ul.master_navigation
    {
        font-size: 100%;
        font-weight: bold;
        text-align: center;
        list-style: none;
        margin: 0.5em 0;
        padding: 0;
     /*background: #FF0066*/   
    }

    ul.master_navigation li
    {
        display: inline-block;
        padding: 0 0.5%;
    }

    a
    {
        color: #08f;
        font-weight: bold;
        text-decoration: none;
    }

    a:visited
    {
        color: #88f;
    }

    a:hover
    {
        color: #88f;
    }

    p
    {
        text-align: justify;
    }
    #centered {
        width: 800px;
        text-align:left;
        border:0px;
        padding : 0;
        margin :0 auto;
    }

    body {
        width:900px;
        max-width: 100%;
        margin: 0;
        padding: 0;
         background: #DBDBDD;  
    }

    .pad {
        padding: 10px;
    }
    .onTopOfEachOther {
    position: relative;
        top: 1px;
        left: -3px;
    }
.onTopOfEachOther span {
    position: absolute;
    top: 0px;
    left: 0px;
}

pre, code{
      direction: ltr;
      text-align: left;
 }
  pre {
	font-size:0.8em; 
 	line-height: 0.8em;
	font-family: Courier, "Courier New", mono;
 	color: #000000; 
	margin: 4px; 
	padding:4px;
	border: solid 1px #808080;
	background: #c3dff8;
}

 code {
	font-size:0.9em; 
 	line-height: 0.9em; 
	font-family: Courier, "Courier New", mono;
 	color: #000000;
 	background: #EEEEEE;
}
    displayNone {
        display:none;
    }

</style>
    </head>

      <body class="main-wrapper" id="centered">

    <form id="progressForm" runat="server">

    
  <asp:ScriptManager ID="ScriptManager1" runat="server">

        </asp:ScriptManager>

       

         <script type="text/javascript">

             // Intializing Page Request Manager object to access the 

             var progressBarPRM = Sys.WebForms.PageRequestManager.getInstance();

             //Raised during the initialization of the asynchronous postback.
             progressBarPRM.add_initializeRequest(progressBarPRM_InitializeRequest);

             //Raised after an asynchronous postback is finished and control has been returned to the browser
             progressBarPRM.add_endRequest(progressBarPRM_EndRequest);

             

             // This method is written to display image , when asynchronus post back starts

             function progressBarPRM_InitializeRequest(sender, args) {

                 // Showing Progress Image on the screen

                 var progressBarImage = $get('dsiplayImage');

                 progressBarImage.style.display = '';

                 // Showing nothing in Inner HTML

                 var lbl = $get('<%= this.lblText.ClientID %>');

                 lbl.innerHTML = '';

                 // Disaibling button stops further clicking on the button

                 document.getElementById("buttonInvoke").disabled = true;

             }
             // Called when async postback ends

             function progressBarPRM_EndRequest(sender, args) {

                 // get the displayImage and hide it again

                 var progressBarImage = $get('dsiplayImage');                 
                 progressBarImage.style.display = 'none';

                 // Enabling the button after process

                 document.getElementById("buttonInvoke").disabled = false;

             }

         </script>
    
        
  <div class="main-wrapper"  id="centered">
      <h1>Experiment 2</h1>
      <p> <b> Note: This code doesnt work in IE .Please use Google Chrome.</b> </br></br>
          This is because server side issue ,files in IIS is not updated to meet the requirments of IE10 .
          IE compatibility in .NET 4 version . Please contact me (vankireddy.s@husk.neu.edu) if you need more Information on this bug. 
      </p>
      <div class="demo">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>

                <asp:Label ID="lblText" runat="server" Text=""></asp:Label>

                <div id="dsiplayImage" style ="display:none" >

                     <asp:Image ID="carGif" runat="server" src="../../images/webImages/car.gif"  /> 
                    </br>
                     Processing Your Request

                </div>                

                <br />

                <asp:Button ID="buttonInvoke" runat="server" Text="Start Progress bar Using Page Request Manager" 

                    onclick="buttonInvokeFunction" class="displayNone" />

            </ContentTemplate>

        </asp:UpdatePanel>
      </div>
       <h4> About the Experiment :</h4>
    <p><b>Loading  Message :</b> Loading message is always important to have in your code , 
        Because most of the time in real time systems there is always slow processing happening when we have
         large amount of data in Database . So to show user that backend processes are runnning we show loading messages to user.</br></br>
        In .net there are 3 ways to show loading messages : </br></br>
        1)Using Page Request Manager </br>
        2)Ajax Loader </br>
        3)Threading concept </br> 

        In My Experiment I have used Page Event Handler . On click button event , thread sleeps for 10 seconds .  </br></br></br>
    </p>
     <p> <b>How Page Request Manager Works ? :</b> </br></br></br>

         Class for Page Reuest Manager   :   Sys.WebForms.PageRequestManager Class <br /></br>
         Namespace   :   Sys.WebForms </br></br>
         Methods used from class PageRequestManager   :   </br></br>
         PageRequestManager.initializeRequest(Event function)   :   
         Raised during the initialization of the asynchronous postback.</br</br>
         PageRequestManager.endRequest(Event function)   :   
         Raised after an asynchronous postback is finished and control has been returned to the browser.</br></br>
    
         In My experiment Class PageRequestManager is intialized , 
         When page starts loading  method initializeRequest is called where  gif can be shown on the screen 
         and   button is  disaibled.
          Once request is completed endRequest method is called where  gif image is disaibled 
         with success message is shown  and  button is enabled  .
        
     </p>
    <h4> Code Snippet Body:</h4>
      <pre>
           // Intializing Page Request Manager object to access the 

             var progressBarPRM = Sys.WebForms.PageRequestManager.getInstance();

             //Raised during the initialization of the asynchronous postback.

             progressBarPRM.add_initializeRequest(progressBarPRM_InitializeRequest);

             //Raised after an asynchronous postback is finished 

             progressBarPRM.add_endRequest(progressBarPRM_EndRequest);
      </pre>
    <h2>Source Code</h2>
        <a href="../../fileview/Default.aspx?~/experiments/asp/ProgressBar.aspx" target="_blank">View Source</a>

        <hr />

        <h2>References</h2>
        <a href="http://msdn.microsoft.com" target="_blank">MSDN</a></br>
        <a href="http://www.dotnetcurry.com" target="_blank"> .Net Curry Website</a>
         

        <hr />
          </div>

    </form>
</body>
    <script runat="server">
    
        protected void buttonInvokeFunction(object sender, EventArgs e)
        {

            System.Threading.Thread.Sleep(10000);

            lblText.Text = "Processing Completed";

        }
    
    </script>
</html>
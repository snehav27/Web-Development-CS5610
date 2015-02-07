<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html >
    
<head id="Head" runat="server">
    <title>Timer Example Page</title>
    <script runat="server">
        protected void submit(object sender, EventArgs e){
      mess.Text="You selected :"+ timerList.SelectedItem.Text ;
      string selectedText = timerList.SelectedValue;
      
      if (selectedText.Equals("5"))
      {
         
        TimerController.Enabled = true;
            TimerController.Interval = 5000;

      }
      else if (selectedText.Equals("10"))
      {        
        TimerController.Enabled = true;
            TimerController.Interval = 10000;
        }
      else if (selectedText.Equals("15"))
      {
          TimerController.Enabled = true;
          TimerController.Interval = 15000;
      }
      else if (selectedText.Equals("20"))
      {
          TimerController.Enabled = true;
          TimerController.Interval = 20000;
      }
      else if (selectedText.Equals("30"))
      {
          TimerController.Enabled = true;
          TimerController.Interval = 30000;
      }
      else if (selectedText.Equals("40"))
      {
          TimerController.Enabled = true;
          TimerController.Interval = 40000;
      }
        else {
         TimerController.Enabled = false;
        }
        
    }
        protected void Page_Load(object sender, EventArgs e)
        {
            OriginalTime.Text = DateTime.Now.ToLongTimeString();
        }

        protected void TimerTick(object sender, EventArgs e)
        {
            GoldPrice.Text = GetGoldPrice();
            TimeOfPrice.Text = DateTime.Now.ToLongTimeString();
        }

        private string GetGoldPrice()
        {
            double randomGoldPrice = 39 + new Random().NextDouble();
            return randomGoldPrice.ToString("C");
        }

     
      

</script>
   
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

</style>
</head>
<body class="main-wrapper" id="centered">
    <form id="form1" runat="server">
<div >
    <h1> Experiment 1</h1>
     <p> <b> Note: This code doesnt work in IE .Please use Google Chrome.</b> </br></br>
          This is because server side issue ,files in IIS is not updated to meet the requirments of IE10 .
          IE compatibility in .NET 4 version . Please contact me (vankireddy.s@husk.neu.edu) if you need more Information on this bug. 
      </p>
    <h2>Timer Controller In .NET</h2>
        <div class="demo">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="TimerController" OnTick="TimerTick" runat="server" Interval="10000" />

        <asp:UpdatePanel ID="GoldPricePanel" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="TimerController" />
        </Triggers>
        <ContentTemplate>
            Price of gold in USA per Gram :  <asp:Label id="GoldPrice" runat="server"></asp:Label><BR />
            as of <asp:Label id="TimeOfPrice" runat="server"></asp:Label>  
            <br />

        </ContentTemplate>
        </asp:UpdatePanel>
        <div>
        <br />
        Update gold price every:<br />
       <br />

            <asp:DropDownList id="timerList" runat="server">
<asp:ListItem Value="5">5 Seconds</asp:ListItem>
<asp:ListItem Value="10">10 Seconds</asp:ListItem>
<asp:ListItem Value="15">15 Seconds</asp:ListItem>
<asp:ListItem Value="20" >20 Seconds</asp:ListItem>
<asp:ListItem Value="30">30 Seconds</asp:ListItem>
<asp:ListItem Value="40">40 Seconds</asp:ListItem>
<asp:ListItem Value="no">Never</asp:ListItem>
</asp:DropDownList>
            <asp:Button Text="Submit" OnClick="submit" runat="server"/>
<p><asp:label id="mess" runat="server"/></p>
</form>
        Page loaded at <asp:Label ID="OriginalTime" runat="server"></asp:Label>
        </div>

    </div>
    <h4> About the Experiment :</h4>
    <p><b>Timer Control :</b> .NET has special functionality of Ajax where periodic update happens for every particular interval defined. 
       This is mainly used when coder want to update the content of the page without reloading the whole page .
        In this experiment I am using only partial update to get the gold price for selected time interval . 
        When user selects 10 seconds then the update of gold price happens every 10 seconds randomly.
    </p>
     <p> <b>How Timer Control works from Server perspectiver :</b>
         Timer control is the predefined controller in .NET . Timer control functionality is written in JavaScript . 
         When interval property is set in Timer Control , property is passed to JavaScript and 
         defined interval time completes JavaScript will post back the updated content on the web page.
    </p>
    <h4> Code Snippet Body:</h4>
    <pre> 
        &lt; asp:Timer ID=&quot;TimerController&quot; OnTick=&quot;TimerTick&quot; runat=&quot;server&quot; Interval=&quot;10000&quot; / &gt;
        <br />
        &lt; asp:UpdatePanel ID=&quot;UpdatePanel1&quot; runat=&quot;server&quot; UpdateMode=&quot;Conditional&quot; &gt; <br />
          &lt;Triggers&gt; <br />
            &lt;asp:AsyncPostBackTrigger ControlID=&quot;TimerController&quot; /&gt; <br />
        &lt;/Triggers&gt; <br />
         &lt;ContentTemplate&gt;<br />
             &lt;!--  lables will be defined here, These labels are Updated peridically --&gt;<br />
             &lt;/ContentTemplate&gt;<br />
        &lt;/asp:UpdatePanel&gt; <br />
    </pre>
    
    <p>
       <b>Code Snippet Body Description :</b>
        Timer works inside the update panel , After interval time elapsed Timer Control triggers for the update control post back the updated data . 
    </p>
    </form> 
    <h4> Code Snippet Script:</h4>
    <pre>
    TimerController.Enabled = true; //True or false </br>
    TimerController.Interval = 5000;
    </pre>
    <p>
        <b> Code Snippet Script Description :</b>
       TimerController in my example is a timer id with which we can do manipulations on timer controller.
       TimerController.Enable = true enable the timer controller to trigger the update panel  and for define stipulated time in TimerController.
       

    </p>
   
        <h2>Source Code</h2>
        <a href="../../fileview/Default.aspx?~/experiments/asp/timer-Controller.aspx" target="_blank">View Source</a>

        <hr />

        <h2>References</h2>
        <a href="http://msdn.microsoft.com" target="_blank">MSDN</a>

        <hr />

    </br>
    </br>
</body>
</html>


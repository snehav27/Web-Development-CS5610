<%@ Page Language="C#" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>

<head runat="server">

    <title>Fuel Economy GOV</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="Web Development CS-5610 Home Page">
    <meta name="author" content="Venkatesh Balasubramanian">

    <style>
       .main-wrapper {
            height: 80%;
            width: 96%;
            padding: 2%;
        }

        .demo {
            border: 2px solid #a1a1a1;
            padding: 10px 40px;
            background: #dddddd;
            width: 200px;
            border-radius: 25px;
        }

        h1 {
            text-align: center;
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

        ul.master_navigation {
            font-size: 100%;
            font-weight: bold;
            text-align: center;
            padding: 0;
            list-style: none;
            margin: 0.5em 0;
            /*background: #FF0066*/
        }

            ul.master_navigation li {
                display: inline-block;
                padding: 0 0.5%;
            }

        a {
            color: #08f;
            font-weight: bold;
            text-decoration: none;
        }

            a:visited {
                color: #88f;
            }

            a:hover {
                color: #88f;
            }

        p {
            text-align: justify;
        }

        #centered {
            width: 800px;
            text-align: left;
            border: 0px;
            padding: 0;
            margin: 0 auto;
        }

        body {
            width: 900px;
            max-width: 100%;
            margin: 0;
            padding: 0;
            background: #DBDBDD;
        }

        .pad {
            padding: 10px;
        }

        pre {
            direction: ltr;
            text-align: left;
        }

        pre {
            font-size: 0.77em;
            line-height: 0.8em;
            font-family: Courier, "Courier New", mono;
            color: #000000;
            margin: 4px;
            padding: 4px;
            border: solid 1px #808080;
            background: #c3dff8;
        }               
        table {
            border: 1px solid black;
        }

            table td {
                border: 1px solid black;
            }

            table th {
                border: 1px solid black;
            }
    </style>

</head>
<script runat="server">

    // Adding key event handlers during the page load
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    // After clicking the GET FUEL button,Fuel Price results would be displayed 
    protected void fuelPriceSearch_Click(object sender, EventArgs e)
    {
        try
        {
                
           


                string URL = "http://www.fueleconomy.gov/ws/rest/fuelprices" ;

                string xmlContentsAsString = string.Empty;

                // Consuming the helper functions of SimpleProxy class written by Prof. Richard Rasala to obtain the response
                xmlContentsAsString = SimpleProxy.GetResponseContent(URL);

               
                // Calling the helper function to process the response XML and display it in the front end
                ProcessFuelEconomyXML(xmlContentsAsString);
            
        }
        catch (Exception ex)
        {
            status.InnerHtml = "Status: Exception Occurred - " + ex.Message.ToString();
        }
    }


    // This methods process the responde xml recieved from web services of the http://www.fueleconomy.gov/
    protected void ProcessFuelEconomyXML(string xml)
    {
        try
        {


           
            using (StringReader stringReader = new StringReader(xml))
            using (XmlTextReader reader = new XmlTextReader(stringReader))
            {
                while (reader.Read())
                {
                    if (reader.IsStartElement())
                    {
                        switch (reader.Name)
                        {
                            case "cng":
                                cng.Text = reader.ReadString();
                                break;
                            case "diesel":
                                diesel.Text = reader.ReadString();
                                break;
                            case "e85":
                                e85.Text = reader.ReadString();
                                break;
                            case "electric":
                                electric.Text = reader.ReadString();
                                break;
                            case "lpg":
                                lpg.Text = reader.ReadString();
                                break;
                            case "midgrade":
                                midgrade.Text = reader.ReadString();
                                break;
                            case "premium":
                                premium.Text = reader.ReadString();
                                break;
                            case "regular":
                                regular.Text = reader.ReadString();
                                break;                     
                        }
                    }
                }
            }
          // results.Style.display = "";
            results.Style.Add("display", "");
            status.InnerHtml = "Status: Successfully retrieved the data from fueleconomy.gov !!";
        }
        catch (Exception ex)
        {
            status.InnerHtml = "Status: Exception Occurred - " + ex.Message.ToString();
        }
    }

    
</script>

<html>



<body class="main-wrapper" id="centered">

    <form id="form1" runat="server">

        <div >

            <h1>Experiment : XML Responce from web server</h1>

            <hr />

            <div class="exp-wrap">

                <h2>fueleconomy.gov fuel WebService Call Using .NET </h2>

                

                &nbsp;
            <asp:Button runat="server"  Text="GET FUEL PRICE" OnClick="fuelPriceSearch_Click" />
                <br />
                <hr />

                <div id="results" runat="server" class="demo" style ="display:none">
                    <p><b>TODAYS FUEL PRICES:</b></p> <br />
                    CNG       : <asp:Label id="cng" Text="" runat="server" />$<br />
                    DIESEL    : <asp:Label id="diesel" Text="" runat="server" />$<br />
                    E85       : <asp:Label id="e85" Text="" runat="server" />$      <br />              
                    ELECTRIC  : <asp:Label id="electric" Text="" runat="server" />$<br />
                    LPG       : <asp:Label id="lpg" Text="" runat="server" />$<br />
                    MID GRADE : <asp:Label id="midgrade" Text="" runat="server" />$<br />
                    PREMIUM   : <asp:Label id="premium" Text="" runat="server" />$<br />
                    REGULAR   : <asp:Label id="regular" Text="" runat="server" />$<br />
                    <br />
                </div> 
                <hr />

                <div id="status" runat="server">
                    Status: Waiting for the end user to Click on button to get fuel Price.
                </div>
                <div>
       <p> <b>Information :</b><br />
midgrade - $ per gallon of midgrade gasoline(9)<br />
premium - $ per gallon of premium gasoline(9)<br />
regular - $ per gallon of regular gasoline(9)<br />
cng - $ per gallon of gasoline equivalent (GGE) of compressed natural gas(10)<br />
diesel - $ per gallon of diesel(9)<br />
e85 - $ per gallon of E85(10)<br />
electric - $ per kw-hr of electricity(10)<br />
lpg - $ per gallon of propane(10)<br />
                    </p>    
                </div>
            </div>
     
        </div>

    </form>
    <h4>About The Experiment :</h4>
    <p> There are small tweaks in your website which will make it more intresting , Also when an user buys any car , buyer will always think 
        about millage and car fuel prize . So if people want to go green and buy a car they would surely need milage and fuel prizes .
        Which will surely save the resources . In this experiment I am hitting a web service which gives me xml as response and responce containing 
        fuel prizes of the current day. 
    </p>
    <h4> Logic Code 1:</h4>
    <pre>

                string URL = "http://www.fueleconomy.gov/ws/rest/fuelprices" ;<br />
                string xmlContentsAsString = string.Empty;<br />
                xmlContentsAsString = SimpleProxy.GetResponseContent(URL);<br />
                ProcessFuelEconomyXML(xmlContentsAsString);<br />
    </pre>
    <b> Description :</b>
    <p> Above code will alow Cross -Orgine resource sharing . I am passing the  URL  to the  SimpleProxy to fetch xml information from the fuel economy site.
        After fetching the information ,we are passing xml responce in string format to the ProcessFuelEconomyXML function for further extrction of the elements
         in the XML responce.
        <br /><br />  
        Check this link for more information on Simple Proxy  class usage : <a href="http://net4.ccs.neu.edu/home/rasala/simpleproxy/"> SIMPLE PROXY</a> <br />
        
    </p>
    <h4> Logic Code 2:</h4>
    <pre><br />
        protected void ProcessFuelEconomyXML(string xml)<br />
    {
        try<br />
        {
         using (StringReader stringReader = new StringReader(xml))<br />
            using (XmlTextReader reader = new XmlTextReader(stringReader))<br />
            {<br />
                while (reader.Read())<br />
                {<br />
                    if (reader.IsStartElement())<br />
                    {<br />
                        switch (reader.Name)<br />
                        {<br />
                            case "cng":<br />
                                cng.Text = reader.ReadString();<br />
                                break;<br /> 
    </pre>
    
    <b> Description :</b>
    <p> In this function we are reading xml responce and extracting the element value from xml responce recieved .<br /> <br />
        <b>For Example:</b>
        XML responce received as:<br />
        <pre>
       &lt;fuelPrices&gt;<br />
        &lt;cng&gt;2.17&lt;/cng&gt; <br />
       &lt;/fuelPrices&gt;<br />
            </pre>
        When  reader starts to read the xml responce from start element ,in this case - switch case will check which element did we received . 
        In the above responce cng is the key , reader.ReadString() will fetch value which is 2.17. And the result is assigned to the cng.text.
    </p>
    <h4> View Code:</h4>
    <pre>
          &lt;div id="Div1" runat="server" class="demo" style ="display:none"&gt;
                  
                    CNG       : &lt;asp:Label id="cng" Text="" runat="server" /&gt;$<br />
    </pre>
    
    <b> Description :</b>
    <p> onclick of the button the data is fetched from function and assigned to the view. As discussed above cng.text will be assigned xml extracted value and
        will display on the screen. </p>
      <h4>Source Code</h4>
    <a href="../../fileview/Default.aspx?~/experiments/xml/XML-ExtractionFromWebSerivice.aspx" target="_blank">View Source</a>

    <hr />

    <h4>References</h4>
    <a href="http://www.fueleconomy.gov/" target="_blank">Fuel Economy</a>

    <hr />

    </br>
    </br>
</body>
</html>

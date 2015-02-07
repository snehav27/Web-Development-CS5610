<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddingIFrame.aspx.cs" Inherits="experiments_ProjectRelated2_AddingIFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adding Iframe</title>
    <style type="text/css">
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

        table, td, th {
            border: 1px solid black;
        }

        th {
            background-color: pink;
            color: grey;
        }

        img {
            width: 350px;
            height: 250px;
        }
    </style>
</head>
<body id="centered" class="main-wrapper">
    <h1> Adding Iframe to the WebPage</h1>
    <form id="form1" runat="server">
    <div>
      <br />
            <iframe width="400" height="600" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" src="http://calculator.carbonfootprint.com/calculator.aspx?c=car">
                <p>Your browser doesn't support IFRAMES - please use the <a href="http://calculator.carbonfootprint.com/calculator.aspx?c=car" target="_blank">basic calculator</a> instead.</p>
            </iframe>  
   

    <h4>About the Experiment</h4>
      <p>
          An IFrame (Inline Frame) is an HTML document embedded inside another HTML document on a website.
           The IFrame HTML element is often used to insert content from another source, such as an advertisement,
           into a Web page. Only disadvntage with iframe it wont be responsive , need to make it height and width to fit
          into the page. In this experiment I have used Iframe from carbonfootprint.com , They provide iframe
          for all the automotives. Carbon Footprint software is an ideal claculator tool to help raise awareness and measure emissions.

      </p>


      <h4>Code</h4>  
        <pre>

    &lt;iframe width="400" height="600" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" <br />
            src="http://calculator.carbonfootprint.com/calculator.aspx?c=car"&gt;  <br />
                &lt;p&gt;Your browser doesn't support IFRAMES - please use the  <br />
             &lt;a href="http://calculator.carbonfootprint.com/calculator.aspx?c=car"  <br />
            target="_blank"&gt;basic calculator&lt;/a&gt; instead.&lt;/p&gt; <br />
            &lt;/iframe&gt;   <br />
        </pre>
        <h4>Syntax</h4>
        <pre> &lt;iframe&gt;...&lt;/iframe&gt;</pre>
       <h4>Description :</h4>
        <p> Above is the code which I have used and some of the please see below for the attributes used to change the aapearence and look : </p>
        <p>

src="(URL of initial iframe content)" <br />
name="(name of frame, required for targeting)"<br />
longdesc="(link to long description)"<br />
width=(frame width, % or pixels)<br />
height=(frame height, % or pixels)<br />
align=[ top | middle | bottom | left | right | center ] (frame alignment, pick two, use comma)<br />
frameborder=[ 1 | 0 ] (frame border, default is 1)<br />
marginwidth=(margin width, in pixels)<br />
marginheight=(margin height, in pixels)<br />
scrolling=[ yes | no | auto ] (ability to scroll)<br />
        </p>
       <h4>Source Code </h4>
        <a href="../../fileview/Default.aspx?~/experiments/ProjectRelated2/AddingIFrame.aspx" target="_blank">Code</a> <br />
        
        <hr />

        <h4>References</h4>
        <a href="http://www.carbonfootprint.com/" target="_blank">Carbon Foot Print</a>
        <hr />

         </div>
    </form>
</body>
</html>

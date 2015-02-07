
<script type='text/javascript' src='http://code.jquery.com/jquery-1.6.js'></script>
<script type='text/javascript'>

    $(function () {

        $('#btnTest').click(function () {
            fadeSwitchElements('x', 'a', 'c');
        });

        function fadeSwitchElements(id1, id2, id3) {
            var element1 = $('#' + id1);
            var element2 = $('#' + id2);


            if (element1.is(':visible')) {
                element1.fadeToggle(500);
                element2.fadeToggle(500);

            }
            else {
                element2.fadeToggle(500, function () {
                    element1.fadeToggle(500);
                });

            }
        }

    });


</script>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	
	<title>Sneha's Cafe</title>
	<link rel="shortcut icon" href="images/webImages/projectFinal.ico" >
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
	<style>
     * { margin: 0; padding: 0; }
      ul.master_navigation
    {
        font-size: 100%;
        font-weight: bold;
        text-align: center;
        list-style: none;
        margin: 0.5em 0;
        padding: 0;
      
    }

    ul.master_navigation li
    {
        display: inline-block;
        padding: 0 0.5%;
    }

    a
    {
        color: white;
        font-weight: bold;
        text-decoration: none;
    }

    a:visited
    {
        color: lightgrey;
    }

    a:hover
    {
        color: #88f;
    }
		
		
		html { 
			background: url(images/webImages/front-Page.jpg) no-repeat center center fixed; 
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}
         body
        {
            display: flex;
            justify-content: center;
            align-items: center;
        }
		
		#page-wrap { width: 670px; margin: 50px auto; padding: 20px;
                      background: white; -moz-box-shadow: 0 0 20px black; 
                      -webkit-box-shadow: 0 0 20px black;
                       box-shadow: 0 0 20px black; 

		}
	    @media only screen and (max-width: 760px), (min-device-width: 768px) and (max-device-width: 1024px) {
             body {
        width:900px;
        max-width: 100%;
        margin: 0;
        padding: 0;
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
	    #page-wrap { width: 250px; margin: 50px auto; padding: 20px;
                      background: white; -moz-box-shadow: 0 0 20px black; 
                      -webkit-box-shadow: 0 0 20px black;
                       box-shadow: 0 0 20px black; 

		}

        }
		p { font: 15px/2 Georgia, Serif; margin: 0 0 30px 0; text-indent: 40px; }

      img {
    
    margin-left: auto;
    margin-right: auto }

html,body,#wrapper{
    width:100%;
}
  .photo-grid {
	margin: 1em auto;
	max-width: 1106px;
	text-align: center;
}
 
.photo-grid li {
	border: 5px solid white;
	display: inline-block;
	margin: 1em;
	width: 289px;
}
 
 
.photo-grid figure {
	height: 163px;
	overflow: hidden;
	position: relative;
	width: 289px;
}
 
.photo-grid figcaption {
	background: rgba(0,0,0,0.8);
	color: white;
	display: table;
	height: 100%;
	left: 0;
	opacity: 0;
	position: absolute;
	right: 0;
	top: 0;
	-webkit-transition: all 300ms;
	-moz-transition: all 300ms;
	transition: all 300ms;
	-webkit-transition-delay: 100ms;
	-moz-transition-delay: 100ms;
	transition-delay: 100ms;
	z-index: 100;
}
 
.photo-grid figcaption p {
	display: table-cell;
	font-size: 1.5em;
	position: relative;
	top: -40px;
	width: 289px;
	-webkit-transition: all 300ms ease-out;
	-moz-transition: all 300ms ease-out;
	transition: all 300ms ease-out;
	vertical-align: middle;
}
 
.photo-grid li:hover figcaption p {
	-moz-transform: translateY(40px);
	-webkit-transform: translateY(40px);
	transform: translateY(40px);
}
.photo-grid li:hover figcaption {
	opacity: 1;
}
.photo-grid img {
	display: block;
	height: auto;
	-webkit-transition: all 300ms;
	-moz-transition: all 300ms;
	transition: all 300ms;
	max-width: 50%;
}
 
.photo-grid li:hover img {
	-webkit-transform: scale(1.4);
	-moz-transform: scale(1.4);
	transform: scale(1.4);
}
ul {
    font-size: 50px;
}

ul li {
    font-size: 14px;
    display: inline-block;
    align-content: center;

}
.circular {
            width: 120px;
            height: 120px;
            border-radius: 120px;
            -webkit-border-radius: 120px;
            -moz-border-radius: 120px;
            background: url(images/mypic.jpg) no-repeat;

        }
            .circular img {
                HEIGHT : 20px;
                WIDTH :  20px;
                BORDER:  0px;
                   opacity: 0;
                filter: alpha(opacity=0);
            }
	</style>
   
</head>

<body >
 <form id="form1" runat="server">

<div>

<ul class="master_navigation">
    <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
    <li><a href="statistics/" target="_blank">Statistics</a></li>
    <li><a href="source/" target="_blank">Source</a></li>
    <li><a href="search/" target="_blank">Search</a></li>
    <li><a href="searchtree/" target="_blank">SearchTree</a></li>
    <li><a href="textview/" target="_blank">TextView</a></li>
    <li><a href="filelist.aspx" target="_blank">FileList</a></li>
    <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
    <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
    <li><a href="blog/" target="_blank">Blog</a></li>
</ul>
    <br />
    <center>

    <img class="circular" src="images/webImages/mypic.jpg" />
    </center>
    <div id="page-wrap">
           <p>
           <b> Sneha Vankireddy, </b>College of Computer and Information Science, Northeastern University <br />
               <b>About Me ...</b> </br>
                   I am from Tirupati India, candidate for a Master Of Science in
     Computer Science at Northeastern University Boston. This website is being developed
     as a part of the course "CS-5610 : Web Development" instructed by Prof <a href="http://net4.ccs.neu.edu/home/jga/"
        target="_blank" style="color:darkgray">Annunziato, Jose ..</a>  Prior coming to Northeastern University, 
      I was Software Engineer at CSC serving chrysler client.
     Eager to understand more on Web Development technologies (HTML5, CCS3,angular js, Ajax,jQuery, WebServices, JSON, AJAX)

           </p>
     </div>
	
         <ul class="photo-grid">
	<li>
		<a href="story/index.htm?../experiments/story.txt">
			<figure>
				<img src="images/webImages/experiments.png" height="180" width="320" alt="Experiments">
				<figcaption><p>Experiments</p></figcaption>
			</figure>
		</a>
	</li>
	<li>
		<a href="story/index.htm?../database/story.txt">
			<figure>
				<img src="images/webImages/SQL-Tables.png" height="180" width="320" alt="SQL-Tables">
				<figcaption><p>SQL Tables</p></figcaption>
			</figure>
		</a>
	</li>
	<li><a href="story/index.htm?../experiments/FinalProject/story.txt">
			<figure>
				<img src="images/webImages/FinalProject.png" height="180" width="320" alt="Final-Projects">
				<figcaption><p>Final Project</p></figcaption>
			</figure>
		</a>
	</li>
</ul>


    
     <ul class="master_navigation">
	<li>
		<a href="https://www.linkedin.com/pub/sneha-vankireddy/42/9a9/6b8/">			
				<img src="images/webImages/LinkedIn.png"  alt="LinkedIn">						
		</a>
	</li>
	<li>
		<a href="https://plus.google.com/+Snehav27">			
				<img src="images/webImages/google.png"  alt="Google+">						
		</a>
	</li>
         <li>
		<a href="https://www.facebook.com/sneha.vankireddy">			
				<img src="images/webImages/facebook.png"  alt="Facebook">						
		</a>
	</li>
</ul>
        <ul class="master_navigation">
	<li>
    <!-- Counter Code START --><a href="http://www.e-zeeinternet.com/" target="_blank"  ><img src="http://www.e-zeeinternet.com/count.php?page=1083684&style=default&nbdigits=5&reloads=1" alt="Free Counter" border="0" ></a><br><a href="http://www.e-zeeinternet.com/" title="Free Counter" target="_blank" style="font-family: Geneva, Arial, Helvetica, sans-serif; font-size: 10px; color: white; text-decoration: none;align-items: center">Free Counter</a><!-- Counter Code END -->
        </li>
            </ul>

     </div>
     </form>
    
</body>

</html>
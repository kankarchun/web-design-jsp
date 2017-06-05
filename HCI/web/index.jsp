<%@page import="it.bean.UserBean"%>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel=stylesheet type="text/css" href="all.css">
        <link rel="stylesheet" href="style/slider-def.css?v=2"> 
        
        <style>	
            .images img{
                height:500px;
            }
            .content-txt h2 {
                font-family: Quicksand;
                font-weight: normal;
                font-size: 24px;
                font-style: italic;
                color: #fff;
                text-align: left;
                margin-left: 30px;
            }
            .content-txt h1 {
                font-family: Intro;
                font-size: 36px;
                color: #fff;
                text-align: left;
                margin-left: 30px;
                padding-bottom: 10px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="headerDiv">
            <img id="headerImg" src="img/andrd.jpg">
            <div id="headerDesc">Buy Best Product Ltd</div>
        </div>
    <center>
        <div id="slider"> 
            <div class="slides">

                <!-- First slide --> 
                <div class="slider">
                    <div class="legend"></div> 
                    <div class="content"> 
                        <div class="content-txt"> 
                            <h1> Iphone 6s </h1> 
                            <h2> Apple best product </h2> 
                        </div> 
                    </div> 
                    <div class="images"> 
                        <img src="img/iphone.jpg"> 
                    </div> 
                </div> 

                <!-- Second slide --> 
                <div class="slider">
                    <div class="legend"></div> 
                    <div class="content"> 
                        <div class="content-txt"> 
                            <h1> Note 7 </h1> 
                            <h2> Samsung good product </h2> 
                        </div> 
                    </div> 
                    <div class="images"> 
                        <img src="img/note7.jpg"> 
                    </div> 
                </div> 

                <!-- Third slide --> 
                <div class="slider">
                    <div class="legend"></div> 
                    <div class="content"> 
                        <div class="content-txt"> 
                            <h1> One M9 </h1> 
                            <h2> HTC nice product </h2> 
                        </div> 
                    </div> 
                    <div class="images"> 
                        <img src="img/m9.jpg"> 
                    </div> 
                </div> 

                <div class="slider">
                    <div class="legend"></div> 
                    <div class="content"> 
                        <div class="content-txt"> 
                            <h1> Xperia Z3 </h1> 
                            <h2> Sony good product </h2> 
                        </div> 
                    </div> 
                    <div class="images"> 
                        <img src="img/z3.jpg"> 
                    </div> 
                </div> 
            </div> 
        </div>
    </center>
</body>
</html>																									
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel=stylesheet type="text/css" href="all.css">
        <style>
            #warp {
                width: 90%;
                max-width: 800px;
                background: #595959;
                margin: 30px auto;
                overflow: hidden;
                box-shadow: 0 3px 5px rgba(0, 0, 0, 0.75);
                -moz-box-shadow: 0 3px 5px rgba(0, 0, 0, 0.75);
                -webkit-box-shadow: 0 3px 5px rgba(0, 0, 0, 0.75);
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
            }
            ul#gallery-container {
                position: relative;
                width: 100%;
                max-width: 800px;
                height: auto;
                padding: 52% 0 10px;
                margin: 0;
                text-align: center;
                display: block;
            }
            li.gallery-item {display: inline-block;width: 10%;cursor:pointer;*display:inline;}
            img.gallery-preview{
                background: white;
                margin: 0;
                padding: 5% 5% 15%;
                *padding: 2px 2px 10px;
                position: relative;
                top: 0;
                width: 85%;
                height: auto;
                max-height: 45px;
                border-radius: 3px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                overflow: hidden;
                -webkit-transition: all 0.3s ease-out .2s;
                -moz-transition: all 0.3s ease-out .2s;
                -o-transition: all 0.3s ease-out .2s;
                transition: all 0.3s ease-out .2s;
            }
            ul#gallery-container:hover li img.gallery-preview{opacity: 0.5;-webkit-filter:blur(2px) grayscale(0.5); }
            ul#gallery-container:hover li:hover img.gallery-preview{opacity: 1;-webkit-filter:blur(0px) grayscale(0); }

            input.gallery-selector:checked ~ label.gallery-label>img.gallery-preview,
            ul#gallery-container:hover li:hover img.gallery-preview:hover{
                z-index: 5;
                box-shadow: 0 4px 5px rgba(0, 0, 0, 0.75);
                -moz-box-shadow: 0 4px 5px rgba(0, 0, 0, 0.75);
                -webkit-box-shadow: 0 4px 5px rgba(0, 0, 0, 0.75);
                -webkit-transform: scale(1.25);
                -moz-transform: scale(1.25);
                -o-transform: scale(1.25);
                transform: scale(1.25);

                -webkit-transform-origin: bottom center;
                -moz-transform-origin: bottom center;
                -o-transform-origin: bottom center;
                transform-origin: bottom center;
                -webkit-transition: all 0.3s ease-out;
                -moz-transition: all 0.3s ease-out;
                -o-transition: all 0.3s ease-out;
                transition: all 0.3s ease-out;
            }
            ul#gallery-container:hover li:hover img.gallery-preview:hover {z-index: 20;}
            input.gallery-selector:checked ~ label.gallery-label>img.gallery-preview{background: #333}
            input.gallery-selector:checked ~ label.gallery-label:before{
                content: " ";
                position: relative;
                width: 0;
                height: 0;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 20px solid #333;
                top: -30px;
            }

            a img.gallery-fullsize {
                position: absolute;
                top: 0px;
                left: 0px;
                display: block;
                width: 800;
                height: 400;
                z-index: -1;
                opacity: 0;
                -webkit-transform: scale(0.25);
                -moz-transform: scale(0.25);
                -o-transform: scale(0.25);
                transform: scale(0.25);
                -webkit-transform-origin: bottom center;
                -moz-transform-origin: bottom center;
                -o-transform-origin: bottom center;
                transform-origin: bottom center;
                -webkit-transition: all 0.3s ease-out;
                -moz-transition: all 0.3s ease-out;
                -o-transition: all 0.3s ease-out;
                transition: all 0.3s ease-out;
            }
            ul#gallery-container:hover li.gallery-item:active a img.gallery-fullsize{
                z-index: 50;
                opacity: 0.75;
                -webkit-filter:blur(10px) grayscale(1);
                border-radius: 10%;
                -webkit-border-radius: 10%;
                -moz-border-radius: 10%;
                -webkit-transform-origin: bottom center;
                -moz-transform-origin: bottom center;
                -o-transform-origin: bottom center;
                transform-origin: bottom center;
                -webkit-transition: all 0.3s ease-out .2s;
                -moz-transition: all 0.3s ease-out .2s;
                -o-transition: all 0.3s ease-out .2s;
                transition: all 0.3s ease-out .2s;
            }
            ul#gallery-container:hover li:hover input.gallery-selector:checked ~ a img.gallery-fullsize{
                z-index: 10;
                opacity: 1;
                border-radius: 0;
                -moz-border-radius: 0;
                -webkit-border-radius: 0;
            }

            input.gallery-selector:checked ~ a img.gallery-fullsize {
                display: block;
                opacity: 1;
                z-index: 10;
                -webkit-transform: scale(1);
                -moz-transform: scale(1);
                -o-transform: scale(1);
                transform: scale(1);

                -webkit-transform-origin: top center;
                -moz-transform-origin: top center;
                -o-transform-origin: top center;
                transform-origin: top center;
                -webkit-transition: all .2s ease-in .3s;
                -moz-transition: all .2s ease-in .3s;
                -o-transition: all .2s ease-in .3s;
                transition: all .2s ease-in .3s;
            }
            input.gallery-selector {display: none;}
            label.gallery-label {cursor: pointer;}
        </style>
    </head>
    <body>
        <%
            if (request.getAttribute("success") != null&&session.getAttribute("login")==null) {
                out.print("<script>alert('Successful order')</script>");
            }else if(request.getAttribute("success") != null&&session.getAttribute("login")!=null){
                double bonus=(Double)request.getAttribute("addedBonus");
                out.print("<script>alert('Successful order, you have added "+bonus+"')</script>");
            }
        %>
        <jsp:include page="header.jsp"/>
        <div id="headerDiv">
            <img id="headerImg" src="img/Transparent.jpg">
            <div id="headerDesc">Products</div>
        </div>
        <div id="warp">
            <ul id="gallery-container">
                <li class="gallery-item">
                    <input checked="checked" type="radio" name="gallery-list" class="gallery-selector" value="2.jpg" id="gallery-item2" />
                    <a href="apple.jsp">
                        <img src="img/apple1.png" class="gallery-fullsize"  alt="location bateau 135ch" />
                    </a>
                    <label for="gallery-item2" class="gallery-label">
                        <img src="img/apple1.png" class="gallery-preview"  alt="location bateau 135ch"/>
                    </label>
                </li>
                <li class="gallery-item">
                    <input type="radio" name="gallery-list" class="gallery-selector" value="3.jpg" id="gallery-item3" />
                    <a href="samsung.jsp">
                        <img src="img/samsungLogo.jpg" class="gallery-fullsize"  alt="location bateau 135ch" />
                    </a>
                    <label for="gallery-item3" class="gallery-label">
                        <img src="img/samsungLogo.jpg" class="gallery-preview"  alt="location bateau 135ch"/>
                    </label>
                </li>
                <li class="gallery-item">
                    <input type="radio" name="gallery-list" class="gallery-selector" value="4.jpg" id="gallery-item4" />
                    <a href="htc.jsp">
                        <img src="img/htcLogo.jpg" class="gallery-fullsize"  alt="location bateau 135ch" />
                    </a>
                    <label for="gallery-item4" class="gallery-label">
                        <img src="img/htcLogo.jpg" class="gallery-preview"  alt="location bateau 135ch"/>
                    </label>
                </li>
            </ul>
        </div>
    </body>
</html>																																																																		
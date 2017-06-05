<%@page import="it.bean.UserBean"%>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel=stylesheet type="text/css" href="all.css">
        <style>
            #container{
                margin:5% 10%;
            }
            td img{
                margin:50px;
                width:150px;
                height:150px;
            }
            .button {
                display: inline-block;
                border-radius: 4px;
                background-color: #f4511e;
                border: none;
                color: #FFFFFF;
                text-align: center;
                font-size: 16px;
                padding: 5px;
                width: 100%;
                transition: all 0.5s;
                cursor: pointer;
                margin: 5px;
            }

            .button span {
                cursor: pointer;
                display: inline-block;
                position: relative;
                transition: 0.5s;
            }

            .button span:after {
                content: '»';
                position: absolute;
                opacity: 0;
                top: 0;
                right: -20px;
                transition: 0.5s;
            }

            .button:hover span {
                padding-right: 25px;
            }

            .button:hover span:after {
                opacity: 1;
                right: 0;
            }
        </style>
    </head>
    <body>
        <%
            if (request.getAttribute("success") != null) {
                out.print("<script>alert('Successful redeem')</script>");
            }else if(request.getAttribute("fail") != null){
                out.print("<script>alert(\"Fail Redeem.Redeem bonus more than your account bonus\")</script>");
            }
        %>
        <jsp:include page="header.jsp"/>
        <div id="headerDiv">
            <img id="headerImg" src="img/gift.gif">
            <div id="headerDesc">Gifts</div>
        </div>
        <%
            if (session.getAttribute("login") != null) {
                UserBean ub = (UserBean) session.getAttribute("login");
                out.print("<center><h2>Your Bonus: $" + ub.getBonuns() + "</h2></center>");
            }
        %>
        <div id="container">
            <h2>Popular</h2>
            <hr>
            <div id="items">
                <center>
                    <table>
                        <tr>
                            <td>
                                <form action="handleRedeem">
                                    <img src="img/redeem/iwatch.jpeg">
                                    <center>Apple watch</center>
                                    <center>$50</center>
                                    <input type="hidden" name="redeem" value="50">
                                    <center><input type="submit" class="button" value="Redeem"></center>
                                </form>
                            </td>
                            <td>
                                <form action="handleRedeem">
                                    <img src="img/redeem/surface.jpg">
                                    <center>Surface pro 4</center>
                                    <center>$100</center>
                                    <input type="hidden" name="redeem" value="100">
                                    <center><input type="submit" class="button" value="Redeem"></center>
                                </form>
                            </td>
                            <td>
                                <form action="handleRedeem">
                                    <img src="img/redeem/macbook.jpg">
                                    <center>Macbook pro 2015</center>
                                    <center>$200</center>
                                    <input type="hidden" name="redeem" value="200">
                                    <center><input type="submit" class="button" value="Redeem"></center>
                                </form>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
         <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel="stylesheet" type="text/css" href="set1.css?v=1" />
        <link rel="stylesheet" type="text/css" href="normalize.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="login.css" />
         <link rel=stylesheet type="text/css" href="all.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="container">
            <center><h2>Login</h2></center>
            <form method='post' action="handleLogin">
                <p>
                <div class="group">      
                    <input type="text" required name="username" id='username'/>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Username</label>
                </div>
                </p>
                <p>
                <div class="group">      
                    <input type="password" required name="pwd">
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Password</label>
                </div>
                </p>
                <p>
                    <input type="submit" class="button" value="Login">
                </p>
            </form>
            <center>
                <%
                    if (request.getAttribute("error") != null) {
                        out.print("<font color='red'>Incorrect username or password</font>");
                        out.print("<script>$(document).ready(function(){$('#username').focus();})</script>");
                    }
                %>
            </center>
            <p>
            <div class="wrapper">
                <a class="eigth before after" href="register.jsp">Register</a>
            </div>
        </p>
    </div>
</body>
</html>

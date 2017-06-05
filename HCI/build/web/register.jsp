<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel="stylesheet" type="text/css" href="set1.css?v=1" />
        <link rel="stylesheet" type="text/css" href="normalize.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="login.css" />
        <link rel=stylesheet type="text/css" href="all.css">
        <script>
            $(document).ready(function () {
                $('#signup').click(function () {
                   if ($('#enter').val() != $('#reEnter').val()) {
                        alert('password and re-enter password are not same!');
                        $('#enter').val('');
                        $('#reEnter').val('');
                        $('#enter').focus();
                    }else{
                        alert('Successful registration!');
                        window.location.href='/HCI/login.jsp';
                    }
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="container">
            <center><h2>Register</h2></center>
            <form action="login.jsp">
                <p>
                <div class="group">      
                    <input type="text" required/>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Username</label>
                </div>
                </p>
                <p>
                <div class="group">      
                    <input type="password" required id="enter"/>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Password</label>
                </div>
                </p>
                <p>
                <div class="group">      
                    <input type="password" required id="reEnter"/>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Re-enter password</label>
                </div>
                </p>
                <p>
                    <input type="button" class="button" value="Sign up!" id="signup">
                </p>
            </form>
            <p>
            <div class="wrapper">
                <a class="eigth before after" href="login.jsp">Login</a>
            </div>
        </p>
    </div>
</body>
</html>

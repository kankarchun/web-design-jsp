<%@page import="it.bean.UserBean"%>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<div id="header">
    <div id="inner">
        <a href="index.jsp">
            <img src="img/logo.png" alt="" style="width:100px;height:50px;">
        </a>
        <div id="nav" style="float:right;">
            <div id="mainNav">
                <div id="navitem">
                    <%
                        if (session.getAttribute("login") != null) {
                            UserBean ub = (UserBean) session.getAttribute("login");
                            out.print("<b><i>Welcome, " + ub.getUsername() + "</i></b>");
                        }
                    %>
                    <a href="index.jsp" >HOME</a>
                    <a href="products.jsp" >Products</font></a>
                    <a href="cart.jsp" >Cart</a>
                    <%
                        if (session.getAttribute("login") != null) {
                            out.print("<a href=\"gifts.jsp\" >Gifts</a>");
                            out.print("<a href='handleLogout'>Sign out</a>");
                        } else {
                            out.print("<a href='' style='display:none'></a>");
                            out.print("<a href=\"login.jsp\" >Login</a>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
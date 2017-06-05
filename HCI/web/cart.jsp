<%@page import="java.util.ArrayList"%>
<%@page import="it.bean.ItemBean"%>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel=stylesheet type="text/css" href="all.css">
        <style>
            table{
                margin:auto;
                border-collapse: collapse; 
                width:800px;
            }
            tr td{
                border-bottom:1px solid black;
            }
            td{
                width:150px;
            }
            img{
                width:100px;
                height:100px;
            }
            input{
                width:80px;
            }
            td:last-child{
                width:75px;
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
            input,select{
                margin-top:5px;
            }
            select {
                width: 100%;
                padding: 5px 10px;
                border: none;
                border-radius: 4px;
            }
            input[type=number]{
                font-size:14px;
                border-radius:4px;
                padding:10px;
                box-sizing:border-box;
                border:2px solid #ccc;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="headerDiv">
            <img id="headerImg" src="img/cart.jpg">
            <div id="headerDesc">Shopping cart</div>
        </div>

        <%
            ArrayList<ItemBean> orders = new ArrayList();
            if (session.getAttribute("orders") != null) {
                orders = (ArrayList) session.getAttribute("orders");
        %>
        <div class="cart">
            <form action="handleCart">
                <table>
                    <thead>
                        <tr style="text-align:center;">
                            <td style="text-align:left;">Items</td>
                            <td></td>
                            <td>Quantity</td>
                            <td>Price</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            if (orders != null) {
                                for (ItemBean order : orders) {
                                    out.print("                    <tr style=\"text-align:center;\">\n"
                                            + "<form action='handleCancel'>"
                                            + "<input type='hidden' name='cancelID' value='" + order.getId() + "'>                        "
                                            + "<td><img src='" + order.getImg() + "'></td>\n"
                                            + "                        <td style=\"text-align:left;\">" + order.getName() + "</td>\n"
                                            + "                        <td><input id='quantity' type=\"number\" min='1' value='1'></td>\n"
                                            + "                        <td>$<span>" + order.getPrice() + "</span></td>\n"
                                            + "                        <td><button class=\"button\">Cancel</button></td>\n"
                                            + "</form>                    </tr>");
                                }
                            }
                        %>
                        <tr style="text-align:right;">
                            <th></th>
                            <th></th>
                            <td></td>
                            <td style="padding:20px">Subtotal</td>
                            <td>$<span id="subtotal">0</span></td>
                        </tr>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <td style="border-bottom:0px;"><button class="button" style="height:50px;">Checkout</button></td>
                        </tr>
                    </tbody>
                </table>
                <input type="hidden" id="total" name="total">
            </form>
        </div>
        <%
            out.print("<script>"
                    + "$(document).ready(function () {"
                    + "var firstTotal=0;"
            );
            for (int i = 0; i < orders.size(); i++) {
                out.print("var price=$('input[type=number]:eq(" + i + ")').val()*" + orders.get(i).getPrice() + ";");
                out.print("$('span:eq(" + i + ")').text(price);");
                out.print("firstTotal+=price;");
            }
            out.print("$('#subtotal').text(firstTotal);"
                    + "$('#total').val($('#subtotal').text());");
            out.print("$('input[type=number]').on('input',function(){"
                    + "var total=0;"
            );
            for (int i = 0; i < orders.size(); i++) {
                out.print("var price=$('input[type=number]:eq(" + i + ")').val()*" + orders.get(i).getPrice() + ";");
                out.print("$('span:eq(" + i + ")').text(price);");
                out.print("total+=price;");
            }
            out.print("$('#subtotal').text(total);"
                    + "$('#total').val($('#subtotal').text());"
                    + "});"
                    + "});"
                    + "</script>"
            );
        %>
        <%
            }else{
                out.print("<center><h3>Your shopping cart is empty<br><a href='products.jsp'>Click here to order products</a></h3></center>");
            }
        %>
    </body>
</html>																																																																		
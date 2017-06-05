<%@page import="it.bean.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel=stylesheet type="text/css" href="header.css?v=1">
        <link rel=stylesheet type="text/css" href="all.css">

        <script>
        </script>
        <style>
            .search {
                float:left;
                padding-left:5%;
                width:25%;
            }

            .search th, td {
                text-align: left;
                padding: 8px;
            }

            .search tr:nth-child(even){background-color: #f2f2f2}

            .search th {
                background-color: #4CAF50;
                color: white;
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

            #items{
                border-collapse: separate;
                border-spacing: 20px 30px;
                float:left;
                padding-left:5%;
                padding-right:5%;
                width:74%;
                word-wrap:break-word;
            }

            #items td table{
                margin:auto;
                width:100%;
            }

            #items td table td{
                max-width:1;
                text-align:center;
            }

            #items td table td p{
                text-align:justify;
            }

            #cart,#hideCart{
                position:fixed;
                bottom:0;
                right:0;
                border:1px solid;
                background-color:#FFF3E0;
                color:#424242;
                width:200px;
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
            input[type=text]{
                font-size:14px;
                border-radius:4px;
                padding:10px;
                box-sizing:border-box;
                border:2px solid #ccc;
                width:100%;
            }

            #items table{
                border-collapse: collapse;
            }
            tbody{
                border: transparent;
            }
            tbody tr:first-child,tbody tr:nth-child(3){
                border: 1px black;
            }
            #hideCart{
                display: none;
            }
            ul.button-group>li{
                float: none;
                display: inline-block;
            }
            ul.button-group{
                text-align: center;
            }
            a.button {
                -webkit-appearance: button;
                -moz-appearance: button;
                appearance: button;

                text-decoration: none;
                color: initial;
                background-color: #FFE082;
                width: 100px;
            }
            .disabled {
                pointer-events: none;
                cursor: not-allowed;
            }
            .idHeader{
                background-color: #E0E0E0;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('#hide').click(function () {
                    $('#cart').hide();
                    $('#hideCart').show();
                });
                $('#show').click(function () {
                    $('#cart').show();
                    $('#hideCart').hide();
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="headerDiv">
            <img id="headerImg" src="img/htc.jpg">
            <div id="headerDesc" style="color:#F5F5F5">HTC</div>
        </div>
        <div class="row">
            <div class="large-12 columns">
                <ul class="button-group ">
                    <li><a class="button " href="/HCI/apple.jsp">Apple</a></li>
                    <li><a class="button " href="/HCI/samsung.jsp">Samsung</a></li>
                    <li><a class="button disabled" href="/HCI/htc.jsp">HTC</a></li>
                </ul>
            </div>
        </div>
        <br>
        <%
            if (session.getAttribute("orders") != null) {
                ArrayList<ItemBean> orders = (ArrayList) session.getAttribute("orders");
                out.print("<div id='hideCart'>"
                        + "You ordered " + orders.size() + " items"
                        + "<img id='show' src='img/plus.png' width='25' height='25' style='float:right;'>"
                        + "</div>");
                out.print("<div id='cart'>"
                        + "<img id='hide' src='img/minus.ico' width='25' height='25' style='float:right;'><br>");
                for (ItemBean order : orders) {
                    out.print("<img src='" + order.getImg() + "' width='50' height='50'>" + order.getName() + " $" + order.getPrice() + "<br>");
                }
                out.print("</div>");
            }
        %>

        <form action="search">
            <input type="hidden" name="action" value="htc">
            <table class="search">
                <tr>
                    <th>
                        Products search
                    </th>
                </tr>
                <tr>
                    <td>
                        Name<br>
                        <input type="text" placeholder="Search.." name="search">
                    </td>
                </tr>
                <tr>
                    <td>
                        Price<br>
                        <div class="radio">
                            <input type="radio" name="price" value="0,300">0~300<br>
                            <input type="radio" name="price" value="301,500">301~500<br>
                            <input type="radio" name="price" value="501,800">501~800<br>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" class="button" style="vertical-align:middle;background-color:#8BC34A " value="Search">
                    </td>
                </tr>
            </table>
        </form>

        <div id="products">
            <table id="items">
                <%
                    if (request.getAttribute("items") != null) {
                        ArrayList items = (ArrayList) request.getAttribute("items");
                        if (items.size() > 0) {
                            int size = items.size();
                            for (int i = 0; i < items.size(); i++) {
                                ItemBean ib = (ItemBean) items.get(i);
                                out.print("<tr>");
                                if (size >= 2) {
                                    for (int j = 0; j < 2; j++) {
                                        ib = (ItemBean) items.get(i + j);
                                        out.print("<td>\n"
                                                + "	<table border=\"1\">\n"
                                                + "         <form action=\"handleOrder\">"
                                                + "             <input type='hidden' name='action' value='htc'>"
                                                + "             <input type='hidden' name='id' value='" + ib.getId() + "'>"
                                                + "             <input type='hidden' name='name' value='" + ib.getName() + "'>"
                                                + "             <input type='hidden' name='price' value='" + ib.getPrice() + "'>"
                                                + "             <input type='hidden' name='image' value='" + ib.getImg() + "'>"
                                                + "		<tr>\n"
                                                + "			<td class='idHeader'>\n"
                                                + "				" + ib.getId() + "\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "		<tr>\n"
                                                + "			<td>\n"
                                                + "				<img src=\"" + ib.getImg() + "\" width=\"200\" height=\"200\">\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "		<tr>\n"
                                                + "			<td>\n"
                                                + "				<p style='text-align:center'>" + ib.getName() + "</p>\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "		<tr>\n"
                                                + "			<td>\n"
                                                + "				<p>" + ib.getDescription() + "</p>\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "		<tr>\n"
                                                + "			<td>\n"
                                                + "				<p>" + ib.getAvailable() + " available</p>\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "		<tr>\n"
                                                + "			<td>\n"
                                                + "				<p>$" + ib.getPrice() + "</p>\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "		<tr>\n"
                                                + "			<td>\n"
                                                + "				<button class=\"button\" style=\"vertical-align:middle\">\n"
                                                + "					<span>Add to cart </span>\n"
                                                + "				</button>\n"
                                                + "			</td>\n"
                                                + "		</tr>\n"
                                                + "          </form>"
                                                + "	</table>\n"
                                                + "</td>");
                                    }
                                    size -= 2;
                                    i++;
                                } else {
                                    out.print("<td>\n"
                                            + "	<table border=\"1\">\n"
                                            + "         <form action=\"handleOrder\">"
                                            + "             <input type='hidden' name='action' value='htc'>"
                                            + "             <input type='hidden' name='id' value='" + ib.getId() + "'>"
                                            + "             <input type='hidden' name='name' value='" + ib.getName() + "'>"
                                            + "             <input type='hidden' name='price' value='" + ib.getPrice() + "'>"
                                            + "             <input type='hidden' name='image' value='" + ib.getImg() + "'>"
                                            + "		<tr>\n"
                                            + "			<td class='idHeader'>\n"
                                            + "				" + ib.getId() + "\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "		<tr>\n"
                                            + "			<td>\n"
                                            + "				<img src=\"" + ib.getImg() + "\" width=\"200\" height=\"200\">\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "		<tr>\n"
                                            + "			<td>\n"
                                            + "				<p style='text-align:center'>" + ib.getName() + "</p>\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "		<tr>\n"
                                            + "			<td>\n"
                                            + "				<p>" + ib.getDescription() + "</p>\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "		<tr>\n"
                                            + "			<td>\n"
                                            + "				<p>" + ib.getAvailable() + " available</p>\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "		<tr>\n"
                                            + "			<td>\n"
                                            + "				<p>$" + ib.getPrice() + "</p>\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "		<tr>\n"
                                            + "			<td>\n"
                                            + "				<button class=\"button\" style=\"vertical-align:middle\" id=\"add\">\n"
                                            + "					<span>Add to cart </span>\n"
                                            + "				</button>\n"
                                            + "			</td>\n"
                                            + "		</tr>\n"
                                            + "          </form>"
                                            + "	</table>\n"
                                            + "</td>");
                                }
                                out.print("</tr>");
                            }
                        }
                    } else {
                        ArrayList items = new ArrayList();
                        String[] id = {"H001", "H002", "H003", "H004", "H005", "H006", "H007", "H008"};
                        String[] name = {"One A9", "One M9+", "One E9", "One M9", "Butterfly 2", "Desire 10", "Desire 530", "Desire EYE"};
                        String[] description = {"one A9 is good", "one M9+ is nice", "one E9 is good", "one M9 is cheap", "Butterfly2 is good", "desire 10 is nice", "desire 530 is cheap", "desire EYE is nice"};
                        int[] available = {10, 12, 10, 9, 7, 8, 11, 13};
                        int[] price = {100, 200, 400, 300, 350, 400, 600, 650};
                        String[] img = {"img/htc/a9.jpg", "img/htc/m9p.jpg", "img/htc/e9.jpg", "img/htc/m9.jpg", "img/htc/b2.jpg", "img/htc/d10.jpg", "img/htc/d530.jpeg", "img/htc/de.png"};
                        for (int i = 0; i < name.length; i++) {
                            ItemBean ib = new ItemBean();
                            ib.setId(id[i]);
                            ib.setName(name[i]);
                            ib.setDescription(description[i]);
                            ib.setAvailable(available[i]);
                            ib.setPrice(price[i]);
                            ib.setImg(img[i]);
                            items.add(ib);
                        }
                        int index = 0;
                        for (int i = 0; i < 4; i++) {
                            out.print("<tr>");
                            for (int j = 0; j < 2; j++) {
                                ItemBean ib = (ItemBean) items.get(index);
                                out.print("<td>\n"
                                        + "	<table border=\"1\">\n"
                                        + "         <form action=\"handleOrder\">"
                                        + "             <input type='hidden' name='action' value='htc'>"
                                        + "             <input type='hidden' name='id' value='" + ib.getId() + "'>"
                                        + "             <input type='hidden' name='name' value='" + ib.getName() + "'>"
                                        + "             <input type='hidden' name='price' value='" + ib.getPrice() + "'>"
                                        + "             <input type='hidden' name='image' value='" + ib.getImg() + "'>"
                                        + "		<tr>\n"
                                        + "			<td class='idHeader'>\n"
                                        + "				" + ib.getId() + "\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "		<tr>\n"
                                        + "			<td>\n"
                                        + "				<img src=\"" + ib.getImg() + "\" width=\"200\" height=\"200\">\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "		<tr>\n"
                                        + "			<td>\n"
                                        + "				<p style='text-align:center'>" + ib.getName() + "</p>\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "		<tr>\n"
                                        + "			<td>\n"
                                        + "				<p>" + ib.getDescription() + "</p>\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "		<tr>\n"
                                        + "			<td>\n"
                                        + "				<p>" + ib.getAvailable() + " available</p>\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "		<tr>\n"
                                        + "			<td>\n"
                                        + "				<p>$" + ib.getPrice() + "</p>\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "		<tr>\n"
                                        + "			<td>\n"
                                        + "				<button class=\"button\" style=\"vertical-align:middle\" id=\"add\">\n"
                                        + "					<span>Add to cart </span>\n"
                                        + "				</button>\n"
                                        + "			</td>\n"
                                        + "		</tr>\n"
                                        + "          </form>"
                                        + "	</table>\n"
                                        + "</td>");
                                index++;
                            }
                            out.print("</tr>");
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>																																																																	
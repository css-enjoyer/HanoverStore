<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Product p1 = new Product(1, "Jacket", 10);
    Product p2 = new Product(2, "Shirt", 4);
    Product p3 = new Product(3, "Pants", 7);

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("username") == null) 
        response.sendRedirect("LandingJSP.jsp");          
%>
            
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Styles.css"/>
    </head>
    <body>
        <div class="navsection"></div>
        <div class="mainsection">
            
            <form>
                <input type="submit" value="Logout" formaction="Logout"/>
                <input type="submit" value="View Cart" formaction="ViewCart">
            </form>
            <div>
                <div class="container">
                    
                </div>
                <a href="AddToCart?id=<%=p1.getId()%>&name=<%=p1.getName()%>&price=<%=p1.getPrice()%>"><%=p1.getName()%></a>
                <a href="AddToCart?id=<%=p2.getId()%>&name=<%=p2.getName()%>&price=<%=p2.getPrice()%>"><%=p2.getName()%></a>
                <a href="AddToCart?id=<%=p3.getId()%>&name=<%=p3.getName()%>&price=<%=p3.getPrice()%>"><%=p3.getName()%></a>
            </div>
            
          <%if(session.getAttribute("order-status") == null) {
                // order failed
                out.println("order failed");
            } else {
                // order success
                out.println("order success");
            }%>
        </div>
    </body>
</html>
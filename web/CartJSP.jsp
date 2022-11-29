<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("username") == null) {
        response.sendRedirect("LandingJSP.jsp");  
    }
    if(session.getAttribute("cart-list") == null) {
        ArrayList<Cart> sessionCart = new ArrayList();
        session.setAttribute("cart-list", sessionCart);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"); 
    double cartTotal = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cart</title>
    </head>
    <body>
        
        <a href="HomeJSP.jsp">Back to home</a>
        <h1>Your cart contains: </h1>
        <%
        if(!cart_list.isEmpty()) {
            for(Cart p: cart_list) {
                cartTotal += Double.parseDouble(p.getPrice().replaceAll(",",""));
        %>
        
        <h5><%= p.getName() + ", " + p.getPrice() %></h5> <a href="RemoveFromCart?index=<%= cart_list.indexOf(p) %>">Remove</a>
        
        <%
            }
        } else {
        %>
        
        <h5>Nothing, your cart is empty.</h5>
        
        <%
        }
        %>
        
        <h3>Total: <%= cartTotal %></h3>  
        
        <form>
            <input type="submit" formaction="Order" value="Order"/>
        </form>
        
    </body>
</html>
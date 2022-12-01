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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width", initial-scale="1.0">
        <title>Cart</title>
        <link rel="stylesheet" href="Style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alexandria:wght@300;500;600;800&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/14074f687d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css">
        <link rel="shortcut icon" href="./Images/LogoIconT.png">
    </head>
    <body>
        <div class="container">
            <div class="small-container">
                <h1 class="title cart-title">Your cart contains: </h1>
                <a href="HomeJSP.jsp" class="home-btn">← Back to home</a>
                <%
                if(!cart_list.isEmpty()) {
                    for(Cart p: cart_list) {
                        cartTotal += Double.parseDouble(p.getPrice().replaceAll(",",""));
                %>
                <div class="col-4 remove">
                    <h5><%= p.getName() + ", " + p.getPrice() %></h5> <a href="RemoveFromCart?index=<%= cart_list.indexOf(p) %>">Remove</a>
                </div>
                <%
                    }
                } else {
                %>

                <h5 class="empty-text">Nothing, your cart is empty.</h5>

                <%
                }
                %>

                <h3>Total: ₱<%= cartTotal %></h3>  

                <form>
                    <input type="submit" formaction="Order" value="Order &#8594;" class="btn"/>
                </form>
            </div>
        </div>
            
        <!-- Footer -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download App</h3>
                        <p>Download App for Android and iOS devices.</p>
                        <div class="app-logo">
                            <img src="Images/GooglePlay.png"/>
                            <img src="Images/AppStore.png"/>
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="Images/LogoT.png"/>
                        <p>Hanover Sneakers is the fastest and easiest source of the rarest sneakers released.</p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>
                        <ul>
                            <li>Coupons</li>
                            <li>Blog Post</li>
                            <li>Return Policy</li>
                            <li>Join Affiliate</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li>Facebook</li>
                            <li>Twitter</li>
                            <li>Instagram</li>
                            <li>Youtube</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2020 - Group 8</p>
            </div>
        </div>
    </body>
</html>
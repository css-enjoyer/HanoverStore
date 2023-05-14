<%-- 
    Document   : Error
    Created on : May 5, 2023, 4:06:18 PM
    Author     : maxim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width", initial-scale="1.0">
        <title>Register Error</title>
        <link rel="stylesheet" href="Style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alexandria:wght@300;500;600;800&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/14074f687d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css">
        <link rel="shortcut icon" href="./Images/LogoIconT.png">
    </head>
    <body>
<!--        Note: error can be shown in the login/ register page itself rather than
            being directed to a separate page-->
        <div class="error header">
            <h1 class="error-heading">Registration Error</h1>
                <% String msg = (String) request.getAttribute("msg");
                    if (msg != null) { %>
                <div class="error-msg">
                <% out.println(msg);
                    request.removeAttribute("msg");
                %>
                </div>
                <% }%>
            <div class="error-link">
                <a href="LandingJSP.jsp" class="btn">Return to login</a>
            </div>
            <% if (session.getAttribute("username") != null) { %>
                <div class="container">
                    <a href="LandingJSP.jsp" class="btn">Return to content</a>
                </div>
            <% } %>
        </div>
    </body>
</html>

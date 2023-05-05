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
        <title>JSP Page</title>
    </head>
    <body>
<!--        Note: error can be shown in the login/ register page itself rather than
            being directed to a separate page-->
        <div class="container">
            <h1><font color='red'>Error!</font></h1>
                <% String msg = (String) request.getAttribute("msg");
                    if (msg != null) { %>
                <div class="error">
                <% out.println(msg);
                    request.removeAttribute("msg");
                %>
                </div>
                <% }%>
            <div class="container">
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

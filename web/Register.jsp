<%-- 
    Document   : Register
    Created on : May 5, 2023, 3:32:17 PM
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
        <form method="post" action="Register">

            <div class="input-group">
                <label>Username</label>
                <input type="email" name="username" required>
            </div>
<!--            <div>
                <p>Choose your role:</p>
                <input type="radio" id="admin" name="userRole" value="admin" required>
                <label for="admin">Admin</label><br>
                <input type="radio" id="guest" name="userRole" value="guest">
                <label for="user">Guest</label><br>
            </div>-->
            <!--Note: default user role is "user"-->
            <input type="hidden" name="userRole" value="user">
            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password1" required>
            </div>
            <div class="input-group">
                <label>Confirm password</label>
                <input type="password" name="password2" required>
            </div>
            <div class="input-group">
                <img src="simpleCaptcha.png" /><br>
                <label>Answer</label>
                <input type="text" name="answer" required>
            </div>
            <div class="input-group">
                <button type="submit" class="btn" name="regUser">Register</button>
            </div>
            <p>
                Already a member? <a href="LandingJSP.jsp">Sign in</a>
            </p>
        </form>
    </body>
</html>

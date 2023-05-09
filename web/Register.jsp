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
        <meta name="viewport" content="width=device-width", initial-scale="1.0">
        <title>Register</title>
        <link rel="stylesheet" href="Style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alexandria:wght@300;500;600;800&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/14074f687d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css">
        <link rel="shortcut icon" href="./Images/LogoIconT.png">
    </head>
    <body>
        <form method="post" action="Register"> 
            <div class="register header">
                <h1 class="title cart-title">Register Now</h1>
                <table>
                    <tr>
                        <td><label>Username</label></td>
                        <td><input type="email" name="username" required></td>
                    </tr>
                    <tr>
                        <td><label>Password</label></td>
                        <td><input type="password" name="password1" required></td>
                    </tr>
                    <tr>
                        <td><label>Confirm Password</label></td>
                        <td><input type="password" name="password2" required></td>
                    </tr>
                    <tr>
                        <td><label>Password</label></td>
                        <td><input type="password" name="password1" required></td>
                    </tr>
                </table>
                <div>
                    <img src="simpleCaptcha.png" /><br>
                    <table>
                            <td><label>Answer</label></td>
                            <td><input type="text" name="answer" required></td>
                    </table>
                </div>
                
                <div>
                    <button type="submit" class="btn" name="regUser">Register</button>
                    <p>
                        Already a member? <a href="LandingJSP.jsp">Sign in</a>
                    </p>
                </div>
                
                <!--Note: default user role is "user"-->
                <input type="hidden" name="userRole" value="user">
                
<!--                
                <div class="input-group">
                    <label>Username</label>
                    <input type="email" name="username" required>
                </div>
                
                Note: default user role is "user"
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
-->
            </div>
        </form>
    </body>
</html>

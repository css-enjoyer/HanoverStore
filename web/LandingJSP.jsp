<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page import="Model.ProductInventory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--
    ProductInventory inventory = new ProductInventory();
    ArrayList<Product> pList = inventory.getProductInvetory();
    Product pOffer = inventory.getProductOffer();
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width", initial-scale="1.0">
        <title>Welcome to Hanover</title>
        <link rel="stylesheet" href="Style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Alexandria:wght@300;500;600;800&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/14074f687d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.0/css/fontawesome.min.css">
        <link rel="shortcut icon" href="./Images/LogoIconT.png">
    </head>
    <script> <!-- Pop-up Script -->
        function openForm() {
            document.getElementById("loginform").style.display = "flex";
        }
        function closeForm() {
            document.getElementById("loginform").style.display = "none";
        }
    </script>
    <body>
        <div class="header">
            <div class="container">
                <div class="navsection">
                    <div class="logo">
                        <img src="Images/LogoT.png" width="125px" alt="logo"/>
                    </div>
                    <nav>
                        <ul>
                            <li><a href="LandingJSP.jsp">Home</a></li>
                            <li><a href="#products">Products</a></li>
                            <li><a href="#about-contact">About</a></li>
                            <li><a href="#about-contact">Contact</a></li>
                            <li><button id="login" onclick="openForm()">Login</button></li>
                            <li><a href="Register.jsp">Register</a></li>
                            <li><a onclick="openForm()"><i class="fa-solid fa-bag-shopping"></i></a></li>
                        </ul>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-2">
                        <h1>The Best Plug <br> For The Best Kicks!</h1>
                        <p>Don't ever let your head down, unless it's to admire our shoes.</p>
                        <a class="explore-btn btn" onclick="openForm()">Explore Now &#8594;</a> <!-- Html code -->
                    </div>
                    <div class="col-2">
                        <img src="Images/Jordans.png"/>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Featured Brands -->
        <div class="categories">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <img src="Images/Category-Jordans.png"/>
                    </div>
                    <div class="col-3">
                        <img src="Images/Category-Yeezys.png"/>
                    </div>
                    <div class="col-3">
                        <img src="Images/Category-Balenciagas.png"/>
                    </div>
                </div>
            </div>
        </div>
        
<!--    REMOVE (?) 
        
        <!-- Products 
        <div class="small-container" id="products">
            <h2 class="title">Available Products</h2>
            <div class="row">
        <%--  
            if(!pList.isEmpty()) {
                for(Product p: pList) {     
        %>
                    <div class="col-4">
                        <div class="img-container">
                            <img class="feat-prod-img" src="<%= p.getImage() %>"/>
                        </div>
                        <h4><%= p.getName() %></h4>
                        <div class="rating">
                    <%  for(int i = 0; i < p.getRating(); i++) { %>
                            <i class="fa fa-star"></i>
                    <%  }                                        %>
                        </div>
                        <p>₱<%= p.getPrice() %></p>
                    </div>
        <%      
                }               
            }   
        --%>
            </div>
        </div>
        
         Offered Product 
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="<%--= pOffer.getImage() %>" class="offer-img"/>
                    </div>
                    <div class="col-2">
                        <p>Converse pays homage to to the band’s 1978 album ‘Powerage’</p>
                        <h1><%= pOffer.getName() %></h1>
                        <small>In 2009, Converse dropped a Chuck Taylor All Stars collection featuring Australian rock legends AC/DC.</small>
                        <br>
                        <p>₱<%= pOffer.getPrice() --%></p>
                        <a onclick="openForm()" class="btn">Buy Now &#8594;</a>
                    </div>
                </div>
            </div>
        </div>
-->
        
        <!-- Testimonial Section -->
        <div class="testimonial">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>Hanover has become the best place for me to get my shoes. 
                           I can trust that the shoes will always be top quality.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half"></i>      
                        </div>
                        <img src="Images/BenSimmons.png"/>
                        <h3>Ben Simmons</h3>
                    </div>
                    
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>It's lit (with reverb)</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>      
                        </div>
                        <img src="Images/TravisScott.png"/>
                        <h3>Travis Scott</h3>
                    </div>
                    
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>A mind needs a book like my warddrobe needs hanover.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>      
                        </div>
                        <img src="Images/TyrionLannister.png"/>
                        <h3>Tyrion Lannister</h3>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <div class="footer" id="about-contact">
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
        
        
        <form id="loginform" action="Login" method="POST">
            <h2>Login</h2>
            <input type="email" name="username" placeholder="username" required/>
            <input type="password" name="password" placeholder="password" required/>
            <div class="formbuttons">
                <button onclick="closeForm()">Cancel</button>
                <input type="submit" value="Login"/>
            </div>
        </form>
        
        
        
    </body>
</html>

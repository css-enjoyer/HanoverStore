<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li><a>Home</a></li>
                            <li><a>Products</a></li>
                            <li><a>About</a></li>
                            <li><a>Contact</a></li>
                            <li><button id="login" onclick="openForm()">Login</button></li>
                            <li><a><i class="fa-solid fa-bag-shopping"></i></a></li>
                        </ul>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-2">
                        <h1>The Best Plug <br> For The Best Kicks!</h1>
                        <p>Don't ever let your head down, unless it's to admire our shoes.</p>
                        <a href="" class="explore-btn btn">Explore Now &#8594;</a> <!-- Html code -->
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
        
        <!-- Featured Products -->
        <div class="small-container">
            <h2 class="title">Featured Products</h2>
            <div class="row">
                <!-- Each Product, modify to print for each object stored in arraylist  -->
                <div class="col-4">
                    <img class="feat-prod-img" src="Images/Featured-TSJordan1s.png"/>
                    <h4>Travis Scott x Jordan 1s</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>      
                    </div>
                    <p>₱94,689.00</p>
                </div>
                
                <div class="col-4">
                    <img class="feat-prod-img" src="Images/Featured-NikeXYeezyZenGrey.png"/>
                    <h4>Nike x Yeezy Zen Grey</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>      
                    </div>
                    <!-- <p>₱185,699.00</p> -->    
                    <p>Sold Out</p>
                </div>
                
                <div class="col-4">
                    <img class="feat-prod-img" src="Images/Featured-BalenciagaTrack2Biege.png"/>
                    <h4>Balenciaga Track 2s Biege/Black</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>      
                    </div>
                    <p>₱325,999.00</p>
                </div>
            </div>
            
            <!-- Latest Products -->
            <h2 class="title">Latest Products</h2>
            <div class="row">
                <!-- Each Product, modify to print for each object stored in arraylist  -->
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/Featured-TSJordan1s.png"/>
                    </div>
                    <h4>Travis Scott x Jordan 1s</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>      
                    </div>
                    <p>₱94,689.00</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/Featured-NikeXYeezyZenGrey.png"/>
                    </div>
                    <h4>Nike x Yeezy Zen Grey</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half"></i>
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>      
                    </div>
                    <!-- <p>₱185,699.00</p> -->    
                    <p>Sold Out</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/AdidasXGucciGazelleRed.png"/>
                    </div>
                    <h4>Adidas X Gucci Gazelle</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-o"></i>
                        <i class="fa fa-star-o"></i>      
                    </div>
                    <p>₱53,364.54</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/RickOwensVintageSneaks.png"/>
                    </div>
                    <h4>Rick Owens Vintage Sneaks</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half"></i>      
                    </div>
                    <p>₱81,055.00</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/Jordan1RetroHighDior.png"/>
                    </div>
                    <h4>Js1 RH Dior</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>      
                    </div>
                    <p>₱353,687.50</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/AdidasY3Runner4D.png"/>
                    </div>
                    <h4>Adidas Y3 Runners</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>      
                    </div>
                    <p>₱40,259.50</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/NikeSBDunkLowCoffeeLovers.png"/>
                    </div>
                    <h4>Nike SBD CLs</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>      
                    </div>
                    <p>₱31,125.50</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/NikeAirMax1AtmosElephant.png"/>
                    </div>
                    <h4>Air Max 1 Atmost E</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>      
                    </div>
                    <p>₱33,499.79</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/Kobe6ProtroEYBL.png"/>
                    </div>
                    <h4>Kobe 6 Protro</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>      
                    </div>
                    <p>₱43,099.79</p>
                </div>
                
                <div class="col-4">
                    <div class="img-container">
                        <img class="feat-prod-img" src="Images/Jordan1RetroHighTrophyRoom.png"/>
                    </div>
                    <h4>J1 RH Trophy Room</h4>
                    <div class="rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>      
                    </div>
                    <p>₱89,099.79</p>
                </div>
                
            </div>
        </div>
        
        <!-- Offered Product -->
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="Images/Offer-ChuckTaylorXACDC.jpg" class="offer-img"/>
                    </div>
                    <div class="col-2">
                        <p>Converse pays homage to to the band’s 1978 album ‘Powerage’</p>
                        <h1>AC/DC Chuck Taylors</h1>
                        <small>In 2009, Converse dropped a Chuck Taylor All Stars collection featuring Australian rock legends AC/DC.</small>
                        <br>
                        <a href="#" class="btn">Buy Now &#8594;</a>
                    </div>
                </div>
            </div>
        </div>
        
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
        
        
        <form id="loginform" action="Login" method="POST">
            <h2>Login</h2>
            <input type="text" name="user" placeholder="username"/>
            <input type="password" name="pass" placeholder="password"/>
            <div class="formbuttons">
                <button onclick="closeForm()">Cancel</button>
                <input type="submit" value="Login"/>
            </div>
        </form>
        
        
        
    </body>
</html>

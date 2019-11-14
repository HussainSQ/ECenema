<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>NotAMC Theatres</title>
    <link href="assets/images/favicon.png" rel="shortcut icon">
    <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/plugins/owl-carousel/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/plugins/magnific-popup/magnific-popup.min.css" rel="stylesheet">
    <link href="assets/css/app.min.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">
    <link href="assets/plugins/font-awesome/css/all.css" rel="stylesheet">
    <link href="assets/plugins/themify/themify-icons.min.css" rel="stylesheet">

</head>
<body data-preloader="2">
<header>
    <div class="container text-center">
        <div class="margin-top-70">
            <a href="index.jsp"><h2 style="padding-bottom: 10px"class="no-margin line-height-100">NotAMC Movie Theatre</h2></a>
        </div>
    </div>
    <nav class="navbar">
        <div class="container">
            <ul class="nav m-auto dropdown-transparent-dark">
                <li class="nav-item nav-dropdown">
                    <a style="white-space:pre" class="nav-link" href="userHome.html">Home</a>
                </li>
                <%
                    if (session.getAttribute("user") != null){
                        User user = (User) session.getAttribute("user");
                    if (1 == user.getAdmin()) { %>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link" href="adminPage.jsp">Admin Page</a>
                </li>
                <% } %>
                    <li class="nav-item nav-dropdown">
                        <a class="nav-link" href="./Logout">Logout</a>
                    </li>
                    <li class="nav-item nav-dropdown" >
                        <a class="nav-link" href = "./ProfileServ" > Profile </a >
                    </li >
                <% } else{%>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link" href="Login.html">Login</a>
                </li>
                <% } %>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link" href="checkout.html">Checkout</a>
                </li>
            </ul>
            <button class="nav-toggle-btn">
                <span class="lines"></span>
            </button>
        </div>
    </nav>
    <div style="width:240px;margin:0 auto">
        <form class="form-style-4" style="width: 200px">
            <input type="text" class="form-control" placeholder="Search Movies"></
        >
    </div>
</header>
<div class="section" style="padding-top: 5px">
    <div class="container">
        <div class="filter filter-style-2 text-center">
            <ul>
                <li class="active" data-filter="*">All</li>
                <li data-filter=".category-1" class="">Action</li>
                <li data-filter=".category-2">Comedy</li>
                <li data-filter=".category-3">Kids</li>
                <li data-filter=".category-5">SciFi</li>
                <li data-filter=".category-4">Music</li>
                <li data-filter=".category-6">Horror</li>
            </ul>
        </div>
        <div class="portfolio-wrapper column-4 spacing-10" style="position: relative; height: 805.333px;">
            <div class="portfolio-item category-5" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/event-10-52.jpg" alt="">
                    </div>
                    <a href="moviePage.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Avengers Endgame</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-5" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/event-11-11.jpg" alt="">
                    </div>
                    <a href="Boxing.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Spiderman Far From Home</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-6" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/event-9-9.jpg" alt="">
                    </div>
                    <a href="ATHArch.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Joker</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-2" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/event-8-24.jpg" alt="">
                    </div>
                    <a href="UGAUKwom.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">ZombieLand Double Tap</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-3" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/event-7-45.jpg" alt="">
                    </div>
                    <a href="FLArch.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Toy Story 4</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-4" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/Rocketman.jpg" alt="">
                    </div>
                    <a href="hotel.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Rocketman</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-4" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/yesterday.jpg" alt="">
                    </div>
                    <a href="fitness.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Yesterday</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-4" style="position: absolute; left: 0px; top: 0px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/queen.jpg" alt="">
                    </div>
                    <a href="erika.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Bohemain Rhapsody</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-1" style="position: absolute; left: 369px; top: 0px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/1917.jpg" alt="">
                    </div>
                    <a href="zeph.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">1917</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-1" style="position: absolute; left: 739px; top: 0px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/John3.jpg" alt="">
                    </div>
                    <a href="jaclyn.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">John Wick 3</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portfolio-item category-4" style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/terminator.jpg" alt="">
                    </div>
                    <a href="hoco2018.html"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal">Terminator Dark Fate</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/plugins/jquery.min.js"></script>
        <script src="assets/plugins/bootstrap/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
        <script src="assets/plugins/appear.min.js"></script>
        <script src="assets/plugins/easing.min.js"></script>
        <script src="assets/plugins/retina.min.js"></script>
        <script src="assets/plugins/countdown.min.js"></script>
        <script src="assets/plugins/imagesloaded.pkgd.min.js"></script>
        <script src="assets/plugins/isotope.pkgd.min.js"></script>
        <script src="assets/plugins/jarallax/jarallax.min.js"></script>
        <script src="assets/plugins/jarallax/jarallax-video.min.js"></script>
        <script src="assets/plugins/magnific-popup/magnific-popup.min.js"></script>
        <script src="assets/plugins/owl-carousel/owl.carousel.min.js"></script>
        <script src="assets/plugins/gmaps.min.js"></script>
        <script src="assets/js/functions.min.js"></script>
    </div>
</div>
</body>
</html>
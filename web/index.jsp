<%@ page import="model.User" %>
<%@ page import="java.sql.*"%>
<%@ page import="model.MovieService" %>
<%@ page import="model.Movie" %>
<%@ page import="java.util.ArrayList" %>
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
                    <a style="white-space:pre" class="nav-link" href="index.jsp">Home</a>
                </li>
                <%
                    if (session.getAttribute("user") != null){
                        User user = (User) session.getAttribute("user");
                    if (1 == user.getInstance().getAdmin()) { %>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link" href="adminPage.jsp">Admin Page</a>
                </li>
                <% } %>
                    <li class="nav-item nav-dropdown">
                        <a class="nav-link" href="./Logout">Logout</a>
                    </li>
                    <li class="nav-item nav-dropdown" >
                        <a class="nav-link" href = "profile.jsp" > Profile </a >
                    </li >
                <% } else{%>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link" href="Login.html">Login</a>
                </li>
                <% } %>
            </ul>
            <button class="nav-toggle-btn">
                <span class="lines"></span>
            </button>
        </div>
    </nav>

    <form action="./searchServlet" method="POST">
        <div class="container">
            <div class="form-group">
                <div class="col-sm-50">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" placeholder="Search Movies"/>
                        <div class="input-group-btn">
                            <button type="submit" value="Search" class="btn btn-default">Enter</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
                if(session.getAttribute("movieList") != null){%>
            <table class="table table-bordered table-striped" style="width:70%">

                <tr>
                    <th style="width: 100%">Results:</th>
                </tr>
                <tr>
                    <td>

                        <div class="portfolio-wrapper column-4 spacing-10" style="position: relative; height: 805.333px;">
                            <%
                                ArrayList<Movie> movieList = (ArrayList<Movie>) session.getAttribute("movieList");
                                if(movieList.size() > 0){
                                for(int q = 0; q<movieList.size(); q++){%>
                            <div class="portfolio-item" style="position: absolute; left: 369px; top: 304px;">
                                <div class="portfolio-box">
                                    <div class="portfolio-img">
                                        <img src="assets/images/<%out.print(movieList.get(q).getTitle());%>.jpg" alt="">
                                    </div>
                                    <a href="./BookServ?movie=<%out.print(movieList.get(q).getTitle());%>"></a>
                                    <div class="portfolio-title">
                                        <div>
                                            <h5 class="font-weight-normal"><%=movieList.get(q).getTitle()%></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } }if(movieList.size() == 0){
                                 %>
                            <div class="portfolio-item" style="position: absolute; left: 369px; top: 304px;">
                                <div class="portfolio-box">
                                    <div class="portfolio-img">
                                        <img src="assets/images/Error.jpg" alt="">
                                    </div>
                                    <div class="portfolio-title">
                                        <div>
                                            <h5 class="font-weight-normal">Movie Not Found</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}}%>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</header>
<div class="section" style="padding-top: 5px">
    <div class="container">
        <div class="filter filter-style-2 text-center">
            <ul>
                <li data-filter=".category-1" class="">Available Now</li>
                <li class="active" data-filter=".category-0">Coming Soon</li>
            </ul>
        </div>


        <div class="portfolio-wrapper column-4 spacing-10" style="position: relative; height: 805.333px;">

            <%
                MovieService movieService = new MovieService();
                ArrayList<Movie> movies = null;
                try {
                    movies = movieService.getAllMovies();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
                assert movies != null;
                for (Movie movie : movies) {
            %>
            <div class="portfolio-item category-<% out.print(movie.getAvailable());%>"
                 style="position: absolute; left: 369px; top: 304px;">
                <div class="portfolio-box">
                    <div class="portfolio-img">
                        <img src="assets/images/<% out.print(movie.getTitle());%>.jpg" alt="">
                    </div>
                    <a href="./BookServ?movie=<%out.print(movie.getTitle());%>"></a>
                    <div class="portfolio-title">
                        <div>
                            <h5 class="font-weight-normal"><% out.print(movie.getTitle());%></h5>
                        </div>
                    </div>
                </div>
            </div>

            <%
                }%>
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
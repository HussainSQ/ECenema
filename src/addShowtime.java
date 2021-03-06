import model.Movie;
import model.MovieService;
import model.ShowtimeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Servlet implementation class Servlet1
 */
@WebServlet("/addShowtime")
public class addShowtime extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String showroom = request.getParameter("showroom");
        String day = request.getParameter("day");
        String time = request.getParameter("time");
        ShowtimeService showtimeService = new ShowtimeService();
        PrintWriter out = response.getWriter();
        try {
            if(showtimeService.exists(showroom, day, time)){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/addShowtime.jsp");
                out.println("<font color=red>Showtime already exists for another movie, please pick another</font>");
                rd.include(request, response);
                return;
            }
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesite", "root", "asdasd");//"UN", "PW"
                Statement stmt = con.createStatement();
                Statement stmt1 = con.createStatement();
                Statement stmt2 = con.createStatement();
                int success = stmt.executeUpdate("INSERT INTO showtime (timeID, movieID, showroomID, dayID) values ((SELECT id from timeslot where time = '"+ time+"'), (SELECT id from movie where title = '"+ title+"'), (SELECT id from showroom where name = '"+showroom+"'),(SELECT id from day where day = '"+ day+"'))");
                ResultSet rs = stmt1.executeQuery("SELECT nbOfSeats FROM showroom INNER JOIN showtime ON showroom.id = showtime.showroomID WHERE showtime.id = (SELECT id FROM showtime ORDER BY id DESC LIMIT 1)");
                ResultSet rs1 = stmt2.executeQuery("SELECT id FROM showtime WHERE showtime.id = (SELECT id FROM showtime ORDER BY id DESC LIMIT 1)");
                if(success == 1){
                    if(rs.next()){
                    request.setAttribute("seats", rs.getInt(1));}
                    if(rs1.next()){
                    request.setAttribute("showtimeID", rs1.getInt(1));}
                    RequestDispatcher rd = request.getRequestDispatcher("CreateSeats");
                    rd.include(request, response);
                    return;
                }else{
                    out.println("<font color=red>Showtime wasn't added, please check input again</font>");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/addShowtime.jsp");
                    rd.include(request, response);
                    return;
                }
            } catch (Exception p) {
                out.print(p);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminPage.jsp");
        rd.include(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}

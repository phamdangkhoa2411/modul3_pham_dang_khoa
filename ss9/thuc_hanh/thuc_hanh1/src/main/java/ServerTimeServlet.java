import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ServerTimeServlet",  urlPatterns = "/index")
public class ServerTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        writer.println("<html>");

        Date today = new Date();

        writer.println("<h1>" + today + "</h1>");
        writer.println("</html>");
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<head>");
//        writer.println("<meta charset=\"UTF-8\">");
//        writer.println("</head>");
//        writer.println("<h1>Phạm Trần Đăng Khoa </h1>");
//        writer.println("</html>");
  }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Product_Discount_Calculator", value = "/Product_Discount_Calculator")
public class Product_Discount_Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ProductDescription = request.getParameter("ProductDescription");
        double list_price = Double.parseDouble(request.getParameter("list_price"));
        double  Discount_Amount = Double.parseDouble(request.getParameter("Discount_Amount"));

        double Discount_Price;
        Discount_Price = list_price * Discount_Amount * 0.01;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Product Description "+ ProductDescription+"</h1>");
        writer.println("<h1> list_price  "+ list_price +"</h1>");
        writer.println("<h1> Discount_Amount  "+ Discount_Amount +"</h1>");
        writer.println("<h1> Discount_Price  "+ Discount_Price +"</h1>");
        writer.println("</html>");
    }
}

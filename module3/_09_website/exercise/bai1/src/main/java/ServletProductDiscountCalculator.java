import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletProductDiscountCalculator", value = "/product")
public class ServletProductDiscountCalculator extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int listPrice = Integer.parseInt(request.getParameter("list_price"));
        int discountPercent = Integer.parseInt(request.getParameter("discount_percent"));
        String description = request.getParameter("product_description");

        int discountAmount = (int) (listPrice * discountPercent * 0.1);
        int discountPrice = listPrice - discountAmount;

        request.setAttribute("description", description);

        request.setAttribute("listPrice", listPrice);

        request.setAttribute("discountPercent", discountPercent);

        request.setAttribute("discountAmount", discountAmount);

        request.setAttribute("discountPrice", discountPrice);

        request.getRequestDispatcher("ProductDiscountCalculator.jsp").forward(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

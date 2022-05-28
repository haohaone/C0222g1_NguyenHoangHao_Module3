import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletControllers", urlPatterns = "/customer")
public class ServletControllers extends HttpServlet {
    String pathHao = "https://tiengdong.com/wp-content/uploads/www_tiengdong_com-meme-meo-trai-tim.jpg";
    String pathDat = "https://i.pinimg.com/564x/5e/b3/04/5eb30477c9be2919e2ad525071613082.jpg";
    String pathUyen = "https://anhdephd.vn/wp-content/uploads/2022/04/anh-meme-meo-600x600.jpg";
    String pathTrung = "https://trinhvantuyen.com/wp-content/uploads/2022/05/meme-meo-cute-anh-meo-khoc-600x600.jpg";
    String pathTruong = "https://trinhvantuyen.com/wp-content/uploads/2022/05/anh-meo-khoc-rung-rung-nuoc-mat-507x600.jpg";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Customer[] customers = new Customer[5];

        customers[0] = new Customer("Hảo Hảo",
                "08/07/1999",
                0,
                "Đà Nẵng",
                pathHao);

        customers[1] = new Customer("Đạt Đần",
                "10/10/1999",
                0,
                "Quảng Trị",
                pathDat);

        customers[2] = new Customer("Uyên Ngu",
                "13/08/1999",
                1,
                "Đà Nẵng",
                pathUyen);

        customers[3] = new Customer("Trung Dốt",
                "18/07/2003",
                0,
                "Quảng Nam",
                pathTrung);

        customers[4] = new Customer("Trường Mập",
                "05/05/1998",
                0,
                "Đà Nẵng",
                pathTruong);

        request.setAttribute("list_customer", customers);
        request.getRequestDispatcher("display_customer.jsp").forward(request, response);
    }
}

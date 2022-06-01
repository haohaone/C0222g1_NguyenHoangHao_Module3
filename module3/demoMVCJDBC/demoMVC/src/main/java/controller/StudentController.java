package controller;

import model.ClassCG;
import model.Student;
import service.IClassService;
import service.IStudentService;
import service.impl.ClassService;
import service.impl.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StudentServlet",urlPatterns = "/student")
public class StudentController extends HttpServlet {
    // controller gọi service
    private IStudentService studentService = new StudentService();
    private IClassService classService = new ClassService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                // trả về một form thêm mới
                save(request,response);
                break;
            case "edit":
                // chỉnh sửa
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showStudentList(request,response);
        }

    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        boolean gender =Boolean.parseBoolean(request.getParameter("gender"));
        String birthday =request.getParameter("birthday");
        int point =Integer.parseInt(request.getParameter("point"));
        int classId=Integer.parseInt(request.getParameter("classId"));
        String email = request.getParameter("email");
        Student student = new Student(name,gender,birthday,point,classId,email);

        Map<String, String> map= studentService.save(student);
        if (map.isEmpty()){
            request.setAttribute("mess", "Them moi thanh cong");
        }else {
            request.setAttribute("mess", "Them moi khong thanh cong");
            request.setAttribute("error",map);
        }

        RequestDispatcher dispatcher=  request.getRequestDispatcher("/view/student/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                // trả về một form thêm mới
                showFormCreate(request,response);
                break;
            case "edit":
                // chỉnh sửa
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showStudentList(request,response);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        // trả về form thêm mới
        List<ClassCG> classList = classService.findAlL();
        request.setAttribute("classList", classList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/student/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showStudentList(HttpServletRequest request, HttpServletResponse response) {
        List<Student> studentList = studentService.findAll();
        List<ClassCG> classList = classService.findAlL();
        request.setAttribute("classList", classList);
        request.setAttribute("studentList", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/student/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

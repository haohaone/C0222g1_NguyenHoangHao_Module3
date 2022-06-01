package repository.impl;

import model.Student;
import repository.BaseRepository;
import repository.IStudentRepository;
import service.IStudentService;
import service.impl.StudentService;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL ="SELECT * FROM student";
    private final String INSERT_STUDENT ="insert into student(`name`,birthday, gender,`point`, class_id,email,`account`) " +
            "values (?,?,?,?,?,?,?);";

    public static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1, "tuấn", true, "12/12/2022", 9, "tuanvn", 1, "chanhtv235@gmial.com"));
        studentList.add(new Student(2, "trâm", false, "12/12/2022", 8, "tram", 2, "chanhtv235@gmial.com"));
        studentList.add(new Student(3, "lịch", true, "12/12/2022", 7, "lichhn", 2, "chanhtv235@gmial.com"));
        studentList.add(new Student(4, "hải", true, "12/12/2022", 6, "haitt", 3, "chanhtv235@gmial.com"));
        studentList.add(new Student(5, "chánh", true, "12/12/2022", 4, "chanhtv", 1, "chanhtv235@gmial.com"));
    }

    @Override
    public List<Student> findAll() {
        // kêts nối DB
        //
        List<Student> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuocj tính của bảng
                String name  = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                String birthday = resultSet.getString("birthday");
                int point = resultSet.getInt("point");
                String account = resultSet.getString("account");
                int classId = resultSet.getInt("class_id");
                String email = resultSet.getString("email");
                Student student = new Student(id,name,gender,birthday,point,account,classId,email);
                list.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public void save(Student student) {

        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_STUDENT);
            ps.setString(1,student.getName());
            ps.setDate(2, Date.valueOf(student.getBirthday()));
            ps.setBoolean(3,student.isGender());
            ps.setInt(4,student.getPoint());
            ps.setInt(5,student.getClassId());
            ps.setString(6,student.getEmail());//
            ps.setString(7,student.getEmail());//account là email
            int check =ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {

    }
}

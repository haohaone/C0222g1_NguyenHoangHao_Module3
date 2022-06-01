package repository.impl;

import model.Student;
import repository.IStudentRepository;
import service.IStudentService;
import service.impl.StudentService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentRepository implements IStudentRepository {

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
        return studentList;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public void save(Student student) {
       studentList.add(student);
        // không hợp lệ không lưu

    }

    @Override
    public void delete(int id) {

    }
}

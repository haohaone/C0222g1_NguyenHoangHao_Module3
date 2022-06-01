package service;

import model.Student;

import java.util.List;
import java.util.Map;

public interface IStudentService {
    List<Student> findAll();
    Student findById(int id);
    Map<String,String> save(Student student);
    void delete(int id);
}

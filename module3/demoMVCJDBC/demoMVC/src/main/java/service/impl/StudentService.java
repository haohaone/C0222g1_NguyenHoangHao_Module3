package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService implements IStudentService {
    // service gọi repo
    IStudentRepository studentRepository = new StudentRepository();

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public Map<String,String> save(Student student) {
        // phải kiểm tr dữ liệu
        // nếu hợp lệ => lưu
        Map<String, String> map = new HashMap<>();
        if (student.getPoint()<0){
            map.put("point", "Điểm không được nhỏ hơn 0");
        }else if (student.getPoint()>100){
            map.put("point", "Điểm lớn hơn 100");
        }

        if (map.isEmpty()){
            studentRepository.save(student);
        }

        return map;
    }

    @Override
    public void delete(int id) {

    }
}

package service.impl;

import model.ClassCG;
import repository.IClassRepository;
import repository.impl.ClassRepository;
import service.IClassService;

import java.util.List;

public class ClassService implements IClassService {
    private IClassRepository classRepository = new ClassRepository();
    @Override
    public List<ClassCG> findAlL() {
        return classRepository.findAlL();
    }
}

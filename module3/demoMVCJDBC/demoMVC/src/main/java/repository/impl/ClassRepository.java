package repository.impl;

import model.ClassCG;
import repository.BaseRepository;
import repository.IClassRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassRepository implements IClassRepository {
    private final String SELECT_ALL ="select * from class;";
    @Override
    public List<ClassCG> findAlL() {
        List<ClassCG> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                ClassCG classCG = new ClassCG(id,name);
                list.add(classCG);
            }
    } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

}


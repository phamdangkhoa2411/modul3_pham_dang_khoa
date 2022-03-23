package repository.impl;

import model.Category;
import repository.ICategoryRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepositoryImpl implements ICategoryRepository{
    BaseRepository baseRepository=new BaseRepository();
    private static String SELECT_ALL_CATEGORY = "select * from category;";

    @Override
    public List<Category> getAllCategory() {
        Connection connection = baseRepository.getConnection();
        List<Category> categoryList = new ArrayList<>();
        ResultSet resultSet;
        PreparedStatement preparedStatement;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int idCategory = resultSet.getInt("category_id");
                    String nameCategory = resultSet.getString("category_name");
                    categoryList.add(new Category(idCategory, nameCategory));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return categoryList;

    }
}

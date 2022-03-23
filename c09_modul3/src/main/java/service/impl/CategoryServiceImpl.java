package service.impl;

import model.Category;
import repository.ICategoryRepository;
import repository.impl.CategoryRepositoryImpl;
import service.ICategoryService;

import java.util.List;

public class CategoryServiceImpl implements ICategoryService {

    private static ICategoryRepository iCategoryRepository = new CategoryRepositoryImpl();

    @Override
    public List<Category> getAllCategory() {
        return iCategoryRepository.getAllCategory();
    }
}

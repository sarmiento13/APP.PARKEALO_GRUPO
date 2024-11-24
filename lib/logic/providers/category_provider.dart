
import 'package:flutter/material.dart';

import '../../data/models/category.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/category_repository_impl.dart';

class CategoryProvider with ChangeNotifier{
  final CategoryRepository categoryRepository = CategoryRepositoryImpl();

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> getAllCategory() async {
    try {
      _categories = await categoryRepository.getAllCategory();
      notifyListeners();
    } catch (e) {
      Exception(e);
    }
  }
}
import 'package:flutter/material.dart';

import '../../data/models/category.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/category_repository_impl.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryRepository _categoryRepository = CategoryRepositoryImpl();

  List<Category> _categories = [];
  int? _selected;

  List<Category> get categories => _categories;
  int? get selected => _selected;

  CategoryProvider() {
    _load();
  }

  Future<void> _load() async {
    _categories = await _categoryRepository.getAll();
    notifyListeners();
  }

  void toogleCategory(int? index) {
    if (_selected == index) {
      _selected = null;
    } else {
      _selected = index;
    }
    notifyListeners();
  }
}

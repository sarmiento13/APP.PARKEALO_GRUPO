
import '../../core/utils/db_constants.dart';
import '../database/db_helper.dart';
import '../models/category.dart';
import 'category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final DbHelper _dbHelper = DbHelper();
  @override
  Future<List<Category>> getAll() async {
    final db = await _dbHelper.getDatabase();
    final List<Map<String, dynamic>> categories = await db.query(DbConstants.tableCategory);
    return categories.map((model) => Category.fromMap(model)).toList();
  }

}
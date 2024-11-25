import 'package:voygo/core/utils/db_constants.dart';
import 'package:voygo/data/database/db_helper.dart';
import 'package:voygo/data/models/module.dart';
import 'package:voygo/data/repositories/module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  final DbHelper _dbHelper = DbHelper();
  @override
  Future<List<Module>> getAll() async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(DbConstants.tableModule);
    return result.map((e) => Module.fromMap(e)).toList();
  }
}

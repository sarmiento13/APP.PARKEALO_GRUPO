import 'package:sqflite/sql.dart';

import '../../core/utils/db_constants.dart';
import '../database/db_helper.dart';
import '../models/favorite.dart';
import 'favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final DbHelper _dbHelper = DbHelper();

  @override
  Future<int> create(Favorite favorite) async {
    try {
      final db = await _dbHelper.getDatabase();
      return db.insert(
        DbConstants.tableFavorite,
        favorite.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Error create: $e');
    }
  }

  @override
  Future<bool> delete(int id) async {
    try {
      final db = await _dbHelper.getDatabase();
      final count = await db.delete(
        DbConstants.tableFavorite,
        where: 'id=?',
        whereArgs: [id],
      );
      return count > 0;
    } catch (e) {
      throw Exception('Error delete: $e');
    }
  }

  @override
  Future<List<Favorite>> getAll() async {
    try {
      final db = await _dbHelper.getDatabase();
      final List<Map<String, dynamic>> models =
          await db.query(DbConstants.tableFavorite);
      return models.map((model) => Favorite.fromMap(model)).toList();
    } catch (e) {
      throw Exception('Error getAll: $e');
    }
  }

  @override
  Future<Favorite?> getById(int id) async {
    try {
      final db = await _dbHelper.getDatabase();
      final result = await db.query(
        DbConstants.tableFavorite,
        where: 'id=?',
        whereArgs: [id],
        limit: 1,
      );

      return result.isNotEmpty ? Favorite.fromMap(result.first) : null;
    } catch (e) {
      throw Exception('Error getById: $e');
    }
  }

  @override
  Future<int> update(Favorite favorite) async {
    try {
      final db = await _dbHelper.getDatabase();
      return db.update(
        DbConstants.tableFavorite,
        favorite.toMap(),
        where: 'id=?',
        whereArgs: [favorite.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Error update: $e');
    }
  }
}

import 'package:sqflite/sql.dart';

import '../../core/utils/db_constants.dart';
import '../database/db_helper.dart';
import '../models/favorite.dart';
import 'favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final DbHelper _dbHelper = DbHelper();

  // FavoriteRepositoryImpl(this._dbHelper);

  @override
  Future<int> create(Favorite favorite) async {
    final db = await _dbHelper.getDatabase();
    return db.insert(
      DbConstants.tableFavorite,
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> delete(int agencyId) async {
    final db = await _dbHelper.getDatabase();
    return db.delete(
      DbConstants.tableFavorite,
      where: 'agency_id=?',
      whereArgs: [agencyId],
    );
  }

  @override
  Future<List<int>> getAll() async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(
      DbConstants.tableFavorite,
      columns: ['agency_id'],
    );
    return result.map((e) => e['agency_id'] as int).toList();
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

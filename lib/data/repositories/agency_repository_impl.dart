import 'package:sqflite/sqflite.dart';

import '../../core/utils/db_constants.dart';
import '../database/db_helper.dart';
import '../models/agency.dart';
import 'agency_repository.dart';

class AgencyRepositoryImpl implements AgencyRepository {
  final DbHelper _dbHelper = DbHelper();

  // AgencyRepositoryImpl(this._dbHelper);
  @override
  Future<int> create(Agency agency) async {
    final db = await _dbHelper.getDatabase();
    return await db.insert(
      DbConstants.tableAgency,
      agency.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _dbHelper.getDatabase();
    return db.delete(
      DbConstants.tableAgency,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Agency>> getAll() async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(DbConstants.tableAgency);
    return result.map((e) => Agency.fromMap(e)).toList();
  }

  @override
  Future<Agency?> getById(int id) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(
      DbConstants.tableAgency,
      where: 'id=?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isEmpty ? Agency.fromMap(result.first) : null;
  }

  @override
  Future<int> update(Agency agency) async {
    final db = await _dbHelper.getDatabase();
    return db.update(
      DbConstants.tableAgency,
      agency.toMap(),
      where: 'id=?',
      whereArgs: [agency.id],
    );
  }

  @override
  Future<List<Agency>> getAllByCategoryId(int categoryId) async {
    final db = await _dbHelper.getDatabase();
    final result = await db.query(
      DbConstants.tableAgency,
      where: 'category_id=?',
      whereArgs: [categoryId],
    );
    return result.map((e) => Agency.fromMap(e)).toList();
  }
}

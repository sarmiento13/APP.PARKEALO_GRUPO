
import 'package:sqflite/sql.dart';

import '../../core/utils/db_constants.dart';
import '../database/db_helper.dart';
import '../models/agency.dart';
import 'agency_repository.dart';

class AgencyRepositoryImpl implements AgencyRepository {
  final DbHelper _dbHelper = DbHelper();

  @override
  Future<int> create(Agency agency) async {
    try {
      final db = await _dbHelper.getDatabase();
      return db.insert(
        DbConstants.tableAgency,
        agency.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Error create data: $e');
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      final db = await _dbHelper.getDatabase();
      await db.delete(
        DbConstants.tableAgency,
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Error getAll data: $e');
    }
  }

  @override
  Future<List<Agency>> getAll() async {
    try {
      final db = await _dbHelper.getDatabase();
      // final List<Map<String, dynamic>> agencies = await db.query('agency');
      final result = await db.query(DbConstants.tableAgency);
      return result.map((model) => Agency.fromMap(model)).toList();
    } catch (e) {
      throw Exception('Error getAll data: $e');
    }
  }

  @override
  Future<Agency> getById(int id) async {
    try {
      final db = await _dbHelper.getDatabase();
      final List<Map<String, dynamic>> agencies = await db.query(
        DbConstants.tableAgency,
        where: 'id=?',
        whereArgs: [id],
        limit: 1,
      );
      return Agency.fromMap(agencies.first);
    } catch (e) {
      throw Exception('Error getById data: $e');
    }
  }

  @override
  Future<int> update(Agency agency) async {
    try {
      final db = await _dbHelper.getDatabase();
      return db.update(
        DbConstants.tableAgency,
        agency.toMap(),
        where: 'id=?',
        whereArgs: [agency.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Error create data: $e');
    }
  }
}

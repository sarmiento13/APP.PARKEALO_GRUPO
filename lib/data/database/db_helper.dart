import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  factory DbHelper() {
    return _instance;
  }

  DbHelper._internal();

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bd_agencias_de_turismos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version)  async{
        await _executeSqlFile(db, 'assets/sql/ddl_agencias_de_turismos.sql');
        await _executeSqlFile(db, 'assets/sql/dml_agencias_de_turismos.sql');
      },
    );
  }

  Future<void> _executeSqlFile(Database db, String path) async{
    String sql = await rootBundle.loadString(path);

    List<String> queries = sql.split(';');

    for (var query in queries) {
      if (query.trim().isNotEmpty) {
        await db.execute(query.trim());
      }
    }
  }
}

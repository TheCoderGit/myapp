import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AdminDatabaseHelper {
  static final AdminDatabaseHelper _instance = AdminDatabaseHelper._internal();

  static Database? _database;

  factory AdminDatabaseHelper() {
    return _instance;
  }

  AdminDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXIST admin(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
    );
  }

  Future<int> insertAdmin(Map<String, dynamic> item) async {
    Database db = await database;
    return await db.insert('admin', item);
  }

  Future<List<Map<String, dynamic>>> getAdmins() async {
    Database db = await database;
    return await db.query('admin');
  }

  Future<List<Map<String, dynamic>>> getAdminById(int id) async {
    Database db = await database;
    return await db.query('admin', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getAdminByUserName(String userName) async {
    Database db = await database;
    return await db.query('admin', where: 'name = ?', whereArgs: [userName]);
  }

  Future<int> updateAdmin(int id, Map<String, dynamic> admin) async {
    Database db = await database;
    return await db.update('admin', admin, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAdmin(int id) async {
    Database db = await database;
    return await db.delete('admin', where: 'id = ?', whereArgs: [id]);
  }
}

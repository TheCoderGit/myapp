import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AdminWindowsOsDatabaseHelper {
  static final AdminWindowsOsDatabaseHelper _instance =
      AdminWindowsOsDatabaseHelper._internal();

  static Database? _database;

  factory AdminWindowsOsDatabaseHelper() {
    return _instance;
  }

  AdminWindowsOsDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    String path = join(await getDatabasesPath(), 'my_database.db');
    var db = await databaseFactory.openDatabase(
      path,
    );
    db.setVersion(1);

    await db.execute(
        ' CREATE TABLE IF NOT EXISTS admin(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, pass TEXT)');

    return db;
  }

  Future<int> insertAdmin(Map<String, dynamic> admin) async {
    Database db = await database;
    return await db.insert('admin', admin);
  }

  Future<List<Map<String, dynamic>>> getAdmins() async {
    Database db = await database;
    return await db.query('admin');
  }

  Future<List<Map<String, dynamic>>> getAdminById(int id) async {
    Database db = await database;
    return await db.query('admin', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getAdminByUserName(String name) async {
    Database db = await database;
    return await db.query('admin', where: 'name = ?', whereArgs: [name]);
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

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE flights(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        from_city TEXT,
        to_city TEXT,
        date TEXT,
        passengers INTEGER,
        class TEXT,
        airline TEXT,
        price INTEGER
      )
    ''');
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (users.isNotEmpty) {
      return users.first;
    }
    return null;
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  Future<int> insertFlight(Map<String, dynamic> flight) async {
    final db = await database;
    return await db.insert('flights', flight);
  }

  Future<List<Map<String, dynamic>>> getFlights() async {
    final db = await database;
    return await db.query('flights');
  }
}

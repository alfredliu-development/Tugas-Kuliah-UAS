import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get getDatabase async {
    if (_database != null) return _database!;
    _database = await initDatabase("accout.db");
    return _database!;
  }

  Future<Database> initDatabase(String pathName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, pathName);

    return await openDatabase(path, version: 1, onCreate: createDB);
  }

  Future createDB(Database db, int version) async {
    await db.execute("""
      CREATE TABLE account(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    """);

    await db.execute("""
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        title TEXT,
        image_title TEXT,
        detail TEXT,
        FOREIGN KEY (user_id) REFERENCES account (id)
      )
    """);
  }

  Future<int> registerUser(String name, String email, String password) async {
    final db = await instance.getDatabase;
    return await db.insert("account", {
      "name": name,
      "email": email,
      "password": password,
    });
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await instance.getDatabase;
    final result = await db.query(
      "account",
      columns: ["id", "name"], // Ambil ID juga
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) return result.first;
    return null;
  }

  // --- Fitur Favorites ---

  Future<int> addFavorite(
    int userId,
    String title,
    String imageTitle,
    String detail,
  ) async {
    final db = await instance.getDatabase;
    return await db.insert("favorites", {
      "user_id": userId,
      "title": title,
      "image_title": imageTitle,
      "detail": detail,
    });
  }

  Future<List<Map<String, dynamic>>> getFavorites(int userId) async {
    final db = await instance.getDatabase;
    return await db.query(
      "favorites",
      where: "user_id = ?",
      whereArgs: [userId],
    );
  }

  Future<int> removeFavorite(int userId, String title) async {
    final db = await instance.getDatabase;
    return await db.delete(
      "favorites",
      where: "user_id = ? AND title = ?",
      whereArgs: [userId, title],
    );
  }
}

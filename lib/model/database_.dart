// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart'; // For database path management

// class DiaryDatabase {
//   static final DiaryDatabase instance = DiaryDatabase._init();
//   static Database? _database;

//   DiaryDatabase._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('diary.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     await db.execute('''
//         CREATE TABLE diary_entries (
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           title TEXT NOT NULL,
//           content TEXT NOT NULL,
//           dateTime TEXT NOT NULL, 
//           mood TEXT
//         )
//         ''');
//   }
// }

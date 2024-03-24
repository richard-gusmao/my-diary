import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'myDiary_sql_all_data.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, version) async {
      await db.execute('''
    CREATE TABLE post(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      content TEXT,
      image TEXT,
      date TEXT,
      time INTEGER
)
''');
    });
  }
}

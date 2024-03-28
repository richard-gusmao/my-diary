import 'package:my_diary/model/database_.dart';
import 'package:sqflite/sqflite.dart';

class Diary {
  int? id;
  String? title;
  String? content;
  String? date;
  String? image;

  Diary({this.title, this.content, this.id, this.image, this.date});

  Future<void> save() async {
    Database db = await MyDatabase().initDatabase();
    await db.insert(
        "post",
        {
          'title': title,
          'content': content,
          'date': date,
          'image': image ?? "",
          'year': DateTime.now().year.toString()
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List> showAll() async {
    Database db = await MyDatabase().initDatabase();
    List<Map<String, dynamic>> data = await db.query("post");
    return data;
  }

  Future<void> update() async {
    Database db = await MyDatabase().initDatabase();
    await db.update(
      "post",
      where: "id = ?",
      whereArgs: [id],
      {
        'title': title,
        'content': content,
        'image': image,
      },
    );
  }

  Future<List> getById() async {
    Database db = await MyDatabase().initDatabase();
    List<Map<String, dynamic>> data =
        await db.query("post", where: "id = ?", whereArgs: [id]);
    return data;
  }

  Future<void> delete() async {
    Database db = await MyDatabase().initDatabase();
    await db.delete("post", where: "id = ", whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    Database db = await MyDatabase().initDatabase();
    await db.delete("post");
  }

  Future<List> getByText(String text) async {
    Database db = await MyDatabase().initDatabase();
    List data = await db.rawQuery(
        "SELECT * FROM post WHERE content LIKE '%${text}%' OR title LIKE '%${text}%' ");
    return data;
  }

  Future<List> getYear() async {
    Database db = await MyDatabase().initDatabase();
    List years =
        await db.rawQuery("SELECT DISTINCT year FROM post ORDER BY year");
    return years;
  }

  Future<int> getMemories(int year) async {
    Database db = await MyDatabase().initDatabase();
    final result =
        await db.rawQuery("SELECT COUNT(*) FROM post WHERE year = $year");
    final int? count = Sqflite.firstIntValue(result);
    int count2 = count ?? 0;
    return count2;
  }
}

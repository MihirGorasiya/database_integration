import 'dart:io';

import 'package:database_integration/controller/Note.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "";

  static Future<Database> _getDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/posts.db';
    return openDatabase(
      join(path, _dbName),
      onCreate: ((db, version) async => await db.execute(
          "CREATE TABLE userData(id INTEGER PRIMARY KEY, username TEXT, email TEXT)")),
      version: _version,
    );
  }

  static Future<int> addData(Note note) async {
    final db = await _getDB();
    return await db.insert("userData", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateData(Note note) async {
    final db = await _getDB();
    return await db.update("userData", note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteData(Note note) async {
    final db = await _getDB();
    return await db.delete(
      "userData",
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  static Future<List<Note>?> getAllNotes() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("userData");
    if (maps.isEmpty) return null;
    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
}

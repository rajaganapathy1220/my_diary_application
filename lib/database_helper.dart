import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const dataBaseName = 'diaryDB.db';
  static const dataBaseVersion = 3;
  static const dataBaseTableName = '_diaryTable';

  static const columnId = '_id';
  static const columnTitle = '_title';
  static const columnDescription = '_description';
 // static const columnCreatedAt = '_createdAt';

  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dataBaseName);

    _db = await openDatabase(
      path,
      version: dataBaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $dataBaseTableName (
      $columnId INTEGER PRIMARY KEY,
      $columnTitle TEXT,
      $columnDescription TEXT
      )
   ''');
  }

  Future _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('DROP TABLE $dataBaseTableName');
    _onCreate(database, newVersion);
  }

//insert
  Future<int> insertDiaryDetails(Map<String, dynamic> row) async {
    return await _db.insert(dataBaseTableName, row);
  }

//display
  Future<List<Map<String, dynamic>>> getDiaryDetails() async {
    return await _db.query(dataBaseTableName);
  }

//update
  Future<int> updateDiaryDetails(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      dataBaseTableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  //delete
  Future<int> deleteDiaryDetails(int id) async {
    return await _db.delete(
      dataBaseTableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
